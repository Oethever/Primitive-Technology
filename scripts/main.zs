import crafttweaker.data.IData;
import mods.jei.JEI.removeAndHide;

removeAndHide(<charcoal_pit:fire_starter>);
removeAndHide(<betterwithmods:axle_generator>);
removeAndHide(<betterwithmods:axle_generator:2>);
removeAndHide(<betterwithmods:material:11>);
removeAndHide(<betterwithmods:axle_generator:1>);
//mods.notreepunching.NoTreePunching.addKnifeGrassDrop(<charcoal_pit:straw>);


// Remove IE steel tools
removeAndHide(<immersiveengineering:pickaxe_steel>);
removeAndHide(<immersiveengineering:shovel_steel>);
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
 
 
// Lit torch with iron and flint, fire starter, or matchbox
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
 
recipes.addShapeless(
	<minecraft:paper> * 2,
	[<ore:dustWood>, <ore:dustWood>, <ore:dustWood>, <ore:dustWood>, clay_bucket_water]
);
 
recipes.addShapeless(
	<minecraft:clay_ball> * 4,
	[<ore:itemSlag>, <ore:itemSlag>, <ore:dirt>, clay_bucket_water]
);
 
recipes.addShapeless(
	<realistictorches:glowstone_paste>,
	[<ore:dustGlowstone>, <ore:clay>, clay_bucket_water]
);
 
recipes.addShaped(<chisel:waterstone:0>,
[[<ore:stone>, <ore:stone>,       <ore:stone>],
 [<ore:stone>, clay_bucket_water, <ore:stone>],
 [<ore:stone>, <ore:stone>,       <ore:stone>]]);

recipes.addShaped(<immersiveengineering:stone_decoration:5> * 12,
[[<ore:itemSlag>,   <ore:clay>,        <ore:itemSlag>],
 [<ore:gravel>,     clay_bucket_water, <ore:gravel>],
 [<ore:itemSlag>,   <ore:clay>,        <ore:itemSlag>]]);
 
recipes.addShaped(<immersiveengineering:stone_decoration:5> * 8,
[[<ore:sand>,   <ore:clay>,        <ore:sand>],
 [<ore:gravel>, clay_bucket_water, <ore:gravel>],
 [<ore:sand>,   <ore:clay>,        <ore:sand>]]);
 
recipes.addShaped(<immersiveengineering:metal_decoration0:7> * 2,
[[<ore:ingotSteel>,  <ore:ingotCopper>, <ore:ingotSteel>],
 [<ore:ingotCopper>, clay_bucket_water, <ore:ingotCopper>],
 [<ore:ingotSteel>,  <ore:ingotCopper>, <ore:ingotSteel>]]);
 
val ingotCopperOrIron = <ore:ingotCopper>.or(<ore:ingotIron>);
recipes.addShaped(<betterwithmods:cooking_pot:1>,
[[ingotCopperOrIron, <ore:bone>,        ingotCopperOrIron],
 [ingotCopperOrIron, clay_bucket_water, ingotCopperOrIron],
 [ingotCopperOrIron, ingotCopperOrIron, ingotCopperOrIron]]);
 

// Allow to use bronze instead of iron for some early recipes
val ingotBronzeOrIron = <ore:ingotBronze>.or(<ore:ingotIron>);

// BWM saw
recipes.addShaped(<betterwithmods:saw>,
[[<ore:ingotBronze>, <ore:ingotBronze>, <ore:ingotBronze>],
 [<ore:gearWood>,    <ore:hideBelt>,    <ore:gearWood>],
 [<ore:plankWood>,   <ore:gearWood>,    <ore:plankWood>]]);
 
// Engineer's hammer
recipes.remove(<immersiveengineering:tool:0>);
recipes.addShaped(<immersiveengineering:tool:0>,
[[null,            ingotBronzeOrIron, <ore:string>],
 [null,            <ore:stickWood>,   ingotBronzeOrIron],
 [<ore:stickWood>, null,              null]]);

// Water wheel
recipes.remove(<immersiveengineering:wooden_device1:0>);
recipes.addShaped(<immersiveengineering:wooden_device1:0>,
[[null,                               <immersiveengineering:material:10>, null],
 [<immersiveengineering:material:10>, ingotBronzeOrIron,                  <immersiveengineering:material:10>],
 [null,                               <immersiveengineering:material:10>, null]]);

// Windmill
recipes.remove(<immersiveengineering:wooden_device1:1>);
recipes.addShaped(<immersiveengineering:wooden_device1:1>,
[[<immersiveengineering:material:11>, <immersiveengineering:material:11>, <immersiveengineering:material:11>],
 [<immersiveengineering:material:11>, ingotBronzeOrIron,                  <immersiveengineering:material:11>],
 [<immersiveengineering:material:11>, <immersiveengineering:material:11>, <immersiveengineering:material:11>]]);

// Add a recipe for lead without slime or glue
recipes.addShaped(<minecraft:lead> * 2,
[[<ore:string>, <ore:string>,          null        ],
 [<ore:string>, <betterwithmods:rope>, null        ],
 [null,         null,                  <ore:string>]]);


recipes.addShapeless(<dawnoftimebuilder:wax> * 10, [<minecraft:sugar>, <realistictorches:torch_lit>]);

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

// Diamon ingot ???
removeAndHide(<betterwithmods:material:45>);
