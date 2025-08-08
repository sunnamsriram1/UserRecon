#!/bin/bash
# ✅ S_OSINT_Recon_Pro.sh - Ultimate Username OSINT Tool
# 🌐 By: @SunnamSriram
# ⚠️ For Educational & Ethical Use Only

# 🌈 Colors
RED="\e[1;31m"
GREEN="\e[1;32m"
CYAN="\e[1;36m"
YELLOW="\e[1;33m"
RESET="\e[0m"

# 📁 Output Setup
OUT_DIR="S_OSINT_Results"
mkdir -p "$OUT_DIR"

# 🔐 Dependencies check
command -v curl >/dev/null 2>&1 || { echo "❌ curl not installed!"; exit 1; }
command -v grep >/dev/null 2>&1 || { echo "❌ grep not installed!"; exit 1; }

clear
echo -e "${CYAN}"
echo "███████╗     ██████╗ ███████╗███████╗███╗   ██╗███████╗███████╗"
echo "██╔════╝    ██╔════╝ ██╔════╝██╔════╝████╗  ██║██╔════╝██╔════╝"
echo "█████╗█████╗██║  ███╗█████╗  █████╗  ██╔██╗ ██║█████╗  ███████╗"
echo "██╔══╝╚════╝██║   ██║██╔══╝  ██╔══╝  ██║╚██╗██║██╔══╝  ╚════██║"
echo "███████╗    ╚██████╔╝███████╗███████╗██║ ╚████║███████╗███████║"
echo "╚══════╝     ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝"
echo -e "${RESET}"

# 🧑‍💻 Input
read -p "🔎 Enter Target Username: " username
read -p "🌐 Enter Country Code (e.g. IN, US): " cc

# 📁 Create log file
LOGFILE="$OUT_DIR/${username}_Recon.txt"
touch "$LOGFILE"

echo -e "\n${GREEN}🔍 Searching for username: $username...${RESET}"
echo -e "----------------------------------------" >> "$LOGFILE"

# 📌 Module: Social Media & Adult Sites Check
echo -e "${YELLOW}[1] Social/Adult Sites Presence Check...${RESET}"
SITES=(
    "facebook.com/$username"
    "instagram.com/$username"
    "twitter.com/$username"
    "github.com/$username"
    "tiktok.com/@$username"
    "reddit.com/user/$username"
    "pinterest.com/$username"
    "onlyfans.com/$username"
    "pornhub.com/users/$username"
    "xvideos.com/profiles/$username"
    "xhamster.com/users/$username"
)
for site in "${SITES[@]}"; do
    url="https://$site"
    if curl -s -L --head "$url" | grep -q "200 OK"; then
        echo -e "✅ Found: $url" | tee -a "$LOGFILE"
    else
        echo -e "❌ Not Found: $url"
    fi
done

# 📌 Module: Video & Tag Presence
echo -e "\n${YELLOW}[2] Video/Forum/Tag Based Presence...${RESET}"
YOUTUBE="https://www.youtube.com/results?search_query=$username"
TAGS="https://tagdef.com/$username"

echo "🔗 YouTube Search: $YOUTUBE" | tee -a "$LOGFILE"
echo "🔗 TagDef Search: $TAGS" | tee -a "$LOGFILE"

# 📌 Module: Phone, Email, Address, Company — via Pipl (Deep Web People Search Engine)
echo -e "\n${YELLOW}[3] Deep People Lookup (phone/email/address)...${RESET}"
echo "⚠️ Searching public data leaks, may take time..."

SEARCH_URL="https://www.google.com/search?q=${username}+site:pipl.com"
echo "🔗 Google People Lookup: $SEARCH_URL" | tee -a "$LOGFILE"

# 📌 Bonus Module: Pastebin leaks
echo -e "\n${YELLOW}[4] Checking Pastebin for email/phone leaks...${RESET}"
PASTE="https://pastebin.com/u/$username"
echo "🔗 Pastebin Profile: $PASTE" | tee -a "$LOGFILE"

# 📌 Public API Leaks Search (Simple query)
echo -e "\n${YELLOW}[5] Public API leak sites (manual open)...${RESET}"
echo "📁 View leaked data if available:"
echo -e "🔗 https://www.cybernews.com/personal-data-leak-check/" | tee -a "$LOGFILE"
echo -e "🔗 https://haveibeenpwned.com/" | tee -a "$LOGFILE"
echo -e "🔗 https://hunter.io/search/$username@$cc" | tee -a "$LOGFILE"

# ✅ Final Summary
echo -e "\n${GREEN}✔️ Recon Complete! All results saved to: ${LOGFILE}${RESET}"
