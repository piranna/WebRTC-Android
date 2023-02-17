#/usr/bin/en sh

mkdir webrtc_android
cd webrtc_android

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:$PWD/depot_tools

sudo apt install python-is-python3

fetch --nohooks webrtc_android
gclient sync
cd src

apt update
apt upgrade
apt dist-upgrade

./build/install-build-deps.sh

git checkout branch-heads/4472

gclient revert
gclient sync

tools_webrtc/android/build_aar.py
