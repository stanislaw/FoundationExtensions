PROJECT_NAME=FoundationExtensionsApp
WORKSPACE=$(PROJECT_NAME).xcworkspace
IOS_SCHEME=FoundationExtensionsApp

test:
	xcodebuild -workspace $(WORKSPACE) -scheme $(IOS_SCHEME) -sdk iphonesimulator clean test

install_tools:
	gem update cocoapods

remove_pods:
	rm -rf Pods
	rm Podfile.lock

install_pods:
	pod install

ci: remove_pods install_tools install_pods test

