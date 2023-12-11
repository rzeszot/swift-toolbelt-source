
xcodebuild clean archive \
    -scheme Toolbelt \
    -destination "generic/platform=iOS" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath Archives/Toolbelt \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES


xcodebuild -create-xcframework \
    -archive Archives/Toolbelt.xcarchive -framework Toolbelt.framework \
    -output XCFrameworks/Toolbelt.xcframework
