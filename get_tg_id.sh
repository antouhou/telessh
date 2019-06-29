TELEGRAM_BOT_TOKEN="place_your_bot_token_here"
TELEGRAM_BOT_UPDATES_URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/getUpdates"

echo "Your telegram ID is:"
curl -s $TELEGRAM_BOT_UPDATES_URL | jq ".result[0].message.from.id"