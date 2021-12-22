#/bin/bash

#########################################################################
#Purpose: Terraform code deployment with env backend                    #
#Author: Rehan Anwar                                                    #
#Date: 15/06/2021                                                       #
#                                                                       #
#########################################################################


# Backend Variables required for each deployment.

if [[ $# -eq 0 ]] ; then
    echo "Usage: $0 [test|prod|uat] [apply|destroy]"
    echo "e.g:"
    echo ./deploy.sh test apply     "Deploy test enviornment"
    echo ./deploy.sh test destroy   "Destroy test enviornment"
    exit 3
fi

# Dev installation
if [[ "$1" == "dev" && "$2" == "apply" ]]; then
        # rm -rf .terraform*
        # terraform init -backend-config=environments/${1}/backend.config .
        terraform apply -var-file environments/${1}/variables.tfvars -lock=false
            
elif [[ "$1" == "dev" && "$2" == "destroy" ]]; then
        # rm -rf .terraform*
        # terraform init -backend-config=environments/${1}/backend.config .
        terraform destroy -auto-approve -var-file environments/${1}/variables.tfvars -lock=false
    
# PROD installation
elif [[ "$1" == "prod" && "$2" == "apply" ]]; then
        rm -rf .terraform*
        terraform init -backend-config=environments/${1}/backend.config .
        terraform apply -auto-approve -var-file environments/${1}/variables.tfvars
            
elif [[ "$1" == "prod" && "$2" == "destroy" ]]; then
        rm -rf .terraform*
        terraform init -backend-config=environments/${1}/backend.config .
        terraform destroy -auto-approve -var-file environments/${1}/variables.tfvars
fi