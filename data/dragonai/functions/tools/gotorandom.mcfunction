$execute store result storage dragonai:tmp x double 1 run random value $(xl)..$(xh)
$execute store result storage dragonai:tmp y double 1 run random value $(yl)..$(yh)
$execute store result storage dragonai:tmp z double 1 run random value $(zl)..$(zh)
execute at @s store result score @s ChargeTargetX run data get storage dragonai:tmp x 100
execute at @s store result score @s ChargeTargetY run data get storage dragonai:tmp y 100
execute at @s store result score @s ChargeTargetZ run data get storage dragonai:tmp z 100
scoreboard players set @s DragonChargeTimer 3