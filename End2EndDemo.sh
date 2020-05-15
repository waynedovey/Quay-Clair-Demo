#!/bin/bash

oc login --username=admin --password=redhat --server=https://api.ocp4.digitaldovey.com:6443

oc delete project demo-anz-bank

oc new-project demo-anz-bank

oc get secrets builder-quay-openshift deployer-quay-openshift default-quay-openshift

oc describe sa builder default deployer

#oc new-app --template=httpd-example
oc new-app --template=nodejs-mongodb-example

oc get build nodejs-mongodb-example-1 --template='{{ .spec.output.to.name }}'

oc describe is nodejs-mongodb-example

oc get route nodejs-mongodb-example --template='{{ .spec.host }}'

