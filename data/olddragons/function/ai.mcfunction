tag @s add this
execute store result score @s DragonPhase run data get entity @s DragonPhase
#Detect if the dragon JUST spawned
execute unless entity @s[tag=initialized] run scoreboard players set @s PerchTimer 200
execute at @s unless entity @s[tag=initialized] run summon marker ~ ~ ~ {Tags:["DragonChargeRotation"],Rotation:[0f,0f]}
tag @s[tag=!initialized] add initialized
#Tick this dragon's rotation helper for charging, and spawn it if it doesn't exist
execute at @s unless entity @e[tag=DragonChargeRotation,distance=..20,type=marker] run summon marker ~ ~ ~ {Tags:["DragonChargeRotation"],Rotation:[0f,0f]}
execute at @s as @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation,distance=..20] rotated as @s run tp ~ ~ ~
function olddragons:velocitymarker

#Prevent the 1.9 mechanics from occurring, unless it is enabled
execute if score Allow1.9Behavior Settings matches 0 unless entity @s[nbt=!{DragonPhase:1},nbt=!{DragonPhase:2},nbt=!{DragonPhase:10},nbt=!{DragonPhase:3},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7}] unless entity @s[nbt=!{HurtTime:0s}] run data merge entity @s {DragonPhase:0}

#Prevent perching, if disabled
execute if score DisablePerch Settings matches 1 unless entity @s[nbt=!{DragonPhase:3},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7}] unless entity @s[nbt=!{HurtTime:0s}] run data merge entity @s {DragonPhase:0}

#Store motion in scores for reference when starting a charge
execute if score @s DragonChargeTimer matches ..0 store result score @s XVel run data get entity @s Motion[0] 1000
execute if score @s DragonChargeTimer matches ..0 store result score @s YVel run data get entity @s Motion[1] 1000
execute if score @s DragonChargeTimer matches ..0 store result score @s ZVel run data get entity @s Motion[2] 1000

#Randomly charge at the player, if it is enabled
execute at @s if score DragonCharging Settings matches 1 if entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3}] if score @s RNG <= ChargeRate Settings unless entity @s[nbt=!{HurtTime:0s}] unless score @s DragonChargeTimer matches 1.. store result score @s ChargeTargetX run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[0] 100
execute at @s if score DragonCharging Settings matches 1 if entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3}] if score @s RNG <= ChargeRate Settings unless entity @s[nbt=!{HurtTime:0s}] unless score @s DragonChargeTimer matches 1.. store result score @s ChargeTargetY run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[1] 100
execute at @s if score DragonCharging Settings matches 1 if entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3}] if score @s RNG <= ChargeRate Settings unless entity @s[nbt=!{HurtTime:0s}] unless score @s DragonChargeTimer matches 1.. store result score @s ChargeTargetZ run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[2] 100
execute at @s if entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator,distance=..125] if score DragonCharging Settings matches 1 if entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3}] if score @s RNG <= ChargeRate Settings unless entity @s[nbt=!{HurtTime:0s}] unless score @s DragonChargeTimer matches 1.. run scoreboard players set @s DragonChargeTimer 15

execute at @s if score MimicVanillaCharge Settings matches 0 store result score @s ChargeTargetX run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[0] 100
execute at @s if score MimicVanillaCharge Settings matches 0 store result score @s ChargeTargetY run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[1] 100
execute at @s if score MimicVanillaCharge Settings matches 0 store result score @s ChargeTargetZ run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[2] 100
execute at @s if score @s DragonChargeTimer matches ..0 store result score @s ChargeTargetX run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[0] 100
execute at @s if score @s DragonChargeTimer matches ..0 store result score @s ChargeTargetY run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[1] 100
execute at @s if score @s DragonChargeTimer matches ..0 store result score @s ChargeTargetZ run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[2] 100

#Perch more often, if it is enabled
execute if score MorePerching Settings matches 1 if entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3},nbt=!{DragonPhase:9}] if score @s PerchTimer matches 1.. unless score @s DragonChargeTimer matches 1.. run scoreboard players remove @s PerchTimer 1
execute if score MorePerching Settings matches 1 unless entity @s[nbt=!{DragonPhase:2}] if score @s PerchTimer matches 1.. unless score @s DragonChargeTimer matches 1.. run scoreboard players remove @s PerchTimer 1
execute if score MorePerching Settings matches 1 if entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3},nbt=!{DragonPhase:9}] if score @s RNG matches 980..1000 unless score @s DragonChargeTimer matches 1.. if score @s PerchTimer matches ..0 run data modify entity @s DragonPhase set value 3
execute unless entity @s[nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:3}] run scoreboard players set @s PerchTimer 300

#Replace vanilla charging, if enabled
execute if score ReplaceVanillaCharging Settings matches 1 if entity @s[nbt={DragonPhase:8}] unless entity @s[nbt=!{HurtTime:0s}] unless score @s DragonChargeTimer matches 1.. run scoreboard players set @s DragonChargeTimer 15
execute if score ReplaceVanillaCharging Settings matches 1 if entity @s[nbt={DragonPhase:8}] run data modify entity @s DragonPhase set value 0

#Dragon charging mechanics

execute unless score @s DragonChargeTimer matches 1.. run tp @e[type=marker,limit=1,sort=nearest,tag=DragonChargeRotation,distance=..20] ^ ^ ^ ~180 ~
execute unless score @s DragonChargeTimer matches 1.. store result score @s Rotation run data get entity @s Rotation[0] 100
#Stop dragon charging if it is currently in phase 9 (flying to the portal to die)
execute if entity @s[nbt={DragonPhase:9}] run scoreboard players set @s DragonChargeTimer -999

#Stop dragon charging if it is currently in phase 3 (flying to the portal to perch)
execute if entity @s[nbt={DragonPhase:3}] run scoreboard players set @s DragonChargeTimer 0

#Stop the dragon charging if it takes damage
execute if entity @s[nbt=!{HurtTime:0s}] run scoreboard players set @s DragonChargeTimer 0
data merge storage charge {Pos:[0d,0d,0d]}
execute store result storage charge Pos[0] double 0.01 run scoreboard players get @s ChargeTargetX
execute store result storage charge Pos[1] double 0.01 run scoreboard players get @s ChargeTargetY
execute store result storage charge Pos[2] double 0.01 run scoreboard players get @s ChargeTargetZ
execute at @s run function olddragons:charging/initcharge

#Set the target for certain operations
execute unless score @s DragonChargeTimer matches 1.. if data entity @s {DragonPhase:0} at @s run tag @e[type=marker,tag=DragonNode,limit=1,sort=nearest,distance=0..] add DragonTarget
execute unless score @s DragonChargeTimer matches 1.. if data entity @s {DragonPhase:2} at @s run tag @e[type=marker,tag=DragonNode,limit=1,sort=nearest,distance=0..] add DragonTarget
execute unless score @s DragonChargeTimer matches 1.. if data entity @s {DragonPhase:4} at @s run tag @e[type=marker,tag=DragonNode,limit=1,sort=nearest,distance=0..] add DragonTarget
execute if entity @s[nbt=!{DragonPhase:5},nbt=!{DragonPhase:6},nbt=!{DragonPhase:7},nbt=!{DragonPhase:9}] if score @s DragonChargeTimer matches 1.. at @s run tag @e[limit=1,sort=nearest,type=marker,tag=DragonChargeTarget] add DragonTarget
execute if data entity @s {DragonPhase:8} at @s run tag @p[distance=..125,gamemode=!creative,gamemode=!spectator] add DragonTarget
execute if data entity @s {DragonPhase:1} at @s run tag @p[distance=..125,gamemode=!creative,gamemode=!spectator] add DragonTarget
execute if data entity @s {DragonPhase:3} at @s run tag @e[type=marker,limit=1,tag=center,sort=nearest,distance=0..] add DragonTarget
execute if data entity @s {DragonPhase:9} at @s run tag @e[type=marker,limit=1,tag=center,sort=nearest,distance=0..] add DragonTarget


#Stop charging if too far away from target position or is done charging
execute at @s if entity @e[limit=1,sort=nearest,distance=..5,tag=DragonChargeTarget] run scoreboard players remove @s DragonChargeTimer 1
execute at @s unless entity @e[limit=1,sort=nearest,distance=..125,tag=DragonChargeTarget] run scoreboard players set @s DragonChargeTimer 0

#Charge
execute unless data entity @s {DragonPhase:5} unless data entity @s {DragonPhase:6} unless data entity @s {DragonPhase:7} at @s if score @s DragonChargeTimer matches 1.. run function olddragons:charging/calcfly with storage olddragons

#Fix vertical flying, if enabled
execute unless data entity @s {DragonPhase:5} unless data entity @s {DragonPhase:6} unless data entity @s {DragonPhase:7} if score MiscDragonTweaks Settings matches 1 at @s run function olddragons:adjustflight with storage olddragons

#Remove target tag
tag @e remove DragonTarget


kill @e[type=marker,tag=DragonChargeTarget]
tag @s remove this