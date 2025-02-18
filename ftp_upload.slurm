#!/bin/bash
#SBATCH --job-name=sra_job_%j  # Name of the job, including job ID
#SBATCH --output=ftp_job_%j.out  # Output log file for each job
#SBATCH --error=ftp_job_%j.err  # Error log file for each job
#SBATCH --time=48:00:00         # Adjust based on expected duration
#SBATCH --mem=1G                # Adjust based on memory requirements

# Define variables
UPLOAD_DIR=""  # Directory containing your FASTQ files
FTP_SCRIPT_DIR=""  # Directory where your FTP scripts are stored

# Get the filename from the argument and prepend the full path
FTP_SCRIPT="$FTP_SCRIPT_DIR/$1"

# Ensure the FTP script exists
if [[ ! -f "$FTP_SCRIPT" ]]; then
    echo "Error: FTP script '$FTP_SCRIPT' not found." >&2
    exit 1
fi

# Change to the directory with the files
cd "$UPLOAD_DIR" || exit

# Execute FTP upload with the full path
ftp -n < "$FTP_SCRIPT"
