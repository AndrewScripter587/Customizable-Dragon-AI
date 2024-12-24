#Display a message saying the pack is loading
tellraw @a {"text":"Old Dragon Mechanics is loading...","color":"yellow"}

#Create a "top of 0, 0" marker in all three dimensions.
execute positioned 0 0 0 in minecraft:overworld unless entity @e[type=marker,tag=center,distance=0..] run summon marker ~ ~ ~ {Tags:["center"]}
execute positioned 0 0 0 in minecraft:the_nether unless entity @e[type=marker,tag=center,distance=0..] run summon marker ~ ~ ~ {Tags:["center"]}
execute positioned 0 0 0 in minecraft:the_end unless entity @e[type=marker,tag=center,distance=0..] run summon marker ~ ~ ~ {Tags:["center"]}


#Create the objectives
scoreboard objectives add RNG dummy
scoreboard objectives add DragonChargeTimer dummy
scoreboard objectives add Settings dummy
scoreboard objectives add Temp dummy
scoreboard objectives add XPos dummy
scoreboard objectives add YPos dummy
scoreboard objectives add ZPos dummy
scoreboard objectives add XDiff dummy
scoreboard objectives add YDiff dummy
scoreboard objectives add ZDiff dummy
scoreboard objectives add XVel dummy
scoreboard objectives add YVel dummy
scoreboard objectives add ZVel dummy
scoreboard objectives add RVel dummy
scoreboard objectives add TargetXVel dummy
scoreboard objectives add TargetYVel dummy
scoreboard objectives add TargetZVel dummy
scoreboard objectives add XVelDiff dummy
scoreboard objectives add YVelDiff dummy
scoreboard objectives add ZVelDiff dummy
scoreboard objectives add PerchTimer dummy
scoreboard objectives add Rotation dummy
scoreboard objectives add VelRotation dummy
scoreboard objectives add TargetDistance dummy
scoreboard objectives add CrystalHeight dummy
scoreboard objectives add EnhancedAIPhase dummy
scoreboard objectives add Cycles dummy
#Charging Target
scoreboard objectives add ChargeTargetX dummy
scoreboard objectives add ChargeTargetY dummy
scoreboard objectives add ChargeTargetZ dummy
#reference in case i need it
scoreboard objectives add DragonPhase dummy

scoreboard objectives add odconfig trigger

scoreboard players set FrictionUpperFraction Settings 1
scoreboard players set FrictionLowerFraction Settings 1

#Initialize Settings values

#Setting to enable/disable the dragon's ability to randomly "charge" (go towards entities in an attempt to attack them)
scoreboard players set DragonCharging Settings 1
#Setting to make dragon charging mimic how it is in modern minecraft, where the dragon only charges at where you were when the charge started. Turning this off will make the dragon always charge at where the player currently is.
scoreboard players set MimicVanillaCharge Settings 1
#Setting to replace the vanilla charging mechanic with the one from this pack
scoreboard players set ReplaceVanillaCharging Settings 1
#Setting to allow 1.9 Dragon behavior (landing, shooting fireballs, etc)
scoreboard players set Allow1.9Behavior Settings 1
#Setting to disable perching. This setting does nothing if Allow1.9Behavior is set to 0 as it will not perch regardless of this setting.
scoreboard players set DisablePerch Settings 0
#Setting to change how often dragons can charge
scoreboard players set ChargeRate Settings 5
#Setting for how smooth the dragon's horizontal speed should change while charging
scoreboard players set HorizontalSmoothing Settings 10
#Setting for how smooth the dragon's vertical speed should change while charging
scoreboard players set VerticalSmoothing Settings 10
#Setting to make the dragon perch more often
scoreboard players set MorePerching Settings 1
#Setting to disable perching.
scoreboard players set DisablePerching Settings 0
#Setting to fix the dragon's vertical movement
scoreboard players set FixVertical Settings 1
#Setting for how much knockback vertically the dragon should take when it gets damaged. 100 = 1 block per tick. 1 = 0.01 (1/100) block per tick. Vertical velocity increases by this number for every tick the dragon is "taking damage" (aka tinted red by recieving damage)
#Does nothing as of now, used to do something but a previous technical change renders this unused.
scoreboard players set HurtKB Settings 50
#Setting for the limits / "bounds" of the dragon's vertical velocity. 100 = 1 block per tick. 1 = 0.01 (1/100) block per tick.
scoreboard players set YVelUB Settings 125
scoreboard players set YVelLB Settings -125
#Setting for how much the dragon will slow down in advance to reduce how far it might accidentally go below/above its target height
#Unused.
scoreboard players set Slowdown Settings 15
#Setting for how high the dragon will try to fly above ground level. 100 = 1 block. 1 = 0.01 (1/100) block.
#Does nothing as of now, used to do something but a previous technical change renders this unused.
scoreboard players set FlyHeight Settings 700
#Setting for how high the dragon will try to fly towards the top of the closest pillar. Lower values make the dragon fly closer to the pillar's top. High values make the dragon stay closer to the specified height in FlyHeight.
#Unused.
scoreboard players set FlyHeightPillar Settings 50
#Setting for how fast the dragon will move up and down
scoreboard players set FlySpeed Settings 900
#Setting for how fast the dragon will move up and down while charging, as a percent of normal FlySpeed.
scoreboard players set ChargeFlySpeed Settings 125
#Unused, for now.
scoreboard players set BedrockStyle Settings 0
#Setting to make area effect clouds act more like bedrock edition. As for how this relates to the ender dragon, dragon fireballs when they hit something and the breath attack spawn area effect clouds. This also makes dragon's breath area effect clouds work like in bedrock edition where they last forever and also stay the same size.
scoreboard players set BedrockAEClouds Settings 0
#Setting to make the dragon stop charging whenever it takes damage.
scoreboard players set StopChargeOnHurt Settings 0
#Setting for whether or not the custom "enhanced" ai should be used.
scoreboard players set UseEnhancedAI Settings 0
#Setting for the mode of the enhanced ai
scoreboard players set EnhancedAIMode Settings 1
#Amount of "flight cycles" a dragon in phase 0 will go through before changing its phase to another.
scoreboard players set FlightCyclesBeforePhaseChange Settings 1


function olddragons:settings/loadpreset
execute store result score Supported Temp run function olddragons:supportedtest

#Display a message saying the pack loaded successfully
tellraw @a {"text":"Old Dragon Mechanics has been enabled!","color":"green"}
schedule function olddragons:help 3s
