#!/usr/bin/env bash
#
# Sample post-install shell script that runs the cron jobs on the installed instance.
# It has to be executed if other post-install scripts has created objects (Accounts, f.e.) that
# are processed by the cron jobs in a running instance (indexed into the Elasticsearch, f.e.)

# Variables inherited from the parent script:
#  - SQLPLUS - the path of the sqlplus64 Oracle utility
#  - DEST    - instance installation directory
#  - CRM_HOST - the name of the host where the instance is installed
#  - CRM_PATH - the path (on $CRM_HOST) where the instance is installed (http://$CRM_HOST$CRM_PATH)
#  - INSTANCE - the argument --instance provided to Nusim
#  - FLAVOR   - the flavor of the installation ('pro', 'ent', 'ult')
#  - VERSION  - the version of SugarCRM of the customization
#  - ADMIN_USER - the name of the Administrator user on the installation
DEST=$DEST


# Go to the installation directory, run the cron script, change the directory back
cd $DEST
echo "Running the cron jobs on the installed instance..."
php -f ./cron.php
cd - &>/dev/null


# That's all, folks
