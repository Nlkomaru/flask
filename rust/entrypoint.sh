#!/bin/bash

rustup -V
cargo -V

cat /root/.config/code-server/config.yaml
code-server --bind-addr 0.0.0.0:8080