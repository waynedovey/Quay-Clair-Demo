#!/bin/bash

docker login -u="anz-bank+openshift" -p="2MWZRJ567WQFI17MC369WA79XRR6CDX55MKX0TVE3DGP13VJS713KK4L2Z9FLYI1" quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com

# Bad Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/badimage ./badimage
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/badimage:latest


# very Bad Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/verybadimage ./verybadimage
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/verybadimage:latest

# Multi-arch Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/multi-arch ./multi-arch
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/multi-arch:latest

# greatimage-base Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-base ./greatimage-base
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-base:latest

# greatimage-extra Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-extra ./greatimage-extra
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-extra:latest

# greatimage-base-fix Image
docker build -t quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-base-fix ./greatimage-base-fix
docker push quayecosystem-quay-quay-enterprise.apps.ocp4.digitaldovey.com/anz-bank/greatimage-base-fix:latest
