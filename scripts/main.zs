import crafttweaker.data.IData;
import mods.jei.JEI.removeAndHide;

// This should be default
//<ore:bricksStone>.addAll(<minecraft:stonebrick:*>);

// Remove some items that are provided by multiple mods
removeAndHide(<charcoal_pit:fire_starter>);
removeAndHide(<betterwithmods:axle_generator>);
removeAndHide(<betterwithmods:axle_generator:2>);
removeAndHide(<betterwithmods:material:11>);
removeAndHide(<betterwithmods:axle_generator:1>);

// Remove IE steel tools
// We do not remove hoe and shovel because they can be used in the hoe cart
removeAndHide(<immersiveengineering:pickaxe_steel>);
removeAndHide(<immersiveengineering:axe_steel>);

// Melon on the chopping block only
recipes.remove(<minecraft:melon>);
mods.horsepower.ChoppingBlock.add(<minecraft:melon_block>, <minecraft:melon>, 1);

// No nether needed for blast furnace
recipes.remove(<immersiveengineering:stone_decoration:1>);
recipes.addShaped(<immersiveengineering:stone_decoration:1> * 3,
[[<ore:clay>,       <ore:ingotBrick>,                          <ore:clay>],
 [<ore:ingotBrick>, <immersiveengineering:stone_decoration:5>, <ore:ingotBrick>],
 [<ore:clay>,       <ore:ingotBrick>,                          <ore:clay>]]);
 
 
// Light torch with iron and flint, fire starter, or matchbox
//recipes.remove(<realistictorches:torch_lit>);
/*recipes.addShapeless(
	<realistictorches:torch_lit>,
	[<realistictorches:torch_unlit>,
	 <minecraft:flint_and_steel>.transformDamage()]
);
recipes.addShapeless(
	<realistictorches:torch_lit>,
	[<realistictorches:torch_unlit>,
	 <notreepunching:fire_starter>.transformDamage()]
);*/
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
val clay_bucket_water = <ceramics:clay_bucket:0>.withTag({fluids: {FluidName: "water", Amount: 1000}});

recipes.replaceAllOccurences(<minecraft:water_bucket>, clay_bucket_water | <minecraft:water_bucket>, <*>);

recipes.replaceAllOccurences(<minecraft:bucket>, <ceramics:clay_bucket:0> | <minecraft:bucket>,
	<charcoal_pit:stone_creosote_collector>  |
	<charcoal_pit:brick_creosote_collector>  |
	<charcoal_pit:nether_creosote_collector> |
	<betterwithmods:bucket>);
  
 
// Allow to use bronze instead of iron for some early recipes
recipes.replaceAllOccurences(<ore:ingotIron>, <ore:ingotCopper> | <ore:ingotIron> | <ore:ingotBronze>,
	<betterwithmods:cooking_pot:1>); 

recipes.replaceAllOccurences(<ore:ingotIron>, <ore:ingotBronze> | <ore:ingotIron>,
	  <betterwithmods:saw>
	| <immersiveengineering:tool:0>
	| <immersiveengineering:wooden_device1:0>
	| <immersiveengineering:wooden_device1:1>
	| <bibliocraft:toolrack:*>
	| <bibliocraft:framingsaw>
);


// Add a recipe for lead without slime or glue
recipes.addShaped(<minecraft:lead> * 2,
[[<ore:string>, <ore:string>,          null        ],
 [<ore:string>, <betterwithmods:rope>, null        ],
 [null,         null,                  <ore:string>]]);


recipes.addShapeless(<dawnoftimebuilder:wax> * 10, [<minecraft:sugar>, <realistictorches:torch_lit>]);

// Press paper recipes
mods.horsepower.Press.add(<ore:sugarcane> * 3, <minecraft:paper> * 6);
mods.horsepower.Press.add(<dawnoftimebuilder:mulberry_leaves> * 3, <minecraft:paper> * 6);

// CONFLICTS //

// <tconstruct:rack:0> has the same recipe as <dawnoftimebuilder:oak_planks_edge>
// and thus the latter changes to a recipes that conflicts with wooden pressure plate
recipes.remove(<dawnoftimebuilder:oak_planks_edge>);
recipes.addShaped(<dawnoftimebuilder:oak_planks_edge>,
[[<minecraft:wooden_slab:0>, null, <minecraft:wooden_slab:0>]]);

recipes.remove(<dawnoftimebuilder:oak_waxed_planks_edge>);
recipes.addShaped(<dawnoftimebuilder:oak_waxed_planks_edge>,
[[<dawnoftimebuilder:oak_waxed_planks_slab>, null, <dawnoftimebuilder:oak_waxed_planks_slab>]]);

recipes.remove(<dawnoftimebuilder:spruce_planks_edge>);
recipes.addShaped(<dawnoftimebuilder:spruce_planks_edge>,
[[<minecraft:wooden_slab:1>, null, <minecraft:wooden_slab:1>]]);

// Inspiration has the same stone rod already (and it looks better)
removeAndHide(<tconstruct:stone_stick>);

// Spruce support slab
recipes.remove(<dawnoftimebuilder:spruce_support_slab>);
recipes.addShaped(<dawnoftimebuilder:spruce_support_slab> * 12,
[[<minecraft:wooden_slab:1>, <minecraft:wooden_slab:1>, <minecraft:wooden_slab:1>],
 [null, null, null],
 [<minecraft:wooden_slab:1>, <minecraft:wooden_slab:1>, <minecraft:wooden_slab:1>]]);

// Oak support slab
recipes.remove(<dawnoftimebuilder:oak_support_slab>);
recipes.addShaped(<dawnoftimebuilder:oak_support_slab> * 12,
[[<dawnoftimebuilder:oak_waxed_planks_slab>, <dawnoftimebuilder:oak_waxed_planks_slab>, <dawnoftimebuilder:oak_waxed_planks_slab>],
 [null, null, null],
 [<dawnoftimebuilder:oak_waxed_planks_slab>, <dawnoftimebuilder:oak_waxed_planks_slab>, <dawnoftimebuilder:oak_waxed_planks_slab>]]);

// Spruce roof support
recipes.remove(<dawnoftimebuilder:spruce_roof_support>);
recipes.addShaped(<dawnoftimebuilder:spruce_roof_support> * 6,
[[<minecraft:planks:1>, null,                 <minecraft:planks:1>],
 [<minecraft:planks:1>, null,                 <minecraft:planks:1>],
 [<minecraft:planks:1>, <minecraft:planks:1>, <minecraft:planks:1>]]);
 
// Dawn of time builder edition has a built-in conflict, yay
recipes.remove(<dawnoftimebuilder:tatami_mat>);
recipes.addShaped(<dawnoftimebuilder:tatami_mat> * 4,
	[[<dawnoftimebuilder:thatch_bamboo>, <dawnoftimebuilder:thatch_bamboo>, <dawnoftimebuilder:thatch_bamboo>],
	[<dawnoftimebuilder:thatch_bamboo>, <dawnoftimebuilder:thatch_bamboo>, <dawnoftimebuilder:thatch_bamboo>]]);
 
// Tachi sword is removed by tinker hegemony
recipes.addShaped(<dawnoftimebuilder:tachi_sword>,
	[[null, null, <ore:ingotIron>],
	 [<ore:ingotGold>, <ore:ingotIron>, null],
	 [<minecraft:planks:1>, <ore:ingotGold>, null]]);

// Diamon ingot ???
removeAndHide(<betterwithmods:material:45>);
