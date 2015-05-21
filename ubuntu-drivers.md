# ubuntu-drivers

Present in 14.04. `jockey` was used in 12.04.

Command line interface for the "Additional drivers" dialog.

List possible drivers for present hardware:

    sudo ubuntu-drivers devices

Sample output from an NVIDIA GPU:

    == /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0 ==
    vendor   : NVIDIA Corporation
    modalias : pci:v000010DEd00000DEFsv000017AAsd000021F4bc03sc00i00
    model    : GF108M [NVS 5400M]
    driver   : nvidia-304 - distro non-free
    driver   : nvidia-331-updates - distro non-free
    driver   : nvidia-304-updates - distro non-free
    driver   : nvidia-331 - distro non-free recommended
    driver   : xserver-xorg-video-nouveau - distro free builtin

You can then install or uninstall the drivers with `apt-get`: `nvidia-304`, `nvidia-331`, etc. are the actual package names.
