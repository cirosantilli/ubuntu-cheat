# dpkg

Lower level tool that `apt-get`: capable of listing, installing and removing individual `.deb` packages, but not of managing dependencies.

`apt-get` is a front-end for `dpkg`

List all installed packages and greps for `foo`:

    dpkg -l | grep "$EXPRESSION"

The first two letters mean:

- `ii`: installed
- `rc`: configuration files only (`rc` means config such as in `bashRC`)

Install `.deb` file:

    dpkg -i a.deb

Remove previously installed package:

    dpkg -r a.deb

You don't need the `.deb` to uninstall it.

Automatically install updates without asking for confirmation: <http://askubuntu.com/questions/9/how-do-i-enable-automatic-updates>

    sudo dpkg-reconfigure unattended-upgrades

## x

Extract files to be installed by this package to a directory named `a/`:

    dpkg -x a.deb a

Does not extract control files.

## L

List files in installed package:

    dpkg -L mysql | sort

Sample output:

    /.
    /usr
    /usr/bin
    /usr/bin/acyclic
    /usr/bin/bcomps
    /usr/bin/ccomps
    /usr/bin/circo
    /usr/bin/cluster
    /usr/bin/diffimg
    /usr/bin/dijkstra

For packages that are not installed, consider `apt-file`.

## S

Search for pattern in paths of installed packages:

    dpkg -S vmlinuz

Sample output:

    linux-image-3.13.0-24-generic: /boot/vmlinuz-3.13.0-24-generic
    linux-image-3.13.0-40-generic: /boot/vmlinuz-3.13.0-40-generic
    linux-image-3.13.0-36-generic: /boot/vmlinuz-3.13.0-36-generic
    linux-image-3.13.0-37-generic: /boot/vmlinuz-3.13.0-37-generic

For packages that are not installed, consider `apt-file search`.
