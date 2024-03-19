#!/bin/bash

rustup -V
cargo -V

echo "http://localhost:8080"
PASSWORD=$(pwgen -s 12 1)
echo $PASSWORD
export PASSWORD=$PASSWORD

code-server --bind-addr 0.0.0.0:8080 /workspace