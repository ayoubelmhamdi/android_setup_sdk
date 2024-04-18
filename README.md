# SDK Setup Script

This repository contains a bash script for setting up a development environment with various SDKs.

## Description

The `setup.sh` script is designed to create a structured SDK environment for Android and Flutter development. It handles the downloading and extraction of specific versions of Gradle, Flutter, Android command-line tools, and the NDK.

## Prerequisites

Before running the script, ensure you have the following installed: `bash`, `curl`, `unzip`, `tar`.

## Usage

To use the script, simply clone the repository and execute the script:

```bash
curl -LO https://github.com/ayoubelmhamdi/android_setup_sdk/master/setup.sh
bash ./setup.sh
```

## Environment Variables

The script sets several environment variables necessary for development. You may need to add these to your `.bashrc` or `.bash_profile` for persistence:

```bash
export ANDROID_SDK_HOME="/data/sdk/androidHome"
export ANDROID_SDK_ROOT="/data/sdk/android"
export GRADLE_USER_HOME="/data/sdk/gradle"
export GRADLE_HOME="/data/sdk/gradle/gradle-7.6.3"
export PATH="$PATH:/data/sdk/flutter/bin:/data/sdk/android-studio/bin:/data/sdk/gradle/gradle-7.6.3/bin:/data/sdk/android/cmdline-tools/latest/bin:/data/sdk/android/platform-tools"
```

## Directory Structure

After running the script, your SDK directory should look like this:

```
sdk/
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
```

## Contributing

Feel free to fork this repository and submit pull requests to improve the script.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
