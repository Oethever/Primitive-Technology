import mods.jei.JEI.removeAndHide;

// Remove IE steel tools
// We do not remove hoe and shovel because they can be used in the hoe cart
removeAndHide(<immersiveengineering:pickaxe_steel>);
removeAndHide(<immersiveengineering:axe_steel>);


// No nether needed for blast furnace
recipes.remove(<immersiveengineering:stone_decoration:1>);
recipes.addShaped(<immersiveengineering:stone_decoration:1> * 3,
[[<ore:clay>,       <ore:ingotBrick>,                          <ore:clay>],
 [<ore:ingotBrick>, <immersiveengineering:stone_decoration:5>, <ore:ingotBrick>],
 [<ore:clay>,       <ore:ingotBrick>,                          <ore:clay>]]);