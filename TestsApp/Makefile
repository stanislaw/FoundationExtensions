CC=clang

$(export DYLD_FRAMEWORK_PATH=/Applications/Xcode.app/Contents/Developer/Library/Frameworks)

find-recursive = \
  $(wildcard $1/$2) \
  $(foreach f,$(wildcard $1/*/.),\
    $(call find-recursive,$(patsubst %/.,%,$f),$2))

TESTS_APP_DIR:= $(shell pwd)
TESTS_DIR:= $(shell pwd)/../Tests

PROJECT_DIR:= $(TESTS_APP_DIR)/..
FRAMEWORKS_PATH:= -F/Applications/Xcode.app/Contents/Developer/Library/Frameworks
FRAMEWORKS:= -framework Foundation -framework SenTestingKit
LIBRARIES:= -lobjc

KIWI_INCLUDE_PATHS = $(foreach directory, $(sort $(dir $(call find-recursive,$(shell pwd)/Kiwi,*))), \
    -I$(directory) \
  )

INCLUDE_PATHS =  -I$(PROJECT_DIR)/FoundationExtensions\
								 -I$(dirpath) \) \
                 -I$(TESTS_DIR)
INCLUDE_PATHS += $(KIWI_INCLUDE_PATHS)

SOURCE_FOUNDATION_EXTENSIONS = $(call find-recursive, $(PROJECT_DIR)/FoundationExtensions,*.m)

SOURCE_TESTS = octest.m \
               $(call find-recursive,$(shell pwd)/Kiwi,*.m)

SOURCE_TEST_SUITE = $(wildcard $(TESTS_DIR)/NS*/*.m)

CFLAGS=-fobjc-arc -x objective-c -arch x86_64 -fmessage-length=94 -fdiagnostics-show-note-include-stack -fmacro-backtrace-limit=0 -fcolor-diagnostics -std=gnu99 -Wno-trigraphs -fpascal-strings -O0 -Wno-missing-field-initializers -Wno-missing-prototypes -Wno-return-type -Wno-implicit-atomic-properties -Wno-receiver-is-weak -Wno-arc-repeated-use-of-weak -Wno-missing-braces -Wparentheses -Wswitch -Wno-unused-function -Wno-unused-label -Wno-unused-parameter -Wno-unused-variable -Wunused-value -Wno-empty-body -Wno-uninitialized -Wno-unknown-pragmas -Wno-shadow -Wno-four-char-constants -Wno-conversion -Wno-constant-conversion -Wno-int-conversion -Wno-bool-conversion -Wno-enum-conversion -Wno-shorten-64-to-32 -Wpointer-sign -Wno-newline-eof -Wno-selector -Wno-strict-selector-match -Wno-undeclared-selector -Wno-deprecated-implementations -DDEBUG=1 -DCOCOAPODS=1 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk -fasm-blocks -fstrict-aliasing -Wprotocol -Wdeprecated-declarations -mmacosx-version-min=10.8 -g -Wno-sign-conversion $(SOURCE_FOUNDATION_EXTENSIONS) $(SOURCE_TEST_SUITE) $(SOURCE_TESTS)

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o octest

# Default
test:
	$(build)
	
# Travis CI
ci: command_line_tests

setup:
	pod install

# Command line tests using octest
command_line_tests: compile octest

.PHONY:octest
octest:
		export DYLD_FRAMEWORK_PATH=/Applications/Xcode.app/Contents/Developer/Library/Frameworks; ./octest 2>&1 | awk -f "octest.awk"

compile:
		$(CC) $(FRAMEWORKS_PATH) $(CFLAGS) $(INCLUDE_PATHS) $(LDFLAGS) $(OUT)

# xcodebuild tests
xcodebuild_tests: xcodebuild xcoderun

xcoderun:
	export DYLD_FRAMEWORK_PATH=/Applications/Xcode.app/Contents/Developer/Library/Frameworks; ./Build/Products/Debug/TestsApp 2>&1 | awk -f "octest.awk"

.PHONY:xcodebuild
xcodebuild:
	xcodebuild -workspace TestsApp.xcworkspace \
						 -scheme TestsApp \
			 			  clean \
			        build

