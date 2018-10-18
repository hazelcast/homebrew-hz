# A Homebrew repository

`hazelcast-member` is a command line tool that is able to run one or more [Hazelcast IMDG](https://hazelcast.org) member
instance(s) on the local machine.

## About

This repository contains the Homebrew formula for `hazelcast-member`.

See https://github.com/hazelcast/hazelcast-member-tool for the source code.

## How to install

    $ brew tap hazelcast/homebrew-hazelcast
    $ brew install hazelcast-member

### Tab completion support

To enable tab completion on Bash add the following command to your profile:

    if which hazelcast-member > /dev/null; then eval "$(hazelcast-member init -)"; fi

### To clean up everything (may come in handy):

    $ brew uninstall hazelcast-member
    $ brew untap hazelcast/homebrew-hazelcast
    $ brew cleanup -s
