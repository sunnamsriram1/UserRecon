#!/usr/bin/env python3
# 🔎 OSINT IP Tracker — by @SunnamSriram

import requests, json, os
from time import sleep
from datetime import datetime

# 🎨 Colors
R = "\033[1;31m"
G = "\033[1;32m"
Y = "\033[1;33m"
C = "\033[1;36m"
W = "\033[0m"

BANNER = f"""{C}
╗╔╦╗╔═╗╔═╗╦═╗╔═╗╦═╗╔═╗╔═╗╔╦╗
╚═╗ ║ ║ ║╠╣ ╠╦╝║╣ ╠╦╝║╣ ╚═╗ ║
╚═╝ ╩ ╚═╝╚═╝╩╚═╚═╝╩╚═╚═╝╚═╝ ╩
{W}🌐 OSINT | Darknet | GeoSOCMINT
{Y}       🔐 by @SunnamSriram{W}
"""

def get_ip_info(target):
    print(f"\n{Y}[~] Tracking IP info for {target}...\n{W}")
    try:
        res = requests.get(f"http://ip-api.com/json/{target}?fields=66846719", timeout=5)
        data = res.json()

        if data['status'] != 'success':
            print(f"{R}[✘] Failed to fetch IP info: {data.get('message', 'Unknown error')}{W}")
            return

        domain = target.replace("http://", "").replace("https://", "").split("/")[0]
        save_path = f"results/{domain}/ipinfo.json"
        os.makedirs(os.path.dirname(save_path), exist_ok=True)

        with open(save_path, "w") as f:
            json.dump(data, f, indent=2)

        # 🎯 Print key data
        print(f"{G}[✓] IP Address: {C}{data['query']}")
        print(f"{G}[✓] ISP      : {C}{data['isp']}")
        print(f"{G}[✓] Org      : {C}{data['org']}")
        print(f"{G}[✓] Country  : {C}{data['country']} ({data['countryCode']})")
        print(f"{G}[✓] Region   : {C}{data['regionName']} ({data['region']})")
        print(f"{G}[✓] City     : {C}{data['city']}")
        print(f"{G}[✓] Zip      : {C}{data['zip']}")
        print(f"{G}[✓] Lat, Lon : {C}{data['lat']}, {data['lon']}")
        print(f"{G}[✓] Timezone : {C}{data['timezone']}")
        print(f"{G}[✓] AS       : {C}{data['as']}")
        print(f"{G}[✓] Saved to : {Y}{save_path}{W}\n")

    except Exception as e:
        print(f"{R}[✘] Error: {e}{W}")

def main():
    while True:
        os.system("clear")
        print(BANNER)
        target = input(f"{C}🔍 Enter IP or Domain: {W}").strip()
        if not target:
            print(f"{R}[!] Empty input. Exiting...{W}")
            break

        get_ip_info(target)

        again = input(f"{Y}🔁 Run another scan? (y/n): {W}").strip().lower()
        if again != 'y':
            print(f"{C}👋 Exiting. Stay safe!{W}\n")
            break
        sleep(1)

if __name__ == "__main__":
    main()
