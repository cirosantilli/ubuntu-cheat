# dpkg-deb

Unpack a `.deb` and the contained `data.tar.gz` and `control.tar.gz` archives into a new directory named `tmp`:

    dpkg-deb -R *.deb tmp

This unpacks:

- `data.tar.gz` to the top level
- `control.tar.gz` to a `DEBIAN` directory

This is the best input format for repositories that generate Debian packages, as `-R` can be inversed with `-b`:

    dpkg-deb -b tmp updated.deb
