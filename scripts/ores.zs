import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import scripts.functions.getModItemDefault;
import scripts.functions.getModItems;
import scripts.functions.concatString;

val materialsToRemove = [
	"Platinum",
	"Iridium",
	"Invar",
	"Uranium",
	"Mithril",
	"Signalum",
	"Lumium",
	"Enderium",
	"Pigiron",
	"Ardite",
	"Manyullyn",
	"Knightslime"
] as string[];

val materialsToKeep = [
	"Iron",
	"Gold",
	"Copper",
	"Tin",
	"Silver",
	"Lead",
	"Nickel",
	"Bronze",
	"Steel",
	"Electrum",
	"Constantan",
	"Aluminum",
	"Alubrass",
	"Cobalt"
] as string[];

val allMaterials = concatString(materialsToKeep, materialsToRemove);

val oreDictPrefixes = [
	"ore",
	"ingot",
	"block",
	"nugget",
	"dust",
	"plate",
	"gear",
	"rod",
	"slab",
	"blockSheetmetal",
	"slabSheetmetal",
	"fence",
	"stick",
	"coin",
	"dustTiny",
	"dustSmall",
	"plateDense"
] as string[];


for material in materialsToRemove {
	// Remove crafting recipes
	for oreDictPrefix in oreDictPrefixes {
		val oreDictEntry = oreDict.get(oreDictPrefix ~ material);
		for item in oreDictEntry.itemArray {
			mods.jei.JEI.removeAndHide(item);
		}
	}

	// Remove all press recipes
	for oreDictPrefix in ["plate", "gear", "rod", "stick", "wire"] as string[] {
		val oreDictEntry = oreDict.get(oreDictPrefix ~ material);
		for item in oreDictEntry.itemArray {
			mods.immersiveengineering.MetalPress.removeRecipe(item);
		}
	}

	// Remove crusher dust recipes
	for item in oreDict.get("dust" ~ material).itemArray {
		mods.immersiveengineering.Crusher.removeRecipe(item);
	}
}

// Remove the Thermal Foundation version of items that
// Immersive Engineering already provides
for material in materialsToKeep {
	if (material != "Tin" & material != "Bronze") {
		for oreDictPrefix in oreDictPrefixes {
			val oreDictEntry = oreDict.get(oreDictPrefix ~ material);
			val foundItems = getModItems("thermalfoundation", oreDictEntry) as IItemStack[];
			for item in foundItems {
				mods.jei.JEI.removeAndHide(item);
			}
		}
	}
}

for material in allMaterials {
	// Remove all ingots and nuggest from being smelted in a furnace
	for oreDictPrefix in ["ingot", "nugget"] as string[] {
		for item in oreDict.get(oreDictPrefix ~ material).itemArray {
			furnace.remove(item);
		}
	}
	
	// Remove creation of pure metal dust from ore with engineer's hammer
	// This also remove metal alloying through dust blending
	for item in oreDict.get("dust" ~ material).itemArray {	
		recipes.remove(item);
	}
}


// Add bronze ingot/dust smelting in Charcoal Pit crucible
// mods.charcoalpit.addAlloyRecipe(result, amount, advanced, usePrefix, recipe);
// *advanced:  boolean-if true only the bloomery can use this recipe
// *usePrefix: boolean-if true the oredict values of the recipe will have the prefixes ore/ingot/dust applied. this allows ores, ingots and dust to be mixed as well as only using one recipe.
mods.charcoalpit.addAlloyRecipe(<thermalfoundation:material:163>, 1, false, true, [<ore:Bronze>]);
mods.charcoalpit.addAlloyRecipe(<immersiveengineering:metal:7>, 1, false, true, [<ore:Electrum>]);

// Add low-melting-point metals smelting in stoked crucible
val easyMetals = ["Copper", "Silver", "Tin", "Gold", "Lead", "Bronze", "Electrum"] as string[];
for metal in easyMetals {
	val ingot = getModItemDefault("immersiveengineering", oreDict.get("ingot" ~ metal));
	mods.betterwithmods.Crucible.addStoked([oreDict.get("dust" ~ metal)], [ingot]);
	if (metal != "Bronze" & metal != "Electrum") {
		mods.betterwithmods.Crucible.addStoked([oreDict.get("ore" ~ metal)], [ingot]);
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

// Remove some metal melting and alloying
var liquidsToRemove = [
	// These are real metals, but we don't need them yet
	<liquid:iridium>,
	<liquid:zinc>,
	<liquid:platinum>,
	<liquid:invar>,
	// These should definitely be removed
	<liquid:enderium>,
	<liquid:lumium>,
	<liquid:signalum>,
	<liquid:manyullyn>,
	<liquid:knightslime>,
	<liquid:ardite>,
	<liquid:pigiron>,
] as ILiquidStack[];

for liquid in liquidsToRemove {
	mods.tconstruct.Melting.removeRecipe(liquid);
	mods.tconstruct.Alloy.removeRecipe(liquid);
}