import crafttweaker.data.IData;

mods.jei.JEI.removeAndHide(<charcoal_pit:fire_starter>);
mods.jei.JEI.removeAndHide(<betterwithmods:axle_generator>);
mods.jei.JEI.removeAndHide(<betterwithmods:axle_generator:2>);
mods.jei.JEI.removeAndHide(<betterwithmods:material:11>);
mods.jei.JEI.removeAndHide(<betterwithmods:axle_generator:1>);
//mods.notreepunching.NoTreePunching.addKnifeGrassDrop(<charcoal_pit:straw>);


// Remove IE steel tools
mods.jei.JEI.removeAndHide(<immersiveengineering:pickaxe_steel>);
mods.jei.JEI.removeAndHide(<immersiveengineering:shovel_steel>);
mods.jei.JEI.removeAndHide(<immersiveengineering:axe_steel>);

mods.horsepower.ChoppingBlock.add(<minecraft:melon_block>, <minecraft:melon>, 1);

// No nether needed for blast furnace
recipes.remove(<immersiveengineering:stone_decoration:1>);
recipes.addShaped(<immersiveengineering:stone_decoration:1> * 3,
[[<ore:clay>,       <ore:ingotBrick>,                          <ore:clay>],
 [<ore:ingotBrick>, <immersiveengineering:stone_decoration:5>, <ore:ingotBrick>],
 [<ore:clay>,       <ore:ingotBrick>,                          <ore:clay>]]);
 
 
// Lit torch with iron and flint, fire starter, or matchbox
recipes.remove(<realistictorches:torch_lit>);
recipes.addShapeless(
	<realistictorches:torch_lit>,
	[<realistictorches:torch_unlit>,
	 <minecraft:flint_and_steel>.transformDamage()
	 | <notreepunching:fire_starter>.transformDamage()
	 | <realistictorches:matchbox>.transformDamage()]
);


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
