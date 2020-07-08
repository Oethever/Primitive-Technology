import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

recipes.addShapeless(
	"recipe1",
	<minecraft:stick> * 3,
	[<minecraft:glass>],
	null,
	function(output, craftInfo, player) {
		player.give(<minecraft:dirt> * 2);
	}
);

// Output when crafting with a saw in a craftin grid
val planksPerLogManual = 4;
val sawdustPerLogManual = 1;
val barkPerLogManual = 2;
val stickPerPlankManual = 8;
val sawdustPerPlankManual = 1;

// Output when crafting with a BWM mechanical saw
val planksPerLogSaw = 6;
val sawdustPerLogSaw = 2;
val barkPerLogSaw = 4;
val stickPerPlankSaw = 12;
val sawdustPerPlankSaw = 2;

val sawTool = <ore:ticSaw> |
	<betterwithmods:steel_hacksaw> |
	<bibliocraft:framingsaw> |
	<ore:toolSaw>;

val axeTool = <ore:toolWeakAxe> |
	<ore:toolMattock> |
	<betterwithmods:steel_mattock> |
	<tconstruct:mattock> |
	<tconstruct:hatchet>;

var sawdustItem = <betterwithmods:material:22>;

// This item is mysteriously useless
mods.jei.JEI.removeAndHide(<betterwithmods:shaft>);


// Saw tools: use only the No Tree Punching variants
recipes.replaceAllOccurences(<betterwithmods:steel_hacksaw>, sawTool, <*>);
recipes.replaceAllOccurences(<bibliocraft:framingsaw>, sawTool, <*>);
mods.jei.JEI.removeAndHide(<betterwithmods:steel_hacksaw>);
mods.jei.JEI.removeAndHide(<bibliocraft:framingsaw>);


// Planks recipes
for plankItem in <ore:plankWood>.itemArray {
	recipes.remove(plankItem);
}

// Add back saw recipe as shapeless. We can't use ore dictionnary here because each
// type of log generates a different type of plank
val logPlanksBarks = [
	[<minecraft:log:0>         , <minecraft:planks:0>, <betterwithmods:bark:0>,],
	[<minecraft:log:1>         , <minecraft:planks:1>, <betterwithmods:bark:1>,],
	[<minecraft:log:2>         , <minecraft:planks:2>, <betterwithmods:bark:2>,],
	[<minecraft:log:3>         , <minecraft:planks:3>, <betterwithmods:bark:3>,],
	[<minecraft:log2:0>        , <minecraft:planks:4>, <betterwithmods:bark:4>,],
	[<minecraft:log2:1>        , <minecraft:planks:5>, <betterwithmods:bark:5>,],
	[<betterwithmods:blood_log>, <minecraft:planks:3>, <betterwithmods:bark:6>,]
] as IItemStack[][];

var JEIpageItems = [sawdustItem, <minecraft:stick>] as IItemStack[];

var i = 0 as int;
for items in logPlanksBarks {
	val log = items[0];
	val planks = items[1];
	val bark = items[2];
	
	// Add manual sawing in crafting grid
	recipes.addShapeless(
		"manual_saw_" ~ i,
		planks * planksPerLogManual,
		[log, sawTool.transformDamage()],
		// we have to specify this function
		null,
		// action to be performed after the craft
		function(output, craftInfo, player) {
			player.give(sawdustItem * sawdustPerLogManual);
			player.give(bark * barkPerLogManual);
		}
	);
	
	// Remove BWM mechanical saw recipe
	mods.betterwithmods.Saw.remove(log);
	
	// Add it back
	mods.betterwithmods.Saw.add(log, [planks * planksPerLogSaw, bark * barkPerLogSaw, sawdustItem * sawdustPerLogSaw]);
	
	JEIpageItems += planks;
	JEIpageItems += bark;
	JEIpageItems += log;
	i += 1;
}

mods.jei.JEI.addDescription(JEIpageItems, "Bark and sawdust can be obtained by using a manual saw on logs or planks in the crafting grid. It will produce planks or sticks, and bark and sawdust as additional outputs.");

// Stick recipes
recipes.remove(<minecraft:stick>);
recipes.addShapeless(
	"manual_saw_stick",
	<minecraft:stick> * stickPerPlankManual,
	[<ore:plankWood>, sawTool.transformDamage()],
	// we have to specify this function
	null,
	// action to be performed after the craft
	function(output, craftInfo, player) {
		player.give(sawdustItem * sawdustPerPlankManual);
	}
);
mods.horsepower.ChoppingBlock.add(<ore:plankWood>, <minecraft:stick> * stickPerPlankManual, 1, false);
mods.horsepower.ChoppingBlock.add(<ore:plankWood>, <minecraft:stick> * stickPerPlankManual, 4, true);
// No stick in saw since it conflicts with mouldings
mods.betterwithmods.Saw.add(<ore:plankWood>, [<minecraft:stick> * stickPerPlankSaw, sawdustItem * sawdustPerPlankSaw]);


// Chopping block recipes (for creating a chopping block, not using it)
recipes.remove(<horsepower:chopping_block>);
i = 0;
// Create a different recipe for each type of chopping block / log wood
for logItem in <ore:logWood>.itemArray {
	recipes.addShapeless(
		"chopping_block_" ~ i,
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
	i += 1;
}

// Compressed sawdust
val compressedSawdust = <thermalfoundation:material:801>;
recipes.remove(compressedSawdust);
mods.horsepower.Press.add(sawdustItem * 9, compressedSawdust);
mods.immersiveengineering.CokeOven.addRecipe(<minecraft:coal:1>, 250, compressedSawdust, 1800);


// Framing sheet (conflict with stick recipe)
recipes.remove(<bibliocraft:framingsheet>);
recipes.addShapeless(<bibliocraft:framingsheet> * 4, [<ore:plankWood>, <ore:plankWood>, sawTool.transformDamage()]);