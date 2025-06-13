import os
import requests
import webbrowser

# Benutzername holen
username = os.getenv("USER", "User")

# Standort über IP
try:
    res = requests.get("https://ipinfo.io/loc")  # liefert "LAT,LON"
    latlon = res.text.strip()
    webbrowser.open(f"https://www.latlong.net/c/?lat={latlon.replace(',', '&long=')}")
except:
    latlon = "unknown"

# Sprach-Nachricht per espeak
messages = [
    f"We found you, {username}",
    "We know where you are",
    "We are everywhere",
    "We do not forgive, we do not forget",
    "Expect us"
]

for msg in messages:
    os.system(f'espeak "{msg}"')
