import crafttweaker.oredict.IOreDict;

val materials = [
	"Aluminum",
	"Platinum",
	"Iridium",
	"Mithril",
	"Invar",
	"Signalum",
	"Lumium",
	"Enderium"
] as string[];

for material in materials {
	val ingot = oreDict.get("ingot" ~ material);
	val block = oreDict.get("block" ~ material);
	val nugget = oreDict.get("nugget" ~ material);
	val dust = oreDict.get("dust" ~ material);
	val plate = oreDict.get("plate" ~ material);
	val gear = oreDict.get("gear" ~ material);
	for item in ingot.itemArray {
		recipes.remove(item);
		mods.jei.JEI.removeAndHide(item);
	}
	for item in block.itemArray {
		recipes.remove(item);
		mods.jei.JEI.removeAndHide(item);
	}
	for item in nugget.itemArray {
		recipes.remove(item);
		mods.jei.JEI.removeAndHide(item);
	}
	for item in dust.itemArray {
		recipes.remove(item);
		mods.immersiveengineering.Crusher.removeRecipe(item);
		mods.jei.JEI.removeAndHide(item);
	}
	for item in gear.itemArray {
		mods.immersiveengineering.MetalPress.removeRecipe(item);
		mods.jei.JEI.removeAndHide(item);
	}
}