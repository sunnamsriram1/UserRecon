#!/usr/bin/env python3
# 🌐 WHOIS + IP Info Tool by @SunnamSriram

import whois
import socket
import requests
import os
import sys
import webbrowser
from datetime import datetime

# Colors
R = "\033[1;31m"
G = "\033[1;32m"
Y = "\033[1;33m"
C = "\033[1;36m"
W = "\033[0m"

def clear():
    os.system("clear" if os.name == "posix" else "cls")

def banner():
    clear()
    print(f"""{C}
╔═╗╔╦╗╔═╗╔═╗╦═╗╔═╗╦═╗╔═╗╔═╗╔╦╗
╚═╗ ║ ║ ║╠╣ ╠╦╝║╣ ╠╦╝║╣ ╚═╗ ║
╚═╝ ╩ ╚═╝╚═╝╩╚═╚═╝╩╚═╚═╝╚═╝ ╩
{Y}🌐 OSINT | Darknet | GeoSOCMINT
{G}🔐Coded By Sunnam_Sriram{W}
""")

def format_date(date_obj):
    if isinstance(date_obj, list):
        date_obj = date_obj[0]
    if isinstance(date_obj, datetime):
        return date_obj.strftime("%Y-%m-%d %H:%M:%S")
    return str(date_obj)

def open_map(loc):
    if loc:
        maps_url = f"https://www.google.com/maps?q={loc}"
        print(f"\n{C}[📍] Google Maps: {maps_url}{W}")
        ask = input(f"{Y}🗺️  Open location in browser? (y/n): {W}").strip().lower()
        if ask == "y":
            webbrowser.open(maps_url)
    else:
        print(f"{R}[✘] No coordinates found for map view.{W}")

def ip_info(ip):
    print(f"\n{Y}[~] IP Tracker for: {ip}{W}")
    try:
        response = requests.get(f"https://ipinfo.io/{ip}/json", timeout=5)
        data = response.json()

        print(f"{G}[✓] IP Address : {data.get('ip', 'N/A')}")
        print(f"{G}[✓] Org        : {data.get('org', 'N/A')}")
        print(f"{G}[✓] Country    : {data.get('country', 'N/A')}")
        print(f"{G}[✓] Region     : {data.get('region', 'N/A')}")
        print(f"{G}[✓] City       : {data.get('city', 'N/A')}")
        print(f"{G}[✓] Zip        : {data.get('postal', 'N/A')}")
        print(f"{G}[✓] Loc        : {data.get('loc', 'N/A')}")
        print(f"{G}[✓] Timezone   : {data.get('timezone', 'N/A')}")

        open_map(data.get("loc"))

    except Exception as e:
        print(f"{R}[✘] IP Info Error: {e}{W}")

def whois_info(domain):
    print(f"\n{Y}[~] Performing WHOIS lookup for: {domain}{W}")
    try:
        data = whois.whois(domain)
        print(f"\n{G}[✓] WHOIS Info Found:\n")

        print(f"{C}Domain Name : {data.domain_name}")
        print(f"Registrar   : {data.registrar}")
        print(f"Whois Server: {data.whois_server}")
        print(f"Created     : {format_date(data.creation_date)}")
        print(f"Updated     : {format_date(data.updated_date)}")
        print(f"Expires     : {format_date(data.expiration_date)}")

        print(f"\n{Y}Name Servers:{W}")
        ns = data.name_servers or []
        for server in ns:
            print(f" - {server}")

        print(f"\n{Y}Status:{W}")
        status = data.status or []
        if isinstance(status, str):
            status = [status]
        for s in status:
            print(f" - {s}")

        print(f"\n{Y}Emails:{W}")
        emails = data.emails or []
        if isinstance(emails, str):
            emails = [emails]
        for email in emails:
            print(f" - {email}")

        print(f"\n{Y}Organization:{W}")
        print(f"Org     : {data.org}")
        print(f"City    : {data.city}")
        print(f"State   : {data.state}")
        print(f"Country : {data.country}")
        print(f"DNSSEC  : {data.dnssec}")

    except Exception as e:
        print(f"{R}[✘] WHOIS Error: {e}{W}")

def main():
    banner()
    try:
        user_input = input(f"{Y}🌐 Enter domain or IP: {W}").strip()
        ip = user_input
        try:
            ip = socket.gethostbyname(user_input)
        except:
            pass

        ip_info(ip)
        whois_info(user_input)

    except KeyboardInterrupt:
        print(f"\n{R}[✘] Aborted by user.{W}")
        sys.exit()

if __name__ == "__main__":
    main()
