#!/bin/sh

echo ">>>>>>>>>>>>>>> Updating BarcodeScanner <<<<<<<<<<<<<<<<<"
cd ../barcodescanner
git pull
echo ">>>>>>>>>>>>>>> Updating c program (make) <<<<<<<<<<<<<<<<<"
make

echo ">>>>>>>>>>>>>>> Updating Info-Beamer <<<<<<<<<<<<<<<<<"
cd ../info-beamer
git pull
echo ">>>>>>>>>>>>>>> Updating c program (make) <<<<<<<<<<<<<<<<<"
make

echo ">>>>>>>>>>>>>>> Updating Info-Beamer-Node <<<<<<<<<<<<<<<<<"
cd ../info-beamer-nodes
git pull

echo ">>>>>>>>>>>>>>> Building helpers (clock - java) <<<<<<<<<<<<<<<<<"
cd ../info-beamer-kitchen
javac helper/Clock.java
