# Launchpad

<https://help.launchpad.net/>

## Help

<https://help.launchpad.net/>

## Projects

`https://launchpad.net/<project-name>`

E.g.: <https://launchpad.net/cirosantilli-test>

Project URL. `<project-name>` does not start with `~`, otherwise it is a username.

Projects can be registered from: <https://launchpad.net/projects/+new>

## Users

`https://launchpad.net/~<user-name>`

E.g.: <https://launchpad.net/~cirosantilli>

Your projects: <https://launchpad.net/~cirosantilli/+related-projects>

### Personal branches

`https://code.launchpad.net/~<user-name>/<project-name>/<branch-name>`

E.g.:

- <https://code.launchpad.net/~cirosantilli/+junk/branch>
- <https://code.launchpad.net/~cirosantilli/cirosantilli-test/feature0>

Branches for given project. `+junk` is a magic name which does not correspond to any project.

When you do `bzr push lp:~cirosantilli/cirosantilli-test/feature0`, it appears as a branch under <https://code.launchpad.net/cirosantilli-test>

It shows up even if you don't have push access to the repository. So don't do this on non-test repositories.

If you a personal branch that corresponds to a project, e.g., <https://code.launchpad.net/~cirosantilli/cirosantilli-test/feature0>, you can then create a pull request.

## vcs-imports

Magical user for... VCS imports!

<https://code.launchpad.net/~vcs-imports>

## git

As of 2015, Launchpad is finally starting to offer Git support...

<http://askubuntu.com/questions/13613/git-on-launchpad>

But I cannot use it because of: <http://superuser.com/questions/954490/launchpad-says-i-dont-have-an-ssh-key-but-i-do>

## Trunk

A branch chosen to be the main development place. Analogous to GitHub's default branch.

<https://launchpad.net/cirosantilli-test/trunk>

You set it on the web interface to any branch on the given project, e.g. <https://code.launchpad.net/~cirosantilli/cirosantilli-test/feature0>

## +source

TODO
