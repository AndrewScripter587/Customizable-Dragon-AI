execute if entity @s[type=player] run tellraw @s "§1This must be run as an Ender Dragon! §rTip: use \"/execute as @e[type=ender_dragon] run function olddragons:tools/forcecharge\" to run this as all currently loaded Ender Dragons."
execute if entity @s[type=!ender_dragon] run return 0
scoreboard players set @s DragonChargeTimer 15
$execute at @s store result score @s ChargeTargetX run data get entity $(selector) Pos[0] 100
$execute at @s store result score @s ChargeTargetY run data get entity $(selector) Pos[1] 100
$execute at @s store result score @s ChargeTargetZ run data get entity $(selector) Pos[2] 100