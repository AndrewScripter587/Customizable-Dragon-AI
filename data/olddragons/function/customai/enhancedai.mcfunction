scoreboard players set MimicVanillaCharge Settings 1
scoreboard players set FrequentPerching Settings 0
execute unless score @s EnhancedAIPhase matches 0.. store result score @s EnhancedAIPhase run data get entity @s DragonPhase
#scoreboard players set @s EnhancedAIPhase 0

#Phase 0 (Flying Around)
execute if score @s DragonChargeTimer matches 15 at @s run function olddragons:tools/forcecharge
execute if score @s EnhancedAIPhase matches 0 if score @s DragonChargeTimer matches ..0 unless data entity @s {DragonPhase:9} run scoreboard players add @s Cycles 1
execute if score @s EnhancedAIPhase matches 0 if score @s DragonChargeTimer matches ..0 unless data entity @s {DragonPhase:9} run function olddragons:tools/gotorandom {xl:-70,xh:70,yl:85,yh:100,zl:-70,zh:70}
execute if score @s EnhancedAIPhase matches 0 unless data entity @s {DragonPhase:9} run data modify entity @s DragonPhase set value 0


