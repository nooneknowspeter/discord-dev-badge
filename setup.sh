#!/bin/bash

echo -e "\n Discord Developer Badge \n"

# function to clear screen
clear_screen() {
  tput clear
}

# discord ascii art (simplified)
DISCORD_LOGO="\n 
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢹⣿⣿⣿
⣿⣿⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⣿⣿⣿
⣿⣿⣿⡇⠄⠄⠄⢠⣴⣾⣵⣶⣶⣾⣿⣦⡄⠄⠄⠄⢸⣿⣿⣿
⣿⣿⣿⡇⠄⠄⢀⣾⣿⣿⢿⣿⣿⣿⣿⣿⣿⡄⠄⠄⢸⣿⣿⣿
⣿⣿⣿⡇⠄⠄⢸⣿⣿⣧⣀⣼⣿⣄⣠⣿⣿⣿⠄⠄⢸⣿⣿⣿
⣿⣿⣿⡇⠄⠄⠘⠻⢷⡯⠛⠛⠛⠛⢫⣿⠟⠛⠄⠄⢸⣿⣿⣿
⣿⣿⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⣿⣿⣿
⣿⣿⣿⣧⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢡⣀⠄⠄⢸⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣆⣸⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ 
\n"

# animation duration
DURATION=$((SECONDS + 3))

# animation loop
while [[ $SECONDS -lt $DURATION ]]; do
  for color in 34 35 36; do
    # check if time is up
    [[ $SECONDS -ge $DURATION ]] && break
    clear_screen
    # set text color
    tput setaf $color
    # print logo in the center of the screen
    tput cup $((($(tput lines) / 2) - 3)) $((($(tput cols) - 20) / 2))
    echo -e "$DISCORD_LOGO"
    # reset text attributes
    tput sgr0
    # pause for animation
    sleep 0.3
  done
done

# clear screen after animation ends
clear_screen

echo -e "\n Input Your Environemt Variables"

echo -e "________________________________\n"

APPLICATION_ID=""
PUBLIC_KEY=""
BOT_TOKEN=""
SERVER_ID=""

ENVIRONMENT_VARIABLES() {

  echo -e "\n Enter Your Application ID \t"

  read -r APPLICATION_ID

  echo -e "\n Public Key \t"

  read -r PUBLIC_KEY

  echo -e "\n Bot Token \t"

  read -r BOT_TOKEN

  echo -e "\n Server/Guild ID \t"

  read -r SERVER_ID

  echo -e "\n Make Sure These Are Correct"

  echo -e "________________________________\n"

  echo -e "\n APPLICATION_ID = $APPLICATION_ID \n"
  echo -e "\n PUBLIC_KEY = $PUBLIC_KEY \n"
  echo -e "\n BOT_TOKEN = $BOT_TOKEN \n"
  echo -e "\n SERVER_ID = $SERVER_ID \n"

  echo -e "\n________________________________"

  sleep 1

  echo -e "Would You Like To Re-enter Your Values? y/n  \n"

  read -r USER_INPUT

  if [[ $USER_INPUT == "y" || $USER_INPUT == "Y" ]]; then
    ENVIRONMENT_VARIABLES
  fi
}

PARSE_ENVIRONMENT_VARIABLES() {
  rm .env

  echo "
  APPLICATION_ID=$APPLICATION_ID
  PUBLIC_KEY=$PUBLIC_KEY
  BOT_TOKEN=$BOT_TOKEN
  SERVER_ID=$SERVER_ID
  " >>.env

  echo -e "\n Variables Parsed and Saved In Enironment File"
}

echo -e "\n Read the docs for more information"

echo -e "https://github.com/nooneknowspeter/discord-dev-badge \n"

RUN_BOT() {
  npm run deploy-commands
  npm run bot
}

ENVIRONMENT_VARIABLES

PARSE_ENVIRONMENT_VARIABLES

RUN_BOT
