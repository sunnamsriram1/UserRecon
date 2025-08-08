#!/usr/bin/env python3

import whois
import time
import sys
from datetime import datetime
from colorama import Fore, Style, init

# Initialize colorama
init(autoreset=True)

def banner():
    print(Fore.CYAN + Style.BRIGHT + "\n" + "="*60)
    print(Fore.GREEN + Style.BRIGHT + "         🔍 Advanced WHOIS Lookup Tool")
    print(Fore.YELLOW + "             Coded by @SunnamSriram")
    print(Fore.CYAN + "="*60 + "\n")

def get_user_input():
    try:
        domain = input(Fore.LIGHTMAGENTA_EX + "🌐 Enter domain or IP (e.g., example.com): ").strip()
        if not domain:
            print(Fore.RED + "❌ Please enter a valid domain or IP.")
            sys.exit()
        return domain
    except KeyboardInterrupt:
        print(Fore.RED + "\n❌ Interrupted by user.")
        sys.exit()

def print_whois_info(info):
    keys = [
        "domain_name", "registrar", "whois_server", "referral_url", "updated_date",
        "creation_date", "expiration_date", "name_servers", "status", "emails",
        "dnssec", "name", "org", "address", "city", "state", "zipcode", "country"
    ]
    for key in keys:
        value = info.get(key)
        if value:
            if isinstance(value, list):
                value = ', '.join(str(v) for v in value)
            print(Fore.CYAN + f"{key.replace('_', ' ').title()}: " + Fore.WHITE + f"{value}")

def main():
    banner()
    domain = get_user_input()

    print(Fore.YELLOW + f"\n[🔎] Performing WHOIS lookup for: {domain}")
    time.sleep(1)

    try:
        w = whois.whois(domain)
        print(Fore.GREEN + "\n[✓] WHOIS Info Found:\n")
        print_whois_info(w)
    except Exception as e:
        print(Fore.RED + f"\n[✘] Error: {e}")

if __name__ == "__main__":
    main()
