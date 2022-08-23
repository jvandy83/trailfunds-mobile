cd ./App/
python3 -m venv .venv
. .venv/bin/activate
pip install --upgrade pip
python3 -m pip install -r requirements.txt 
python3 -m pip install -r requirements_dev.txt
pip install black
pip install flake8
pip install autoflake
pip install pylint
# cd ../frontend
# npm install
echo """
Post Commands Completed. 
If .venv is not visible under App/, press the refresh icon.
"""
