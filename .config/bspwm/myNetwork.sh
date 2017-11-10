#!/bin/bash

Network() {
    WIF=$(nmcli con show | grep wlp3s0 | awk '{print $1}')
    if [ "${WIF}" == "" ]; then
        ETH=$(nmcli con show | grep enp0s25 | awk '{print $1}')
        if [ "${ETH}" == "" ]; then
            echo -e ""
        else
            echo "${ETH}"
        fi
    else
        echo "${WIF}"
    fi
}
Network
