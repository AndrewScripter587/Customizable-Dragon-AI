execute if score @s YVelDiff matches 5.. at @s run tp ~ ~0.005 ~
execute if score @s YVelDiff matches 5.. at @s run scoreboard players remove @s YVelDiff 5
execute if score @s YVelDiff matches ..-5 at @s run tp ~ ~-0.005 ~
execute if score @s YVelDiff matches ..-5 at @s run scoreboard players add @s YVelDiff 5
#execute at @s positioned ^ ^ ^0.005 rotated as @s run tp ~ ~ ~
execute if score @s YVelDiff matches -4..4 at @s rotated ~ 0 positioned ^ ^ ^0.75 rotated as @s run tp ~ ~ ~
execute unless score @s YVelDiff matches -4..4 run function dragonai:flyalt