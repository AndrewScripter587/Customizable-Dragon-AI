#Display a message saying the pack is loading
tellraw @a {"text":"Loading Version Detector (Embedded)","color":"yellow"}

scoreboard objectives add VersionInfo dummy

scoreboard players set MinecraftVersion VersionInfo 0
scoreboard players set IsBukkit VersionInfo 0

function verdetect:1.14
function verdetect:bukkittest
tellraw @a {"text":"Loaded Version Detector (Embedded) successfully!","color":"green"}



