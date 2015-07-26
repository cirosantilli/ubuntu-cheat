# apt-cache

Get information on packages without downloading them.

See also: `apt-rdepends`.

List package dependencies

    apt-cache depends $PKG

The pattern is a POSIX ERE.

Get detailed information about a package:

    apt-cache showpkg $PKG

    sudo aptitude install debtags
    debtags tag ls $PKG

## show

Get basic information about a package that can be installed from the remote server:

    apt-cache show hello

Sample output:

    Package: hello
    Priority: optional
    Section: devel
    Installed-Size: 108
    Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
    Original-Maintainer: Santiago Vila <sanvila@debian.org>
    Architecture: amd64
    Version: 2.8-4
    Depends: libc6 (>= 2.14), dpkg (>= 1.15.4) | install-info
    Filename: pool/main/h/hello/hello_2.8-4_amd64.deb
    Size: 28148
    MD5sum: af651f8b526976269affa5b888e63db7
    SHA1: c353f6e99dad0dc628b5604741bfbf97eaf74bcf
    SHA256: 0cd79de61001c8f6ab7611ba724f0f7da7fd0998bf0fd98710fe26d81f0a6b18
    Description-en: The classic greeting, and a good example
     The GNU hello program produces a familiar, friendly greeting.  It
     allows non-programmers to use a classic computer science tool which
     would otherwise be unavailable to them.
     .
     Seriously, though: this is an example of how to do a Debian package.
     It is the Debian version of the GNU Project's `hello world' program
     (which is itself an example for the GNU Project).
    Description-md5: b7df6fe7ffb325083a3a60819a7df548
    Homepage: http://www.gnu.org/software/hello/
    Bugs: https://bugs.launchpad.net/ubuntu/+filebug
    Origin: Ubuntu
    Supported: 5y

May show multiple versions if may are available.

## showsrc

    apt-cache showsrc 

List all direct build dependencies: <http://askubuntu.com/questions/21379/how-do-i-find-the-build-dependencies-of-a-package>

    apt-cache showsrc $PKG | grep -i build

## policy

    apt-cache policy hello

Sample output:

    hello:
      Installed: 2.8-4
      Candidate: 2.8-4
      Version table:
     *** 2.8-4 0
            500 http://fr.archive.ubuntu.com/ubuntu/ trusty/main amd64 Packages
            500 http://archive.ubuntu.com/ubuntu/ trusty/main amd64 Packages
            100 /var/lib/dpkg/status

Meaning:

- <http://unix.stackexchange.com/questions/121413/understanding-the-output-of-apt-cache-policy>
- <http://askubuntu.com/questions/282602/what-do-the-numbers-in-the-output-of-apt-cache-policy-tell-us>

Example with multiple available versions:

    gdb:
      Installed: 7.7.1-0ubuntu5~14.04.2
      Candidate: 7.7.1-0ubuntu5~14.04.2
      Version table:
     *** 7.7.1-0ubuntu5~14.04.2 0
            500 http://fr.archive.ubuntu.com/ubuntu/ trusty-updates/main amd64 Packages
            100 /var/lib/dpkg/status
         7.7-0ubuntu3 0
            500 http://fr.archive.ubuntu.com/ubuntu/ trusty/main amd64 Packages
            500 http://archive.ubuntu.com/ubuntu/ trusty/main amd64 Packages
