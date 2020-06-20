import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

val sawTool = <ore:toolSaw>.or(<betterwithmods:steel_hacksaw>).or(<bibliocraft:framingsaw>);
val axeTool = <ore:toolWeakAxe>.or(<tconstruct:mattock>).or(<tconstruct:hatchet>);
val plankDef = <minecraft:planks>.definition;
val logDef = <minecraft:log>.definition;


// This item is mysteriously useless
mods.jei.JEI.removeAndHide(<betterwithmods:shaft>);


// Planks recipes
for plankItem in <ore:plankWood>.itemArray {
	recipes.remove(plankItem);
}
// Add back saw recipe as shapeless. We can't use ore dictionnary here because each
// type of log generates a different type of plank
val logToPlanks = {
	<betterwithmods:blood_log>: <minecraft:planks:3>,
	<minecraft:log:0>         : <minecraft:planks:0>,
	<minecraft:log:1>         : <minecraft:planks:1>,
	<minecraft:log:2>         : <minecraft:planks:2>,
	<minecraft:log:3>         : <minecraft:planks:3>,
	<minecraft:log2:0>        : <minecraft:planks:4>,
	<minecraft:log2:1>        : <minecraft:planks:5>,
} as IItemStack[IIngredient];

for log, planks in logToPlanks {
	recipes.addShapeless(planks * 4, [log, sawTool.transformDamage()]);
}


// Stick recipes
recipes.remove(<minecraft:stick>);
recipes.addShapeless(<minecraft:stick>, [<betterwithmods:shaft>]);
recipes.addShapeless(<minecraft:stick> * 8, [<ore:plankWood>, sawTool.transformDamage()]);
mods.horsepower.ChoppingBlock.add(<ore:plankWood>, <minecraft:stick> * 8, 1, false);
mods.horsepower.ChoppingBlock.add(<ore:plankWood>, <minecraft:stick> * 8, 4, true);


// Chopping block recipes (for creating a chopping block, not using it)
recipes.remove(<horsepower:chopping_block>);
// Create a different recipe for each type of chopping block / log wood
for logItem in <ore:logWood>.itemArray {
	recipes.addShapeless(
		"chopping_block_" ~ logItem.name,
		<horsepower:chopping_block> * 2,
		[logItem.marked("mark"), axeTool.transformDamage()],
		function(output, inputs, craftInfo) {
			return <horsepower:chopping_block>.withTag({
				textureBlock: {
					id: inputs.mark.definition.id,
					Count: 1 as byte,
					Damage: inputs.mark.metadata as short
				}
			}) * 2;
		},
		null);
}