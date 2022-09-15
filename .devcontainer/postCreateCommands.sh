cd ./App/
echo "Creating .venv (obsolete)..."
python3 -m venv .venv
. .venv/bin/activate
echo ".venv created under app/"
echo "Upgrading pip..."
pip install --upgrade pip
echo "Pip upgraded"
echo "Installing project requirements (requirements.txt, requirements_dev.txt)..."
python3 -m pip install -r requirements.txt 
python3 -m pip install -r requirements_dev.txt
echo "Requirements installed"
echo "Installing lint tools..."
pip install black
pip install flake8
pip install autoflake
pip install pylint
echo "Lint tools installed"
echo "Running 'npm install'..."
npm install -g
echo "Done"
echo "Installing Expo..."
npm install -g expo-cli
echo "Expo installed"
echo "Running 'expo start'..."
expo start
echo """
Post Commands Completed. 
If .venv is not visible under app/, press the refresh icon.
"""