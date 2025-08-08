#!/data/data/com.termux/files/usr/bin/bash
# 🌐 S_TracerX.sh — Ultimate OSINT Toolkit by @SunnamSriram
# 🔍 Username, GeoSOCMINT, IP Tracker, Tor/Darknet Scanner

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

banner() {
    echo -e "${CYAN}
    ╔═╗╔╦╗╔═╗╔═╗╦═╗╔═╗╦═╗╔═╗╔═╗╔╦╗
    ╚═╗ ║ ║ ║╠╣ ╠╦╝║╣ ╠╦╝║╣ ╚═╗ ║ 
    ╚═╝ ╩ ╚═╝╚  ╩╚═╚═╝╩╚═╚═╝╚═╝ ╩ 
      ${YELLOW}🌐 OSINT | Darknet | GeoSOCMINT
           🔐 by @SunnamSriram
${NC}"
}

save_result() {
    mkdir -p results/"$1"
    echo -e "$2" >> results/"$1"/"$3".txt
}

start_tor() {
    tor &>/dev/null &
    sleep 10
    echo -e "${GREEN}[✓] Tor started.${NC}"
}

# 🔍 Username Check
username_check() {
    read -p "🔎 Enter username to search: " uname
    banner
    echo -e "${YELLOW}[~] Searching for username on clear web...${NC}"
    
    for site in facebook.com twitter.com instagram.com reddit.com github.com dev.to \
                pastebin.com pinterest.com 4shared.com about.me roblox.com \
                imgur.com soundcloud.com vimeo.com tiktok.com \
                pornhub.com xvideos.com xnxx.com
    do
        url="https://$site/$uname"
        response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
        if [ "$response" == "200" ]; then
            echo -e "${GREEN}[+] Found on: $url${NC}"
            save_result "$uname" "[+] $url" "usernames"
        else
            echo -e "${RED}[-] Not found: $url${NC}"
        fi
    done
}

# 🌍 GeoSOCMINT (location -> Twitter/Instagram map based link)
geo_socmint() {
    read -p "📍 Enter location (city or place): " location
    banner
    echo -e "${YELLOW}[~] Fetching geo-based social links...${NC}"
    
    echo -e "${CYAN}📡 Twitter GeoSearch:${NC}"
    echo "https://twitter.com/search?q=geocode:$location" | tee results/"$location"/geosocmint.txt

    echo -e "${CYAN}📸 Instagram GeoSearch:${NC}"
    echo "https://www.instagram.com/explore/locations/search/?query=$location" >> results/"$location"/geosocmint.txt
}

# 🌐 IP Tracker
ip_tracker() {
    read -p "🌐 Enter IP or domain to trace: " ip
    banner
    echo -e "${YELLOW}[~] Tracking IP info for $ip...${NC}"
    ipdata=$(curl -s "http://ip-api.com/json/$ip")

    if [[ "$ipdata" == *"fail"* ]]; then
        echo -e "${RED}[✘] IP Lookup Failed${NC}"
    else
        echo "$ipdata" | jq
        echo "$ipdata" > results/"$ip"/ipinfo.json
        echo -e "${GREEN}[✓] IP info saved to results/$ip/ipinfo.json${NC}"
    fi
}

# 🕵️ Onion Username Search
darknet_check() {
    read -p "🧅 Enter username for darknet search: " uname
    banner
    echo -e "${YELLOW}[~] Searching on Onion sites using Tor...${NC}"

    onion_sites=(
        "http://facebookcorewwwi.onion"
        "http://githubmsjjdfoe.onion"
        "http://protonirockerxow.onion"
        "http://darkfailllnkf4vf.onion"
    )

    for site in "${onion_sites[@]}"
    do
        url="$site/$uname"
        result=$(torsocks curl -s -o /dev/null -w "%{http_code}" "$url")
        if [ "$result" == "200" ]; then
            echo -e "${GREEN}[+] Found: $url${NC}"
            save_result "$uname" "[+] $url" "darknet"
        else
            echo -e "${RED}[-] Not found: $url${NC}"
        fi
    done
}

# 📋 Main Menu
while true; do
    banner
    echo -e "${YELLOW}
1️⃣  Username Recon
2️⃣  GeoSOCMINT (Location-Based)
3️⃣  IP Address Tracker
4️⃣  Darknet Username Search (Tor)
5️⃣  Start Tor Manually
0️⃣  Exit
${NC}"
    read -p "💡 Select option: " opt

    case "$opt" in
        1) username_check ;;
        2) geo_socmint ;;
        3) ip_tracker ;;
        4) darknet_check ;;
        5) start_tor ;;
        0) echo -e "${CYAN}👋 Exiting...${NC}"; killall tor 2>/dev/null; exit ;;
        *) echo -e "${RED}[!] Invalid option!${NC}" ;;
    esac

    read -p "🔁 Run another scan? (y/n): " again
    [[ "$again" != "y" ]] && echo -e "${CYAN}👋 Bye! All data saved in results/.${NC}" && break
done
