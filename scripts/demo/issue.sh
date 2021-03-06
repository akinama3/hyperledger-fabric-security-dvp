#!/bin/bash

. ./.env

echo
echo "=========== 証券発行 =========== "
# 証券発行(platform)
docker-compose run --rm \
   cc-builder peer chaincode invoke -C $CH -n $CC_SECURITY_MANAGER -c '{"Args":["finalizeSecurity", "security1"]}'

sleep 1

echo
echo "=========== モノとカネのAtomicな交換 =========== "
docker-compose run --rm \
    cc-builder peer chaincode invoke -C $CH -n $CC_SECURITY_MANAGER -c '{"Args":["issueSecurity", "{\"securityId\":\"security1\",\"targetOrganization\":\"MinatoBank\",\"receiverOrganization\":\"Platform\",\"receiverIdentity\":\"layerx\"}"]}'
