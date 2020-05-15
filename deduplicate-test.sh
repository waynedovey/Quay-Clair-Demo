#!/bin/bash

docker login -u="anz-bank+openshift" -p="LXCRL67ZSIKDPAEB91G2J492968DK2GMTNE33OTPN9S72GZTA282LS8BC42OZ7HG" quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com

# greatimage-extra Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-extra ./greatimage-extra
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-extra:latest

# deduplicate-first  Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/deduplicate-first:v1.2 ./deduplicate-first
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/deduplicate-first:v1.2

# deduplicate-second  Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/deduplicate-second:v1.3 ./deduplicate-second
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/deduplicate-second:v1.3
