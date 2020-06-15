# CREATED USING EXTERNAL TWEAKER

mods.notreepunching.FirePit.remove(<notreepunching:pottery/large_vessel>);
mods.notreepunching.FirePit.remove(<notreepunching:pottery/small_vessel>);
mods.notreepunching.FirePit.remove(<notreepunching:pottery/bucket>);
mods.notreepunching.FirePit.remove(<notreepunching:pottery/flower_pot>);
mods.notreepunching.FirePit.remove(<notreepunching:clay_brick>);

mods.charcoalpit.addKilnRecipe(<ceramics:clay_barrel_unfired>, <ceramics:clay_barrel>);
mods.charcoalpit.addKilnRecipe(<ceramics:clay_barrel_unfired:1>, <ceramics:clay_barrel:1>);
mods.charcoalpit.addKilnRecipe(<ceramics:clay_barrel_unfired:3>, <ceramics:porcelain_barrel_extension>);
mods.charcoalpit.addKilnRecipe(<ceramics:clay_barrel_unfired:2>, <ceramics:porcelain_barrel>);
mods.charcoalpit.addKilnRecipe(<ceramics:unfired_clay:6>, <ceramics:faucet>);
mods.charcoalpit.addKilnRecipe(<ceramics:unfired_clay:7>, <ceramics:channel>);
mods.charcoalpit.addKilnRecipe(<ceramics:unfired_clay>, <ceramics:clay_bucket>);
mods.charcoalpit.addKilnRecipe(<ceramics:unfired_clay:4>, <ceramics:unfired_clay:5>);
mods.charcoalpit.addKilnRecipe(<betterwithmods:unfired_pottery>, <betterwithmods:cooking_pot>);
mods.charcoalpit.addKilnRecipe(<betterwithmods:unfired_pottery:1>, <betterwithmods:planter>);
mods.charcoalpit.addKilnRecipe(<betterwithmods:unfired_pottery:2>, <betterwithmods:urn>);
mods.charcoalpit.addKilnRecipe(<betterwithmods:unfired_pottery:3>, <betterwithmods:vase>);
mods.charcoalpit.addKilnRecipe(<betterwithmods:unfired_pottery:4>, <minecraft:brick>);
mods.charcoalpit.addKilnRecipe(<betterwithmods:unfired_pottery:5>, <minecraft:netherbrick>);
mods.charcoalpit.addKilnRecipe(<ceramics:unfired_clay:8>, <ceramics:unfired_clay:9>);
mods.charcoalpit.addKilnRecipe(<ceramics:unfired_clay:1>, <ceramics:clay_shears>);

mods.betterwithmods.Kiln.add(<ceramics:clay_barrel_unfired>, [<ceramics:clay_barrel>]);
mods.betterwithmods.Kiln.add(<ceramics:clay_barrel_unfired:1>, [<ceramics:clay_barrel:1>]);
mods.betterwithmods.Kiln.add(<ceramics:clay_barrel_unfired:3>, [<ceramics:porcelain_barrel_extension>]);
mods.betterwithmods.Kiln.add(<ceramics:clay_barrel_unfired:2>, [<ceramics:porcelain_barrel>]);

furnace.remove(<ceramics:clay_barrel>);
furnace.remove(<ceramics:clay_barrel:1>);
furnace.remove(<ceramics:porcelain_barrel_extension>);
furnace.remove(<ceramics:porcelain_barrel>);
furnace.remove(<ceramics:faucet>);
furnace.remove(<ceramics:channel>);
furnace.remove(<ceramics:clay_bucket>);
furnace.remove(<ceramics:unfired_clay:5>);
furnace.remove(<ceramics:unfired_clay:9>);
furnace.remove(<ceramics:clay_shears>);