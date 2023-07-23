#!/bin/bash

# Check rmdir 
if sudo rmdir "/Volumes/$1"; then
  echo "Mount point deleted" 
else
  echo "Error deleting mount point"
  exit 1
fi

# Get disk info
disk_info=$(diskutil list)

# Grep for storage name 
disk_line=$(echo "$disk_info" | grep "$1")

# Get identifier
disk_id=$(echo "$disk_line" | awk '{print $NF}')

# Extract disk name
disk_name="${disk_id%s*}"

# Mount disk
diskutil mountDisk /dev/"$disk_name"
