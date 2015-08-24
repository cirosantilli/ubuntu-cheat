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

    dpkg -L hello | sort

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

## p

Show full package description:

    dpkg -p hello

Sample output:

    Package: hello
    Priority: optional
    Section: devel
    Installed-Size: 108
    Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
    Architecture: amd64
    Version: 2.8-4
    Depends: libc6 (>= 2.14), dpkg (>= 1.15.4) | install-info
    Size: 28148
    Description: The classic greeting, and a good example
     The GNU hello program produces a familiar, friendly greeting.  It
     allows non-programmers to use a classic computer science tool which
     would otherwise be unavailable to them.
     .
     Seriously, though: this is an example of how to do a Debian package.
     It is the Debian version of the GNU Project's `hello world' program
     (which is itself an example for the GNU Project).
    Original-Maintainer: Santiago Vila <sanvila@debian.org>
    Homepage: http://www.gnu.org/software/hello/
