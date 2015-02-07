# command-not-found

On Ubuntu 14.04, it is the `/usr/lib/command-not-found` python package that setups the smart messages when a command is not found, like:

    $ foo
    No command 'foo' found, did you mean:
      Command 'fio' from package 'fio' (universe)
      Command 'goo' from package 'goo' (universe)
      Command 'fop' from package 'fop' (main)
      Command 'fox' from package 'objcryst-fox' (universe)
      Command 'xoo' from package 'xoo' (universe)
      Command 'zoo' from package 'zoo' (universe)
    foo: command not found

And:

    $ gnuchess
    The program 'gnuchess' is currently not installed.  You can install it by typing:
    sudo apt-get install gnuchess

The file is provided by the [command-not-found](https://launchpad.net/ubuntu/+source/command-not-found) package.

This works by setting up `command-not-found` at `/etc/bash.bashrc`.
