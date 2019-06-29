TELEGRAM_USER_ID="place_your_user_id_here"
TELEGRAM_BOT_TOKEN="place_your_telegram_bot_token_here"
TELEGRAM_SEND_MESSAGE_URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

API_REQUEST_TIMEOUT="10"

LOGIN_DATE="$(date "+%d %b %Y %H:%M")"
HOSTNAME=$(hostname -f)
IPADDR=$(hostname -I | awk '{print $1}')
FROM="unknown ip address"

if [ -n "$SSH_CLIENT" ] ; then
	FROM=$(echo $SSH_CLIENT | awk '{print $1}')
fi

MESSAGE=$(cat <<EOF
New login to SSH detected:
Date: $LOGIN_DATE
User: $USER
Host: $HOSTNAME ($IPADDR)
From: $FROM
EOF
)

curl -s --max-time $API_REQUEST_TIMEOUT -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$MESSAGE" $TELEGRAM_SEND_MESSAGE_URL > /dev/null
