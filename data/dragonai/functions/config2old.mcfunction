execute unless entity @s run say The function dragonai:config2 cannot be run through the console.
execute unless entity @s run return fail

tellraw @s "§5Old Dragon Mechanics Configuration Page 2"
tellraw @s {"text":"§7Presets:"}
tellraw @s [{"text":"[1.0-1.8] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.8"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon randomly charges at the nearest player, won't perch or shoot fireballs."}}},{"text":"[1.9-1.13] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.9"},"hoverEvent":{"action":"show_text","contents":{"text":"Normal Ender Dragon, but can move up and down better. This is the default preset, and is enabled when the datapack loads."}}},{"text":"[1.14+] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.14"},"hoverEvent":{"action":"show_text","contents":{"text":"Vanilla Ender Dragon, disables most datapack features."}}},{"text":"[Mixed] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/mixed"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon randomly charges at the nearest player, AND can perch or shoot fireballs. Also perches more often."}}},{"text":"[Bedrock] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/bedrock"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon moves up and down even faster than the 1.9-1.13 preset, and perches more often. Designed to act like Bedrock's Ender Dragon."}}},{"text":"[Passive] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/passive"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon will NEVER perch or shoot fireballs, and will not charge at the player. Makes the dragon mostly passive. Flies like the 1.9-1.13 preset."}}}]

function dragonai:configmenu/booleaninput {returnto:"dragonai:config2",name:"Enable Debug Visuals",id:"EnableDebug",hovertext:"Show debug particle visuals, such as particles around where the dragon is charging at, if charging (only charging added by the datapack works with this). May reduce performance with lower-end computers if there are many dragons.",extrajson:""}
function dragonai:configmenu/booleaninput {returnto:"dragonai:config2",name:"Disable Vanilla Charging",id:"DisableVanillaCharge",hovertext:"Disable the dragon charging at a player after leaving the perch.\\n§o§7Not to be confused with Replace Vanilla Charging.§r",extrajson:""}
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""
tellraw @s ""

tellraw @s [{"text":"[1]","color":"red","hoverEvent":{"action":"show_text","contents":"Go to page 1"},"clickEvent":{"action":"run_command","value":"/function dragonai:config"}},{"text":"[2]","color":"green","hoverEvent":{"action":"show_text","contents":"Go to page 2. §aYou are already on this page!§r"}}]
tellraw @s [{"text":"[Beta Features]","hoverEvent":{"action":"show_text","contents":"Opens a new config for BETA features"},"clickEvent":{"action":"run_command","value":"/function dragonai:betaconfig"}}]

tellraw @s [{"text":"[Reload Config Screen]","hoverEvent":{"action":"show_text","contents":"Re-opens the config. Use this in certain cases where the config doesn't update itself."},"clickEvent":{"action":"run_command","value":"/function dragonai:config2"}},{"text":" "},{"text":"§4[Reload ALL Datapacks]§r","hoverEvent":{"action":"show_text","contents":"Reloads ALL datapacks, including this one. Doesn't do anything on bukkit/spigot/purpur/paper/etc. servers, as this runs /reload, triggering bukkit's plugins reload warning instead, you'll need to use /minecraft:reload instead."},"clickEvent":{"action":"run_command","value":"/reload"}}]