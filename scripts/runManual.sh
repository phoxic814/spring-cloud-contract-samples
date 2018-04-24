#!/bin/bash

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

ROOT=${ROOT:-`pwd`}

function clean() {
    rm -rf ~/.m2/repository/com/example/
    rm -rf ~/.gradle/caches/modules-2/files-2.1/com.example/
}

cat <<'EOF'
 .----------------.  .----------------.  .-----------------. .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| | ____    ____ | || |      __      | || | ____  _____  | || | _____  _____ | || |      __      | || |   _____      | |
| ||_   \  /   _|| || |     /  \     | || ||_   \|_   _| | || ||_   _||_   _|| || |     /  \     | || |  |_   _|     | |
| |  |   \/   |  | || |    / /\ \    | || |  |   \ | |   | || |  | |    | |  | || |    / /\ \    | || |    | |       | |
| |  | |\  /| |  | || |   / ____ \   | || |  | |\ \| |   | || |  | '    ' |  | || |   / ____ \   | || |    | |   _   | |
| | _| |_\/_| |_ | || | _/ /    \ \_ | || | _| |_\   |_  | || |   \ `--' /   | || | _/ /    \ \_ | || |   _| |__/ |  | |
| ||_____||_____|| || ||____|  |____|| || ||_____|\____| | || |    `.__.'    | || ||____|  |____|| || |  |________|  | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
EOF

echo -e "\n\nBuilding beer_contracts\n\n"
echo -e "\n\nBuilding only the subset of contracts\n\n"

cd "${ROOT}/beer_contracts/src/main/resources/contracts/com/example/beer-api-producer-external/1.0.0"
cp "${ROOT}/mvnw" .
cp -r "${ROOT}/.mvn" .
./mvnw clean install -DskipTests -U

clean