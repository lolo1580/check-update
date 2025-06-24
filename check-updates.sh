#!/bin/bash

WEBHOOK_URL="https://discord.com/api/webhooks/TON_WEBHOOK_ID"
HOSTNAME=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Exécuter apt update
sudo apt update > /dev/null 2>&1
UPGRADABLE=$(apt list --upgradable 2>/dev/null | tail -n +2)

# Échapper les retours à la ligne
UPGRADABLE_ESCAPED=$(echo "$UPGRADABLE" | sed ':a;N;$!ba;s/\n/\\n/g')

# Message Discord
MESSAGE="**$HOSTNAME - MàJ du $DATE**\\n\`\`\`\\n$UPGRADABLE_ESCAPED\\n\`\`\`"

# Envoi Discord
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"$MESSAGE\"}" \
     "$WEBHOOK_URL"
