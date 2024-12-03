# Check if /opt/scripts directory exists
if test ! -e /opt/scripts;
then
    mkdir -p /opt/scripts;
fi;

# Check if autoupdate.sh exists
if test ! -e "/opt/scripts/autoupdate.sh" ;
then
    touch "/opt/scripts/autoupdate.sh" ;
    chmod +x "/opt/scripts/autoupdate.sh" ;
fi;

# Add commands to autoupdate.sh
echo "apt-get update && apt-get upgrade -y" >> "/opt/scripts/autoupdate.sh" ;
echo "date '+%H:%M:%S   %d/%m/%y'  >> /opt/scripts/autoupdate_t.log" >> "/opt/scripts/autoupdate.sh";

# Install cron if not installed
apt-get install cron -y ;

# Add a cron job to run autoupdate.sh daily at 1:00 AM
echo "0 1 * * * root /opt/scripts/autoupdate.sh > /opt/scripts/autoupdate.log" >> /etc/crontab ;

