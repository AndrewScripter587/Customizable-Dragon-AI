#This file was generated by MC-Build

# This function fixes MC-272431 by reverting the buggy movement to 1.13.1, the last release version before the dragon broke.
# In case you didn't know, in 19w08b (a 1.14 snapshot), a typo was added to the dragon's AI code, 
# where a value was set to 0.01 when it should have been set to 0.1.
# The value that has the typo is responsible for slowing the dragon's vertical movement,
# else you'd get Bedrock Edition's dragon (It goes very fast up and down in case you haven't seen the bedrock dragon) but with even faster vertical speed.
# The code multiplies the vertical speed that it calculates earlier in the code by the value that has the typo, which multiplying by the intended 0.1
# makes the dragon actually normal, while the typo that is 0.01 makes it go up and down super slowly, resulting in the dragon you probably know
# now.
scoreboard players set 10 Temp 10
scoreboard players set 3 Temp 10
# Fix an issue where knockback from explosions sends the ender dragon extremely high, by constraining the dragon's velocity.
execute store result score YVel Temp run data get entity @s Motion[1] 1000
execute if score YVel Temp > YVelUB DragonAISettings run scoreboard players operation YVel Temp = YVelUB DragonAISettings
execute if score YVel Temp < YVelLB DragonAISettings run scoreboard players operation YVel Temp = YVelLB DragonAISettings
execute store result entity @s Motion[1] double 0.001 run scoreboard players get YVel Temp
# Calculate movement
$execute store result score YVel Temp run data get entity @s Motion[1] $(FlySpeed)
# scoreboard players operation YVel Temp *= 10 Temp
execute if score YVel Temp > YVelUB DragonAISettings run scoreboard players operation YVel Temp = YVelUB DragonAISettings
execute if score YVel Temp < YVelLB DragonAISettings run scoreboard players operation YVel Temp = YVelLB DragonAISettings
scoreboard players operation Height Temp = @s YPos
execute store result entity @s Pos[1] double 0.01 run scoreboard players operation Height Temp += YVel Temp