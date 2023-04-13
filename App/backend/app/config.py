from pydantic import BaseSettings

# fastapi env variable configuration
class Settings(BaseSettings):
  database_url: str
  secret: str
  class Config:
      env_file = ".env"
