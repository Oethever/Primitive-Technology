import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;

// backpack without gold
recipes.remove(<wearablebackpacks:backpack>);
recipes.addShaped(<wearablebackpacks:backpack>,
[[<ore:hideTanned>, <ore:hideTanned>, <ore:hideTanned>],
 [<ore:hideTanned>, <ore:wool>,       <ore:hideTanned>],
 [<ore:hideTanned>, <ore:hideTanned>, <ore:hideTanned>]]);


// Tool belt without metal
recipes.remove(<toolbelt:belt>);
recipes.addShaped(<toolbelt:belt>.withTag({Size: 2, Items: {}}),
[[<ore:string>,     <ore:hideTanned>, <ore:string>],
 [<ore:hideTanned>, null,             <ore:hideTanned>],
 [<ore:hideTanned>, null,             <ore:hideTanned>]]);

recipes.remove(<toolbelt:pouch>);
recipes.addShaped(<toolbelt:pouch>,
[[<ore:string>,     null,             <ore:string>],
 [<ore:hideTanned>, null,             <ore:hideTanned>],
 [<ore:string>,     <ore:hideTanned>, <ore:string>]]);

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