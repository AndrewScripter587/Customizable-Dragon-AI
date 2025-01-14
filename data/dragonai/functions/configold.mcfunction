execute unless entity @s run say The function dragonai:config cannot be run through the console.
execute unless entity @s run return fail

tellraw @s "§5Old Dragon Mechanics Configuration"
tellraw @s {"text":"§7Presets:"}
tellraw @s [{"text":"[1.0-1.8] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.8"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon randomly charges at the nearest player, won't perch or shoot fireballs."}}},{"text":"[1.9-1.13] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.9"},"hoverEvent":{"action":"show_text","contents":{"text":"Normal Ender Dragon, but can move up and down better. This is the default preset, and is enabled when the datapack loads."}}},{"text":"[1.14+] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/1.14"},"hoverEvent":{"action":"show_text","contents":{"text":"Vanilla Ender Dragon, disables most datapack features."}}},{"text":"[Mixed] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/mixed"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon randomly charges at the nearest player, AND can perch or shoot fireballs. Also perches more often."}}},{"text":"[Bedrock] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/bedrock"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon moves up and down even faster than the 1.9-1.13 preset, and perches more often. Designed to act like Bedrock's Ender Dragon."}}},{"text":"[Passive] ","clickEvent":{"action":"run_command","value":"/function dragonai:settings/passive"},"hoverEvent":{"action":"show_text","contents":{"text":"Dragon will NEVER perch or shoot fireballs, and will not charge at the player. Makes the dragon mostly passive. Flies like the 1.9-1.13 preset."}}}]
#tellraw @s "§7Individual Settings:"
function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Dragon Charging",id:"DragonCharging",hovertext:"Whether or not the dragon can charge",extrajson:""}
function dragonai:configmenu/numericinput {step:1,returnto:"dragonai:config",name:"Dragon Charge Rate",id:"ChargeRate",hovertext:"How often the dragon can charge. A random number between 1-1000 is generated once per loaded dragon every tick (1/20 sec), and if it is less than or equal to this value, that specific dragon will start a charge if the above setting is enabled and there is a player close enough to the dragon (about 125 blocks away maximum). A value of 0 means it will not charge at all even if charging is enabled, and a value of 1000 means the dragon will always be charging, making whoever's closest's life hell",extrajson:""}
function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Fix §nMC-272431§r",id:"MiscDragonTweaks",hovertext:"Fixes the bug introduced in 1.14 where the dragon goes up and down very slowly, causing erratic behavior as a side effect. Click for more info.",extrajson:"\"clickEvent\":{\"action\":\"open_url\",\"value\":\"https://bugs.mojang.com/browse/MC-272431\"},"}
function dragonai:configmenu/numericinput {step:100,returnto:"dragonai:config",name:"Dragon Fly Speed",id:"FlySpeed",hovertext:"How much faster the dragon will fly up and down, as a percent, when the above setting is enabled. If the above setting is off, this value has no effect. This is ADDED ONTO the dragon's normal speed, so a value of 900 will make the dragon move at 1000% (10x) speed, which is 900% of its normal speed added onto 100% of its normal speed, and 900 + 100 = 1000",extrajson:""}
function dragonai:configmenu/numericinput {step:10,returnto:"dragonai:config",name:"Dragon Fly Speed (Charging)",id:"ChargeFlySpeed",hovertext:"How fast the dragon will move up and down while charging. This value IS affected by the above value.",extrajson:""}
function dragonai:configmenu/numericinput {step:1,returnto:"dragonai:config",name:"Dragon Charging Vertical Smoothing",id:"VerticalSmoothing",hovertext:"How smooth the dragon's change in vertical velocity is when charging, so the dragon doesn't just instantly snap its' vertical velocity up or down toward the charge target when the dragon starts a charge.",extrajson:""}
function dragonai:configmenu/numericinput {step:1,returnto:"dragonai:config",name:"Dragon Charging Horizontal Smoothing",id:"HorizontalSmoothing",hovertext:"How smooth the dragon's change in vertical velocity is when charging, so the dragon doesn't just instantly snap its' horizontal velocity toward the charge target when the dragon starts a charge.",extrajson:""}

function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Allow 1.9+ Mechanics",id:"Allow1.9Behavior",hovertext:"If disabled, the dragon will not be able to use mechanics like perching, shooting fireballs, or any other mechanics added in 1.9.",extrajson:""}
function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Disable Perching",id:"DisablePerching",hovertext:"If enabled, this disables perching without disabling any other 1.9 feature like fireballs.",extrajson:""}
execute if score UseEnhancedAI Settings matches 0 run function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Frequent Perching",id:"MorePerching",hovertext:"Makes the dragon perch more often.",extrajson:""}
execute if score UseEnhancedAI Settings matches 1 run function dragonai:configmenu/booleaninputlocked {lockreason:"Use Custom AI (located in BETA Config) locks this value to false when it is enabled, which it is",name:"Frequent Perching",id:"MorePerching",hovertext:"Makes the dragon perch more often.",extrajson:""}
function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Replace Vanilla Dragon Charging",id:"ReplaceVanillaCharging",hovertext:"Makes the dragon use the datapack's charging over the vanilla charging.",extrajson:""}
execute if score UseEnhancedAI Settings matches 0 run function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Mimic Vanilla Charging",id:"MimicVanillaCharge",hovertext:"When enabled, makes it so the dragon only charges toward where the nearest player was at when the charge started. When disabled, the dragon will always charge toward the nearest player's current location. Only affects the charging added by the datapack. To make it affect vanilla charging, set \\\"Replace Vanilla Dragon Charging\\\" to true.",extrajson:""}
execute if score UseEnhancedAI Settings matches 1 run function dragonai:configmenu/booleaninputlocked {lockreason:"Use Custom AI (located in BETA Config) locks this value to true when it is enabled, which it is",name:"Mimic Vanilla Charging",id:"MimicVanillaCharge",hovertext:"When enabled, makes it so the dragon only charges toward where the nearest player was at when the charge started. When disabled, the dragon will always charge toward the nearest player's current location. Only affects the charging added by the datapack. To make it affect vanilla charging, set \\\"Replace Vanilla Dragon Charging\\\" to true.",extrajson:""}
function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Bedrock Area Effect Clouds",id:"BedrockAEClouds",hovertext:"Makes area effect clouds (spawned by any means, such as commands, lingering potions, or dragon's breath) act like bedrock edition.",extrajson:""}
function dragonai:configmenu/booleaninput {returnto:"dragonai:config",name:"Stop Charging When Hurt",id:"StopChargeOnHurt",hovertext:"If enabled, any dragon that is charging will stop charging when they take damage.",extrajson:""}
tellraw @s [{"text":"[1]","color":"green","hoverEvent":{"action":"show_text","contents":[{"text":"Go to page 1.","color":"white"},{"text":" You are already on this page!","color":"green"}]}},{"text":"[2]","color":"red","hoverEvent":{"action":"show_text","contents":"Go to page 2"},"clickEvent":{"action":"run_command","value":"/function dragonai:config2"}}]
tellraw @s [{"text":"[Beta Features]","hoverEvent":{"action":"show_text","contents":"Opens a new config for BETA features"},"clickEvent":{"action":"run_command","value":"/function dragonai:betaconfig"}}]

tellraw @s [{"text":"[Reload Config Screen]","hoverEvent":{"action":"show_text","contents":"Re-opens the config. Use this in certain cases where the config doesn't update itself."},"clickEvent":{"action":"run_command","value":"/function dragonai:config"}},{"text":" "},{"text":"§4[Reload ALL Datapacks]§r","hoverEvent":{"action":"show_text","contents":"Reloads ALL datapacks, including this one. Doesn't do anything on bukkit/spigot/purpur/paper/etc. servers, as this runs /reload, triggering bukkit's plugins reload warning instead, you'll need to use /minecraft:reload instead."},"clickEvent":{"action":"run_command","value":"/reload"}}]