import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// This function returns the Immersive Engineering ingot
// corresponding to the given ore dict entry, if any exists.
// If it does not exists, returns the first IItemStack from the entry.
function getIEIngot(oreDictEntry as IOreDictEntry) as IItemStack{
	val itemStacks = oreDictEntry.items as IItemStack[];
	if loadedMods has "Immersive Engineering" {
		for item in itemStacks {
			if loadedMods["Immersive Engineering"].items has item {
				return item;
			}
		}
	}
	return oreDictEntry.firstItem;
}

// Add bronze ingot/dust smelting in Charcoal Pit crucible
// mods.charcoalpit.addAlloyRecipe(result, amount, advanced, usePrefix, recipe);
// *advanced:  boolean-if true only the bloomery can use this recipe
// *usePrefix: boolean-if true the oredict values of the recipe will have the prefixes ore/ingot/dust applied. this allows ores, ingots and dust to be mixed as well as only using one recipe.
mods.charcoalpit.addAlloyRecipe(<thermalfoundation:material:163>, 1, false, true, [<ore:Bronze>]);

// Add low-melting-point metals smelting in stoked crucible
val easyMetals = ["Copper", "Silver", "Tin", "Gold", "Lead", "Bronze"] as string[];
for metal in easyMetals {
	val ingot = [getIEIngot(oreDict.get("ingot" ~ metal))] as IItemStack[];
	mods.betterwithmods.Crucible.addStoked([oreDict.get("dust" ~ metal)], ingot);
	mods.betterwithmods.Crucible.addStoked([oreDict.get("ingot" ~ metal)], ingot);
	if (metal != "Bronze") {
		mods.betterwithmods.Crucible.addStoked([oreDict.get("ore" ~ metal)], ingot);
	}
}

// Add low-melting-point alloy smelting in stoked crucible
val easyAlloys = [
	[<thermalfoundation:material:163>, <ore:ingotCopper> * 3, <ore:ingotTin>    ],        
	[<thermalfoundation:material:163>, <ore:ingotCopper> * 3, <ore:dustTin>     ],        
	[<thermalfoundation:material:163>, <ore:dustCopper> * 3,  <ore:ingotTin>    ],        
	[<thermalfoundation:material:163>, <ore:dustCopper> * 3,  <ore:dustTin>     ],        
	[<immersiveengineering:metal:7>  , <ore:ingotGold>,       <ore:ingotSilver> ],        
	[<immersiveengineering:metal:7>  , <ore:ingotGold>,       <ore:dustSilver>  ],        
	[<immersiveengineering:metal:7>  , <ore:dustGold>,        <ore:ingotSilver> ],        
	[<immersiveengineering:metal:7>  , <ore:dustGold>,        <ore:dustSilver>  ]        
] as IIngredient[][];

for alloy in easyAlloys {
	mods.betterwithmods.Crucible.addStoked([alloy[1], alloy[2]] as IIngredient[], [alloy[0].itemArray[0]] as IItemStack[]);
}


// Create a list of all ingots
var ingots = [
	<ore:ingotIron>,
	<ore:ingotGold>,
	<ore:ingotAluminum>,
	<ore:ingotCopper>,
	<ore:ingotTin>,
	<ore:ingotNickel>,
	<ore:ingotSilver>,
	<ore:ingotLead>,
	<ore:ingotUranium>,
	<ore:ingotConstantan>,
	<ore:ingotSteel>,
	<ore:ingotElectrum>,
	<ore:ingotInvar>,
	<ore:ingotBronze>,
	<ore:ingotCobalt>,
	<ore:ingotArdite>,
	<ore:ingotManyullyn>,
	<ore:ingotKnightslime>,
	<ore:ingotPigiron>,
	<ore:ingotAlubrass>,
] as IIngredient[];

// Remove all ingots from being smelted in a furnace
for ingotOre in ingots {
	for ingotItem in ingotOre.itemArray {
		furnace.remove(ingotItem);
	}
}


// Remove ore smelting in tconstruct smeltry
var oreToLiquids = {
	<ore:oreIron>    : <liquid:iron>,
	<ore:oreGold>    : <liquid:gold>,
	<ore:oreCobalt>  : <liquid:cobalt>,
	<ore:oreCopper>  : <liquid:copper>,
	<ore:oreTin>     : <liquid:tin>,
	<ore:oreLead>    : <liquid:lead>,
	<ore:oreNickel>  : <liquid:nickel>,
	<ore:oreSilver>  : <liquid:silver>,
	<ore:oreAluminum>: <liquid:aluminum>,
	<ore:oreUranium> : <liquid:uranium>
} as ILiquidStack[IIngredient];

for ore, liquid in oreToLiquids {
	for item in ore.itemArray {
		mods.tconstruct.Melting.removeRecipe(liquid, item);
	}
}


// Remove creation of pure metal dust from ore with engineer's hammer
val dusts = [
	<ore:dustAluminum>,
	<ore:dustCopper>,
	<ore:dustIron>,
	<ore:dustGold>,
	<ore:dustTin>,
	<ore:dustNickel>,
	<ore:dustSilver>,
	<ore:dustLead>,
	<ore:dustUranium>
] as IIngredient[];

for dustOre in dusts {
	for dustItem in dustOre.itemArray {
		recipes.remove(dustItem);
	}
}