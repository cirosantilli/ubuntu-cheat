# Metapackages

Metapackages are packages that contain no source code of their own, but have several dependencies

They serve as a collection of software that is useful when installed together.

Examples: `texlive-full` (*lots* of latex packages), several desktop environments, etc.

It seems that `dpkg` without additional info has no way to tell the difference between packages installed as dependencies of a metadata and packages explicitly installed: it is as if you had written if all by yourself on the command line.

It seems that aptitude can store this information, and uninstall metapackages in one go: *major* reason for using aptitude!

There seems to be no way of telling
