# Discord Developer Badge / Bot Starter Repo

<div align="center">

![](https://imgs.search.brave.com/8nwrqH-40aByE0_-n2ZcxL60SWvW9yBdygpNtwvRtqE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vd3d3LmZv/bGxvd2NoYWluLm9y/Zy93cC1jb250ZW50/L3VwbG9hZHMvMjAy/Mi8xMS9pY29uczgt/c291cmNlLWNvZGUt/MzUwLnBuZz9maXQ9/MzUwLDM1MCZzc2w9/MQ)

</div>

Make sure you have an application, bot and server setup

I recommend that you turn on Developer Settings in your Discord client

## Follow these guides for extra details

- [Discord.js Guide](https://discordjs.guide/#before-you-begin)
- [Discord Developer Badge Blog](https://support-dev.discord.com/hc/en-us/articles/10113997751447-Active-Developer-Badge)
- [Setting up a bot application](https://discordjs.guide/preparations/setting-up-a-bot-application.html#creating-your-bot)
- [Adding bots to servers](https://discordjs.guide/preparations/adding-your-bot-to-servers.html)

## Using Docker

Ensure Docker is installed

`docker --version`

If not, get Docker [here](https://docs.docker.com/get-started/get-docker/)

You can get Docker Desktop or the Docker Engine

For Windows users,
Docker Desktop is the simplest but clunky

[Taking the other route will not allow you to run Linux containers](https://docs.docker.com/engine/install/binaries/#install-server-and-client-binaries-on-windows)
If you don't want to install Docker Desktop and you're comfortable with a command line interface (CLI)

You can use a [WSL Distro](https://learn.microsoft.com/en-us/windows/wsl/), then install the [Docker engine](https://docs.docker.com/engine/install/) on that distro

You don't need Docker Desktop to run Docker on a Linux subsystem

I highly recommend the [Lazydocker](https://github.com/jesseduffield/lazydocker) Docker client

You can monitor and use certain Docker functions using a terminal user interface (TUI)

### Pulling the Image

In your terminal run

`docker pull peter6/discord`

This will pull the Docker image from Docker hub

When done downloading, list the images to ensure it's there

`docker image ls` or `docker images`

### Run

Run the image using

`docker run -it --name discord-dev-badge peter6/discord:dev-badge`

`-it` Interactive mode with tty (terminal)
This allows you to interact with the newly created container (discord-dev-badge) created from the image (peter6/discord:dev-badge)

`--name discord-dev-badge` Name the newly created container instance to "discord-dev-badge"

`peter6/discord:dev-badge` The docker image containing the environment; Ubuntu binaries, repository, Node.js, npm packages

This creates a container from that image

You will then have a running interactive bash shell

In the shell run

```sh
chmod +x ./setup.sh
./setup.sh
```

### Notice

If you want to do the setup manually, follow [here](<README#Manual Setup>)

The packages are pre-installed in the image when pulled but you can do it again if you like

#### OPTIONAL: Making Your Own Image and Deploy Custom Bot

Also, if you would like to build your own docker image and change some source code

Clone the repository on your local machine / development machine

Follow [this method for cloning and setting up your environment](README#Git)

You will also need the buildx Docker plugin for building the image

If you want to learn more on Docker, I recommend [Typecraft's Docker series](https://www.youtube.com/watch?v=WKI7d2zZv9U&list=PLsz00TDipIfcc6X5TECsuk0YNGWIx5HMl)

## Local Development Environment

### Git

Ensure Git is installed

`git --version`

If not, get Git [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Clone this repository to a directory of your choice either

`git clone https://github.com/nooneknowspeter/discord-dev-badge.git`

You can append a folder path to the git command and dump the contents of the repo inside the folder of your choosing

For example

On Windows (Powershell), dump repository contents into discord-dev-badge folder on Desktop

`git clone https://github.com/nooneknowspeter/discord-dev-badge.git $env:ONEDRIVE\Desktop\discord-dev-badge`

On Linux (Bash/Zsh), dump repository contents into discord-dev-badge folder in Downloads

`git clone https://github.com/nooneknowspeter/discord-dev-badge.git ~/Downloads/discord-dev-badge`

### Node

Ensure Node.js and npm are installed

`node --version` and `npm --version`

If not, get Node [here](https://nodejs.org/en/download)

### Automated Setup

Change directory in your shell into the repository

`cd /loation/of/discord-dev-badge`

If you are on Linux, MacOS using bash, you can use the script

```sh
chmod +x ./setup.sh
./setup.sh
```

If you using Zsh or Fish you can remove the shell declarative to the top `#!/bin/bash`

Or, put in your own by checking the path using `echo $SHELL` or `which $SHELL` and change the declarative, for example `#!/usr/bin/zsh`

Fish is not POSIX compliant, so be careful if you are using Fish

You can remove the declarative and try again if you face any problems

### Manual Setup

#### Install Packages

Run `npm install` to install the packages in the package.json file

These include

- [Discordjs](https://discord.js.org/)
- [Dotenv](https://www.npmjs.com/package/dotenv)
- [ESLint](https://eslint.org/)
- [Nodemon](https://www.npmjs.com/package/nodemon)
- [Prettier](https://prettier.io/)

#### Environment Variables

Ensure there is a .env file in the root directory of the repository by using `touch .env` on Bash, Zsh or `New-Item .env` on Powershell

Or create it in a file manager of your choice

The .env file must follow this format

```
APPLICATION_ID=<enter-your-application-id>
PUBLIC_KEY=<enter-your-public-key>
BOT_TOKEN=<enter-your-bot-token>
SERVER_ID=<enter-your-server-id>
```

Replace the placeholders `< >` with the information from your application

You should have no whitespace when assigning the variables in the file

Invalid
`APPILICATION_ID = <application-id>`

Valid
`APPLICATION_ID=<application-id>`

#### Run

Run the bot using `npm run bot && npm run deploy-commands`

#### Quick Note

If you would like to create a custom bot and deploy with custome commands

You can add those commands in ./src/commands/

Play around in the package.json to change the name of the bot

You can play around with the source files and code and suit it to your liking

This repo is also a Discord bot starter project; hosting and deploying a container on a server

You can pick infrastructure providers like DigitalOcean, AWS, Azure, ...

## Notice

Ensure the bot is running using `npm run deploy-commands && npm run bot`

Check if the bot's commands show by entering `/` in the text field

If the bot's commands do not show up, ensure there are no errors when using the `npm run deploy-commands` command

If there is a 400 status code you need to give the bot permissions in your developer portal or you put in the wrong tokens/keys

You can try again by using ^c, Ctrl + c, or Cmd + c and entering `npm run deploy-commands && npm run bot` or run the script again using `./setup.sh`

Also, if you would like to add additional commands, you can do so in ./src/commands

You can follow the [Discord.js guide](https://discordjs.guide/#before-you-begin) and [Discord.js api](https://discord.js.org/)

Make sure to have a terminal instance running the bot `npm run bot`

Make anther terminal instance (multiplex) by pane or by tabs in your preffered terminal emulator

Run the `npm run deploy commands` in that terminal instance

To run another shell with the same Docker container, use `docker exec -it discord-dev-badge /bin/bash`

## Finally

When done, visit the [developer portal](https://discord.com/developers/active-developer)

You may have to wait 24 - 48 hours
