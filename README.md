# A Homebrew repository for Hazelcast Command Line Tool

`hazelcast` is a command line tool that is able to run one or more [Hazelcast IMDG](https://hazelcast.org) member
instance(s) on the local machine.

## About

This repository contains the Homebrew formula for `hazelcast`.

See [Hazelcast Command Line Tool](https://github.com/hazelcast/hazelcast-command-line/) for the source code.

## How to install

    $ brew tap hazelcast/homebrew-hazelcast
    $ brew install hazelcast

### To clean up everything (may come in handy):

    $ brew uninstall hazelcast
    $ brew untap hazelcast/homebrew-hazelcast
    $ brew cleanup -s
