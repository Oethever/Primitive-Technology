recipes.removeShaped(<betterwithmods:hibachi>);
val blockCoalAny = <ore:blockCoal>.or(<ore:blockCharcoal>).or(<ore:blockCoalCoke>).or(<ore:fuelCoke>);
recipes.addShaped(
	<betterwithmods:hibachi>,
	[[blockCoalAny, blockCoalAny,                blockCoalAny],
	 [<ore:stone>,  <realistictorches:matchbox>, <ore:stone>],
	 [<ore:stone>,  <ore:stone>,                 <ore:stone>]]);

mods.immersiveengineering.Crusher.removeRecipe(<thermalfoundation:material:768>);
mods.immersiveengineering.Crusher.removeRecipe(<thermalfoundation:material:769>);
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:18>, <ore:coal>, 2048);
mods.immersiveengineering.Crusher.addRecipe(<betterwithmods:material:37>, <ore:charcoal>, 2048);

mods.immersiveengineering.CokeOven.removeAll();
mods.immersiveengineering.CokeOven.addRecipe(<charcoal_pit:item_coke>, 500, <ore:coal>, 1800);
mods.immersiveengineering.CokeOven.addRecipe(<charcoal_pit:block_coke>, 4500, <ore:blockCoal>, 16200);
mods.immersiveengineering.CokeOven.addRecipe(<minecraft:coal:1>, 250, <ore:logWood>, 1800);

furnace.remove(<minecraft:coal:1>);
furnace.remove(<minecraft:coal>);

mods.jei.JEI.removeAndHide(<immersiveengineering:material:6>);
mods.jei.JEI.removeAndHide(<immersiveengineering:stone_decoration:3>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:802>);
mods.jei.JEI.removeAndHide(<thermalfoundation:storage_resource:1>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:769>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:768>);

recipes.remove(<chisel:block_charcoal2:1>);

// Merge Chisel and Charcoal Pit coal coke block OreDict entries
<ore:blockCoalCoke>.addAll(<ore:blockCoke>);
<ore:blockCoke>.addAll(<ore:blockCoalCoke>);
