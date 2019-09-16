# Shell Secrets Manager

## Prerequisites

* gpg - Encryption and Signing tool
* awk - Pattern-Directed scanning and processing language
* make - GNU make utility

## Background

I needed a secure and revisionable method of backing up my various secret and configuration files.

## Setup

Whilst the following is not, 100% necessary, it is advisable.

**TL;SR** Files that need backing up should be in the `secrets/` directory and suffixed with `.secret`.

In `scripts/harvest_files.sh` place `cp` commands that will copy your files into the directory. For example:
``` shell
cp ~/.aws/config secrets/aws_config.secret
```

**Important** Whilst filenames don't have to remain the same, they must be suffixed with `.secret` otherwise they won't be encrypted and will not be ignored by git.


Ensure you add the reverse `cp` commands to `scripts/restore_files.sh`.
``` shell
cp secrets/aws_config.secret ~/.aws/config
```

## Commands

At present, you can access the commands using the provided Makefile.

* `make harvest` gathers your indicated files to the secrets folder
* `make lock` encrypts any `.secret` files that are in the `secrets/` directory
* `make lock-file` encrypts the file indicated by the required file parameter
``` shell

make lock-file file=secrets/my.secret
```
* `make unlock` decrypts all `.gpg` files in `secrets/` directory
* `make unlock-file` decrypts the file indicated by the required file parameter
``` shell

make unlock-file file=secrets/my.secret.gpg
```
* `make restore` restores all `.secret` files in the `secrets/` directory back to their original locations.
