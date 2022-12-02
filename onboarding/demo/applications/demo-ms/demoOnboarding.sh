#!/bin/bash

function printDigitalMessage() {
    MESSAGE=$1
    for (( i=0; i<${#MESSAGE}; i++ )); do
        echo -n "${MESSAGE:$i:1}"
        sleep .04
    done
    sleep .5
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

welcomeMessage
demoEnvironments
demoJobTemplates