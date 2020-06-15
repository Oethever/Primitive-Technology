# CREATED USING EXTERNAL TWEAKER

recipes.removeShaped(<betterwithmods:hibachi>);
recipes.addShaped("simple_hibachi_coal", <betterwithmods:hibachi>, [[<ore:blockCoal>, <ore:blockCoal>, <ore:blockCoal>], [<ore:stone>, <betterwithmods:material:27>, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);

recipes.addShaped("simple_hibachi_charcoal", <betterwithmods:hibachi>, [[<ore:blockCharcoal>, <ore:blockCharcoal>, <ore:blockCharcoal>], [<ore:stone>, <betterwithmods:material:27>, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);

recipes.addShaped("simple_hibachi_coke", <betterwithmods:hibachi>, [[<ore:blockCoalCoke>, <ore:blockCoalCoke>, <ore:blockCoalCoke>], [<ore:stone>, <betterwithmods:material:27>, <ore:stone>], [<ore:stone>, <ore:dustRedstone>, <ore:stone>]]);

mods.jei.JEI.removeAndHide(<charcoal_pit:fire_starter>);
mods.jei.JEI.removeAndHide(<betterwithmods:axle_generator>);
mods.jei.JEI.removeAndHide(<betterwithmods:axle_generator:2>);
mods.jei.JEI.removeAndHide(<betterwithmods:material:11>);
mods.jei.JEI.removeAndHide(<betterwithmods:axle_generator:1>);


mods.notreepunching.NoTreePunching.addKnifeGrassDrop(<charcoal_pit:straw>);
