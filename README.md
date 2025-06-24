# Discord APT Update Notifier

Un script Bash qui vérifie les mises à jour disponibles via `apt`, puis envoie le résumé sur un salon Discord via un webhook.

## 📦 Installation

### 1. Copiez le script
```bash
sudo cp check-updates.sh /usr/local/bin/check-updates.sh
sudo chmod +x /usr/local/bin/check-updates.sh
```

### 2. Copiez les fichiers systemd
```bash
sudo cp systemd/check-updates.service /etc/systemd/system/
sudo cp systemd/check-updates.timer /etc/systemd/system/
```

### 3. Activez le timer
```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now check-updates.timer
```

## 🧪 Tester manuellement
```bash
sudo systemctl start check-updates.service
```

## 📅 Planification
Le script s’exécute automatiquement **tous les lundis à 18h** (`OnCalendar=Mon 18:00`).

## ⚠️ Webhook Discord
Remplacez la variable `WEBHOOK_URL` dans `check-updates.sh` par votre lien Discord Webhook :
```bash
WEBHOOK_URL="https://discord.com/api/webhooks/TON_WEBHOOK_ID"
```

## 📂 Structure du dépôt
```
discord-apt-updates/
├── check-updates.sh
├── systemd/
│   ├── check-updates.service
│   └── check-updates.timer
└── README.md
```