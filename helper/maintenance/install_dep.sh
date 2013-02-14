#!/bin/sh

echo ">>>>>>>>>>>>>>> Cloning BarcodeScanner <<<<<<<<<<<<<<<<<"

git clone https://github.com/aritas1/barcodescanner.git ../barcodescanner

echo ">>>>>>>>>>>>>>> Make BarcodeScanner <<<<<<<<<<<<<<<<<"
make -C ../barcodescanner/


echo ">>>>>>>>>>>>>>> Cloning Info-Beamer <<<<<<<<<<<<<<<<<"
git clone https://github.com/aamuuninen/info-beamer ../info-beamer

echo ">>>>>>>>>>>>>>> Make Info_Beaner <<<<<<<<<<<<<<<<<"
make -C ../info-beamer/


echo ">>>>>>>>>>>>>>> Cloning Info-Beamer-Nodes <<<<<<<<<<<<<<<<<"
git clone https://github.com/aamuuninen/info-beamer-nodes ../info-beamer-nodes

echo ">>>>>>>>>>>>>>> Building helpers (clock - java) <<<<<<<<<<<<<<<<<"
javac helper/Clock.java
