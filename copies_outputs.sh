#!/bin/bash

# Define the root folder where you want to search for subfolders
root_folder="H_output_files"

# Define the destination folder for the copied files
destination_folder="output_files_for_H"

# Create the destination folder if it doesn't exist
mkdir -p "$destination_folder"

# Loop through subfolders matching the pattern "Output_grid_point_x"
for x in {0..99}; do
    folder_name="Output_grid_point_$x"
    folder_path="$root_folder/$folder_name"

    # Check if the folder exists
    if [ -d "$folder_path" ]; then
        # Check if the "grid_point_x" file exists in the folder
        if [ -e "$folder_path/grid_point_$x" ]; then
            # Copy the "grid_point_x" file to the destination folder
            cp "$folder_path/grid_point_$x" "$destination_folder/"
        fi
    fi
done
