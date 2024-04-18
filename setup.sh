#!/bin/bash

# Associative array to store the SDK paths and version
sdk="${SDK:-/data/sdk}"

declare -A version=(
    # ["gradle"]="8.7"
    ["gradle"]="7.6.3"
    ["flutter"]="3.19.5"
    # ["cmdtools"]="9477386"
    ["cmdtools"]="11076708"
    ["ndk"]="r26d"
)

# Create directories
mkdir -p "$sdk/tmp"
mkdir -p "$sdk/gradle"
mkdir -p "$sdk/flutter"
mkdir -p "$sdk/android-studio"
mkdir -p "$sdk/androidHome"
mkdir -p $sdk/android/{cmdline-tools/latest,emulator,licenses,platforms,tools}
# Note: this could not work with space in pathsm should separated in multiple lines, and use quotes.

# URLs
declare -A urls=(
    ["cmdtools"]="https://dl.google.com/android/repository/commandlinetools-linux-${version[cmdtools]}_latest.zip"
    ["platformtools"]="https://dl.google.com/android/repository/platform-tools-latest-linux.zip"
    ["ndk"]="https://dl.google.com/android/repository/android-ndk-${version[ndk]}-linux.zip"
    # ["gradle"]="https://downloads.gradle.org/distributions/gradle-${version[gradle]}-bin.zip"
    ["gradle"]="https://downloads.gradle.org/distributions/gradle-${version[gradle]}-all.zip"
    ["flutter"]="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${version[flutter]}-stable.tar.xz"
)

# Archives
declare -A archives=(
    ["cmdtools"]="$sdk/tmp/commandlinetools-linux-${version[cmdtools]}_latest.zip"
    ["platformtools"]="$sdk/tmp/platform-tools-latest-linux.zip"
    ["ndk"]="$sdk/tmp/android-ndk-${version[ndk]}-linux.zip"
    # ["gradle"]="$sdk/tmp/gradle-${version[gradle]}-bin.zip"
    ["gradle"]="$sdk/tmp/gradle-${version[gradle]}-all.zip"
    ["flutter"]="$sdk/tmp/flutter_linux_${version[flutter]}-stable.tar.xz"
)



# Download files
for key in "${!urls[@]}"; do
    echo curl "${urls[$key]}" -o "${archives[$key]}"
done

exit 0


# Extract files
# unzip "${archives[cmdtools]}"      -d /tmp && mv /tmp/cmdline-tools/{*,.[!.]*} "$sdk/android/cmdline-tools/latest"
# unzip "${archives[platformtools]}" -d "$sdk/android"
# unzip "${archives[ndk]}"           -d "$sdk/android/" && mv "$sdk/android/android-ndk-${version[ndk]}" "$sdk/android/ndk"
# unzip "${archives[gradle]}"        -d "$sdk/gradle"
# tar -xf "${archives[flutter]}"     -C "$sdk"
# rm -rf /tmp/cmdline-tools

# Directory Structure
echo
echo
cat << EOF
$(pwd)/$sdk/
├── android/
│   ├── cmdline-tools/
│   │   └── latest/bin/sdkmanager
│   ├── emulator/
│   │   └── emulator
│   ├── licenses/
│   ├── ndk/
│   ├── platform-tools/
│   │   └── adb
│   ├── platforms/
│   │   └── android-29/
│   ├── build-tools
│   │   └── /29.0.3
│   └── tools/
├── gradle/
│   └── caches/
│   └── daemon/
│   └── wrapper/
│   └── gradle-7.6.3/
│   └── flutter/
└── android-studio/
EOF

# Set environment variables
export ANDROID_SDK_HOME="$sdk/androidHome"
export ANDROID_SDK_ROOT="$sdk/android"
export GRADLE_USER_HOME="$sdk/gradle"
export GRADLE_HOME="$sdk/gradle/gradle-${version[gradle]}"
export PATH="$PATH:$sdk/flutter/bin:$sdk/android-studio/bin:$sdk/gradle/gradle-${version[gradle]}/bin:$sdk/android/cmdline-tools/latest/bin:$sdk/android/platform-tools"

echo
echo

cat << EOF
# init
sdkmanager --update
yes | sdkmanager --licenses
sdkmanager --install "build-tools;34.0.0" "platforms;android-34" "platform-tools"


# .bashrc

export ANDROID_SDK_HOME="$sdk/androidHome"
export ANDROID_SDK_ROOT="$sdk/android"
export GRADLE_USER_HOME="$sdk/gradle"
export GRADLE_HOME="$sdk/gradle/gradle-${version[gradle]}"
export PATH="\$PATH:$sdk/flutter/bin:$sdk/android-studio/bin:$sdk/gradle/gradle-${version[gradle]}/bin:$sdk/android/cmdline-tools/latest/bin:$sdk/android/platform-tools"
EOF
