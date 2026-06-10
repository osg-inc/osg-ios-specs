#!/usr/bin/env bash
set -euo pipefail

SPECS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ARTIFACTS_DIR="$SPECS_DIR/artifacts"

"$SPECS_DIR/../mopub-ios-sdk/scripts/build-osg-ios-sdk-binary.sh" "$ARTIFACTS_DIR"
"$SPECS_DIR/../osg-ios-admob-mediation-adapter/scripts/build-binary.sh" "$ARTIFACTS_DIR"
"$SPECS_DIR/../osg-ios-applovin-mediation-adapter/scripts/build-binary.sh" "$ARTIFACTS_DIR"

echo "All artifacts written to $ARTIFACTS_DIR"
