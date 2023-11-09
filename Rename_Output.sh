#!/bin/bash

# Define the root folder where you want to search for subfolders
root_folder="H_output_files"

# Loop through subfolders matching the pattern "Output_grid_point_x"
for x in {0..99}; do
    folder_name="Output_grid_point_$x"
    folder_path="$root_folder/$folder_name"

    # Check if the folder exists
    if [ -d "$folder_path" ]; then
        # Check if the "OUTPUT" file exists in the folder
        if [ -e "$folder_path/OUTPUT" ]; then
            # Rename the "OUTPUT" file to "grid_point_x"
            mv "$folder_path/OUTPUT" "$folder_path/grid_point_$x"
        fi
    fi
done

