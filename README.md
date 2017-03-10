# altera 16.1 - modelsim 10.4b on Fedora 23/24

# This project has been moved to Gitlab: <https://gitlab.com/users/neo0x3d/projects>

How to install Altera ModelSim 16.0 on Fedora 23/24.<br/>
There is a known problem with the current freetype packet:
https://wiki.archlinux.org/index.php/Altera_Design_Software#With_freetype2_2.5.0.1-1

1. Install dependencies (Fedora 24)
```
sudo dnf install glibc.i686 zlib.i686 bzip2-libs.i686 libXft.i686 libXext.i686 ncurses-compat-libs.i686
```
1. Download and install ModelSim
1. modify vsim
Modify the file /home/$USER/altera/16.0/modelsim_ase/bin/vsim, row 205 from  vco="linux_rh60" to vco="linux"
1. Download old freetype package, extract, copy lib
```
wget ftp://rpmfind.net/linux/sourceforge/s/sl/sl7-i686-project/yum/FEDOREL7/FULLMISSING/freetype-2.4.11-9.el7.i686.rpm
rpm2cpio freetype-2.4.11-9.el7.i686.rpm | cpio -idmv
cp usr/lib/* /home/$USER/altera/16.0/modelsim_ase/lib/
rm -r usr freetype-2.4.11-9.el7.i686.rpm  
```

1. Set alias for vsim
```
export PATH=$PATH:/home/$USER/altera/16.0/modelsim_ase/bin
alias vsim="LD_PRELOAD=\"/home/$USER/altera/16.0/modelsim_ase/lib/libfreetype.so.6\" vsim"
```
Or use lazy.sh for automated lib installation after ModelSim has been installed.

# altera/intelFPGA 16.1 - modelsim 10.5b on Fedora 25

Walk though the steps from above (modelsim 10.4b on Fedora 23/24), after intelFPGA has been installed:
* Download and extract the same libfreetype packet as above (the version of libfreetype matters, the package for Fedora 23 or 24 can also be used on Fedora 25, it will only be used for modelsim and NOT for the rest of the system!)
* Modify the string "linux_rh60" to "linux" in the ~/intelFPGA/16.1/modelsim_ase/bin/vsim file

Add to ~/.bashrc
```
export PATH=$PATH:/home/$USER/intelFPGA/16.1/modelsim_ase/linuxaloem
alias vsim="LD_PRELOAD=\"/home/$USER/intelFPGA/16.1/modelsim_ase/lib/libfreetype.so.6\" vsim"
```
