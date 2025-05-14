execute unless entity @s run say The function dragonai:betaconfig cannot be run through the console.
execute unless entity @s run return fail

tellraw @s "§5Old Dragon Mechanics BETA Configuration"
tellraw @s {"text":"§7Presets:"}
$tellraw @s [{"text":"[1.0-1.8] ","click_event":{"action":"run_command","command":"/function dragonai:settings/1.8"},"hover_event":{"action":"show_text","$(showtextname)":{"text":"Dragon randomly charges at the nearest player, won't perch or shoot fireballs."}}},{"text":"[1.9-1.13] ","click_event":{"action":"run_command","command":"/function dragonai:settings/1.9"},"hover_event":{"action":"show_text","$(showtextname)":{"text":"Normal Ender Dragon, but can move up and down better. This is the default preset, and is enabled when the datapack loads."}}},{"text":"[1.14+] ","click_event":{"action":"run_command","command":"/function dragonai:settings/1.14"},"hover_event":{"action":"show_text","$(showtextname)":{"text":"Vanilla Ender Dragon, disables most datapack features."}}},{"text":"[Mixed] ","click_event":{"action":"run_command","command":"/function dragonai:settings/mixed"},"hover_event":{"action":"show_text","$(showtextname)":{"text":"Dragon randomly charges at the nearest player, AND can perch or shoot fireballs. Also perches more often."}}},{"text":"[Bedrock] ","click_event":{"action":"run_command","command":"/function dragonai:settings/bedrock"},"hover_event":{"action":"show_text","$(showtextname)":{"text":"Dragon moves up and down even faster than the 1.9-1.13 preset, and perches more often. Designed to act like Bedrock's Ender Dragon."}}},{"text":"[Passive] ","click_event":{"action":"run_command","command":"/function dragonai:settings/passive"},"hover_event":{"action":"show_text","$(showtextname)":{"text":"Dragon will NEVER perch or shoot fireballs, and will not charge at the player. Makes the dragon mostly passive. Flies like the 1.9-1.13 preset."}}}]

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

$tellraw @s [{"text":"[Normal Config]","hover_event":{"action":"show_text","$(showtextname)":"Return to the normal config."},"click_event":{"action":"run_command","command":"/function dragonai:config"}}]

$tellraw @s [{"text":"[Reload Config Screen]","hover_event":{"action":"show_text","$(showtextname)":"Re-opens the config. Use this in certain cases where the config doesn't update itself."},"click_event":{"action":"run_command","command":"/function dragonai:betaconfig"}},{"text":" "},{"text":"§4[Reload ALL Datapacks]§r","hover_event":{"action":"show_text","$(showtextname)":"Reloads ALL datapacks, including this one. Doesn't do anything on bukkit/spigot/purpur/paper/etc. servers, as this runs /reload, triggering bukkit's plugins reload warning instead, you'll need to use /minecraft:reload instead."},"click_event":{"action":"run_command","command":"/reload"}}]