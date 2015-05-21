# deb

File format used for distributing packages.

`ar` archive with fixed file structure documented at: <https://www.debian.org/doc/debian-policy>

## Download a deb

For testing, it is cool to download actual deb packages and see what is inside, so:

    apt-get download hello

This downloads a file like:

    hello_2.8-4_amd64.deb

Or you can download archives directly form the server by browsing:

    http://archive.ubuntu.com/

E.g.:

    http://archive.ubuntu.com/ubuntu/pool/main/h/vim/

### hello package

A hello world deb package for us to learn.

<http://packages.ubuntu.com/trusty/devel/hello>

    sudo apt-get install hello
    hello

Outputs:

    Hello, world!

It is a compiled C program.

Not really minimal, but covers all basic features minimally, including manpages.

## File name

Format:

    <name>_<version>-<ubuntu-version>_<architecture>.deb

Sample:

    hello_2.8-4_amd64.deb
    ^^^^^ ^^^ ^ ^^^^^
    1     2   3 4

1.  unique package name

2.  version

3.  TODO. Mentioned at: <https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Version>

    I think this is increased by 1 every time the package changes.

4.  architecture. Common values:

    - `all`
    - `i386`
    - `amd64`

## Open a deb

The most direct way to do it is via `ar`:

    ar xf *.deb

A higher level view can be obtained with:

    dpkg-deb -R *.deb

which also unpacks the internal archives.

## File structure

- `debian-binary`
- `data.tar.gz`
- `control.tar.gz`

### debian-binary

Contains an ASCII representation of the package format version, e.g.:

    2.0

### data.tar.gz

Contains the actual files to be installed.

Example for `lolcat`:

    .
    `-- usr
        |-- games
        |   `-- lolcat
        |-- lib
        |   `-- ruby
        |       `-- vendor_ruby
        |           |-- lolcat
        |           |   |-- cat.rb
        |           |   |-- lol.rb
        |           |   `-- version.rb
        |           `-- lolcat.rb
        `-- share
            |-- doc
            |   `-- lolcat
            |       |-- README.md
            |       |-- changelog.Debian.gz
            |       `-- copyright
            |-- lintian
            |   `-- overrides
            |       `-- lolcat
            `-- man
                `-- man6
                    `-- lolcat.6.gz

### control.tar.gz

Contains two files:

- `control`
- `md5sums`

#### control

Format described at: <https://www.debian.org/doc/debian-policy/ch-controlfields.html>

#### md5sums

MD5 checksum of every file in `data.tar.gz`. Sample content:

    6669174cc9955375474c29f29ede8e7b  usr/games/lolcat
    8e6f3157902e8b8bfb32b160d6d802ba  usr/lib/ruby/vendor_ruby/lolcat.rb
    28a748f7958dd85bfa7d7b8dd2ca0be0  usr/lib/ruby/vendor_ruby/lolcat/cat.rb
    59f025a01793edd3adf69e4c529d3b34  usr/lib/ruby/vendor_ruby/lolcat/lol.rb
    fafe70c21daca4540ba9d9c4e4c2f1d6  usr/lib/ruby/vendor_ruby/lolcat/version.rb
    e556537d53fb6c6b6aeb77e3cdf82232  usr/share/doc/lolcat/README.md
    9c3ab3b431f88c5ec364cdff103b573c  usr/share/doc/lolcat/changelog.Debian.gz
    1e50228bbbc5bd3c3e3dddabf88a0393  usr/share/doc/lolcat/copyright
    b985e90afb69a205982abd4916f782ff  usr/share/lintian/overrides/lolcat
    851b8cc9f1ebd14108fdcdea927211d6  usr/share/man/man6/lolcat.6.gz

## Source vs binary packages

There are two important types of package:

- source packages, which are used to generate binary packages
- binary packages, which is what end users want to run, with the compiled files

Every binary package is built from a single source package.

### Source packages

<https://www.debian.org/doc/debian-policy/ch-source.html>

Download source packages with:

    apt-get source <package>

#### rules

Each source package contains a `debian/rules` file which starts with `#!/usr/bin/make -f` and implements the mandatory targets:

- `clean`
- `binary`
- `binary-arch`
- `binary-indep`
- `build`
- `build-arch`
- `build-indep`

It is also common practice to split this file up and include parts from `rules.d` if it is too large.

### Where source packages come from

Someone took the source, and uploaded it to Debian servers :-)

But it is also common to supply the:

    get-orig-source

optional build target, which allows make the manual process smoother.

### Build essential

Build dependencies like GCC and Make necessary to build a hello world program.

Does not need to be listed as a build dependency under `Build-Depends` of source packages.

List under:

    cat /usr/share/doc/build-essential/list

As documented at <https://www.debian.org/doc/debian-policy/ch-source.html#s-pkg-relations>

## Bibliography

- Official specification: <https://www.debian.org/doc/debian-policy/index.html#contents>

- Debian tutorial: <https://www.debian.org/doc/manuals/debian-faq/ch-pkg_basics.en.html>
