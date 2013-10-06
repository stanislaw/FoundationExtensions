CC=clang

$(export DYLD_FRAMEWORK_PATH=/Applications/Xcode.app/Contents/Developer/Library/Frameworks)

DIR:= $(dir $(lastword $(MAKEFILE_LIST)))

test: build runtests

.PHONY:build
build:
	xcodebuild -workspace TestsApp.xcworkspace \
						 -scheme TestsApp \
			 			 clean \
			       build

.PHONY:runtests
runtests:
	./Build/Products/Debug/TestsApp 2>&1 | awk -f "octest.awk"

test:
	$(build)
