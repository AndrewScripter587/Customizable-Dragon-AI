execute if entity @s[type=player] run tellraw @s "§1This must be run as an Ender Dragon! §rTip: use \"/execute as @e[type=ender_dragon] run function olddragons:tools/kill\" to run this as all currently loaded Ender Dragons."
execute if entity @s[type=!ender_dragon] run return 0
execute at @s run playsound minecraft:entity.generic.death hostile @a ~ ~ ~ 10 1
data modify entity @s DragonPhase set value 9