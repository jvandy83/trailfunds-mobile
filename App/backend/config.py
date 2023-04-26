from pydantic import BaseSettings

# TrailfundsDb="Trailfunds.db"
# DB_TEST_Trailfunds= "Test_Trailfunds.db"

# fastapi env variable configuration
class Settings(BaseSettings):
  database_url: str
  base_url: str
  class Config:
      env_file = ".env"

