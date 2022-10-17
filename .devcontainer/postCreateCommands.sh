echo "Upgrading pip..."
pip install --upgrade pip
echo "Installing lint tools..."
pip install black
pip install flake8
pip install autoflake
pip install pylint
echo "Setting environmental variables..."
export REACT_NATIVE_PACKAGER_HOSTNAME=${dig +short myip.opendns.com @resolver1.opendns.com}