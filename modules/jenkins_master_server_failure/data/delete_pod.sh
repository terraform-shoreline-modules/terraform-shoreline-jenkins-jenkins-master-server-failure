

#!/bin/bash



NAMESPACE=${NAMESPACE}

POD_NAME=${POD_NAME}



kubectl -n ${NAMESPACE} delete pod ${POD_NAME}