#!/bin/bash
module load intel/mkl
# Clear and create the sbatch command file
rm sbatch.cmd
touch sbatch.cmd

# Specify the number of tasks
ntasks=48

for file in *.in; do
    if [ -f "$file" ]; then
        arrIN=(${file//./ })
        outputDirectory="Output_${arrIN}"

        if [ ! -d "$outputDirectory" ]; then
            mkdir "$outputDirectory"
            cp "$file" "${outputDirectory}/INPUT"
            job_script="${outputDirectory}/job_script.sh"

            # Create a job script for each job
            echo "#!/bin/bash" > "$job_script"
            echo "cd $outputDirectory" >> "$job_script"
            echo "mpirun -n $ntasks $HOME/q-e/bin/pw.x < INPUT > OUTPUT 2>&1" >> "$job_script"

            # Make the job script executable
            chmod +x "$job_script"

            # Submit the job script to the cluster 
            # For Slurm, you can use "sbatch" like this:
            sbatch --job-name="grid_rlx" --partition="bsudfq" --time="72:00:00" --ntasks="$ntasks" "$job_script"

            echo "Submitted job for $file"

            # Add job information to the sbatch command file 
            echo "cd $outputDirectory && $job_script" >> sbatch.cmd
        fi
    fi
done
