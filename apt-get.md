# apt-get

`apt-get`, `aptitude`, Ubuntu official repositories, PPAs and related concepts.

## Transitional packages

TODO <http://askubuntu.com/questions/20377/what-exact-purpose-have-transitional-packages>

## dev packages

Are packages that contain libraries to build stuff, typically `.h` and `.so` files

Their names are typically of the type, `libXXX-dev`, e.g.

	libvbr-dev

Of just with the `-dev` suffix:

	nvidia-cuda-dev

## Package naming conventions

`-dev` suffix: headers and libs, no docs
`-doc` suffix: documentation
`-test` suffix: tests

## apt-get vs aptitude vs synaptic

Summary: **always** use `aptitude` instead of `apt-get`!

Reason: on remove aptitude removes all dependencies which were not installed explicitly But apt-get does not. Example: you installed package a, with 50 dependencies d1, d2, etc. which were not installed. If you do `apt-get unsinstall a`, the deps stay, and you have to do `apt-get uninstall d1, d2, ...`, but if you installed with `aptitude`, and you do `aptitude unistall`, D1 .. d50 are all removed.

*it seems that* apt-get aptitude, and synaptic are front-ends for dpkg. Therefore they should be compatible.

Synaptic has a GUI interface, but less options.

Aptitude seems to be more powerful than apt-get

## aptitude

### First time usage

Before you do anything else, do:

    sudo apt-get update
    sudo apt-get install aptitude

#### Proxy

Setup connexion through a proxy via:

    sudo vim /etc/apt/apt.conf

Add line:

    Acquire::http::Proxy "http://proxy.server.here:port/";

### update

Looks for possible updgrades on known sources, but does not install them:

	sudo aptitude update

Meaning of output: TODO

    Hit http://fr.archive.ubuntu.com precise Release.gpg
    Hit http://fr.archive.ubuntu.com precise-updates Release.gpg
    Hit http://fr.archive.ubuntu.com precise-backports Release.gpg
    Hit http://security.ubuntu.com precise-security Release.gpg
    Ign http://archive.canonical.com precise/partner TranslationIndex

### install

Install package

    sudo aptitude install $PKG

Also install recommended packages:

    sudo aptitude install -o APT::Install-Recommends="true" $PKGg

    -o option changes things which could be in the config files.

Also install suggested packages:

    sudo aptitude install -o APT::Install-Suggests="true" $PKGg

Install only the dependencies required for a package but not the package itself:

    sudo aptitude build-dep $PKG

This is useful if you want to dev a package that has compiled dependencies.

Install specific version of a package:

    sudo apt-get install apache2=2.2.20-1ubuntu1

Very likely to clash with other installed versions of the package.

It is not simple to install to current user without root: <http://askubuntu.com/questions/339/how-can-i-install-a-package-without-root-access>

### upgrade installed packages

Move to next version

Upgrade a single package:

    sudo apt-get -u install $PKG

Upgrades all packages for which upgrade does not involve installing more packages

    sudo apt-get -u upgrade

Upgrades all packages, even if upgrade requires installation of new packages

    sudo apt-get dist-upgrade

### remove packages

    sudo apt-get remove $PKG

Remove package but leave configuration files:

    sudo aptitude remove $PKG

Remove package and configuration files:

    sudo apt-get purge $PKG
    sudo aptitude purge $PKG

Removes dependencies which you did not install explicitly (didn't write on the command line yourself) and that are no longer necessary. Always follows remove or purge. `dpkg` then must contain information about what you installed yourself or not.

    sudo apt-get autoremove

Does nothing for packages that come from metapackages, which are treated as if you had manually installed them. This is where `aptitude` comes in!

TODO:

    sudo apt-get autoclean

    sudo apt-get clean

### build-dep

Install all build dependencies for a package.

Great when you are going to compile it from source to get the latest version.

    sudo apt-get build-dep "$pkg"

### source

Download the source version to the current directory:

    pkg='liblapack-dev'
    apt-get source "$pkg"
    sudo apt-get build-dep "$pkg"
    cd "$pkg"*
    debuild -us -uc

It is also possible to fetch the sources with 

## Combos

To correct dependency problems try:

    PKG=gimp
    sudo apt-get update
    sudo apt-get purge $PKG
    sudo apt-get autoremove
    sudo apt-get autoclean
    sudo apt-get clean
    sudo apt-get autoremove
    suto apt-get install $PKG
    Also, if the package comes from a ppa, remove the ppa and try again
    Sources list. does not include ppas
