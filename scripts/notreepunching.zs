import mods.jei.JEI.removeAndHide;

// We have to remove the knife because we have to disable
// the option "breaking change" from NTP. Otherwise the pallets
// do not work. And thus the knife becomes useless.
// Also, the mattock is already given by Tinkers' Construct
val toolMaterials = [
	"iron",
	"gold",
	"diamond",
	"copper",
	"bronze",
	"steel"
] as string[];

for toolMaterial in toolMaterials {
	removeAndHide(itemUtils.getItem("notreepunching:mattock/" ~ toolMaterial));
	removeAndHide(itemUtils.getItem("notreepunching:knife/" ~ toolMaterial));
}

removeAndHide(<notreepunching:knife/flint>);
removeAndHide(<notreepunching:clay_brick>);
removeAndHide(<notreepunching:pottery/large_vessel>);
removeAndHide(<notreepunching:pottery/small_vessel>);
removeAndHide(<notreepunching:pottery/bucket>);
removeAndHide(<notreepunching:pottery/flower_pot>);
removeAndHide(<notreepunching:ceramic_large_vessel>);
removeAndHide(<notreepunching:ceramic_small_vessel>);
removeAndHide(<notreepunching:ceramic_bucket>);
removeAndHide(<notreepunching:clay_tool>);
removeAndHide(<notreepunching:fire_starter>);

mods.notreepunching.FirePit.remove(<notreepunching:pottery/large_vessel>);
mods.notreepunching.FirePit.remove(<notreepunching:pottery/small_vessel>);
mods.notreepunching.FirePit.remove(<notreepunching:pottery/flower_pot>);
mods.notreepunching.FirePit.remove(<notreepunching:pottery/bucket>);
mods.notreepunching.FirePit.remove(<notreepunching:clay_brick>);

// Charcoal Pit' Straw is the main plant fiber
recipes.replaceAllOccurences(<notreepunching:grass_fiber>, <charcoal_pit:straw>, <*>);
<charcoal_pit:straw>.displayName = "Plant Fiber";

// Since we removed the knifes, add plant fiber as grass drop
vanilla.seeds.addSeed(<charcoal_pit:straw> % 20);

// Also convert grass to plant fiber
// Separate the recipes, it is easier to understand for the player
recipes.addShapeless(<charcoal_pit:straw> * 2, [<minecraft:tallgrass:*>]);
recipes.addShapeless(<charcoal_pit:straw> * 2, [<minecraft:double_plant:*>]);
recipes.addShapeless(<charcoal_pit:straw> * 2,
	[<minecraft:red_flower:*> |
	 <minecraft:yellow_flower:*> |
	 <inspirations:flower>]);