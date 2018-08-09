title: Introduction To Nix (Part II)
subtitle: August 2018
author: Michael Fellinger
description: Nix is a powerful package manager for Linux and other Unix systems that makes package management reliable and reproducible.
theme: black


## In this Talk

We will explore Nix


## What you will learn

* Using `nix repl`
* Doing our first `nix build`
* Managing environments using `nix-env`
* Developing in `nix-shell`


## Getting started

For our first session, we'll simply run Nix in a Docker container, so we don't
spend too much time on setup due to our different system configurations.

    docker volume create nix_store
    docker run -v nix_store:/nix/store --rm -it lnl7/nix

More information about this image are at https://github.com/LnL7/nix-docker

## Starting the Nix REPL

This makes sure you'll have access to all packages in the `nixpkgs` repository.

    nix repl '<nixpkgs>'


## Getting some help

    bash-4.4# nix repl '<nixpkgs>'
    Welcome to Nix version 2.0.4. Type :? for help.

    Loading '<nixpkgs>'...
    Added 9189 variables.

    nix-repl> :?
    The following commands are available:

      <expr>        Evaluate and print expression
      <x> = <expr>  Bind expression to variable
      :a <expr>     Add attributes from resulting set to scope
      :b <expr>     Build derivation
      :i <expr>     Build derivation, then install result into current profile
      :l <path>     Load Nix expression and add it to scope
      :p <expr>     Evaluate and print expression recursively
      :q            Exit nix-repl
      :r            Reload all files
      :s <expr>     Build dependencies of derivation, then start nix-shell
      :t <expr>     Describe result of evaluation
      :u <expr>     Build derivation, then start nix-shell


## What does this mean?

Let me guide you through each command with an example


## Evaluate and print expression

    nix-repl> 1
    1

    nix-repl> "Hello, World!"
    "Hello, World!"

    nix-repl> ["lists"]
    [ "lists" ]

    nix-repl> { this = "set"; }
    { this = "set"; }


## Bind expression to variable

    nix-repl> a = 1

    nix-repl> b = 2

    nix-repl> a + b
    3


## Add attributes from resulting set to scope

    nix-repl> :a builtins
    Added 95 variables.

    nix-repl> attrNames { this = "set"; }
    [ "this" ]

    nix-repl> length [1]
    1

## Build derivation

    nix-repl> :b hello
    these paths will be fetched (0.04 MiB download, 0.19 MiB unpacked):
      /nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10
    copying path '/nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10' from 'https://cache.nixos.org'...
    warning: you did not specify '--add-root'; the result might be removed by the garbage collector
    /nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10

    this derivation produced the following outputs:
      out -> /nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10



    bash-4.4# /nix/store/aq3by*-hello-2.10/bin/hello 
    Hello, world!


## Install result into current profile

    nix-repl> :i hello
    installing 'hello-2.10.drv'
    these paths will be fetched (0.04 MiB download, 0.19 MiB unpacked):
      /nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10
    copying path '/nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10' from 'https://cache.nixos.org'...
    building '/nix/store/ar8sjvpp0i0v8m2fn77fmw0kj1808w51-user-environment.drv'...
    created 2 symlinks in user environment

    nix-repl> 
    bash-4.4# hello
    Hello, world!


## Load Nix expression and add it to scope

In a fresh `nix repl`:

    bash-4.4# nix repl            
    Welcome to Nix version 2.0.4. Type :? for help.

    nix-repl> :l <nixpkgs>
    Added 9189 variables.

    nix-repl> hello
    «derivation /nix/store/m5chcjbj7p08sy8adqpkr2rzf6rmdfh6-hello-2.10.drv»


## Evaluate and print expression recursively

    nix-repl> x = { a = { b = 2; }; }

    nix-repl> x
    { a = { ... }; }

    nix-repl> :p x
    { a = { b = 2; }; }


## Build derivation, then start nix-shell

    nix-repl> :u hello

    [nix-shell:/]# type -f hello
    hello is hashed (/nix/store/aq3byv8z9ax5zqbqi5b73q06yq8gfl99-hello-2.10/bin/hello)

    [nix-shell:/]# type -f gcc
    bash: type: gcc: not found
    
In this shell we have access to `gcc`, `glibc`, and `binutils`


## Build dependencies of derivation, then start nix-shell

    nix-repl> :s hello

    [nix-shell:/]# type -f hello
    bash: type: hello: not found

    [nix-shell:/]# type -f gcc
    gcc is /nix/store/38picpf5cl6d7lj38h8191vmxlxjbgq3-gcc-wrapper-7.3.0/bin/gcc

In this shell we have access to the built `hello`, but not its dependencies anymore.

## Describe result of evaluation

    nix-repl> :t hello.outPath
    a string with context


## On to nix-shell

Let's run a command only once without installing it

    nix-shell -p nix-info --run 'nix-info -m'
    ....
     - system: `"x86_64-linux"`
     - host os: `Linux 4.14.55`
     - multi-user?: `yes`
     - sandbox: `no`
     - version: `nix-env (Nix) 2.0.4`
     - nixpkgs: `/nix/store/1a7blwzdwsafkw1x5fql61ddbv1v3r25-nixpkgs-unstable-2018-07-17`


## Development environment

    cd /root
    mkdir first
    cd first
    vim shell.nix


## Our first shell.nix

    with import <nixpkgs> {};
    mkShell {
      buildInputs = [ tcl ];
    }


## Now invoke the file

`nix-shell` will automatically look for a `shell.nix` or `default.nix` in the
current directory and put you at the first of its "phases".

    bash-4.4# nix-shell 

    [nix-shell:~/first]# echo $phases
    nobuildPhase

    [nix-shell:~/first]# which tclsh
    /nix/store/z6jc7mvhiziwy4mf86lsm0wlq1aaqdzz-tcl-8.6.6/bin/tclsh
    
    [nix-shell:~/first]# tclsh
    % puts "Hello, World!"
    Hello, World!


