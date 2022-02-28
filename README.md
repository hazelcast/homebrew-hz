# Homebrew Tap Repository for Hazelcast Platform

`hz` is a tool which allows users to install & run [Hazelcast IMDG](https://hazelcast.org/imdg/) on a local environment.

`hzcloud` is a command line tool to make actions on Hazelcast Cloud easily.

## About

This repository contains the Homebrew formulas for `hazelcast`, `hazelcast-enterprise` and  `hzcloud`.

See [Hazelcast Packaging](https://github.com/hazelcast/hazelcast-packaging) for the source code.

See [Hazelcast Cloud Command Line](https://github.com/hazelcast/hazelcast-cloud-cli) for the source code

## How to install

### Add Tap Repository

    brew tap hazelcast/hz

### Install Hazelcast

Install the community version of Hazelcast

    brew install hazelcast 

Upgrade the community version of Hazelcast

    brew upgrade hazelcast 

Install particular minor version of Hazelcast

    brew install hazelcast-5.1

Install particular version of Hazelcast

    brew install hazelcast@5.0.1

NOTE: To upgrade to a particular version, uninstall the old package first 
and then install `hazelcast` for the latest version or `hazelcast-x.y` for another version.

Install snapshot version of Hazelcast

    brew install hazelcast@5.1.snapshot

Install Hazelcast Enterprise edition (you need a license key to run it,
see [Installing a License Key](https://docs.hazelcast.com/hazelcast/latest/getting-started/get-started-enterprise#installing-a-license-key)

    brew install hazelcast-enterprise

Install without Java dependency (you already have installed Java in 
another way)

    brew install hazelcast --without-openjdk

### Configuration

Starting from the 5.1 version configuration files are preserved between upgrades and stored in

    $(brew --prefix)/etc/hazelcast

(usually `/usr/local/etc/hazelcast` or `/opt/homebrew/etc/hazelcast`)

### Install Hazelcast CLoud CLI

    brew install hzcloud

### Clean Up

    brew uninstall hazelcast
    brew uninstall hzcloud
    brew untap hazelcast/hz
    brew cleanup -s
    rm -rf $(brew --prefix)/etc/hazelcast
