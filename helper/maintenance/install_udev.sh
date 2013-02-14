#!/bin/sh

echo ">>>>>>>>>>>>>>> INSTALLING UDEV RULE <<<<<<<<<<<<<<<<<"
echo "+++++++++++++++ YOU WILL BE ASK FOR SUDO THINGS ++++++++++++++++"
sudo cp -f ../barcodescanner/99-barcode-reader.rules /etc/udev/rules.d/
sudo service udev reload
