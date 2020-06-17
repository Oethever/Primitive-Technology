recipes.removeShaped(<betterwithmods:hibachi>);
recipes.addShaped("simple_hibachi_coal", <betterwithmods:hibachi>, [[<ore:blockCoal>, <ore:blockCoal>, <ore:blockCoal>], [<ore:stone>, <betterwithmods:material:27>, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);
recipes.addShaped("simple_hibachi_charcoal", <betterwithmods:hibachi>, [[<ore:blockCharcoal>, <ore:blockCharcoal>, <ore:blockCharcoal>], [<ore:stone>, <betterwithmods:material:27>, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);
recipes.addShaped("simple_hibachi_coke", <betterwithmods:hibachi>, [[<ore:blockCoalCoke>, <ore:blockCoalCoke>, <ore:blockCoalCoke>], [<ore:stone>, <betterwithmods:material:27>, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);

mods.immersiveengineering.Crusher.removeRecipe(<thermalfoundation:material:768>);
mods.immersiveengineering.Crusher.removeRecipe(<thermalfoundation:material:769>);
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:18>, <minecraft:coal>, 2048);
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:37>, <minecraft:coal:1>, 2048);

mods.immersiveengineering.CokeOven.removeAll();
mods.immersiveengineering.CokeOven.addRecipe(<charcoal_pit:item_coke>, 500, <minecraft:coal>, 1800);
mods.immersiveengineering.CokeOven.addRecipe(<charcoal_pit:block_coke>, 4500, <minecraft:coal_block>, 16200);
mods.immersiveengineering.CokeOven.addRecipe(<minecraft:coal:1>, 250, <ore:logWood>, 1800);

//mods.betterwithmods.Kiln.remove([<minecraft:coal:1>]);
furnace.remove(<minecraft:coal:1>);

mods.jei.JEI.removeAndHide(<immersiveengineering:material:6>);
mods.jei.JEI.removeAndHide(<immersiveengineering:stone_decoration:3>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:802>);
mods.jei.JEI.removeAndHide(<thermalfoundation:storage_resource:1>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:769>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:768>);

// Merge Chisel and Charcoal Pit coal coke block OreDict entries
<ore:blockCoalCoke>.addAll(<ore:blockCoke>);
<ore:blockCoke>.addAll(<ore:blockCoalCoke>);