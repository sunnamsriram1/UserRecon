#!/usr/bin/env python3
# 🔍 S_TracerX.py — Ultimate OSINT Toolkit
# 👨‍💻 Author: @SunnamSriram

import os
import requests
import json
from time import sleep
from rich import print
from rich.prompt import Prompt
from rich.console import Console
from colorama import init

# Initialize colorama
init(autoreset=True)

console = Console()

# 🔒 Save results
def save_result(category, name, content):
    path = f"results/{name}"
    os.makedirs(path, exist_ok=True)
    with open(f"{path}/{category}.txt", "a") as f:
        f.write(content + "\n")

# ✅ Banner function
def banner():
    os.system("clear")
    print(
        "[bold red]"
        "╔═╗╔╦╗╔═╗╔═╗╦═╗╔═╗╦═╗╔═╗╔═╗╔╦╗\n"
        "╚═╗ ║ ║ ║╠╣ ╠╦╝║╣ ╠╦╝║╣ ╚═╗ ║ \n"
        "╚═╝ ╩ ╚═╝╚═╝╩╚═╚═╝╩╚═╚═╝╚═╝ ╩\n"
        "[/bold red]"
        "[bold yellow]🌐 OSINT | Darknet | GeoSOCMINT[/bold yellow]\n"
        "[bold green]       🔐 by @SunnamSriram[/bold green]\n"
    )

# ✅ Username Recon
def username_check():
    uname = Prompt.ask("🔎 Enter username to search")
    banner()
    print("[yellow][~] Searching for username on clear web...[/yellow]\n")
    sites = [
        "facebook.com", "twitter.com", "instagram.com", "reddit.com", "github.com",
        "dev.to", "pastebin.com", "pinterest.com", "4shared.com", "about.me",
        "roblox.com", "imgur.com", "soundcloud.com", "vimeo.com", "tiktok.com",
        "pornhub.com", "xvideos.com", "xnxx.com"
    ]
    for site in sites:
        url = f"https://{site}/{uname}"
        try:
            response = requests.get(url, timeout=5)
            if response.status_code == 200:
                print(f"[green][+] Found on: {url}[/green]")
                save_result("usernames", uname, f"[+] {url}")
            else:
                print(f"[red][-] Not found: {url}[/red]")
        except:
            print(f"[red][-] Error accessing: {url}[/red]")

# 🌍 GeoSOCMINT
def geo_socmint():
    location = Prompt.ask("📍 Enter location (city or place)")
    banner()
    print("[yellow][~] Fetching geo-based social links...[/yellow]\n")
    os.makedirs(f"results/{location}", exist_ok=True)
    twitter_link = f"https://twitter.com/search?q=geocode:{location}"
    insta_link = f"https://www.instagram.com/explore/locations/search/?query={location}"
    print(f"[cyan]📡 Twitter:[/cyan] {twitter_link}")
    print(f"[cyan]📸 Instagram:[/cyan] {insta_link}")
    with open(f"results/{location}/geosocmint.txt", "w") as f:
        f.write(twitter_link + "\n" + insta_link + "\n")

# 🌐 IP Tracker
def ip_tracker():
    ip = Prompt.ask("🌐 Enter IP or domain to trace")
    banner()
    print(f"[yellow][~] Tracking IP info for {ip}...[/yellow]\n")
    try:
        r = requests.get(f"http://ip-api.com/json/{ip}", timeout=6)
        data = r.json()
        if data["status"] == "fail":
            print("[red][✘] IP Lookup Failed[/red]")
        else:
            console.print_json(json.dumps(data, indent=2))
            os.makedirs(f"results/{ip}", exist_ok=True)
            with open(f"results/{ip}/ipinfo.json", "w") as f:
                json.dump(data, f, indent=2)
            print(f"[green][✓] Saved to results/{ip}/ipinfo.json[/green]")
    except:
        print("[red][✘] Error during IP lookup[/red]")

# 🕵️ Onion Username Search
def darknet_check():
    uname = Prompt.ask("🧅 Enter username for darknet search")
    banner()
    print("[yellow][~] Searching on Onion sites using Tor...[/yellow]\n")
    onion_sites = [
        "http://facebookcorewwwi.onion",
        "http://githubmsjjdfoe.onion",
        "http://protonirockerxow.onion",
        "http://darkfailllnkf4vf.onion"
    ]
    for site in onion_sites:
        url = f"{site}/{uname}"
        try:
            result = os.popen(f"torsocks curl -s -o /dev/null -w '%{{http_code}}' {url}").read().strip()
            if result == "200":
                print(f"[green][+] Found: {url}[/green]")
                save_result("darknet", uname, f"[+] {url}")
            else:
                print(f"[red][-] Not found: {url}[/red]")
        except:
            print(f"[red][-] Error accessing: {url}[/red]")

# 🔁 Menu
def menu():
    while True:
        banner()
        print("[yellow]1️⃣  Username Recon[/yellow]")
        print("[yellow]2️⃣  GeoSOCMINT (Location-Based)[/yellow]")
        print("[yellow]3️⃣  IP Address Tracker[/yellow]")
        print("[yellow]4️⃣  Darknet Username Search (Tor)[/yellow]")
        print("[yellow]5️⃣  Exit[/yellow]\n")

        opt = Prompt.ask("💡 Select option", choices=["1", "2", "3", "4", "5"])
        if opt == "1":
            username_check()
        elif opt == "2":
            geo_socmint()
        elif opt == "3":
            ip_tracker()
        elif opt == "4":
            darknet_check()
        elif opt == "5":
            print("[cyan]👋 Exiting... All data saved in results/[/cyan]")
            os.system("killall tor >/dev/null 2>&1")
            break

        again = Prompt.ask("🔁 Run another scan? (y/n)", default="y")
        if again.lower() != "y":
            break

# ✅ Run the script
if __name__ == "__main__":
    menu()
