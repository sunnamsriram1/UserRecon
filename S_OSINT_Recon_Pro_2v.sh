#!/data/data/com.termux/files/usr/bin/bash
# 🔥 AdvancedOSINT Pro v3.0 — Full Recon Tool by @SunnamSriram
# ⚠️ For Legal & Educational Use Only

RED='\033[1;31m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; CYAN='\033[1;36m'; RESET='\033[0m'
clear
echo -e "${CYAN}🛰️  AdvancedOSINT Pro v3.0 — Full Recon Tool${RESET}"
echo -e "${YELLOW}🔍 Developed by @SunnamSriram | 🌐 Termux Ready${RESET}"
echo -e "${RED}⚠️ Use this tool for legal, educational OSINT ONLY\n${RESET}"

read -p "👤 Username: " username
read -p "📧 Email (optional): " email
read -p "📞 Phone (optional): " phone

mkdir -p results
logfile="results/results_${username}.txt"
echo -e "${GREEN}[+] Target: $username${RESET}" | tee "$logfile"

# --- Phase 1: Username on Social & Adult Platforms ---
echo -e "${CYAN}[1] 🌐 Checking Social & Adult Sites...${RESET}"

python3 <<EOF
import requests
import sys

username = "$username"
logfile = "$logfile"
sites = [
 "https://www.instagram.com/", "https://facebook.com/",
 "https://reddit.com/user/", "https://tiktok.com/@",
 "https://twitter.com/", "https://github.com/",
 "https://snapchat.com/add/", "https://linkedin.com/in/",
 "https://dev.to/", "https://about.me/", "https://t.me/",
 "https://onlyfans.com/", "https://fansly.com/", "https://xvideos.com/profiles/",
 "https://pornhub.com/users/", "https://xhamster.com/users/",
 "https://chaturbate.com/", "https://bdsmlr.com/", "https://stripchat.com/",
 "https://cam4.com/", "https://mydirtyhobby.com/profiles/",
 "https://xhamster19.com/pornstars/", "https://erome.com/a/",
 "https://fapello.com/", "https://slutload.com/users/", "https://manyvids.com/Profile/",
 "https://motherless.com/", "https://nudostar.com/", "https://nsfw.xxx/@",
 "https://nudogram.com/", "https://wikifeet.com/", "https://lustery.com/partners/",
 "https://replit.com/@", "https://leetcode.com/", "https://tryhackme.com/p/",
 "https://tnaflix.com/users/", "https://javhub.net/users/", "https://desixnxx.com/users/"
]

for site in sites:
    url = site + username
    try:
        r = requests.get(url, timeout=6)
        if r.status_code == 200:
            print("✅ Found:", url)
            with open(logfile, "a") as f:
                f.write("✅ Found: " + url + "\\n")
    except:
        continue
EOF

# --- Phase 2: Search Engine Dorks ---
echo -e "${CYAN}[2] 🔍 Search Engine Dorks...${RESET}" | tee -a "$logfile"
echo "🔎 Google: https://www.google.com/search?q=$username" | tee -a "$logfile"
echo "🔎 Bing: https://www.bing.com/search?q=$username" | tee -a "$logfile"
echo "🔎 DuckDuckGo: https://duckduckgo.com/?q=$username" | tee -a "$logfile"

# --- Phase 3: Tags/Video OSINT ---
echo -e "${CYAN}[3] 🎥 Video/Tag Based OSINT...${RESET}" | tee -a "$logfile"
echo "📸 Instagram Tags: https://www.instagram.com/explore/tags/$username/" | tee -a "$logfile"
echo "🎥 YouTube Search: https://youtube.com/results?search_query=$username" | tee -a "$logfile"
echo "🎵 TikTok Search: https://www.tiktok.com/search?q=$username" | tee -a "$logfile"

# --- Phase 4: Leaks + Pastebin + GitHub ---
echo -e "${CYAN}[4] 🧾 Leaks & Pastebin...${RESET}" | tee -a "$logfile"
echo "🔎 GitHub: https://github.com/$username" | tee -a "$logfile"
echo "🔎 Pastebin: https://pastebin.com/u/$username" | tee -a "$logfile"
echo "🔎 Dehashed: https://dehashed.com/search?query=$username" | tee -a "$logfile"

# --- Phase 5: Reverse Email Lookup ---
if [[ $email != "" ]]; then
 echo -e "${CYAN}[5] 📧 Email Lookup...${RESET}" | tee -a "$logfile"
 echo "🔍 Email Google: https://www.google.com/search?q=$email" | tee -a "$logfile"
 echo "🔍 Email Leak: https://haveibeenpwned.com/unifiedsearch/$email" | tee -a "$logfile"
 echo "🔍 Email Pastebin: https://pastebin.com/search?q=$email" | tee -a "$logfile"
fi

# --- Phase 6: Phone Search ---
if [[ $phone != "" ]]; then
 echo -e "${CYAN}[6] 📞 Phone Lookup...${RESET}" | tee -a "$logfile"
 echo "🔍 Truecaller: https://www.truecaller.com/search/in/$phone" | tee -a "$logfile"
 echo "🔍 Google: https://www.google.com/search?q=$phone" | tee -a "$logfile"
 echo "🔍 Sync.me: https://sync.me/search/$phone" | tee -a "$logfile"
 echo "🔍 WhosNumber: https://whosnumber.com/$phone" | tee -a "$logfile"
fi

# --- Phase 7: News Search ---
echo -e "${CYAN}[7] 📰 News Mentions...${RESET}" | tee -a "$logfile"
echo "🗞️ Google News: https://news.google.com/search?q=$username" | tee -a "$logfile"
echo "🗞️ Bing News: https://www.bing.com/news/search?q=$username" | tee -a "$logfile"

# --- Phase 8: Forums + Deep Web ---
echo -e "${CYAN}[8] 🕵️ Forums & DeepWeb...${RESET}" | tee -a "$logfile"
echo "🌐 Reddit: https://reddit.com/user/$username" | tee -a "$logfile"
echo "🌐 4chan Search: https://4chansearch.com/search?q=$username" | tee -a "$logfile"
echo "🌐 Telegram: https://t.me/$username" | tee -a "$logfile"

# --- Phase 9: People Search ---
echo -e "${CYAN}[9] 🧠 People Finder...${RESET}" | tee -a "$logfile"
echo "🔍 PeekYou: https://www.peekyou.com/$username" | tee -a "$logfile"
echo "🔍 Spokeo: https://www.spokeo.com/$username" | tee -a "$logfile"
echo "🔍 Whitepages: https://www.whitepages.com/name/$username" | tee -a "$logfile"

# --- Final Report ---
echo -e "${GREEN}\n✅ OSINT Scan Completed for $username${RESET}"
echo -e "📁 Saved at: ${YELLOW}$logfile${RESET}"
