import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;

// backpack without gold
recipes.remove(<wearablebackpacks:backpack>);
recipes.addShaped(<wearablebackpacks:backpack>,
[[<ore:hideStrap>,  <ore:hideTanned>, <ore:hideStrap>],
 [<ore:hideTanned>, <ore:wool>,       <ore:hideTanned>],
 [<ore:hideStrap>,  <ore:hideTanned>, <ore:hideStrap>]]);


// Tool belt without metal
recipes.remove(<toolbelt:belt>);
recipes.addShaped(<toolbelt:belt>.withTag({Size: 2, Items: {}}),
[[<ore:string>,    <ore:hideStrap>, <ore:string>],
 [<ore:hideStrap>, null,            <ore:hideStrap>],
 [<ore:hideStrap>, null,            <ore:hideStrap>]]);

recipes.remove(<toolbelt:pouch>);
recipes.addShaped(<toolbelt:pouch>,
[[<ore:string>,    null,            <ore:string>],
 [<ore:hideStrap>, null,            <ore:hideStrap>],
 [<ore:string>,    <ore:hideStrap>, <ore:string>]]);

// Tool belt upgrade in shapeless crafting
for i in 2 to 9 {
	recipes.addShapeless(
		"add_pouch_toolbelt_" ~ i,
		<toolbelt:belt>,
		[<toolbelt:belt>.withTag({Size: i}).marked("mark"), <toolbelt:pouch>],
		function(output, ingredients, craftInfo) {
			return ingredients.mark.withTag({Size: i + 1, Items: ingredients.mark.tag.Items});
		},
		null
	);
}

// Leather to glue in stoked cauldron
val leathers = [
	<minecraft:rabbit_hide>,
	<ore:leather>,
	<ore:hideTanned>,
	<ore:hideScoured>,
	<ore:hideStrap>,
	<ore:hideBelt>
] as IIngredient[];

for leather in leathers {
	mods.betterwithmods.Cauldron.addStoked([leather], [<betterwithmods:material:12>]);
}

// Saddle
val ingotBronzeOrIron = <ore:ingotBronze>.or(<ore:ingotIron>);
recipes.remove(<minecraft:saddle>);
recipes.addShaped(<minecraft:saddle>,
[[<ore:hideTanned>,  <ore:hideTanned>,  <ore:hideTanned>],
 [<ore:hideTanned>,  ingotBronzeOrIron, <ore:hideTanned>],
 [ingotBronzeOrIron, null,              ingotBronzeOrIron]]);