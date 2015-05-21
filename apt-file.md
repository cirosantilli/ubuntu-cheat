# apt-file

Search files in packages that are not installed.

For installed packages, `dpkg` is usually the tool of choice.

**very** useful to know: which package provides a missing file like a `bin/name` or `include/name.h`?

    sudo aptitude install apt-file
    apt-file update
    f=

## search

Search for file `"$F"` in packages.

    apt-file search "$f"

Literal full path substring match

Use Perl regex:

    apt-file search -x "a.c"

Combo: search for an executable called `a2x`:

    apt-file search bin/a2x

## list

## show

Shows files in package `p`:

    apt-file list "hello"

For installed package, use `dpkg -L`.
