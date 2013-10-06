CC=clang # or gcc

# Trick to get current dir: http://stackoverflow.com/questions/322936/common-gnu-makefile-directory-path
TESTS_DIR:= $(dir $(lastword $(MAKEFILE_LIST)))
PROJECT_DIR:= $(TESTS_DIR)/..

FRAMEWORKS_PATH:= -F/Applications/Xcode.app/Contents/Developer/Library/Frameworks
FRAMEWORKS:= -framework Foundation -framework SenTestingKit
LIBRARIES:= -lobjc
INCLUDE_PATHS:= -I$(PROJECT_DIR)/FoundationExtensions \
								-I$(TESTS_DIR)

SOURCE_FOUNDATION_EXTENSIONS = $(wildcard $(PROJECT_DIR)/FoundationExtensions/*.m)
					
SOURCE_TEST_SUITE = $(wildcard $(TESTS_DIR)/NS**/*.m)

SOURCE_TESTS = octest.m


CFLAGS=-Wall -Werror -fobjc-arc -fobjc-exceptions -fexceptions -fdiagnostics-show-option -fcolor-diagnostics -g -v $(SOURCE_FOUNDATION_EXTENSIONS) $(SOURCE_TEST_SUITE) $(SOURCE_TESTS)

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o octest

test:
		./runtests

all:
		$(CC) $(FRAMEWORKS_PATH) $(CFLAGS) $(INCLUDE_PATHS) $(LDFLAGS) $(OUT)
