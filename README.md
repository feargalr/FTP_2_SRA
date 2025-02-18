# FTP_2_SRA

A collection of basic scripts for transferring data to the **Sequence Read Archive (SRA)**.  

These scripts automate the process of uploading files via FTP and checking their status on the SRA servers.  

## Prerequisites

Before using these scripts, ensure that:  

- You have an **SRA account** and the necessary credentials for FTP access.  
- Your **login credentials** are correctly configured within the scripts (or stored securely).  
- You have access to a computing environment with **SLURM** if you plan to use the queueing system.  

## Scripts Overview  

### 1. `check_sra_uploads.sh`  
A shell script to check which files are already uploaded in a specified directory on the **Sequence Read Archive**.  

#### Usage:  
```bash
bash check_sra_uploads.sh <remote_directory>
```
#### Example:  
```bash
bash check_sra_uploads.sh /sra/submissions/YOUR_PROJECT/
```
---

### 2. `ftp_job1.sh`  
A **Bash script** containing the FTP commands required to upload files to the **Sequence Read Archive**.  

Before running this script, modify it to include your **SRA credentials** and the correct **remote directory** for your submission.  

#### Usage:  
```bash
bash ftp_job1.sh
```
---

### 3. `ftp_upload.slurm`  
A **SLURM job script** that executes `ftp_job1.sh` to submit the upload process as a job to a **SLURM queue**.  

#### Submit the job using:  
```bash
sbatch ftp_upload.slurm
```
