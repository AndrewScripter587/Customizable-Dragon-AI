#!/bin/bash

# Script to create a zip archive of a Minecraft datapack

# Define the source folder and the metadata file
source_folder="data"
metadata_file="pack.mcmeta"

# Define the name of the zip file (you can change this)
zip_file_name="DragonAI.zip"

# Check if the source folder exists
if [ ! -d "$source_folder" ]; then
  echo "Error: Source folder '$source_folder' not found."
  exit 1
fi

# Check if the metadata file exists
if [ ! -f "$metadata_file" ]; then
  echo "Error: Metadata file '$metadata_file' not found."
  exit 1
fi

# Create the zip archive
echo "Creating zip archive '$zip_file_name'..."
zip -r "$zip_file_name" "$source_folder" "$metadata_file"

# Check if the zip command was successful
if [ $? -eq 0 ]; then
  echo "Successfully created '$zip_file_name'."
else
  echo "Error creating zip archive."
  exit 1
fi


exit 0