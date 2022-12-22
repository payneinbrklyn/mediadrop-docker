#!/bin/bash 
python_version="2.7.18"
mkdir -p /downloads && cd /downloads

#self-hosted:
    #wget https://www.dropbox.com/s/o5cx4gtee547q0u/Python-${python_version}.tgz?dl=0



# Create a folder where you want to install different Pythons, and cd into it:
# Note that it doesn't need to be your home folder. Put it wherever you want to maintain such software:
export PYTHON_BASE="$HOME/python"
mkdir -p $PYTHON_BASE

cd $PYTHON_BASE
#official:
curl --create-dirs -L -o src/python-${python_version}.tgz https://www.python.org/ftp/python/2.7.18/Python-${python_version}.tgz
cd src
tar -zxf python-${python_version}.tgz

# Configure, build, and install into a properly versioned subdirectory:
cd Python-${python_version}

#./configure --prefix=$PYTHON_BASE/python-${python_version} --enable-shared --enable-unicode=ucs4 LDFLAGS="-Wl,-rpath=$PYTHON_PREFIX/lib"
# if you need to run this again, run `make clean` before that
./configure --enable-optimizations
make



#export DESTDIR="/usr/local/bin/python-${python_version}"
make install

#### NEED TO test Python install HERE #####
which python


# Get the environment ready
python -m ensurepip
pip install --upgrade setuptools pip
pip install --upgrade virtualenv

# create a virtualenv with python 2.7.18
python -m virtualenv venv

# Activate the virtualenv
source venv/bin/activate

# Deactivate the virtualenv
deactivate


# Make sure the latest setuptools and pip are installed:
#$PYTHON_BASE/python-${python_version}/bin/python -m ensurepip
python -m ensurepip

#$PYTHON_BASE/python-${python_version}/bin/pip install --upgrade setuptools pip
pip install --upgrade setuptools pip
pip install biopython==1.76
pip install FireWorks==1.9.6
pip install azure==2.0.0

# Install all the various packages we use here at MSKCC:
#$PYTHON_BASE/python-${python_version}/bin/pip install --upgrade alabaster ansi argparse azure babel biopython drmaa filemagic fireworks fusepy ipython lockfile markerlib nose powerline-status pygments pyvcf sh snowballstemmer sphinx virtualenv wheel
pip install --upgrade alabaster ansi argparse babel drmaa filemagic fusepy ipython lockfile markerlib nose powerline-status pygments pyvcf sh snowballstemmer sphinx virtualenv wheel

#$PYTHON_BASE/python-${python_version}/bin/pip install --upgrade pysam matplotlib pandas cython scipy
pip install --upgrade pysam matplotlib pandas cython scipy