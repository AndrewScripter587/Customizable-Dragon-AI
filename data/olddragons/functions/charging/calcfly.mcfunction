function olddragons:velocitymarker
scoreboard players set 10 Temp 10
execute at @s run tag @e[tag=DragonChargeRotation,type=marker,limit=1,sort=nearest] add thisdragon
execute at @s facing entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeTarget] feet positioned 0.0 0.0 0.0 positioned ^ ^ ^0.35 rotated as @e[tag=thisdragon,limit=1] positioned ^ ^ ^-0.65 run summon marker ~ ~ ~ {Tags:["TargetVelHoriz"]}
execute at @s facing entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeTarget] feet positioned 0.0 0.0 0.0 positioned ^ ^ ^1 rotated as @e[tag=thisdragon,limit=1] positioned ^ ^ ^0 run summon marker ~ ~ ~ {Tags:["TargetVelVert"]}
execute store result score @s TargetXVel run data get entity @e[limit=1,sort=nearest,type=marker,tag=TargetVelHoriz] Pos[0] 900
$execute store result score @s TargetYVel run data get entity @e[limit=1,sort=nearest,type=marker,tag=TargetVelVert] Pos[1] $(ChargeFlySpeed)
execute store result score @s TargetZVel run data get entity @e[limit=1,sort=nearest,type=marker,tag=TargetVelHoriz] Pos[2] 900

scoreboard players operation @s XVelDiff = @s TargetXVel
scoreboard players operation @s XVelDiff -= @s XVel
scoreboard players operation @s XVelDiff *= 10 Temp
scoreboard players operation @s XVelDiff /= HorizontalSmoothing Settings

scoreboard players operation @s YVelDiff = @s TargetYVel
scoreboard players operation @s YVelDiff -= @s YVel
scoreboard players operation @s YVelDiff *= 10 Temp
scoreboard players operation @s YVelDiff /= VerticalSmoothing Settings

scoreboard players operation @s ZVelDiff = @s TargetZVel
scoreboard players operation @s ZVelDiff -= @s ZVel
scoreboard players operation @s ZVelDiff *= 10 Temp
scoreboard players operation @s ZVelDiff /= HorizontalSmoothing Settings

execute store result entity @s Motion[0] double 0.001 run scoreboard players operation @s XVel += @s XVelDiff
execute store result entity @s Motion[1] double 0.001 run scoreboard players operation @s YVel += @s YVelDiff
execute store result entity @s Motion[2] double 0.001 run scoreboard players operation @s ZVel += @s ZVelDiff
function olddragons:velocitymarker
execute store result entity @s Rotation[0] float 0.001 run scoreboard players get @s Rotation
kill @e[tag=TargetVelHoriz,type=marker]
kill @e[tag=TargetVelVert,type=marker]
tag @e remove thisdragon