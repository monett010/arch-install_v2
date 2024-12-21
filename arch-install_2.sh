#!/bin/bash

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
