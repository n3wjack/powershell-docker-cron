FROM mcr.microsoft.com/powershell

COPY *.ps1 /scripts/

# Install cron
RUN apt-get update && apt-get -y install cron

# Setup cron jobs
RUN crontab -l | { cat; echo "* * * * * pwsh /scripts/test.ps1 >> /var/cron.log"; } | crontab -
RUN crontab -l | { cat; echo "*/2 * * * * pwsh /scripts/test2.ps1 >> /var/cron.log"; } | crontab -

# Create the log file to be able to run tail.
RUN touch /var/cron.log
# Run cron & tail to see some output.
CMD cron && tail -f /var/cron.log 

