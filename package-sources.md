# Package sources

Every package comes from a source.

The following are the major types of sources:

- Main
- Restricted
- Universe
- Multiverse
- Partner
- PPAs

The difference between Main, Universe, Restricted and Multiverse can be visualized as:

|             | Free software | Non-free software |
|-------------|---------------|-------------------|
| Supported   | Main          | Restricted        |
| Unsupported | Universe      | Multiverse        |

The list of all above packages can be found at: <http://packages.ubuntu.com/>. Searchable from: <http://packages.ubuntu.com/name>

In addition, there are also the `partner` sources.

On new installs, Main and Restricted sources are enabled by default.

By default, only Main sources are enabled. Enable everything with:

    sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
    sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"

## Universe

PPAs vs Universe: universe passes some selection form Canonical, PPAs don't.

## Pre-installed

List of pre-installed packages perversion: <http://askubuntu.com/questions/50077/how-to-get-a-list-of-preinstalled-packages>

12.04.4 at <http://releases.ubuntu.com/precise/ubuntu-12.04.4-desktop-i386.manifest>. Remember that `i386` is the 32 bit and `amd64` the 64 bit architectures, both used by both Intel and AMD processors.

For other versions see the parent URL.

## Main

Officially supported software. Full list for 12.04 + their recommendations + the files they provide: <http://packages.ubuntu.com/precise/allpackages>. Not possible to see the file contents.

Not all of those packages come pre-installed, they can be installed directly with `apt-get` since their source is already enabled by default.

## Partner

Support is not given by Canonical, but by the company who produces the software.

Notable examples: Flash, Skype.

<http://askubuntu.com/questions/456345/what-is-the-difference-between-multiverse-and-partner-sources>

Enable:

    sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
