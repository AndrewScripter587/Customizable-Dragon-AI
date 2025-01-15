#Display a message saying the pack is loading
tellraw @a {"text":"Detecting Server Version...","color":"yellow"}

scoreboard objectives add VersionInfo dummy

scoreboard players set MinecraftVersion VersionInfo 0
scoreboard players set IsBukkit VersionInfo 0

function verdetect:1.14
function verdetect:bukkittest

execute as @a run function verdetect:printversion

