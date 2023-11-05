#!/bin/bash

# This script will install all of the dependencies needed for my neovim config

sudo apt install fd-find cargo

# Install cargo dependencies
cargo install --locked ripgrep_all
