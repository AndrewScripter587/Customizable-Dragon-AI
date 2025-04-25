# Generated with MC-Build

execute at @s run summon marker ~ ~ ~ {Tags:["DragonChargeTarget"]}
data modify entity @e[limit=1,sort=nearest,type=marker,tag=DragonChargeTarget] Pos set from storage charge Pos
execute if score EnableDebug DragonAISettings matches 1 as @e[type=ender_dragon] if score @s DragonChargeTimer matches 1.. as @e[type=marker,tag=DragonChargeTarget] at @s run particle electric_spark ~ ~ ~ 1 1 1 0 10 force