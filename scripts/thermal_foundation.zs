val materials = [
	"Platinum",
	"Iridium",
	"Mithril",
	"Signalum",
	"Lumium",
	"Enderium"
] as string[];

// Hide unused materials. This is not ideal, since recipes still exist (crusher, press, etc)
for material in materials {
	val items = itemUtils.getItemsByRegexUnlocalizedName(".*" ~ material ~ ".*");
	for item in items {
		mods.jei.JEI.removeAndHide(item);
	}
}