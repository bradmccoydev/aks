cd src

TF_PLAN_JSON=${GITHUB_JOB}-$CLIENT_ENVIRONMENT.json
terraform show -json ${GITHUB_JOB}-$CLIENT_ENVIRONMENT.tfplan > $TF_PLAN_JSON

echo "Searching for Terraform plan"
ls $TF_PLAN_JSON
echo "Terraform plan name: $TF_PLAN_JSON"

echo "---"
echo "Retrieving terraform-plan-validator"

curl -sfLo app.env "https://github.com/bradmccoydev/terraform-plan-validator/releases/download/v1.0.0/app.env"
curl -sfLo opa-azure-policy.rego "https://github.com/bradmccoydev/terraform-plan-validator/releases/download/v1.0.0/opa-azure-policy.rego"
curl -sfLo terraform-plan-validator-amd64 "https://github.com/bradmccoydev/terraform-plan-validator/releases/download/v1.0.0/terraform-plan-validator-amd64"
chmod a+x ./terraform-plan-validator-amd64

echo "---"
echo "Running validation check"

VALIDATION_PASSED=$(./terraform-plan-validator-amd64 check "$TF_PLAN_JSON" "azure")
echo "Validation passed: $VALIDATION_PASSED"

if [ $VALIDATION_PASSED = true ]; then
    echo "##vso[task.setvariable variable=AUTO_APPROVE;isOutput=true]true"
    echo "##vso[task.logissue type=warning]Plan passed validation step, it is safe for the pipeline to proceed automatically."
else
    echo "##vso[task.setvariable variable=AUTO_APPROVE;isOutput=true]false"
    echo "##vso[task.logissue type=warning]Plan did not pass validation step. Pipeline will require a manual approval to proceed."
fi

echo "---"
echo "Removing Terraform plan"
rm $TF_PLAN_JSON
echo "Plan removed"
