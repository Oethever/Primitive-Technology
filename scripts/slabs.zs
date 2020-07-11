import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingRecipe;


function addRange(blockItem as IItemStack, slabItem as IItemStack, from_ as int, to_ as int) {
	for i in from_ to to_ {
		addRecipe(blockItem, slabItem, i);
	}
}

function addRecipe(blockItem as IItemStack, slabItem as IItemStack, meta as int) {
	val blockItemMeta = blockItem.definition.makeStack(meta);
	val slabItemMeta = slabItem.definition.makeStack(meta);
	recipes.addShaped(blockItemMeta, [[slabItemMeta], [slabItemMeta]]);
}


var slabRecipes = [
	[<minecraft:stone:0>, <minecraft:stone_slab:0>],
	[<minecraft:cobblestone>, <minecraft:stone_slab:3>],
	[<minecraft:brick_block>, <minecraft:stone_slab:4>],
	[<minecraft:nether_brick>, <minecraft:stone_slab:6>],
	[<ceramics:clay_hard:7>, <ceramics:clay_slab:7>],
	[<dawnoftimebuilder:thatch_wheat>, <dawnoftimebuilder:thatch_wheat_slab>],
	[<dawnoftimebuilder:thatch_bamboo>, <dawnoftimebuilder:thatch_bamboo_slab>],
	[<dawnoftimebuilder:oak_waxed_planks>, <dawnoftimebuilder:oak_waxed_planks_slab>],
	[<dawnoftimebuilder:flat_roof_tiles>, <dawnoftimebuilder:flat_roof_tiles_slab>],
	[<dawnoftimebuilder:grey_roof_tiles>, <dawnoftimebuilder:grey_roof_tiles_slab>],
	[<dawnoftimebuilder:ochre_roof_tiles>, <dawnoftimebuilder:ochre_roof_tiles_slab>],
	[<dawnoftimebuilder:limestone_brick>, <dawnoftimebuilder:limestone_brick_slab>],
	[<dawnoftimebuilder:plastered_stone:0>, <dawnoftimebuilder:plastered_stone_slab>],
	[<dawnoftimebuilder:plastered_stone:1>, <dawnoftimebuilder:red_plastered_stone_slab>],
	[<tconstruct:deco_ground:0>, <tconstruct:deco_ground_slab:0>]
] as IItemStack[][];

for items in slabRecipes {
	recipes.addShaped(items[0], [[items[1]], [items[1]]]);
}


addRange(<minecraft:planks>, <minecraft:wooden_slab>, 0, 6);
addRange(<ceramics:clay_hard>, <ceramics:clay_slab>, 0, 6);
addRange(<tconstruct:seared>, <tconstruct:seared_slab>, 0, 8);
addRange(<tconstruct:brownstone>, <tconstruct:brownstone_slab>, 0, 8);
addRange(<tconstruct:dried_clay>, <tconstruct:dried_clay_slab>, 0, 2);
addRange(<tconstruct:firewood>, <tconstruct:firewood_slab>, 0, 2);

for meta in 0 to 4 {
	var blockItemMeta = <tconstruct:seared>.definition.makeStack(meta + 8);
	var slabItemMeta = <tconstruct:seared_slab2>.definition.makeStack(meta);
	recipes.addShaped(blockItemMeta, [[slabItemMeta], [slabItemMeta]]);
	
	blockItemMeta = <tconstruct:brownstone>.definition.makeStack(meta + 8);
	slabItemMeta = <tconstruct:brownstone_slab2>.definition.makeStack(meta);
	recipes.addShaped(blockItemMeta, [[slabItemMeta], [slabItemMeta]]);
}