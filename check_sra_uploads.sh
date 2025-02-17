#!/bin/bash

# Define FTP credentials and target directory
FTP_HOST="ftp-private.ncbi.nlm.nih.gov"
FTP_USER=""
FTP_PASS=""
FTP_DIR=""

# Run FTP command and save output to a log file
ftp -n <<EOF > ftp_uploads.log
open $FTP_HOST
user $FTP_USER $FTP_PASS
cd $FTP_DIR
ls -lh
bye
EOF

# Display the output
cat ftp_uploads.log
