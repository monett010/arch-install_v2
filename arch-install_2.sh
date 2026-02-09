#!/bin/bash

echo "Setting locale and hostname..."
setLocale

read -p "What would you like your hostname to be?" hostname_
setHostname "$hostname_"

# set root password
echo "Setting the root password..."
passwd

# setting up user and home dir...

function createUser () {
  read -p "Username for new user:" _username
  useradd -m -G wheel -s /usr/bin/bash "$_username"
  passwd "$_username"

  read -p "Would you like to create another user? y/n (default)" create_another

  if [ "$create_another" == "y" ]; then
    createUser
  fi
}

createUser
