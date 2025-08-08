#!/data/data/com.termux/files/usr/bin/bash
# 🔥 AdvancedOSINT Pro v2.0 — Enhanced OSINT Tool by @SunnamSriram
# ⚠️ Strictly for Educational + Ethical Use Only

RED='\033[1;31m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; CYAN='\033[1;36m'; RESET='\033[0m'
clear
echo -e "${CYAN}🛰️  AdvancedOSINT v2.0 — Deep Recon Tool${RESET}"
echo -e "${YELLOW}🔍 Developed by @SunnamSriram | 🌐 Termux Ready${RESET}"
echo -e "${RED}⚠️ Use this tool for legal, educational OSINT ONLY\n${RESET}"

read -p "👤 Username: " username
read -p "📧 Email (optional): " email
read -p "📞 Phone (optional): " phone

logfile="results/results_${username}.txt"
mkdir -p results
echo -e "${GREEN}[+] Target: $username${RESET}" | tee "$logfile"

echo -e "${CYAN}[1] 🌐 Social + Adult Sites...${RESET}"
python3 <<EOF
import requests
sites = [
 "https://www.instagram.com/", "https://facebook.com/",
 "https://reddit.com/user/", "https://tiktok.com/@",
 "https://twitter.com/", "https://github.com/",
 "https://pornhub.com/users/", "https://xvideos.com/profiles/",
 "https://xhamster.com/users/", "https://onlyfans.com/",
 "https://chaturbate.com/", "https://snapchat.com/add/"
]
for site in sites:
 url = site + "$username"
 try:
  r = requests.get(url, timeout=5)
  if r.status_code == 200:
   print("✅ Found:", url)
   with open("$logfile", "a") as f:
    f.write("✅ Found: " + url + "\\n")
 except:
  continue
EOF

# PART 2: Search Engines
echo -e "${CYAN}[2] 🔍 Search Engine Dorks...${RESET}" | tee -a "$logfile"
echo "🔎 Google: https://www.google.com/search?q=$username" | tee -a "$logfile"
echo "🔎 Bing: https://www.bing.com/search?q=$username" | tee -a "$logfile"
echo "🔎 DuckDuckGo: https://duckduckgo.com/?q=$username" | tee -a "$logfile"

# PART 3: Video & Tag Content
echo -e "${CYAN}[3] 🎥 Video/Tag OSINT...${RESET}"
echo "🎥 YouTube: https://youtube.com/results?search_query=$username" | tee -a "$logfile"
echo "📸 Instagram Tags: https://www.instagram.com/explore/tags/$username/" | tee -a "$logfile"
echo "🎵 TikTok Search: https://www.tiktok.com/search?q=$username" | tee -a "$logfile"

# PART 4: Leak Check
echo -e "${CYAN}[4] 🧾 Leaks & GitHub/Pastebin...${RESET}"
echo "🔎 GitHub: https://github.com/$username" | tee -a "$logfile"
echo "🔎 Pastebin: https://pastebin.com/u/$username" | tee -a "$logfile"
echo "🔎 Search Leaks: https://dehashed.com/search?query=$username" | tee -a "$logfile"

# PART 5: Reverse Email Lookup
if [[ $email != "" ]]; then
 echo -e "${CYAN}[5] 📧 Reverse Email Lookup...${RESET}"
 echo "🔍 Email Google: https://www.google.com/search?q=$email" | tee -a "$logfile"
 echo "🔍 Email Leak: https://haveibeenpwned.com/unifiedsearch/$email" | tee -a "$logfile"
 echo "🔍 Email Pastebin: https://pastebin.com/search?q=$email" | tee -a "$logfile"
fi

# PART 6: Phone OSINT
if [[ $phone != "" ]]; then
 echo -e "${CYAN}[6] 📞 Phone Number Search...${RESET}"
 echo "🔍 Truecaller: https://www.truecaller.com/search/in/$phone" | tee -a "$logfile"
 echo "🔍 Google: https://www.google.com/search?q=$phone" | tee -a "$logfile"
 echo "🔍 Whosnumber: https://whosnumber.com/$phone" | tee -a "$logfile"
 echo "🔍 Sync.me: https://sync.me/search/$phone" | tee -a "$logfile"
fi

# PART 7: News Articles
echo -e "${CYAN}[7] 📰 News Mentions...${RESET}"
echo "🗞️ Google News: https://news.google.com/search?q=$username" | tee -a "$logfile"
echo "🗞️ Bing News: https://www.bing.com/news/search?q=$username" | tee -a "$logfile"

# PART 8: Forums + DeepWeb hints
echo -e "${CYAN}[8] 🕵️ Deep Web & Forum Trails...${RESET}"
echo "🌐 4chan Search: https://4chansearch.com/search?q=$username" | tee -a "$logfile"
echo "🌐 Reddit Search: https://reddit.com/user/$username" | tee -a "$logfile"
echo "🌐 Telegram: https://t.me/$username" | tee -a "$logfile"

# PART 9: People Search Engines
echo -e "${CYAN}[9] 🧠 People Search...${RESET}"
echo "🔍 PeekYou: https://www.peekyou.com/$username" | tee -a "$logfile"
echo "🔍 Spokeo: https://www.spokeo.com/$username" | tee -a "$logfile"
echo "🔍 Whitepages: https://www.whitepages.com/name/$username" | tee -a "$logfile"

# PART 10: Final Message
echo -e "${GREEN}\n✅ Completed OSINT Scan for $username"
echo -e "📁 Results saved in: $logfile${RESET}"
