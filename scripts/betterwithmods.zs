import mods.jei.JEI.removeAndHide;

// Remove some items that are provided by multiple mods
removeAndHide(<betterwithmods:axle_generator>);
removeAndHide(<betterwithmods:axle_generator:2>);
removeAndHide(<betterwithmods:material:11>);
removeAndHide(<betterwithmods:axle_generator:1>);


// Remove Better with mods Hemp, we have IE's.
// We keep IE instead of BWM because it has one step less
// (grinding hemp to get fiber does not really improve gameplay)
// and it's the only way to allow hemp bowstrings
removeAndHide(<betterwithmods:hemp>);       // Hemp Seeds
removeAndHide(<betterwithmods:material:2>); // Hemp
removeAndHide(<betterwithmods:material:3>); // Hemp Fibers
removeAndHide(<betterwithmods:material:4>); // Hemp Cloth


// Diamon ingot ???
removeAndHide(<betterwithmods:material:45>);
 

// Allow cauldron with copper or bronze as well
recipes.replaceAllOccurences(
	// Replace ... 
	<ore:ingotIron>,
	// ... by ...
	<ore:ingotCopper> | <ore:ingotIron> | <ore:ingotBronze>,
	// ... in recipes ...
	<betterwithmods:cooking_pot:1>); 

// Make rope a generic thing
<ore:rope>.add(<betterwithmods:rope>, <inspirations:rope:0>, <inspirations:rope:2>);
recipes.replaceAllOccurences(<betterwithmods:rope>, <ore:rope>, <*>);


// Add a recipe for the horse lead without slime or glue
recipes.addShaped(<minecraft:lead> * 2,
	[[<ore:string>, <ore:string>, null        ],
	 [<ore:string>, <ore:rope>,   null        ],
	 [null,         null,         <ore:string>]]);

// "Rope and nail" should be any rope and iron nuggets
recipes.remove(<comforts:rope>);
recipes.addShapedMirrored(<comforts:rope>, 
	[[<ore:nuggetIron>, null,       null],
	 [null,             <ore:rope>, null],
	 [null,             null,       <ore:nuggetIron>]]);