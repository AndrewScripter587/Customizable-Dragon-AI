function dragonai:supportedtest
execute unless score Supported Temp matches 1.. run tellraw @a {"color":"red","text":"Customizable Dragon AI doesn't support your version of Minecraft. Please update to 23w41a (1.20.3 snapshot) or newer to use Customizable Dragon AI. If you are using a version that should be supported, please report bugs by DMing me on discord (@AndrewGaming587)"}
execute if score Supported Temp matches 1.. run tellraw @a "This server/singleplayer world is running Customizable Dragon AI."
execute if score Supported Temp matches 1.. run tellraw @a {"text":"If you have operator, click here to open the configuration.","clickEvent":{"action":"run_command","value":"/function dragonai:config"}}