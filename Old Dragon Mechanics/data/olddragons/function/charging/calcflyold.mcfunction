execute store result score @s YVel run data get entity @s Motion[1] 100
scoreboard players set 10 Temp 10
#%scoreboard players operation @s YDiff = @e[tag=DragonTarget,limit=1,sort=nearest] YPos
#%scoreboard players operation @s YDiff -= @s YPos
#scoreboard players operation Flight1 Temp = @s YDiff
#scoreboard players operation Flight1 Temp /= @s TargetDistance
#scoreboard players operation Flight1 Temp *= FlightDistanceModifier Settings
#scoreboard players operation @s YDiff -= Flight1 Temp
$execute store result score @s YDiff at @s run data get entity @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation,distance=..20] Rotation[1] $(ChargeFlySpeed)
execute unless score @s DragonChargeTimer matches 1.. unless entity @s[nbt=!{DragonPhase:3},nbt=!{DragonPhase:9}] run scoreboard players add @s YDiff 150
execute unless score @s DragonChargeTimer matches 1.. unless entity @s[nbt=!{DragonPhase:8}] run scoreboard players remove @s YDiff 0
execute if score @s DragonChargeTimer matches 1.. run scoreboard players remove @s YDiff 0
execute unless score @s DragonChargeTimer matches 1.. run scoreboard players remove @s YDiff 150
execute unless score @s DragonChargeTimer matches 1.. unless entity @s[nbt=!{DragonPhase:0},nbt=!{DragonPhase:1},nbt=!{DragonPhase:2},nbt=!{DragonPhase:4}] run scoreboard players operation @s YDiff += FlyHeight Settings
scoreboard players operation @s YVelDiff = @s YDiff
#scoreboard players operation @s YVelDiff /= @s TargetDistance


#scoreboard players operation @s YVelDiff /= VerticalSmoothing Settings

scoreboard players operation PreSlow Temp = @s YVel
scoreboard players operation PreSlow Temp *= Slowdown Settings
scoreboard players operation PreSlow Temp /= 10 Temp
scoreboard players operation @s YVelDiff -= PreSlow Temp

scoreboard players operation @s YVelDiff /= VerticalSmoothing Settings
scoreboard players operation @s YVel += @s YVelDiff

scoreboard players operation @s YVel *= FrictionUpperFraction Settings
scoreboard players operation @s YVel /= FrictionLowerFraction Settings

#scoreboard players remove @s YVel 15

execute if score @s YVel matches 2000.. run scoreboard players set @s YVel 2000
execute if score @s YVel matches ..-2000 run scoreboard players set @s YVel -2000

#scoreboard players operation @s YVel < YVelUB Settings
#scoreboard players operation @s YVel > YVelLB Settings

scoreboard players operation @s YVelDiff = @s YVel

function olddragons:charging/fly