# debootstrap

Download an Ubuntu image and save it to a directory:

    sudo debootstrap --verbose trusty /tmp/debootstrap http://archive.ubuntu.com/ubuntu

This downloads a small 200Mb Debian system.

Note that `sys`, `proc` and `devpts` are not mounted: their directories are only created.

Things you can do with it:

-   `chroot` into it TODO test:

        mkdir /tmp/debootstrap
        sudo mount -t devpts none /tmp/debootstrap/dev/pts
        sudo mount -t proc none /tmp/debootstrap/proc
        sudo chroot /tmp/debootstrap /bin/bash

    Depending on what you want to do, you don't need to mount `devpts` and `proc`: it all comes down to if your utilities will use them or not.

    For example, I was able to install and run GCC without them.

    But you can't of course run `px aux` as it reads information from `/proc`.
