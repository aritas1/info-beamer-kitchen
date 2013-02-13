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
