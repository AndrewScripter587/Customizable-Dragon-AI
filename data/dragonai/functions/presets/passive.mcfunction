#This file was generated by MC-Build

# Make dragons (mostly) passive (can still damage you, but will not purposely attack you)
scoreboard players set Allow1.9Behavior DragonAISettings 0
scoreboard players set ReplaceVanillaCharging DragonAISettings 0
scoreboard players set FixVertical DragonAISettings 1
scoreboard players set FrequentPerching DragonAISettings 0
scoreboard players set ChargeRate DragonAISettings 5
scoreboard players set DragonCharging DragonAISettings 0
scoreboard players set BedrockStyle DragonAISettings 1
scoreboard players set FlySpeed DragonAISettings 900
scoreboard players set ChargeFlySpeed DragonAISettings 100
scoreboard players set VerticalSmoothing DragonAISettings 50
scoreboard players set Slowdown DragonAISettings 15
scoreboard players set UseEnhancedAI DragonAISettings 0
# function dragonai:config
execute unless score Enabled DragonAISettings matches 1 run function dragonai:logging/disabled_warning