#!/bin/bash

SPEED=.02
LINE_BREAK=1
function printDigitalMessage() {
    MESSAGE=$1
    for (( i=0; i<${#MESSAGE}; i++ )); do
        echo -n "${MESSAGE:$i:1}"
        sleep $SPEED
    done
    sleep $LINE_BREAK
    echo ""
}
function welcomeMessage() {
    printDigitalMessage "Welcome to the demo of bpctl"
    printDigitalMessage "I'll demonstramte a microservices based appication"
}

function pause() {
    printDigitalMessage "Satisfied!!!!"
    printDigitalMessage "Press a key to continue........"
    read pause
    clear
    printDigitalMessage "[[[[         BuildPiper|bpctl Demo         ]]]]"
}

function demoEnvironments() {
    printDigitalMessage "Great let's start"
    printDigitalMessage "As you know without environments we have no place where microservices can be deployed"
    printDigitalMessage "So let's onboard 2 environments first dev & qa"
    bpctl apply -f environments/dev.bp.yaml
    bpctl apply -f environments/qa.bp.yaml
    printDigitalMessage "Want to view the environments"
    printDigitalMessage "http://demo.buildpiper.in:56080/application/10/env/list"
    pause
}

function demoJobTemplates() {
    printDigitalMessage "One last thing to do before MS onboarding"
    printDigitalMessage "Job Templates!!!!"
    printDigitalMessage "Job templates are the way you can bring governance & standardization in your org"
    printDigitalMessage "Some of the examples"
    printDigitalMessage "We will onboard 2 job templates in this demo"
    printDigitalMessage "Extensive DevSecOps CI, having checks as Licence analysis, Cred scanning in code, Image scanning..."
    printDigitalMessage "Basic CI with only buidling docker image and publishing it"
    bpctl apply -f job-templates/demo-ms.bp.yaml
    bpctl apply -f job-templates/extensive-ci.bp.yaml
    printDigitalMessage "Want to view the job templates"
    printDigitalMessage "http://demo.buildpiper.in:56080/application/10/job-templates"
    pause
}

function demoMSOnBoarding() {
    printDigitalMessage "So the wait is over"
    printDigitalMessage "Let's start with MS onboarding!!!!"
    printDigitalMessage "We will onboard 2 microservices"
    printDigitalMessage "emp-ui & emp-salary"
    printDigitalMessage "A MS onboarding is 3 step process"
    printDigitalMessage "MS Meta info definition"
    printDigitalMessage "MS environment meta info definition"
    printDigitalMessage "MS CI configurations"
    printDigitalMessage "MS CD configuratinos"
    printDigitalMessage "Enough of talks let's start with emp-ui MS"
    printDigitalMessage "emp-ui MS meta info..."
    bpctl apply -f services/emp-ui/emp-ui-service-def.bp.yaml
    printDigitalMessage "emp-ui dev env meta info..."
    bpctl apply -f services/emp-ui/env/dev/emp-ui-dev.bp.yaml 
    printDigitalMessage "emp-ui dev env CI configurations..."
    bpctl apply -f services/emp-ui/env/dev/ci/emp-ui-ci.bp.yaml
    printDigitalMessage "emp-ui dev env CD configurations..."
    bpctl apply -f services/emp-ui/env/dev/cd/emp-ui-dev.bp.yaml
    printDigitalMessage "emp-ui qa env meta info..."
    bpctl apply -f services/emp-ui/env/qa/emp-ui-qa.bp.yaml
    printDigitalMessage "emp-ui qa env CI configurations..."
    bpctl apply -f services/emp-ui/env/qa/ci/emp-ui-ci.bp.yaml
    printDigitalMessage "emp-ui qa env CD configurations..."
    bpctl apply -f services/emp-ui/env/qa/cd/emp-ui-qa.bp.yaml

    printDigitalMessage "Great so emp-ui is onboarding with 2 env dev & qa"
    printDigitalMessage "Let's move to emp-salary MS"
    printDigitalMessage "emp-salary MS meta info..."
    bpctl apply -f services/emp-salary/emp-salary-service-def.bp.yaml
    printDigitalMessage "emp-salary dev env meta info..."
    bpctl apply -f services/emp-salary/env/dev/emp-salary-dev.bp.yaml 
    printDigitalMessage "emp-salary qa env meta info..."
    bpctl apply -f services/emp-salary/env/qa/emp-salary-qa.bp.yaml

    printDigitalMessage "Want to view the onboarded MS"
    printDigitalMessage "http://demo.buildpiper.in:56080/application/10/service/listing"
    pause
}

function codeStructure() {
    printDigitalMessage "Now you would be wondering how all this managed?"
    printDigitalMessage "How the code tructure looks like"
    tree
    pause
}

pause
welcomeMessage
demoEnvironments
demoJobTemplates
demoMSOnBoarding
codeStructure