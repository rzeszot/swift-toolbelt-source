scheme="ToolbeltPackage"


archive() {
    local platform="$1"
    local directory="$2"

    xcodebuild clean archive \
        -workspace . \
        -scheme "$scheme" \
        -destination "generic/platform=$platform" \
        -archivePath ".build/archives/Toolbelt-$directory" \
        -derivedDataPath ".build/derived-data" \
        -allowProvisioningUpdates \
        SKIP_INSTALL=NO \
        BUILD_LIBRARIES_FOR_DISTRIBUTION=YES \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        INSTALL_PATH=/Library/Frameworks \
        OTHER_SWIFT_FLAGS="-no-verify-emitted-module-interface" \
        || exit 1

    mkdir \
        ".build/archives/Toolbelt-$directory.xcarchive/Products/Library/Frameworks/ToolbeltLibrary.framework/Modules" \
        || exit 1

    cp -r \
        ".build/derived-data/Build/Intermediates.noindex/ArchiveIntermediates/$scheme/BuildProductsPath/Release-$directory/ToolbeltTarget.swiftmodule" \
        ".build/archives/Toolbelt-$directory.xcarchive/Products/Library/Frameworks/ToolbeltLibrary.framework/Modules/ToolbeltTarget.swiftmodule" \
        || exit 1
}

rm -rf .build

archive "iOS" "iphoneos"
archive "iOS Simulator" "iphonesimulator"

find .build

xcodebuild -create-xcframework \
    -framework ".build/archives/Toolbelt-iphoneos.xcarchive/Products/Library/Frameworks/ToolbeltLibrary.framework" \
    -framework ".build/archives/Toolbelt-iphonesimulator.xcarchive/Products/Library/Frameworks/ToolbeltLibrary.framework" \
    -output ".build/xcframework/ToolbeltLibrary.xcframework"


find .build/xcframework
