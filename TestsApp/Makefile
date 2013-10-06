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

KIWI_INCLUDE_PATHS = $(foreach directory, $(sort $(dir $(call find-recursive,$(shell pwd)/Pods/Kiwi,*))), \
    -I$(directory) \
  )

INCLUDE_PATHS =  -I$(PROJECT_DIR)/FoundationExtensions\
								 -I$(pwd)Pods/Headers\
								 -I$(dirpath) \) \
                 -I$(TESTS_DIR)
INCLUDE_PATHS += $(KIWI_INCLUDE_PATHS)

SOURCE_FOUNDATION_EXTENSIONS = $(call find-recursive, $(PROJECT_DIR)/FoundationExtensions,*.m)

SOURCE_TESTS = octest.m \
               $(call find-recursive,$(shell pwd)/Pods/Kiwi,*.m)

SOURCE_TEST_SUITE = $(wildcard $(TESTS_DIR)/NS*/*.m)

CFLAGS=-Wall -Werror -fobjc-arc -fobjc-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -g $(SOURCE_FOUNDATION_EXTENSIONS) $(SOURCE_TEST_SUITE) $(SOURCE_TESTS)

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o octest

# Default
test:
	$(build)
	
# Travis CI
ci: setup command_line_tests

setup:
	pod install

# Command line tests using octest
command_line_tests: compile octest

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

