# Trailfunds v1 Setup and Install

## Start Services in development

### Make sure Docker is installed on your machine

- With Homebrew:

      brew install docker

- Or from Docker website for Mac:
  https://docs.docker.com/desktop/install/mac-install/

- Or from Docker website for Windows:
  https://docs.docker.com/desktop/install/windows-install/

- Start Docker server

### Start Backend Service

First time (this will build AND run containers):

      docker compose up --build

### Run ngrok

      ngrok start dev --config ngrok.yml

## Stop Services

To stop all conainers:

      docker compose down

Subsequent start ups, run:

      docker compose up

Stop Ngrok server:

      ctl + c
