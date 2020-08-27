# Homebrew Repository for Hazelcast Command Line

`hz` is a tool which allows users to install & run [Hazelcast IMDG](https://hazelcast.org/imdg/) and [Management Center](https://hazelcast.org/imdg/download/#hazelcast-imdg-management-center) on local environment.

## About

This repository contains the Homebrew formula for `hz`.

See [Hazelcast Command Line](https://github.com/hazelcast/hazelcast-command-line/) for the source code.

## How to install

    $ brew tap hazelcast/homebrew-tap
    $ brew install hazelcast

### To clean up everything (may come in handy):

    $ brew uninstall hazelcast
    $ brew untap hazelcast/homebrew-tap
    $ brew cleanup -s
