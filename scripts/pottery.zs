import crafttweaker.item.IItemStack;

// Clay flower pot had a conflicting recipe 
recipes.remove(<charcoal_pit:clay_flowerpot>);
recipes.addShaped(<charcoal_pit:clay_flowerpot>, [[<ore:clay>], [<ore:clay>]]);

val potteryBlocks = [
	[<ceramics:clay_barrel_unfired>,     <ceramics:clay_barrel>],
	[<ceramics:clay_barrel_unfired:1>,   <ceramics:clay_barrel:1>],
	[<ceramics:clay_barrel_unfired:2>,   <ceramics:porcelain_barrel>],
	[<ceramics:clay_barrel_unfired:3>,   <ceramics:porcelain_barrel_extension>],
	[<ceramics:clay_soft>,               <ceramics:porcelain>],
	[<charcoal_pit:clay_pot>,            <charcoal_pit:ceramic_pot>],
	[<betterwithmods:unfired_pottery>,   <betterwithmods:cooking_pot>],
	[<betterwithmods:unfired_pottery:1>, <betterwithmods:planter>],
	[<betterwithmods:unfired_pottery:2>, <betterwithmods:urn>],
	[<betterwithmods:unfired_pottery:3>, <betterwithmods:vase>],
	[<betterwithmods:unfired_pottery:4>, <minecraft:brick>],
	[<betterwithmods:unfired_pottery:5>, <minecraft:netherbrick>],
	[<minecraft:clay>,                   <minecraft:hardened_clay>],
	[<minecraft:brick_block>,            <ceramics:clay_hard:1>],
	[<ceramics:clay_wall:0>,             <ceramics:clay_wall:2>],
	[<minecraft:stone_slab:4>,           <ceramics:clay_slab:1>]
] as IItemStack[][];

val potteryItems = [
	[<ceramics:unfired_clay>,            <ceramics:clay_bucket>],
	[<ceramics:unfired_clay:1>,          <ceramics:clay_shears>],
	[<ceramics:unfired_clay:4>,          <ceramics:unfired_clay:5>],
	[<ceramics:unfired_clay:6>,          <ceramics:faucet>],
	[<ceramics:unfired_clay:7>,          <ceramics:channel>],
	[<ceramics:unfired_clay:8>,          <ceramics:unfired_clay:9>],
	[<charcoal_pit:clay_flowerpot>,      <minecraft:flower_pot>],
	[<minecraft:clay_ball>,              <minecraft:brick>],
	[<betterwithmods:material:35>,       <minecraft:netherbrick>],
	[<dawnoftimebuilder:grey_clay_tile>, <dawnoftimebuilder:grey_tile>]
] as IItemStack[][];


mods.betterwithmods.Kiln.removeAll();
mods.charcoalpit.flushKilnRecipes();


for items in potteryBlocks {
	val input = items[0];
	val output = items[1];
	furnace.remove(output);
	mods.charcoalpit.addKilnRecipe(input, output);
	mods.betterwithmods.Kiln.add(input, [output]);
}

for items in potteryItems {
	val input = items[0];
	val output = items[1];
	furnace.remove(output);
	mods.charcoalpit.addKilnRecipe(input, output);
}