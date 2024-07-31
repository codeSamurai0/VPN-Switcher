#!/bin/bash

# This program requires protonvpn-cli set up properly in order to work!

connection()

{

    echo "Would you like to connect(c) or disconnect(d)?"

    # Checking if the user input is correct

    while [ "$option" != "c" ] || [ "$option" != "d" ]
    do

        # Taking user input

        read option
        echo $option

        echo "Please type in c or d"

        # Connecting if the user input is connect(c)

        if [ "$option" == "c" ] || [ "$option" == "connect" ]
        then
            echo "Connecting..."
            protonvpn-cli c --f
            protonvpn-cli ks --permanent
            protonvpn-cli s
            echo "Successfully connected to the VPN"
            echo "Exiting..."
            return
        fi

        # Disconnecting if the user input is disconnect(d)

        if [ "$option" == "d" ] || [ "$option" == "disconnect" ]
        then
            echo "Disconnecting..."
            protonvpn-cli d
            protonvpn-cli ks --off
            echo "Successfully disconnected from the VPN"
            echo "Exiting..."
            return
        fi

    done

}

connection
