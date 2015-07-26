# Package versions

For stability and QA, there is only a fixed version of each software per Ubuntu version, except for occasional:

- updates
- security
- backports

updates. Those updates normally only touch critical components, and even after an update it is still possible that a more recent version of Ubuntu will have a more recent version of the software.

Therefore, the most flexible way of getting updated version of software are PPAs.

## Security

Hot-fixes that must be updated quickly.

## Updates

Simply updates, not yet in another version.

Enabled by default.

## Proposed

Proposed for updates, but not yet tested.

Disabled by default.

## Backports

Updates that come from a new release and were enabled to older systems.

Enabled by default.

## Version naming

<http://serverfault.com/questions/604541/debian-packages-version-convention/708569#708569>

Do a `dpkg -l` and understand every version name.

Format:

    <name>_<version>-<ubuntu-version>_<architecture>

Samples:

    hello_2.8-4_amd64
    ^^^^^ ^^^ ^ ^^^^^
    1     2   3 4

    gdb-dbg_7.9-1ubuntu1_amd64.deb
    ^^^^^^^ ^^^ ^^^^^^^^ ^^^^^
    1       2   3        4

Those version strings are used everywhere to uniquely identify packages, e.g.:

- on the deb server <http://archive.ubuntu.com/ubuntu/pool/main/v/vim/>
- `dpkg -l`
- `apt-get show`

Meaning of each field:

1.  unique package name

2.  version

3.  Debian and Ubuntu versions, incremented by Debian and Ubuntu patches.

    <http://askubuntu.com/questions/620533/how-does-ubuntu-name-packages>

4.  architecture. Common values:

    - `all`
    - `i386`
    - `amd64`

This package has a `ubuntu1` part of the version: <http://askubuntu.com/questions/620533/how-does-ubuntu-name-packages
