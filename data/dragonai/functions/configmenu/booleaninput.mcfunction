$execute if score MinecraftVersion VersionInfo matches 14.. run function dragonai:configmenu/booleaninputnew {name:"$(name)",id:"$(id)",returnto:"$(returnto)",hovertext:"$(hovertext)",extrajson:"$(extrajson)"}
$execute if score MinecraftVersion VersionInfo matches ..13 run function dragonai:configmenu/booleaninputold {name:"$(name)",id:"$(id)",returnto:"$(returnto)",hovertext:"$(hovertext)",extrajson:"$(extrajson)"}