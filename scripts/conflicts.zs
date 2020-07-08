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