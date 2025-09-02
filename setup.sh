#!/bin/bash

set -e  # Exit on any error

#### check if dnf is installed ####
if ! command -v dnf &> /dev/null; then
    echo -e "\e[31mThis script requires a Red Hat-based system with 'dnf' installed.\e[0m"
    exit 1
fi

echo "Installing system packages..."


sudo dnf install -y \
    wget curl git gcc gcc-c++ make \
    openssl-devel libcurl-devel libxml2-devel \
    zlib-devel libpng-devel \
    python3 python3-pip python3-venv R

#### PYTHON 3 ######
echo "Setting up Python virtual environment"

python3 -m venv ~/quarto-env
source ~/quarto-env/bin/activate

pip install --upgrade pip
pip install jupyter pandas matplotlib quarto

### QUARTO CLI ####
echo "Installing Quarto CLI..."

wget https://quarto.org/download/latest/quarto-linux-amd64.rpm
sudo dnf install -y ./quarto-linux-amd64.rpm
rm -f quarto-linux-amd64.rpm

#### R PACKAGELIST ####
echo "Installing R packages..."

Rscript -e "install.packages(c('languageserver', 'tidyverse', 'reticulate', 'rmarkdown', 'knitr'), repos='https://cloud.r-project.org/')"
Rscript -e install.packages("renv")
Rscript -e renv::init
echo "Follow R setup Instructions, Ensure R is installed on the correct level either project level/user level"
echo -e "\e[1;32mSetup complete!\e[0m"
echo "Activate Python env with: source ~/quarto-env/bin/activate"
