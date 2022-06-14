###########################
# Author :   Rukiye AKINCI
# Date   :   29/05/2022
#############################

# vi disk_kontrol.sh 							#Bash scripti oluşturuldu


#!/bin/sh 


ADMIN="rukiyeakinci@madamecoder.com"                                     # mail gelecek adresi yazıldı

ALERT=90                                                                 # Disk kullanım alanı yüzde 90 olduğunda bize mail atılacak
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $usep" $ADMIN
  fi
done