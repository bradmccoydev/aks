#!/usr/bin/env bash
set -euo pipefail

cd src

TF_PLAN="${BUILD_BUILDNUMBER}-$CLIENT_ENVIRONMENT.tfplan"

echo "Searching for Terraform plan"
ls $TF_PLAN
echo "Terraform plan name: $TF_PLAN"

# terraform apply $TF_PLAN 