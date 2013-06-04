#!/bin/sh

echo ">>>>>>>>>>>>>>> Collecting all needed files <<<<<<<<<<<<<<<<<"

echo ">>>>>>>>>>>>>>> INFO-BEAMER NODES <<<<<<<<<<<<<<<<<"
rm -rf kitchen_cycler
git clone git@github.com:aamuuninen/info-beamer-kitchen-cycler.git kitchen_cycler

echo ">>>>>>>>>>>>>>> INFO-BEAMER BARCODESCANNER NODE <<<<<<<<<<<<<<<<<"
cp -Rf ../barcodescanner/barcodebeamer ./kitchen_cycler/

echo ">>>>>>>>>>>>>>> BARCODESCANNER EXECUTABLE <<<<<<<<<<<<<<<<<"
rm -rf scanner
mkdir scanner
cp -Rf ../barcodescanner/prog3 ./scanner/scan_collector
cp -Rf ../barcodescanner/scanner.jar ./scanner/scanner.jar
chmod 755 ./scanner/scanner.jar
sudo chown root ./scanner/scan_collector
sudo chmod 4755 ./scanner/scan_collector
