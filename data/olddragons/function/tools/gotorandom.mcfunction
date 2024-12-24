$execute store result storage olddragons:tmp x double 1 run random value $(xl)..$(xh)
$execute store result storage olddragons:tmp y double 1 run random value $(yl)..$(yh)
$execute store result storage olddragons:tmp z double 1 run random value $(zl)..$(zh)
execute at @s store result score @s ChargeTargetX run data get storage olddragons:tmp x 100
execute at @s store result score @s ChargeTargetY run data get storage olddragons:tmp y 100
execute at @s store result score @s ChargeTargetZ run data get storage olddragons:tmp z 100
scoreboard players set @s DragonChargeTimer 3