# Powershell docker cron job runner

Run Powershell scripts using a cron job in a docker container.

# Build & run

To build:
    docker build . pscron

To start:
    docker run --name=pscron -d pscron

Check if it's working:
    docker logs pscron -f 


