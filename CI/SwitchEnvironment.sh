#!/bin/sh

uname="$(uname -s)"

PROJECT_PATH=$PROJECT_DIRECTORY

# Windows Cloud Build machines run Cygwin, which won't return a good PROJECT_DIRECTORY.
# This workaround was suggested by a Unity Services Support agent.
if [[ "$uname" == "CYGWIN"* ]]; then
    PROJECT_PATH=$(cygpath -wa "$PROJECT_DIRECTORY")
fi

# Set enrivonment
"$UNITY_EXE" \
    -batchmode \
    -projectPath $PROJECT_PATH \
    -logfile - \
    -buildTarget $BUILD_PLATFORM \
    -executeMethod CloudBuildTest.CommandLineBuild.SetEnvironment

exit $?