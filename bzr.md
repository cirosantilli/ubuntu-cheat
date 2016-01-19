# bzr

Version control system comparable to Git.

This section supposes that you know Git.

## Create and upload a repo 101

Create a launchpad account.

    bzr whoami "Your Name <name@example.com>"
    bzr init
    bzr add
    bzr commit -m 0
    bzr push lp:~$LAUCHPAD_LOGIN/$PROJECT_NAME/$BRANCH_NAME

Now visit <https://code.launchpad.net/~cirosantilli/> and that should be listed there.

You can also visit <https://code.launchpad.net/~cirosantilli/$PROJECT_NAME> to see all branches of a project.

##  Why it exists?

Because Canonical is stuck to its dying solution and is not making an effort to move out.

Initial release of `bzr` was around at the same time as Git.

Today Git is infinitely more used, and Canonical is probably by far the major `bzr` user.

`bzr` even has Launchpad specific commands built-in.

Perhaps this was not clear in the past, but today I am not the only one to wonder: how can they not transition to git?

- <http://lwn.net/Articles/578936/>
- <http://askubuntu.com/questions/32084/why-does-ubuntu-use-launchpad-instead-of-github-or-bitbucket>

At least basic commands look exactly like Git.

## clone

## branch

Latest version:

    bzr branch lp:ubuntu/hello

This includes the next unreleased version. E.g., in 2015-08, it was already the unreleased Ubuntu 15.10.

Specific Ubuntu version:

    bzr branch lp:ubuntu/trusty/hello

If you do `bzr log` in those, you will see every Ubuntu release of the package ever made. Great stuff.

The general URL form of personal launchpad repos is:

    bzr branch lp:~$LAUCHPAD_LOGIN/$PROJECT_NAME/$BRANCH_NAME

### + sign in project names

Launchpad proposes the project name `+junk` by default. Does the `+` sign have any meaning?

### proposed

Ubuntu naming convention for unstable versions:

    bzr branch lp:ubuntu/trusty/hello

When development stops, those branches are completely removed.

## Web code browsing

See also: <http://askubuntu.com/questions/167468/where-can-i-find-the-source-code-of-ubuntu>

List all branches (analogous to Git repositories?): <https://code.launchpad.net/ubuntu/+source/hello>

Possibilities:

-   <http://bazaar.launchpad.net/~ubuntu-branches/ubuntu/trusty/hello/trusty/files> corresponds to `bzr branch lp:ubuntu/trusty/hello`

-   <http://bazaar.launchpad.net/~ubuntu-branches/ubuntu/wily/hello/wily/files> corresponds to the latest `bzr branch lp:ubuntu/hello` as of 2015-08, but that will change in the future.

    There seems to be no "latest" URL corresponding to the `bzr` command.

## help

    bzr help
    bzr help init

## Setup

TODO where is this information stored?

### whoami

Required to commit:

    bzr whoami "Your Name <name@example.com>"

View current `whoami`:

    bzr whoami

### launchpad-login

Required to push to launchpad:

    bzr launchpad-login LAUNCHPAD_LOGIN

View current login:

    bzr launchpad-login

## init

    bzr init

Creates a `.bzr` directory.

## ignore

Adds lines to `.bzrignore`:

    bzr ignore "*.out" "*.exe"

## add

    bzr add README.md

## status

    bzr status

Sample output:

    added:
      README.md

## commit

    bzr commit

## push

    bzr push lp:~$LAUNCHPAD_LOGIN/$PROJECT_NAME/$BRANCH_NAME

### lp:

`lp:` is a magic protocol implemented as a `bzr` extension that automatically deals well with Launchpad.
