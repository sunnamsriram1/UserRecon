#!/bin/bash
# 🔍 OSINT_Recon_Pro.sh - Advanced User Recon & Tag Tracker
# 🌐 By @SunnamSriram | v1.0 | 2025

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m'

clear
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " 🔍 ${CYAN}OSINT Recon Pro Tool v1.0${NC}"
echo -e " 🧠 ${GREEN}By @SunnamSriram"
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

read -p "👤 Enter Username: " username
read -p "📞 Enter Phone Number (optional): " phone
read -p "📧 Enter Email (optional): " email

echo -e "\n🔎 ${YELLOW}Searching Social, Adult & Deep Web profiles for '$username'...${NC}"
echo

sites=(
"https://www.instagram.com/$username"
"https://www.facebook.com/$username"
"https://www.twitter.com/$username"
"https://www.youtube.com/$username"
"https://www.reddit.com/user/$username"
"https://www.tiktok.com/@$username"
"https://www.github.com/$username"
"https://www.pinterest.com/$username"
"https://www.medium.com/@$username"
"https://www.quora.com/profile/$username"
"https://www.tumblr.com/$username"
"https://www.snapchat.com/add/$username"
"https://www.vimeo.com/$username"
"https://www.pornhub.com/users/$username"
"https://www.xvideos.com/profiles/$username"
"https://onlyfans.com/$username"
"https://www.flickr.com/people/$username"
"https://www.deviantart.com/$username"
"https://soundcloud.com/$username"
"https://steamcommunity.com/id/$username"
)

for url in "${sites[@]}"; do
  response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [[ $response == 200 ]]; then
    echo -e "${GREEN}[✔] Found: $url${NC}"
  else
    echo -e "${RED}[✘] Not Found: $url${NC}"
  fi
done

# 📧 Email Reverse Lookup (basic)
if [[ $email != "" ]]; then
  echo -e "\n📧 ${BLUE}Checking email leaks (via Google dork)...${NC}"
  echo "[*] Search: site:pastebin.com \"$email\""
  echo "[*] Search: site:reddit.com \"$email\""
  echo "[*] Search: site:haveibeenpwned.com \"$email\""
  echo
fi

# 📞 Phone Number OSINT
if [[ $phone != "" ]]; then
  echo -e "\n📞 ${BLUE}Checking phone presence...${NC}"
  echo "[*] Search: site:truecaller.com \"$phone\""
  echo "[*] Search: site:facebook.com \"$phone\""
  echo "[*] Search: site:whocallsyou.de \"$phone\""
  echo "[*] Google: \"$phone\""
  echo
fi

# 🏠 Home/Company Address Check (Google Dorks)
echo -e "\n🏠 ${CYAN}Possible address/company links:${NC}"
echo "[*] Google: \"$username\" site:linkedin.com"
echo "[*] Google: \"$username\" site:zoominfo.com"
echo "[*] Google: \"$username\" site:opencorporates.com"
echo "[*] Google: \"$username address\""
echo "[*] Google: \"$username location\""

echo -e "\n📝 ${YELLOW}Tip: Use tools like Sherlock, Maigret, SpiderFoot, Photon for more automation.${NC}"
echo -e "${GREEN}🔚 Done - Check above results and run Google Dorks manually for deep scan.${NC}"
