# Start from the rootproject/root-conda:6.18.04 base image
From rootproject/root-conda:6.18.04

COPY . /analysis/skim

WORKDIR /analysis/skim

RUN echo ">>> Compile skimming executable ..." &&  \
COMPILER=$(root-config --cxx) &&  \
FLAGS=$(root-config --cflags --libs) &&  \
$COMPILER -g -std=c++11 -O3 -Wall -Wextra -Wpedantic -o skim skim.cxx $FLAGS

