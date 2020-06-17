import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

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
	mods.betterwithmods.Crucible.addStoked([oreDict.get("ore" ~ metal)], ingot);
	mods.betterwithmods.Crucible.addStoked([oreDict.get("dust" ~ metal)], ingot);
	mods.betterwithmods.Crucible.addStoked([oreDict.get("ingot" ~ metal)], ingot);
}


// Create a list of all ingots
var ingots = [
	<minecraft:iron_ingot>,
	<minecraft:gold_ingot>,
	<immersiveengineering:material:19>
] as IItemStack[];

var ingotDef = <immersiveengineering:metal>.definition;
for i in 0 to 9 {
	ingots += ingotDef.makeStack(i);
}

ingotDef = <thermalfoundation:material>.definition;
for i in 128 to 137 {
	ingots += ingotDef.makeStack(i);
}
for i in 160 to 168 {
	ingots += ingotDef.makeStack(i);
}

ingotDef = <tconstruct:ingots>.definition;
for i in 0 to 6 {
	ingots += ingotDef.makeStack(i);
}

// Remove all ingots from being smelted in a furnace
for ingot in ingots {
	furnace.remove(ingot);
}




// Remove ore smelting in tconstruct smeltry
var oreToLiquids = {
	<minecraft:iron_ore>:         <liquid:iron>,
	<minecraft:gold_ore>:         <liquid:gold>,
	<tconstruct:ore:0>:           <liquid:cobalt>,
	<immersiveengineering:ore:0>: <liquid:copper>,
	<thermalfoundation:ore:0>:    <liquid:copper>,
	<thermalfoundation:ore:1>:    <liquid:tin>,
	<immersiveengineering:ore:2>: <liquid:lead>,
	<thermalfoundation:ore:3>:    <liquid:lead>,
	<immersiveengineering:ore:4>: <liquid:nickel>,
	<thermalfoundation:ore:5>:    <liquid:nickel>,
	<immersiveengineering:ore:3>: <liquid:silver>,
	<thermalfoundation:ore:2>:    <liquid:silver>,
	<immersiveengineering:ore:1>: <liquid:aluminum>,
	<thermalfoundation:ore:4>:    <liquid:aluminum>,
	<immersiveengineering:ore:5>: <liquid:uranium>
} as ILiquidStack[IItemStack];

for ore, liquid in oreToLiquids {
	mods.tconstruct.Melting.removeRecipe(liquid, ore);
}


// Remove creation of pure metal dust from ore with engineer's hammer
val dusts = [
	<immersiveengineering:metal:9>,
	<immersiveengineering:metal:10>,
	<immersiveengineering:metal:11>,
	<immersiveengineering:metal:12>,
	<immersiveengineering:metal:13>,
	<immersiveengineering:metal:14>,
	<immersiveengineering:metal:18>,
	<immersiveengineering:metal:19>,
	<thermalfoundation:material:65>,
	<thermalfoundation:material:70>,
	<thermalfoundation:material:71>,
	<thermalfoundation:material:72>
] as IItemStack[];
for dust in dusts {
	recipes.remove(dust);
}