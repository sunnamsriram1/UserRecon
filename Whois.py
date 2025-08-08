#!/usr/bin/env python3

# 🔍 Advanced WHOIS & Network Info CLI Tool
# 👤 Author: @SunnamSriram

import socket
import whois
import json
import requests
import subprocess
import sys
import time

def banner():
    print("\033[1;36m" + "="*60)
    print(" 🔍 WHOIS & NETWORK INTELLIGENCE TOOL (v1.0) ".center(60, " "))
    print(" 👤 Coded by @SunnamSriram".center(60, " "))
    print("="*60 + "\033[0m")

def get_ip(domain):
    try:
        ip = socket.gethostbyname(domain)
        return ip
    except Exception as e:
        return f"Error resolving IP: {e}"

def whois_lookup(domain):
    try:
        w = whois.whois(domain)
        return w
    except Exception as e:
        return f"WHOIS lookup failed: {e}"

def ipinfo_lookup(ip):
    try:
        url = f"https://ipinfo.io/{ip}/json"
        res = requests.get(url)
        return res.json()
    except Exception as e:
        return {"error": f"IP Info failed: {e}"}

def dns_info(domain):
    try:
        print("\n📡 DNS Records (A, MX, TXT):")
        subprocess.run(["nslookup", "-type=any", domain])
    except Exception as e:
        print(f"DNS Lookup failed: {e}")

def traceroute(domain):
    print("\n🛰️ Traceroute Path:")
    try:
        subprocess.run(["traceroute", domain])
    except:
        subprocess.run(["tracert", domain])  # Windows fallback

def print_whois(wdata):
    print("\n🔐 WHOIS Details:")
    if isinstance(wdata, str):
        print(wdata)
        return
    for key, value in wdata.items():
        print(f"  {key}: {value}")

def print_ipinfo(info):
    print("\n🌍 IPInfo Details:")
    for key, value in info.items():
        print(f"  {key}: {value}")

def main():
    banner()
    if len(sys.argv) != 2:
        print("❌ Usage: python3 whoistool.py <domain/IP>")
        sys.exit(1)

    target = sys.argv[1]
    print(f"\n🔎 Target: {target}")

    ip = get_ip(target)
    print(f"\n🌐 Resolved IP: {ip}")

    wdata = whois_lookup(target)
    print_whois(wdata)

    ip_data = ipinfo_lookup(ip)
    print_ipinfo(ip_data)

    dns_info(target)

    traceroute(target)

    print("\n✅ Finished scan.\n")

if __name__ == "__main__":
    main()
