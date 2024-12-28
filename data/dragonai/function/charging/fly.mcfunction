execute unless entity @s[type=player] store result entity @s Motion[1] double 0.001 run scoreboard players get @s YVel
#execute unless entity @s[type=player] unless score @s DragonChargeTimer matches 1.. store result entity @s Motion[1] double 0.0003 run scoreboard players get @s YVel
#in case you run the ai function on yourself to experience the mechanics as a player
execute if entity @s[type=player] run scoreboard players operation @s YVelDiff = @s YVel
execute if entity @s[type=player] run function dragonai:flyalt

