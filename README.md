# modelsim_altera_fedora23-24

How to install Altera ModelSim 16.0 on Fedora 23/24.<br/>
There is a known problem with the current freetype packet:
https://wiki.archlinux.org/index.php/Altera_Design_Software#With_freetype2_2.5.0.1-1

* Download and install ModelSim
* Download old freetype package, extract, copy lib
```
wget ftp://rpmfind.net/linux/sourceforge/s/sl/sl7-i686-project/yum/FEDOREL7/FULLMISSING/freetype-2.4.11-9.el7.i686.rpm
rpm2cpio freetype-2.4.11-9.el7.i686.rpm | cpio -idmv
cp usr/lib/* /home/$USER/altera/16.0/modelsim_ase/lib/
rm -r usr freetype-2.4.11-9.el7.i686.rpm  
```

* Set alias for vsim
```
export PATH=$PATH:/home/$USER/altera/16.0/modelsim_ase/bin
alias vsim="LD_PRELOAD=\"/home/$USER/altera/16.0/modelsim_ase/lib/libfreetype.so.6\" vsim"
```
Or use lazy.sh for automated lib installation after ModelSim has been installed.
