#!/bin/sh
cd "/Users/kirafountain/Documents/GitHub/freddys-cafe-game/FreddysCafeGame/Binaries/Mac"
mkdir -p "FreddysCafeGame-Mac-Shipping.app/Contents/MacOS"
mkdir -p "FreddysCafeGame-Mac-Shipping.app/Contents/Resources"
rsync --checksum "/Users/Shared/Epic Games/UE_5.2/Engine/Source/Runtime/Launch/Resources/Mac/UnrealEngine.icns" "FreddysCafeGame-Mac-Shipping.app/Contents/Resources/FreddysCafeGame.icns"
rsync --checksum "/Users/Shared/Epic Games/UE_5.2/Engine/Source/Runtime/Launch/Resources/Mac/Info.plist" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${EXECUTABLE_NAME}/FreddysCafeGame-Mac-Shipping/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${APP_NAME}/com.YourCompany.FreddysCafeGame/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${MACOSX_DEPLOYMENT_TARGET}/10.15.7/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${ICON_NAME}/FreddysCafeGame/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${BUNDLE_VERSION}/5.2.1/g" "$TMPDIR/TempInfo.plist"
rsync --checksum "$TMPDIR/TempInfo.plist" "FreddysCafeGame-Mac-Shipping.app/Contents/Info.plist"
chmod 644 "FreddysCafeGame-Mac-Shipping.app/Contents/Info.plist"
mkdir -p "/Users/kirafountain/Documents/GitHub/freddys-cafe-game/FreddysCafeGame/Intermediate/Mac"
rsync --checksum "$TMPDIR/TempInfo.plist" "/Users/kirafountain/Documents/GitHub/freddys-cafe-game/FreddysCafeGame/Intermediate/Mac/FreddysCafeGame-Mac-Shipping-Info.plist"
chmod 644 "/Users/kirafountain/Documents/GitHub/freddys-cafe-game/FreddysCafeGame/Intermediate/Mac/FreddysCafeGame-Mac-Shipping-Info.plist"
echo 'echo -n "APPL????"' | bash > "$TMPDIR/TempPkgInfo"
rsync --checksum "$TMPDIR/TempPkgInfo" "FreddysCafeGame-Mac-Shipping.app/Contents/PkgInfo"
touch -c "FreddysCafeGame-Mac-Shipping.app"
codesign -f -s - "FreddysCafeGame-Mac-Shipping.app"
codesign -f -s "Developer ID Application" "FreddysCafeGame-Mac-Shipping.app" 2> /dev/null
echo done > /dev/null
