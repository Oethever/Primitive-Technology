mods.horsepower.ChoppingBlock.add(<minecraft:melon_block>, <minecraft:melon>, 1);

// Remove recipes in crafting table
recipes.remove(<minecraft:planks:*>);
recipes.remove(<minecraft:stick>);

// Add back saw recipe as shapeless
var plankDef = <minecraft:planks>.definition;
var logDef = <minecraft:log>.definition;
for i in 0 to 5 {
	recipes.addShapeless(plankDef.makeStack(i) * 4, [logDef.makeStack(i), <ore:toolSaw>.transformDamage()]);
}

recipes.addShapeless(<minecraft:stick>, [<betterwithmods:shaft>]);
recipes.addShapeless(<minecraft:stick> * 8, [<ore:plankWood>, <ore:toolSaw>.transformDamage()]);
mods.horsepower.ChoppingBlock.add(<ore:plankWood>, <minecraft:stick> * 8, 1, false);
mods.horsepower.ChoppingBlock.add(<ore:plankWood>, <minecraft:stick> * 8, 4, true);