execute if entity @s[type=!ender_dragon] run return 0
scoreboard players set @s DragonChargeTimer 15
execute at @s store result score @s ChargeTargetX run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[0] 100
execute at @s store result score @s ChargeTargetY run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[1] 100
execute at @s store result score @s ChargeTargetZ run data get entity @e[limit=1,sort=nearest,type=player,gamemode=!creative,gamemode=!spectator] Pos[2] 100