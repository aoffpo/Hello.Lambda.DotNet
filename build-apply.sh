#!/usr/bin/env bash

./build-zip.sh || exit
cd iac || exit && terraform plan || exit
terraform apply