#Tick this dragon's velocity marker, and spawn it if it doesn't exist
execute at @s unless entity @e[tag=DragonVelocity,distance=..20,type=marker] run summon marker ~ ~ ~ {Tags:["DragonVelocity"],Rotation:[0f,0f]}
execute at @s as @e[type=marker,limit=1,sort=nearest,tag=DragonVelocity,distance=..20] rotated as @s run tp ~ ~ ~
execute store result score XVel Temp run data get entity @s Motion[0] 1000
execute store result score YVel Temp run data get entity @s Motion[1] 1000
execute store result score ZVel Temp run data get entity @s Motion[2] 1000
execute store result score X Temp run data get entity @s Pos[0] 1000
execute store result score Y Temp run data get entity @s Pos[1] 1000
execute store result score Z Temp run data get entity @s Pos[2] 1000
execute at @s store result entity @e[type=marker,limit=1,sort=nearest,tag=DragonVelocity,distance=..20] Pos[0] double 0.001 run scoreboard players operation X Temp += XVel Temp
execute at @s store result entity @e[type=marker,limit=1,sort=nearest,tag=DragonVelocity,distance=..20] Pos[1] double 0.001 run scoreboard players operation Y Temp += YVel Temp
execute at @s store result entity @e[type=marker,limit=1,sort=nearest,tag=DragonVelocity,distance=..20] Pos[2] double 0.001 run scoreboard players operation Z Temp += ZVel Temp

execute at @s unless entity @e[tag=DragonVelocityRot,distance=..20,type=marker] run summon marker ~ ~ ~ {Tags:["DragonVelocityRot"],Rotation:[0f,0f]}

execute at @s as @e[type=marker,limit=1,sort=nearest,tag=DragonVelocityRot,distance=..20] at @s facing entity @e[limit=1,tag=DragonVelocity,sort=nearest] feet run tp @s ^ ^ ^ ~180 ~
#execute at @s store result score @s Rotation run data get entity @e[type=marker,limit=1,sort=nearest,tag=DragonVelocityRot] Rotation[0] 100