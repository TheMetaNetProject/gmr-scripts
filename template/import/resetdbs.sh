#!/bin/bash
# drop and recreate the metanetlm and gmr databases
# 12/6/14:  converted to use /u/metanet/repository/mysql/reset_mndb.sh

export PATH=/u/metanet/tools/mysql64/bin:$PATH
if [[ -z $1 ]]
then
dstamp=`date +%Y%m%d`
else
dstamp="$1"
fi

mndb="metanetlm_$dstamp"
cd /u/metanet/repository/mysql
./reset_mndb.sh $mndb

# metanetdbfile=/u/metanet/repository/mysql/metanetlm.sql
#echo "resetting database $mndb ..."
#echo "DROP DATABASE IF EXISTS $mndb; CREATE DATABASE $mndb CHARACTER SET utf8 COLLATE utf8_bin;" | mysql -u mnadmin
#cat $metanetdbfile | mysql -u mnadmin $mndb
#echo "GRANT ALL ON $mndb.* TO 'mdbuser'@'localhost';" | mysql -u mnadmin mysql
#echo "GRANT FILE ON *.* TO 'mdbuser'@'localhost';" | mysql -u mnadmin mysql
#echo "GRANT SELECT ON $mndb.* TO 'readonly_user'@'localhost';" | mysql -u mnadmin mysql

cd /u/metanet/repository/gmrdumps
./reset_gmr.sh "icsi_gmr_$dstamp"

