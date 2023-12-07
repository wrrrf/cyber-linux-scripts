#!/bin/bash
#MIT License

pass='M0nk3y!M0m3nt123!'

echo "Is sudo enabled? (y/n)"
read
ans=$REPLY
if [ $ans == 'n' ]; then
    echo "ENABLE SUDO MONKEY!!!"
else
    CHOICE=$(whiptail --title "Config" --menu "Choose an option" 25 78 16 \
  "<-- Back" "Return to the main menu" \
  "Add Users" "Add required users in the readme to the system" \
  "Remove Users" "Remove users from the system" \
  "Modify User" "Modify user permissions of user" \
  "List Users" "List all users on the system (hidden or not)" \
  "Pam.d Configs" "Configures pam.d configs for common-password and common-auth" \
  "Removes malicious software" "Removes/purges malicious software and services from the system." \
  "List Users" "List all users on the system (hidden or not)" 3>&1 1>&2 2>&3)
# can add more stuff later 

    if [ -z "$CHOICE" ]; then
  echo "No option was chosen (user hit Cancel)"
    else
      echo "The user chose $CHOICE"
    fi
fi

