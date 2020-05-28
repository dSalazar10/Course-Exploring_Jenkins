#!/bin/bash
function GetStackName {
    stackname="JenkinsServer"
}
function GetTemplateName {
    tempfile="jenkins.yml"
}
function GetParameterName {
    paramfile="jenkins-parameters.json"
}
function PromptUser {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| Main Menu |"
    echo "~~~~~~~~~~~~~"
    echo ""
    echo "Select from the following options:"
    echo "1) Create Stack"
    echo "2) Update Stack"
    echo "3) Delete Stack"
    echo "4) Describe Stacks"
    echo "5) Validate Template"
    echo "6) Get Template"
    echo "7) Exit"
    echo "~:"
}
function CreateStack {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| CreateStk |"
    echo "~~~~~~~~~~~~~"
    echo ""
    aws cloudformation create-stack --stack-name $stackname --template-body file://$tempfile --parameters file://$paramfile --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region us-west-2
    echo "Stack Creation Completed."
    sleep 1
}
function UpdateStack {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| UpdateStk |"
    echo "~~~~~~~~~~~~~"
    echo ""
    aws cloudformation update-stack --stack-name $stackname --template-body file://$tempfile --parameters file://$paramfile --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region us-west-2
    echo "Stack Update Completed."
    sleep 1
}
function DeleteStack {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| DeleteStk |"
    echo "~~~~~~~~~~~~~"
    echo ""
    aws cloudformation delete-stack --stack-name $stackname
    echo "Stack Delete Completed."
    sleep 1
}
function ValidateTemplate {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| ValTempl  |"
    echo "~~~~~~~~~~~~~"
    echo ""
    aws cloudformation validate-template --template-body file://$tempfile
    sleep 1
}
function DescribeStack {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| DescStack |"
    echo "~~~~~~~~~~~~~"
    echo ""
    aws cloudformation describe-stacks --stack-name $stackname
    sleep 1
}
function GetTemplate {
    printf "\033c"
    echo "~~~~~~~~~~~~~"
    echo "| GetTempl  |"
    echo "~~~~~~~~~~~~~"
    echo ""
    aws cloudformation get-template --stack-name $stackname
    sleep 1
}
function CloudFormationModifications {
    GetStackName
    GetTemplateName
    GetParameterName
    choice = 0 
    PromptUser
    while read choice
    do
        case $choice in
            1)
                CreateStack
                ;;
            2)
                UpdateStack
                ;;
            3)
                DeleteStack
                ;;
            4)
                DescribeStack
                ;;
            5)
                ValidateTemplate
                ;;
            6)
                GetTemplate
                ;;
            7) 
                echo "Exiting program!"
                break
                ;;
        esac
        PromptUser
    done
}
CloudFormationModifications