cd ./App/
echo "Creating .venv (obsolete)..."
python3 -m venv .venv
# . .venv/bin/activate
echo "Upgrading pip..."
pip install --upgrade pip
echo "Installing project requirements (requirements.txt, requirements_dev.txt)..."
python3 -m pip install -r ../app/backend/requirements.txt 
python3 -m pip install -r ../app/backend/requirements_dev.txt
echo "Installing lint tools..."
pip install black
pip install flake8
pip install autoflake
pip install pylint
echo "Running 'npm install'..."
npm install
# echo "Installing Expo..."
# npm install -g expo-cli
echo "Running 'expo start'..."
expo start
echo """
Post Commands Completed. 
There may be errors in the startup process, report any unexpected behavior.
If .venv is not visible under app/, press the refresh icon.
"""