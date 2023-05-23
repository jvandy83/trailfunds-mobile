# Trailfunds v1 Setup and Install

### Make sure Docker is installed on your machine

- With Homebrew:

      brew install docker

- Or from Docker website: https://docs.docker.com/desktop/install/mac-install/

- Start Docker server

### Start Backend Service

      docker compose up --build

### Run ngrok

      ngrok start dev --config ngrok.yml
