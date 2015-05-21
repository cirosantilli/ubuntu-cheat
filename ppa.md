# PPA

PPAs are sources of software.

To add a new source you must do two things:

- add the PPA key to the trusted PPA list
- add the PPA to the PPA list

## Find PPAs

Launchpad <https://launchpad.net> is the main source for PPAs and the site is maintained by Ubuntu. Look there first.

Next Google it.

## List PPAs

Default sources:

    cat /etc/apt/sources.list

PPAs:

    ls -1 /etc/apt/sources.list.d/

## Keys

In order to trust a PPA, you have to add its key.

This is called a *digital signature*.

It is meant to ensure that:

- you received the data from who you think you did
- the data was not modified in its way to you

Keys are managed by GPG, and kept in:

	gpg /etc/apt/trustdb.gpg

So if you want to really understand things, you must first understand gpg

List keys easily:

    apt-key list

add keys:

    sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

`wget`:

    wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

## add-apt-repository

Add key to PPAs in Launchpad.

`python-software-properties` package.

Launchpad is maintained by Canonical, and it is easy to Install/remove packages from them with `add-apt-repository`.

    sudo add-apt-repository ppa:deluge-team/ppa
    sudo aptitude update

    - `deluge-team` is an username
    - ppa is an specific ppa from that username

`-y`: don't ask for confirmation:

    sudo add-apt-repository -y ppa:user/repo

Remove sources:

You could remove them manually, but there it is better to do that with `ppa-purge`:

    sudo aptitude install ppa-purge
    sudo ppa-purge ppa:matthaeus123/mrw-gimp-svn

Not sure what is the weight of:

    sudo add-apt-repository --remote

## PPAs outside launchpad

The best I could find for now to add was the GetDeb way:

    wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
    sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu quantal-getdeb games" >> /etc/apt/sources.list.d/getdeb.list'

And to remove:

    sudo rm /etc/apt/sources.list.d/getdeb.list
    apt-key list | less
    Pub   4096R/46D7E7CF 2009-05-15
    ^^^^^^^^
    KEY
    KEY=
    sudo apt-key del "$KEY"

Keep a list of all PPAs added like this somewhere.

If you want to uninstall, you will remember the filename to remove.
