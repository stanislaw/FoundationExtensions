PROJECT_NAME=FoundationExtensionsApp
WORKSPACE=$(PROJECT_NAME).xcworkspace
IOS_SCHEME=FoundationExtensionsIOSApp
MACOSX_SCHEME=FoundationExtensionsApp

test:
	test_ios

test_ios:
	xcodebuild -workspace $(WORKSPACE) -scheme $(IOS_SCHEME) -sdk iphonesimulator clean test

test_macosx:
	xcodebuild -workspace $(WORKSPACE) -scheme $(MACOSX_SCHEME) -sdk macosx clean test

install_tools:
	gem update cocoapods

remove_pods:
	rm -rf Pods
	rm Podfile.lock

install_pods:
	pod install

ios: remove_pods install_tools install_pods test_ios

macosx: remove_pods install_tools install_pods test_macosx

ci: ios

