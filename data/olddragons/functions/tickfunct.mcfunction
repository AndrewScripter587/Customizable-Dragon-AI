#Prevent the 1.9 mechanics from occurring, unless it is enabled
execute if score Allow1.9Behavior Settings matches 0 as @e[type=minecraft:ender_dragon] unless entity @s[nbt=!{DragonPhase:1},nbt=!{DragonPhase:10},nbt=!{DragonPhase:3},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6}] unless entity @s[nbt=!{HurtTime:0s}] run data merge entity @s {DragonPhase:0}

#Randomly charge at the player, if it is enabled
execute if score DragonCharging Settings matches 1 as @e[type=minecraft:ender_dragon,nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6}] if score @s RNG <= ChargeRate Settings unless entity @s[nbt=!{HurtTime:0s}] unless score @s DragonChargeTimer matches 1.. run scoreboard players set @s DragonChargeTimer 3


#Dragon charging mechanics

#Stop dragon charging if it is currently in phase 9 (flying to the portal to die)
execute as @e[type=minecraft:ender_dragon,nbt={DragonPhase:9}] run scoreboard players set @s DragonChargeTimer -999

#Stop the dragon charging if it takes damage
execute as @e[type=minecraft:ender_dragon] if entity @s[nbt=!{HurtTime:0s}] run scoreboard players set @s DragonChargeTimer 0

#Make the dragon charge.
execute if score CanDragonChargeAtMobs Settings matches 1 as @e[type=minecraft:ender_dragon,scores={DragonChargeTimer=1..},nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6}] at @s facing entity @e[limit=1,sort=nearest,type=!minecraft:ender_dragon,type=!minecraft:end_crystal,type=!minecraft:enderman,distance=..125,type=!minecraft:item,type=!minecraft:experience_orb,type=!#minecraft:arrows,type=!#minecraft:impact_projectiles,type=!minecraft:dragon_fireball,type=!minecraft:area_effect_cloud] eyes rotated ~ ~5 positioned ^ ^ ^0.6 rotated ~180 0 run tp ^ ^ ^0.8
execute if score CanDragonChargeAtMobs Settings matches 1 as @e[type=minecraft:ender_dragon,scores={DragonChargeTimer=1..}] at @s if entity @e[limit=1,sort=nearest,type=!minecraft:ender_dragon,type=!minecraft:end_crystal,type=!minecraft:enderman,distance=..10,type=!minecraft:item,type=!minecraft:experience_orb,type=!#minecraft:arrows,type=!#minecraft:impact_projectiles,type=!minecraft:dragon_fireball,type=!minecraft:area_effect_cloud] run scoreboard players remove @s DragonChargeTimer 1
execute if score CanDragonChargeAtMobs Settings matches 1 as @e[type=minecraft:ender_dragon,scores={DragonChargeTimer=1..}] at @s unless entity @e[limit=1,sort=nearest,type=!minecraft:ender_dragon,type=!minecraft:end_crystal,type=!minecraft:enderman,distance=..125,type=!minecraft:item,type=!minecraft:experience_orb,type=!#minecraft:arrows,type=!#minecraft:impact_projectiles,type=!minecraft:dragon_fireball,type=!minecraft:area_effect_cloud] run scoreboard players set @s DragonChargeTimer 0
execute if score CanDragonChargeAtMobs Settings matches 0 as @e[type=minecraft:ender_dragon,scores={DragonChargeTimer=1..},nbt=!{DragonPhase:4},nbt=!{DragonPhase:5},nbt=!{DragonPhase:6}] at @s facing entity @e[limit=1,sort=nearest,distance=..125,type=player,gamemode=!creative,gamemode=!spectator] eyes rotated ~ ~5 positioned ^ ^ ^0.6 rotated ~180 0 run tp ^ ^ ^0.8
execute if score CanDragonChargeAtMobs Settings matches 0 as @e[type=minecraft:ender_dragon,scores={DragonChargeTimer=1..}] at @s if entity @e[limit=1,sort=nearest,distance=..10,type=player,gamemode=!creative,gamemode=!spectator] run scoreboard players remove @s DragonChargeTimer 1
execute if score CanDragonChargeAtMobs Settings matches 0 as @e[type=minecraft:ender_dragon,scores={DragonChargeTimer=1..}] at @s unless entity @e[limit=1,sort=nearest,distance=..125,type=player,gamemode=!creative,gamemode=!spectator] run scoreboard players set @s DragonChargeTimer 0

