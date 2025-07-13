#!/bin/bash

Kindle_Firmware_URL() {
    device="$1"
    version="$2"

    firm_end="$version.bin"

    case $device in
        scribe1)
            printf "https://s3.amazonaws.com/firmwaredownloads/update_kindle_scribe_$firm_end"
            ;;
        kindlepw5)
            printf "https://s3.amazonaws.com/firmwaredownloads/update_kindle_all_new_paperwhite_11th_$firm_end"
            ;;
        *)
            echo "[ERROR] Add support for it"
            exit 1
    esac
}

Kindle_Toolchain() {
    device="$1"
    version="$2"

    local major=0
    local minor=0
    local patch=0

    local n=${version//[!0-9]/ }
    local a=(${n//\./ })
    major=${a[0]}
    minor=${a[1]}
    patch=${a[2]}

    if [[ $major -ge 5 && $minor -ge 16 && $patch -ge 3 ]]; then
        printf "arm-kindlehf-linux-gnueabihf"
    else
        case $device in
            scribe1)
                printf "arm-kindlepw2-linux-gnueabi"
                ;;
            kindlepw5)
                printf "arm-kindlepw2-linux-gnueabi"
                ;;
            *)
                echo "[ERROR] Add support for it"
                exit 1
        esac
    fi
}

Kindle_Platform() {
    device="$1"
    version="$2"

    local major=0
    local minor=0
    local patch=0

    local n=${version//[!0-9]/ }
    local a=(${n//\./ })
    major=${a[0]}
    minor=${a[1]}
    patch=${a[2]}

    if [[ $major -ge 5 && $minor -ge 16 && $patch -ge 3 ]]; then
        printf "kindlehf"
    else
        case $device in
            scribe1)
                printf "kindlepw2"
                ;;
            kindlepw5)
                printf "kindlepw2"
                ;;
            *)
                echo "[ERROR] Add support for it"
                exit 1
        esac
    fi
}
