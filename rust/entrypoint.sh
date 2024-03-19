#!/bin/bash

export PASSWORD=$(pwgen -s 12 1)

code-server --bind-addr 0.0.0.0:8080 /workspace