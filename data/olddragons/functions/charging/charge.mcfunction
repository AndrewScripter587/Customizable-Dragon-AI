#data modify entity @s DragonPhase set value 0
execute store result entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] Rotation[0] float 0.01 run scoreboard players get @s Rotation
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~15 0 run summon marker ^ ^ ^-0.2 {Tags:["SmoothTurn","Right"]}
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~0 0 run summon marker ^ ^ ^-0.2 {Tags:["SmoothTurn","NoTurn"]}
execute at @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] rotated ~-15 0 run summon marker ^ ^ ^-0.2 {Tags:["SmoothTurn","Left"]}
execute if score EnableDebug Settings matches 1 as @e[tag=SmoothTurn,type=marker] at @s run particle electric_spark ~ ~0.5 ~
execute at @s as @e[tag=DragonChargeTarget,limit=1,sort=nearest] at @s run tag @e[tag=SmoothTurn,type=marker,limit=1,sort=nearest] add Closest
#execute at @s as @e[tag=DragonChargeRotation,type=marker] facing entity @e[tag=SmoothTurn,type=marker,limit=1,sort=nearest,tag=Closest] eyes rotated ~180 ~ run tp @s ^ ^ ^ ~ ~
execute at @s as @e[tag=DragonChargeRotation,type=marker,limit=1,sort=nearest] facing entity @e[tag=DragonChargeTarget] eyes rotated ~180 ~ run tp @s ^ ^ ^ ~ ~
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=Right] at @s run scoreboard players add @s Rotation 1500
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=Left] at @s run scoreboard players remove @s Rotation 1500
execute if entity @e[type=marker,tag=SmoothTurn,tag=Closest,tag=NoTurn] at @s store result score @s Rotation run data get entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation] Rotation[0] 100
#execute if score @s Rotation matches 36001.. run scoreboard players remove @s Rotation 36000
#execute if score @s Rotation matches ..0 run scoreboard players add @s Rotation 36000
execute store result entity @s Rotation[0] float 0.01 run scoreboard players get @s Rotation
execute at @s if entity @e[limit=1,sort=nearest,distance=..12.5,tag=DragonChargeTarget] run scoreboard players remove @s DragonChargeTimer 1
execute at @s unless entity @e[limit=1,sort=nearest,distance=..125,tag=DragonChargeTarget] run scoreboard players set @s DragonChargeTimer 0
kill @e[tag=SmoothTurn,type=marker]
tag @e remove Closest
