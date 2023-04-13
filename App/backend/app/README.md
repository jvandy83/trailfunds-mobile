# Trailfunds v1 Setup and Install

- Inside of this folder, create a virtual environment

      python3 -m venv venv

- Activate your virtual environment

      source venv/bin/activate.bash

- Install dependencies

      pip install -r requirements.txt

## Set up tools

### Install ngrok

- Go to: https://ngrok.com/download
- The instructions are very clear on their website on what install you need for
  your machine
- After installation, add this token by pasting this command in your terminal

      ngrok config add-authtoken 2NDKmkQupkdbIs3uGgruLnydtPd_6YvPhWJvHmFwpBB3jnzik

- This will add a token to a .yaml file in your home directory

  Note: **_I have a paid account that let's us use a reserved endpoint. If you
  use your own token then you won't be able to use the endpoint available in the
  current iteration of Trailfunds_**

- This way, we don't have to use a randomly generated url every time we create
  an **ngrok** tunnel

- Start ngrok server

      ngrok http --domain=trailfunds.ngrok.dev 5000

### Install PostgreSQL

      brew install postgresql@14

- Start postgreSQL server

      brew services start postgresql@14

- If you want to the stop postgreSQL server

      brew services stop postgresql@14

- With your postgreSQL instance running on your local machine, create a username
  and password

- To access your postgreSQL instance in your terminal

      psql

- Now you're inside the default DB 'postgres'
- To create a username and password

      CREATE USER <your-username> WITH PASSWORD <your-password>;

### Prisma (database ORM)

- Run your first Prisma migration

  - First, create a new .env file

        cp env .env

  - Add your newly created username and password to the postgreSQL connection
    string assigned to the DATABASE_URL key inside .env

  - Run your migration

        prisma db push

  - This will run your schema.prisma file inside the schema folder and create
    your postgreSQL tables and columns
  - Run this command anytime you make changes to schema.prisma

Run FastApi server

      uvicorn main:app --reload --port 5000
