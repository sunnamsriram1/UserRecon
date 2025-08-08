#!/usr/bin/env python3
# 🔍 Domain WHOIS Info Extractor
# 📅 Author: @SunnamSriram
# 📌 Usage: Just run the script and enter the domain when prompted

import whois
from datetime import datetime

def format_date(date_obj):
    if isinstance(date_obj, list):
        date_obj = date_obj[0]
    if isinstance(date_obj, datetime):
        return date_obj.strftime("%m/%d/%Y")
    return str(date_obj)

def get_domain_info(domain):
    try:
        data = whois.whois(domain)
    except Exception as e:
        print(f"❌ Error: {e}")
        return

    print("\n🔎 WHOIS Full Domain Information\n")

    # Contact Information
    print("📇 Contact Information")
    for contact_type in ["registrant", "admin", "tech"]:
        print(f"\n➡️ {contact_type.capitalize()} Contact")
        print(f"Name        : {data.get(f'{contact_type}_name', 'N/A')}")
        print(f"Organization: {data.get(f'{contact_type}_organization', 'N/A')}")
        print(f"Address     : {data.get(f'{contact_type}_address', 'N/A')}")
        print(f"City        : {data.get(f'{contact_type}_city', 'N/A')}")
        print(f"State       : {data.get(f'{contact_type}_state', 'N/A')}")
        print(f"Country     : {data.get(f'{contact_type}_country', 'N/A')}")
        print(f"Phone       : {data.get(f'{contact_type}_phone', 'N/A')}")
        print(f"Email       : {data.get(f'{contact_type}_email', 'N/A')}")

    # Registrar Info
    print("\n🏢 Registrar Information")
    print(f"Registrar     : {data.get('registrar', 'N/A')}")
    print(f"WHOIS Server  : {data.get('whois_server', 'N/A')}")
    print(f"Referral URL  : {data.get('referral_url', 'N/A')}")

    # Dates
    print("\n📅 Important Dates")
    print(f"Created  : {format_date(data.get('creation_date'))}")
    print(f"Updated  : {format_date(data.get('updated_date'))}")
    print(f"Expires  : {format_date(data.get('expiration_date'))}")

    # Nameservers
    print("\n🌐 Nameservers")
    nameservers = data.get("name_servers", [])
    if isinstance(nameservers, str):
        nameservers = [nameservers]
    for ns in sorted(nameservers):
        print(f" - {ns}")

    # Domain Status
    print("\n🔐 Domain Status")
    status_list = data.get("status", [])
    if isinstance(status_list, str):
        status_list = [status_list]
    for status in status_list:
        print(f" - {status}")

    print("\n✅ Done!\n")

if __name__ == "__main__":
    domain = input("🌐 Enter domain to look up (e.g., apple.com): ").strip()
    if domain:
        get_domain_info(domain)
    else:
        print("❌ No domain entered.")
