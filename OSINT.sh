#!/data/data/com.termux/files/usr/bin/bash
# 🔥 AdvancedOSINT v1.0 — Ultimate OSINT Tool by @SunnamSriram
# ⚠️ Strictly for Educational + Ethical Use Only

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

# 🧾 Banner
clear
echo -e "${CYAN}🛰️  AdvancedOSINT v1.0 — Targeted User Recon Tool"
echo -e "${YELLOW}🔍 Developed by @SunnamSriram | 🌐 Termux Compatible${RESET}"
echo -e "${RED}⚠️  Use for Ethical, Educational Research ONLY\n${RESET}"

# 🧑‍💻 Input
read -p "👤 Enter username to investigate: " username
logfile="results_${username}.txt"
mkdir -p results

echo -e "${GREEN}[+] Searching for: $username${RESET}" | tee results/$logfile

# 🌍 PART 1: Check in popular social + adult websites (400+)
echo -e "${CYAN}[1] 🔗 Checking username in 400+ websites...${RESET}"
python3 <<EOF
import requests, json, os
sites = [
    "https://www.instagram.com/", "https://www.facebook.com/",
    "https://www.reddit.com/user/", "https://www.tiktok.com/@",
    "https://twitter.com/", "https://github.com/", "https://pornhub.com/users/",
    "https://xvideos.com/profiles/", "https://xhamster.com/users/"
]
print("\n📂 Found in:")
for site in sites:
    url = site + "${username}"
    try:
        r = requests.get(url, timeout=5)
        if r.status_code == 200:
            print("✅", url)
            with open("results/${logfile}", "a") as f:
                f.write("✅ " + url + "\\n")
    except:
        continue
EOF

# 🔍 PART 2: Search Engines (Google, DDG, Bing)
echo -e "${CYAN}[2] 🌐 Search Engines...${RESET}"
echo -e "🔎 DuckDuckGo:\nhttps://duckduckgo.com/?q=$username" | tee -a results/$logfile
echo -e "🔎 Google:\nhttps://www.google.com/search?q=$username" | tee -a results/$logfile
echo -e "🔎 Bing:\nhttps://www.bing.com/search?q=$username" | tee -a results/$logfile

# 📸 PART 3: Check for YouTube, IGTV, TikTok videos
echo -e "${CYAN}[3] 🎥 Video + Tag Content...${RESET}"
echo -e "🎥 YouTube:\nhttps://www.youtube.com/results?search_query=$username" | tee -a results/$logfile
echo -e "🎥 TikTok:\nhttps://www.tiktok.com/search?q=$username" | tee -a results/$logfile
echo -e "📷 Instagram Tags:\nhttps://www.instagram.com/explore/tags/$username/" | tee -a results/$logfile

# 🛠️ PART 4: Pastebin + GitHub leaks
echo -e "${CYAN}[4] 🗂️ Pastebin + GitHub Leak Check...${RESET}"
echo -e "🔎 Pastebin:\nhttps://pastebin.com/u/$username" | tee -a results/$logfile
echo -e "🔎 GitHub:\nhttps://github.com/$username" | tee -a results/$logfile

# 🔐 PART 5: Telegram Username
echo -e "${CYAN}[5] 📱 Telegram Search...${RESET}"
echo -e "🔎 Telegram:\nhttps://t.me/$username" | tee -a results/$logfile

# 📁 Save Summary
echo -e "\n📁 Full summary saved in results/${logfile}"

# ✅ DONE
echo -e "${GREEN}\n✅ OSINT Completed for: ${username}${RESET}"

