#!/bin/bash
sudo dnf install glibc.i686 zlib.i686 bzip2-libs.i686 libXft.i686 libXext.i686 ncurses-compat-libs.i686
wget ftp://rpmfind.net/linux/sourceforge/s/sl/sl7-i686-project/yum/FEDOREL7/FULLMISSING/freetype-2.4.11-9.el7.i686.rpm
rpm2cpio freetype-2.4.11-9.el7.i686.rpm | cpio -idmv
cp usr/lib/* /home/$USER/altera/16.0/modelsim_ase/lib/
rm -r usr freetype-2.4.11-9.el7.i686.rpm

echo 'export PATH=$PATH:/home/$USER/altera/16.0/modelsim_ase/bin' >> ~/.bashrc
echo 'alias vsim="LD_PRELOAD=\"/home/$USER/altera/16.0/modelsim_ase/lib/libfreetype.so.6\" vsim"' >> ~/.bashrc
source ~/.bashrc
