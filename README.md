# Homebrew Tap Repository for Hazelcast Command Line

`hz` is a tool which allows users to install & run [Hazelcast IMDG](https://hazelcast.org/imdg/) and [Management Center](https://hazelcast.org/imdg/download/#hazelcast-imdg-management-center) on local environment.

`hzcloud` is a command line tool to make actions on Hazelcast Cloud easily

## About

This repository contains the Homebrew formula for `hz` and  `hzcloud`.

See [Hazelcast Command Line](https://github.com/hazelcast/hazelcast-command-line/) for the source code.

See [Hazelcast Cloud Command Line](https://github.com/hazelcast/hazelcast-cloud-cli) for the source code

## How to install

### Tap repository

    $ brew tap hazelcast/hz

### Install Hazelcast

Install the community version of Hazelcast

    $ brew install hazelcast 

Install particular version of Hazelcast

    $ brew install hazelcast@5.0.1

Install snapshot version of Hazelcast

    $ brew install hazelcast@5.1.snapshot

Install Hazelcast Enterprise edition (you need a license key to run it)

    $ brew install hazelcast-enterprise

Install without Java dependency (you already have installed Java in 
another way)

    $ brew install hazelcast --without-openjdk

### Install Hazelcast CLoud CLI

    $ brew install hzcloud 

### To clean up everything (may come in handy):

    $ brew uninstall hazelcast
    $ brew uninstall hzcloud
    $ brew untap hazelcast/hz
    $ brew cleanup -s
