# Homebrew Tap Repository for Hazelcast Platform

## About

This repository contains the Homebrew formulas for `hazelcast`, `hazelcast-enterprise` and  `hzcloud` packages.

- `hazelcast` and `hazelcast-enterprise` packages contain the server distribution of [Hazelcast Platform](https://hazelcast.com/products/hazelcast-platform/).
- `hzcloud` package contains `hzcloud` command line tool for managing Hazelcast Cloud clusters.

## How to Install Hazelcast

### Add Tap Repository

    brew tap hazelcast/hz

### Install Package

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

Starting from version 5.1, configuration files are preserved between upgrades and stored in

    $(brew --prefix)/etc/hazelcast

(usually `/usr/local/etc/hazelcast` or `/opt/homebrew/etc/hazelcast`)

### Starting Instance

Start the Hazelcast instance with `hz` command

    hz start

### Clean Up

    brew uninstall hazelcast
    brew untap hazelcast/hz
    brew cleanup -s
    rm -rf $(brew --prefix)/etc/hazelcast

## How to Install Hazelcast Cloud CLI

### Add Tap Repository

    brew tap hazelcast/hz

### Install Package

    brew install hzcloud

### Clean Up

    brew uninstall hzcloud
    brew untap hazelcast/hz
    brew cleanup -s

## More Information

- [Hazelcast Packaging](https://github.com/hazelcast/hazelcast-packaging)
- [Hazelcast Cloud Command Line](https://github.com/hazelcast/hazelcast-cloud-cli)
