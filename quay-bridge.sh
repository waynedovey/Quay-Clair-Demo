#!/bin/bash


oc delete secret quay-integration -n openshift-operators

oc create secret generic quay-integration --from-literal=token=3Dq9kfRft1Mgzas3zN647Q1OhOfZSmE5ZbXUbdOL -n openshift-operators


# Generate Onetime only 

https://raw.githubusercontent.com/redhat-cop/quay-openshift-registry-operator/master/hack/webhook-create-signed-cert.sh
chmod +x webhook-create-signed-cert.sh

oc get configmap -n kube-system extension-apiserver-authentication -o=jsonpath='{.data.client-ca-file}' | base64 | tr -d '\n'

apiVersion: admissionregistration.k8s.io/v1beta1
kind: MutatingWebhookConfiguration
metadata:
  name: quay-bridge-operator
webhooks:
  - name: quayintegration.redhatcop.redhat.io
    clientConfig:
      service:
        namespace: openshift-operators
        name: quay-bridge-operator
        path: "/admissionwebhook"
      caBundle: ""
    rules:
    - operations:  [ "CREATE" ]
      apiGroups: [ "build.openshift.io" ]
      apiVersions: ["v1" ]
      resources: [ "builds" ]
    failurePolicy: Fail

example-quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com


apiVersion: redhatcop.redhat.io/v1alpha1
kind: QuayIntegration
metadata:
  name: example-quayintegration
spec:
  clusterID: openshift
  credentialsSecretName: openshift-operators/quay-integration
  quayHostname: https://quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com
  insecureRegistry: true

# CRD

apiVersion: redhatcop.redhat.io/v1alpha1
kind: QuayEcosystem
metadata:
  name: quayecosystem
  namespace: quay-enterprise
spec:
  quay:
    imagePullSecretName: redhat-pull-secret
    keepConfigDeployment: true
    externalAccess:
      tls:
        termination: edge
    enableStorageReplication: true
    registryBackends:
      - name: aws-site-a
        s3:
          accessKey: xxxxxxxxxxxx
          bucketName: quayrepo-site-a
          secretKey: xxxxxxxxxxxx
          replicateByDefault: true
      - name: aws-site-b
        s3:
          accessKey: xxxxxxxxxxxx
          bucketName: quayrepo-site-b
          secretKey: xxxxxxxxxxxx
          replicateByDefault: true
  clair:
    enabled: true
    imagePullSecretName: redhat-pull-secret
