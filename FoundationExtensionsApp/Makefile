PROJECT_NAME=FoundationExtensionsApp
WORKSPACE=$(PROJECT_NAME).xcworkspace
DEFAULT_SCHEME=$(PROJECT_NAME)

test:
	xctool -workspace $(WORKSPACE) -scheme $(DEFAULT_SCHEME) \
	     	 -sdk macosx clean test

install_tools:
	gem update cocoapods

remove_pods:
	rm -rf Pods
	rm Podfile.lock

install_pods:
	pod install

ci: install_tools remove_pods install_pods test
