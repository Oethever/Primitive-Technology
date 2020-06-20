import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

val missingCrusherRecipes = {
	<minecraft:dye:3>: <betterwithmods:material:44>,
	<ore:cropWheat>: <betterwithmods:raw_pastry:3>,
	<minecraft:bone_block>: <minecraft:dye:15> * 9,
	<minecraft:skull:0>: <minecraft:dye:15> * 10,
	<minecraft:skull:1>: <minecraft:dye:15> * 10,
	<ore:netherrack>: <betterwithmods:material:15>,
	<ore:sugarcane>: <minecraft:sugar> * 2,
	<ore:cropHemp>: <betterwithmods:material:3> * 3
} as IItemStack[IIngredient];

for input, output in missingCrusherRecipes {
	mods.immersiveengineering.Crusher.addRecipe(output, input, 2048);
}



val missingMillStoneRecipes = {
	<ore:cobblestone>: <minecraft:gravel>,
	<ore:gravel>: <minecraft:sand>,
	<ore:itemSlag>: <minecraft:sand>,
	<ore:crystalSlag>: <minecraft:sand>,
	<ore:sandstone>: <minecraft:sand> * 2,
	<ore:blockClay>: <minecraft:clay_ball> * 4,
	<ore:blockQuartz>: <minecraft:quartz> * 4,
	<ore:glowstone>: <minecraft:glowstone_dust> * 4,
	<ore:rodBlaze>: <minecraft:blaze_powder> * 3,
	<ore:fuelCoke>: <immersiveengineering:material:17>,
	<ore:blockCoke>: <immersiveengineering:material:17> * 9,
	<ore:wool>: <minecraft:string> * 4,
	<ore:oreLapis>: <minecraft:dye:4> * 6,
	<ore:oreDiamond>:  <minecraft:diamond> * 1,
	<ore:oreRedstone>: <minecraft:redstone> * 4,
	<ore:oreEmerald>: <minecraft:emerald> * 1,
	<ore:oreQuartz>: <minecraft:quartz> * 2,
	<ore:oreCoal>: <minecraft:coal:0> * 3,
	<ore:gemPrismarine>: <minecraft:prismarine_crystals>
} as IItemStack[IIngredient];

for input, output in missingMillStoneRecipes {
	mods.betterwithmods.Mill.addRecipe([input], [output]);
}

val missingGrindStoneRecipes = {
	<ore:cobblestone>: <minecraft:gravel>,
	<ore:gravel>: <minecraft:sand>,
	<ore:itemSlag>: <minecraft:sand>,
	<ore:crystalSlag>: <minecraft:sand>,
	<ore:sandstone>: <minecraft:sand> * 2,
	<ore:blockClay>: <minecraft:clay_ball> * 4,
	<ore:blockQuartz>: <minecraft:quartz> * 4,
	<ore:glowstone>: <minecraft:glowstone_dust> * 4,
	<ore:rodBlaze>: <minecraft:blaze_powder> * 3,
	<ore:fuelCoke>: <immersiveengineering:material:17>,
	<ore:blockCoke>: <immersiveengineering:material:17> * 9,
	<ore:wool>: <minecraft:string> * 4,
	<ore:oreLapis>: <minecraft:dye:4> * 6,
	<ore:oreDiamond>: <minecraft:diamond> * 1,
	<ore:oreRedstone>: <minecraft:redstone> * 4,
	<ore:oreEmerald>: <minecraft:emerald> * 1,
	<ore:oreQuartz>: <minecraft:quartz> * 2,
	<ore:oreCoal>: <minecraft:coal:0> * 3,
	<ore:gemPrismarine>: <minecraft:prismarine_crystals>,
	<ore:coal>: <betterwithmods:material:18>,
	<ore:charcoal>: <betterwithmods:material:37>,
	<minecraft:dye:3>: <betterwithmods:material:44>,
	<minecraft:skull:0>: <minecraft:dye:15> * 10,
	<minecraft:skull:1>: <minecraft:dye:15> * 10,
	<ore:netherrack>: <betterwithmods:material:15>,
	<ore:cropHemp>: <betterwithmods:material:3> * 3,
	<ore:leather>: <betterwithmods:material:7>,
	
	<ore:cropWheat>: <betterwithmods:raw_pastry:3>,
	<ore:sugarcane>: <minecraft:sugar>
} as IItemStack[IIngredient];

mods.horsepower.Grindstone.remove(<horsepower:flour>);
mods.horsepower.Grindstone.remove(<minecraft:sugar>);

for input, output in missingGrindStoneRecipes {
	mods.horsepower.Grindstone.add(input, output, 12, false);
}

