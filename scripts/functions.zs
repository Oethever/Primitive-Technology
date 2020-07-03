import crafttweaker.mods.ILoadedMods;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;

// Returns all items that the given mod provides that match the
// given ore dict entry.
function getModItems(modId as string, oreDictEntry as IOreDictEntry) as IItemStack[] {
	var result = [] as IItemStack[];
	if (loadedMods.contains(modId)) {
		for modItem in loadedMods[modId].items {
			if (oreDictEntry has modItem) {
				result += modItem;
			}
		}
	}
	return result;
}

// Returns the first item in the given ore dict entry
// that is provided by the given mod, if any exists.
// If it does not exists, returns the first IItemStack from the entry.
function getModItemDefault(modId as string, oreDictEntry as IOreDictEntry) as IItemStack {
	val foundItems = getModItems(modId, oreDictEntry) as IItemStack[];
	if (foundItems.length > 0) {
		return foundItems[0];
	} else {
		return oreDictEntry.firstItem;
	}
}

function concatString(lhs as string[], rhs as string[]) as string[] {
	var result = lhs as string[];
	for value in rhs {
		result += value;
	}
	return result;
}

function giveItemStack(player as IPlayer, item as IItemStack) {
	var i = 0;
	val itemEntity = item.withAmount(1).createEntityItem(player.world, player.position.x, player.position.y, player.position.z);
	while i < item.amount {
		player.world.spawnEntity(itemEntity);
		i += 1;
	}
}

function filledClayBucket(fluidName as string) as IItemStack {
	return <ceramics:clay_bucket:0>.withTag({fluids: {FluidName: fluidName, Amount: 1000}});
}

function filledIronBucket(fluidName as string) as IItemStack {
	return <forge:bucketfilled>.withTag({fluids: {FluidName: fluidName, Amount: 1000}});
}