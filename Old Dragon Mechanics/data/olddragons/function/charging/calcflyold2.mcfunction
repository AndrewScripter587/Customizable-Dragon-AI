$execute store result score @s TargetYVel at @s run data get entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation,distance=..20] Rotation[1] $(ChargeFlySpeed)
scoreboard players operation @s YVelDiff = @s TargetYVel
scoreboard players operation @s YVelDiff -= @s YVel
scoreboard players operation @s YVelDiff /= VerticalSmoothing Settings

execute store result entity @s Motion[1] double 0.001 run scoreboard players operation @s YVel += @s YVelDiff