#!/bin/sh

echo ">>>>>>>>>>>>>>> Collecting all needed files <<<<<<<<<<<<<<<<<"

echo ">>>>>>>>>>>>>>> INFO-BEAMER NODES <<<<<<<<<<<<<<<<<"
mkdir kitchen_cycler
cp -Rf ../info-beamer-nodes/kitchen_cycler/* ./kitchen_cycler/

echo ">>>>>>>>>>>>>>> INFO-BEAMER BARCODESCANNER NODE <<<<<<<<<<<<<<<<<"
cp -Rf ../barcodescanner/barcodebeamer ./kitchen_cycler/

echo ">>>>>>>>>>>>>>> BARCODESCANNER EXECUTABLE <<<<<<<<<<<<<<<<<"
mkdir scanner
cp -Rf ../barcodescanner/prog3 ./scanner/scan_collector
cp -Rf ../barcodescanner/scanner.jar ./scanner/scanner.jar
sudo chown root ./scanner/scan_collector
sudo chmod 4755 ./scanner/scan_collector
