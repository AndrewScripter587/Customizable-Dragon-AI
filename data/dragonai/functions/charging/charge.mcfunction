scoreboard players set ST Temp 4000
scoreboard players set B Temp 1000
scoreboard players set F Temp 1075
#data modify entity @s DragonPhase set value 0
execute if score EnableDebug Settings matches 1 at @s run particle minecraft:campfire_signal_smoke ~ ~ ~ 0 0 0 0 2 force
execute if score EnableDebug Settings matches 1 at @s rotated ~ 0 run particle minecraft:campfire_cosy_smoke ^ ^ ^-10 0 0 0 0 0 force
execute store result entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] Rotation[0] float 0.01 run scoreboard players get @s Rotation
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~115 0 run summon marker ^ ^ ^-1 {Tags:["SmoothTurn","Right","Far"]}
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~10 0 run summon marker ^ ^ ^-1 {Tags:["SmoothTurn","Right"]}
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~0 0 run summon marker ^ ^ ^-1 {Tags:["SmoothTurn","NoTurn"]}
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~-10 0 run summon marker ^ ^ ^-1 {Tags:["SmoothTurn","Left"]}
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~-115 0 run summon marker ^ ^ ^-1 {Tags:["SmoothTurn","Left","Far"]}
execute if score EnableDebug Settings matches 1 as @e[tag=SmoothTurn,type=marker] at @s run particle electric_spark ~ ~0.5 ~ 0 0 0 0 0 force
execute at @s as @e[tag=DragonChargeTarget,limit=1,sort=nearest] at @s run tag @e[tag=SmoothTurn,type=marker,limit=1,sort=nearest] add Closest
#execute at @s as @e[tag=DragonChargeRotation,type=marker] facing entity @e[tag=SmoothTurn,type=marker,limit=1,sort=nearest,tag=Closest] eyes rotated ~180 ~ run tp @s ^ ^ ^ ~ ~
execute at @s as @e[tag=DragonChargeRotation,type=marker,limit=1,sort=nearest] facing entity @e[tag=DragonChargeTarget] eyes rotated ~180 ~ run tp @s ^ ^ ^ ~ ~
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=Right,tag=Far] at @s run scoreboard players add @s RVel 75
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=Right] at @s run scoreboard players add @s RVel 45
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=Left] at @s run scoreboard players remove @s RVel 45
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=Left,tag=Far] at @s run scoreboard players remove @s RVel 75
scoreboard players operation @s RVel *= B Temp
scoreboard players operation @s RVel /= F Temp
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=NoTurn] at @s run scoreboard players operation @s RVel *= B Temp
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=NoTurn] at @s run scoreboard players operation @s RVel /= ST Temp
#execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=NoTurn] at @s store result score @s Rotation run data get entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] Rotation[0] 100
scoreboard players operation @s Rotation += @s RVel
#execute if score @s Rotation matches 36001.. run scoreboard players remove @s Rotation 36000
#execute if score @s Rotation matches ..0 run scoreboard players add @s Rotation 36000
execute store result entity @s Rotation[0] float 0.01 run scoreboard players get @s Rotation
#execute at @s if entity @e[limit=1,sort=nearest,distance=..12.5,tag=DragonChargeTarget] run scoreboard players remove @s DragonChargeTimer 1
#execute at @s unless entity @e[limit=1,sort=nearest,distance=..125,tag=DragonChargeTarget] run scoreboard players set @s DragonChargeTimer 0
kill @e[tag=SmoothTurn,type=marker]
tag @e remove Closest
