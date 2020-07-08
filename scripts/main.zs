import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import mods.jei.JEI.removeAndHide;
import scripts.functions.filledClayBucket;
import scripts.functions.filledIronBucket;

// Crafting station is made first, since crafting table is difficult to use with two slots only
recipes.remove(<minecraft:crafting_table>);
recipes.addShapeless(<minecraft:crafting_table>,
	[<ore:workbench>]);

recipes.remove(<tconstruct:tooltables:0>);
recipes.addShaped(<tconstruct:tooltables:0>,
 [[<ore:plankWood>, <ore:plankWood>],
  [<ore:plankWood>, <ore:plankWood>]]);


// Melon on the chopping block only
recipes.remove(<minecraft:melon>);
mods.horsepower.ChoppingBlock.add(<minecraft:melon_block>, <minecraft:melon>, 1);


// Remove ConArm backpacks
removeAndHide(<conarm:travel_sack>);
removeAndHide(<conarm:travel_belt>);
removeAndHide(<conarm:travel_belt_base>);
removeAndHide(<conarm:travel_potion>);

// Remove some TCon tools
removeAndHide(<tconstruct:lumberaxe>);
removeAndHide(<tconstruct:scythe>);
removeAndHide(<tconstruct:excavator>);
removeAndHide(<tconstruct:hammer>);

// Remove dye recipe from Inspirations flowers
recipes.removeByRecipeName("inspirations:building/flower/dye_pink");
recipes.removeByRecipeName("inspirations:building/flower/dye_red");
recipes.removeByRecipeName("inspirations:building/flower/dye_cyan");
recipes.removeByRecipeName("inspirations:building/flower/dye_magenta");

// Inspiration has the same stone rod already (and it looks better)
mods.jei.JEI.removeAndHide(<tconstruct:stone_stick>);
 
// Light torch with iron and flint, fire starter, or matchbox
//recipes.remove(<realistictorches:torch_lit>);
/*recipes.addShapeless(
	<realistictorches:torch_lit>,
	[<realistictorches:torch_unlit>,
	 <minecraft:flint_and_steel>.transformDamage()]
);
*/
// Desactivated because the recipe does not work when the fire starter has nonzero damage :(


// Impractical storage should be easy to make
recipes.remove(<impstorage:controller>);
recipes.addShaped(<impstorage:controller>,
[[<ore:ingotCopper>],
 [<ore:chest>],
 [<ore:stone>]]);

recipes.remove(<impstorage:controller_interface>);
recipes.addShaped(<impstorage:controller_interface>,
[[<ore:ingotCopper>, <ore:trapdoorWood>, <ore:ingotCopper>],
 [null,              <minecraft:hopper>.or(<tconstruct:wooden_hopper:0>), null]]);


// Clay bucket should be usable where iron bucket is
val liquidBuckets = [
	[<minecraft:water_bucket>, filledClayBucket("water")],
	[<minecraft:lava_bucket>, filledClayBucket("lava")],
	[<minecraft:milk_bucket>, <ceramics:clay_bucket:1>],
	[filledIronBucket("creosote"), filledClayBucket("creosote")],
	[filledIronBucket("plantoil"), filledClayBucket("plantoil")]
] as IItemStack[][];

for buckets in liquidBuckets {
	recipes.replaceAllOccurences(buckets[0], buckets[0] | buckets[1], <*>);
}

// Handle separately the empty bucket case, some recipes make sense only with iron bucket
recipes.replaceAllOccurences(
	// Replace ... 
	<minecraft:bucket>,
	// ... by ...
	<ceramics:clay_bucket:0> | <minecraft:bucket>,
	// ... in recipes ...
	  <charcoal_pit:stone_creosote_collector>
	| <charcoal_pit:brick_creosote_collector>
	| <charcoal_pit:nether_creosote_collector>
	| <betterwithmods:bucket>
);

// Add back some recipes that still won't show the clay bucket option
recipes.addShaped(<immersiveengineering:metal_decoration0:7> * 2,
	[[<ore:ingotSteel>,  <ore:ingotCopper>,         <ore:ingotSteel>],
	 [<ore:ingotCopper>, filledClayBucket("water"), <ore:ingotCopper>],
	 [<ore:ingotSteel>,  <ore:ingotCopper>,         <ore:ingotSteel>]]);

recipes.addShaped(<immersiveengineering:stone_decoration:5> * 12,
	[[<ore:itemSlag>, <ore:clay>,                <ore:itemSlag>],
	 [<ore:gravel>,   filledClayBucket("water"), <ore:gravel>],
	 [<ore:itemSlag>, <ore:clay>,                <ore:itemSlag>]]);

recipes.addShaped(<immersiveengineering:stone_decoration:5> * 8,
	[[<ore:sand>,   <ore:clay>,                <ore:sand>],
	 [<ore:gravel>, filledClayBucket("water"), <ore:gravel>],
	 [<ore:sand>,   <ore:clay>,                <ore:sand>]]);

recipes.addShaped(<immersiveengineering:treated_wood:0> * 8,
	[[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>],
	 [<ore:plankWood>, filledClayBucket("creosote"), <ore:plankWood>],
	 [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]]);
	 
recipes.addShaped(<immersiveengineering:wirecoil:7> * 4,
	[[<ore:fabricHemp>, <immersiveengineering:wirecoil:1>, <ore:fabricHemp>],
	 [<immersiveengineering:wirecoil:1>, filledClayBucket("creosote"), <immersiveengineering:wirecoil:1>],
	 [<ore:fabricHemp>, <immersiveengineering:wirecoil:1>, <ore:fabricHemp>]]);

recipes.addShaped(<immersiveengineering:toolupgrade:1>,
	[[filledClayBucket("plantoil"), <ore:ingotIron>, null],
	 [<ore:ingotIron>, filledClayBucket("plantoil"), <ore:ingotIron>],
	 [null, <ore:ingotIron>, <immersiveengineering:material:8>]]);


// Allow to use bronze instead of iron for some early recipes
recipes.replaceAllOccurences(
	// Replace ... 
	<ore:ingotIron>,
	// ... by ...
	<ore:ingotBronze> | <ore:ingotIron>,
	// ... in recipes ...
	  <betterwithmods:saw>
	| <immersiveengineering:tool:0>
	| <immersiveengineering:wooden_device1:0>
	| <immersiveengineering:wooden_device1:1>
	| <bibliocraft:toolrack:*>
	| <bibliocraft:furniturepaneler:*>
	| <bibliocraft:handdrill>
);


recipes.addShapeless(<dawnoftimebuilder:wax> * 10, [<minecraft:sugar>, <realistictorches:torch_lit>]);

// Press paper recipes
mods.horsepower.Press.add(<ore:sugarcane> * 3, <minecraft:paper> * 6);
mods.horsepower.Press.add(<dawnoftimebuilder:mulberry_leaves> * 3, <minecraft:paper> * 6);
