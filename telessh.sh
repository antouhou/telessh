# put this file to /etc/profile.d/

USERID="place_your_user_id_here"
KEY="place_your_telegram_bot_token_here"
TIMEOUT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

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

curl -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$MESSAGE" $URL > /dev/null
