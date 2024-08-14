#!/bin/sh

#
# This script is a wrapper around spring boot cli. Just making it a little more convenient.
#

group="com.example"
name="demo"
description="This is a demo project"
build="maven"
java_version="17"
packaging="jar"
artifact="$name"
dependencies=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --group) group="$2"; shift ;;
        --dep) dependencies="$2"; shift ;;
        --name) name="$2"; shift ;;
        --artifact) artifact="$2"; shift ;;
        --description) description="$2"; shift ;;
        --build) build="$2"; shift ;;
        --java-version) java_version="$2"; shift ;;
        --packaging) packaging="$2"; shift ;;
        -*) echo "Unknown option: $1"; return 1 ;;
    esac
    shift
done

package_name="$group.$name"
extract_dir="./$name"

echo "=========creating spring boot project==========="
echo "Group: $group"
echo "Artifact: $artifact"
echo "Name: $name"
echo "Description: $description"
echo "Package Name: $package_name"
echo "Build: $build"
echo "Extract Dir: $extract_dir"
echo "Java Version: $java_version"
echo "Packaging: $packaging"
echo "Dependencies: $dependencies"

# Call the actual command
spring init \
    --dependencies="$dependencies" \
    --group="$group" \
    --artifact="$artifact" \
    --name="$name" \
    --description="$description" \
    --package-name="$package_name" \
    --build="$build" \
    --extract "$extract_dir" \
    --java-version="$java_version" \
    --packaging="$packaging"
