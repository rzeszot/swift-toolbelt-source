
archive() {
    local platform="$1"

    xcodebuild clean archive \
        -scheme Toolbelt \
        -destination "generic/platform=$platform" \
        -archivePath "Archives/Toolbelt-$platform" \
        -derivedDataPath DerivedData \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        INSTALL_PATH=/Library/Frameworks \
        | xcpretty
}

archive "iOS"
archive "iOS Simulator"
archive "macOS"

find Archives

xcodebuild -create-xcframework \
    -archive "Archives/Toolbelt-iOS.xcarchive" -framework "Toolbelt.framework" \
    -archive "Archives/Toolbelt-iOS Simulator.xcarchive" -framework "Toolbelt.framework" \
    -archive "Archives/Toolbelt-macOS.xcarchive" -framework "Toolbelt.framework" \
    -output "XCFrameworks/Toolbelt.xcframework"
