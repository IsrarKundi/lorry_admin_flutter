#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Building Flutter web (release)..."
flutter build web --release

echo "Deploying to Firebase Hosting (project: lorry-52d79)..."
firebase deploy --only hosting

echo "Done."
