# telessh
SSH Login notifications for Telegram

## Usage:

1. Clone this repo
2. Register a bot in Telegram: https://core.telegram.org/bots#3-how-do-i-create-a-bot
3. Put your [Telegram user id](#how-to-figure-out-your-telegram-user-id) and bot token to `telessh.sh` file
4. Put `telessh.sh` file to the `/etc/profile.d/`

## Contributing:

Do you want to change something in the script? [Create a PR](https://github.com/antouhou/telessh/compare)!

## How to figure out your Telegram user ID

I've created a simple script to figure out your Telegram id. 
1. Install a jq, a simple JSON parser for Linux: `sudo apt install jq` (May vary for different Linux distributions)
2. Place your bot token into `get_tg_id.sh`
3. Write any message to your bot in Telegram
4. Run `get_tg_id.sh`