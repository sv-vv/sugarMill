#!/usr/bin/env bash
#
# Sample post-install shell script that replaces the avatar image for Administrator.
# It doesn't use Sugar, it simply finds the file name in the database and replaces the file with a custom one.
#
# Copy `examples/avatar-man.png` or `examples/avatar-woman.png` as `avatar.png` or put a different `avatar.png` file.
#
# Variables inherited from the parent script:
#  - SQLPLUS - the path of the sqlplus64 utility
#  - DATA    - the directory of this file
#  - DEST    - installation directory
#  - DB_URL  - database connection string
SQLPLUS=$SQLPLUS
DATA=$DATA
DEST=$DEST
DB_URL=$DB_URL

# Local: use `avatar.png' from this directory as avatar for Administrator
SOURCE="$DATA/avatar.png"


# Attempt to find the name of the current avatar image file for Administrator
IMAGE=$(echo "SELECT picture FROM Users WHERE id='1';" | $SQLPLUS -S $DB_URL | head -n 4 | tail -n 1)

if [ "$IMAGE" ]; then
    # Set the admin avatar
    echo cp $SOURCE $DEST/upload/$IMAGE
    cp $SOURCE $DEST/upload/$IMAGE
else
    echo "** Error retrieving the ID of the Admin avatar image from the database. Will blindly change it."
    echo cp $SOURCE $DEST/upload/*-*
    cp $SOURCE $DEST/upload/*-*
fi


# That's all, folks!
