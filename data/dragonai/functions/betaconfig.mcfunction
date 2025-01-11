tellraw @s "§5Old Dragon Mechanics BETA Configuration"
tellraw @s [{"text":"§7Presets:\n"},{"text":"[1.0-1.8] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.8"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon randomly charges at the nearest player, won't perch or shoot fireballs."}}},{"text":"[1.9-1.13] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.9"},"hoverEvent":{"action":"show_text","contents":{"text":"Normal Ender Dragon, but can move up and down better. This is the default preset, and is enabled when the datapack loads."}}},{"text":"[1.14+] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.14"},"hoverEvent":{"action":"show_text","contents":{"text":"Vanilla Ender Dragon, disables most datapack features."}}},{"text":"[Mixed] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/mixed"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon randomly charges at the nearest player, AND can perch or shoot fireballs. Also perches more often."}}},{"text":"[Bedrock] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/bedrock"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon moves up and down even faster than the 1.9-1.13 preset, and perches more often. Designed to act like Bedrock's Ender Dragon."}}},{"text":"[Passive] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/passive"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon will NEVER perch or shoot fireballs, and will not charge at the player. Makes the dragon mostly passive. Flies like the 1.9-1.13 preset."}}}]

function dragonai:configmenu/booleaninput {returnto:"dragonai:betaconfig",name:"Use Custom AI",id:"UseEnhancedAI",hovertext:"Use a different Ender Dragon AI that this datapack adds instead of the vanilla AI.",extrajson:""}
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
tellraw @s ""
tellraw @s ""

tellraw @s [{"text":"[Normal Config]","hoverEvent":{"action":"show_text","contents":"Return to the normal config."},"clickEvent":{"action":"run_command","value":"/function dragonai:config"}}]

tellraw @s [{"text":"[Reload Config Screen]","hoverEvent":{"action":"show_text","contents":"Re-opens the config. Use this in certain cases where the config doesn't update itself."},"clickEvent":{"action":"run_command","value":"/function dragonai:betaconfig"}},{"text":" "},{"text":"§4[Reload ALL Datapacks]§r","hoverEvent":{"action":"show_text","contents":"Reloads ALL datapacks, including this one. Doesn't do anything on bukkit/spigot/purpur/paper/etc. servers, as this runs /reload, triggering bukkit's plugins reload warning instead, you'll need to use /minecraft:reload instead."},"clickEvent":{"action":"run_command","value":"/reload"}}]