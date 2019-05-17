#!/bin/bash

# Make www-data user use id from hosts user to make shared folder writable.
USERID=$(id -u)
if [ "$USERID" -ne 0 ]
then
    # fetch current userid for user www-data
    WWW_DATA_USERID=$(id -u www-data)
    # if www-data userid doesn't equal the one from host, force id of user to the one from host
    if [ "$WWW_DATA_USERID" -ne "$USERID" ];then
        echo "usermod -u ${USERID} www-data"
        usermod -u ${USERID} www-data
    fi
    echo "$(id www-data)"
else
    echo "$(id www-data)"
fi

# start apache
exec apachectl -D FOREGROUND
