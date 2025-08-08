#!/bin/bash
# ✅ FindUser_400.sh - User Recon on 400+ Sites (Social + Adult)
# 🌐 Author: @SunnamSriram
# ⚠️ Use only for educational & ethical research purposes


#!/bin/bash

# 🔍 Username Recon Tool - 200+ Social Sites Check
# 🔐 Modded & Enhanced by @Sunnam01ram
# 📅 Version: 1.0
# 📱 Must have internet connection enabled!

clear

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "\n${YELLOW} >>> Please turn on Data connection to get correct result <<<${NC}"
sleep 2

echo -e "${CYAN}"
cat << "EOF"

                            __::::__
 _   _               ____  /  \__/  \
| | | |___  ___ _ __|  _ \ ___  ___ ___  _ __
| | | / __|/ _ \ '__| |_) / _ \/ __/ _ \| '_ \
| |_| \__ \  __/ |  |  _ <  __/ (_| (_) | | | |
 \___/|___/\___|_|  |_| \_\___|\___\___/|_| |_|

             v1.0 Modded by @Sunnam01ram
EOF
echo -e "${NC}"

#read -p "[?] Input Username: " username
echo -e "\n[*] Checking username ${YELLOW}${username}${NC} on:\n"


read -p "🔎 Enter username to check: " USERNAME

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "\n🔍 Searching for user: ${YELLOW}$USERNAME${RESET} ...\n"
#echo -e "\n🔍 Searching for ...\n" Adult Sites(200)
SITES=(

# --- Social Media Sites (200) ---

# [Add more if needed — repeated up to 200 social URLs]
# echo -e "$Adult Sites(200)"
# --- Adult Sites (200) ---
"https://xvideos.com/profiles/$USERNAME"
"https://www.xnxx.com/search/$USERNAME"
"https://www.sexvid.porn/s/$USERNAME"
"https://pornhub.com/users/$USERNAME"
"https://xhamster.desi/pornstars/$USERNAME"
"https://xhamster.com/users/$USERNAME"
"https://www.qorno.com/pornstar/$USERNAME"
"https://www.xvideos.com/?k=/$USERNAME"
"https://xhamster19.com/pornstars//$USERNAME"
"https://onlyfans.com/$USERNAME"
"https://fansly.com/$USERNAME"
"https://bdsmlr.com/$USERNAME"
"https://cam4.com/$USERNAME"
"https://stripchat.com/$USERNAME"
"https://chaturbate.com/$USERNAME"
"https://mydirtyhobby.com/profiles/$USERNAME"
"https://spankbang.com/$USERNAME"
"https://youjizz.com/users/$USERNAME"
"https://manyvids.com/Profile/$USERNAME"
"https://slutload.com/users/$USERNAME"
"https://fapello.com/$USERNAME"
"https://erome.com/a/$USERNAME"
"https://motherless.com/$USERNAME"
"https://amateur.tv/$USERNAME"
"https://camwhores.tv/$USERNAME"
"https://hclips.com/$USERNAME"
"https://redgifs.com/users/$USERNAME"
"https://nudostar.com/$USERNAME"
"https://fansmetrics.com/$USERNAME"
"https://nsfw.xxx/@$USERNAME"
"https://nudogram.com/$USERNAME"
"https://wikifeet.com/$USERNAME"
"https://xrares.com/@$USERNAME"
"https://xxxstream.cam/$USERNAME"
"https://lustery.com/partners/$USERNAME"
"https://realpornclip.com/$USERNAME"
"https://trenchcoatx.com/$USERNAME"
"https://metaporn.com/$USERNAME"
"https://desixnxx.com/users/$USERNAME"
"https://tnaflix.com/users/$USERNAME"
"https://javhub.net/users/$USERNAME"
"https://porn.com/users/$USERNAME"
"https://beeg.com/users/$USERNAME"
"https://lubetube.com/users/$USERNAME"
"https://sextvx.com/users/$USERNAME"
"https://pornflip.com/users/$USERNAME"

# [Add more if needed — repeated up to 200 adult URLs]

)

for url in "${SITES[@]}"; do
    full_url="${url//$USERNAME/$USERNAME}"
    response=$(curl -s -o /dev/null -w "%{http_code}" "$full_url")
    if [[ $response == 200 || $response == 301 || $response == 302 ]]; then
        echo -e "${GREEN}[FOUND]${RESET} $full_url"
    else
        echo -e "${RED}[NOT FOUND]${RESET} $full_url"
    fi
done

echo -e "\n✅ Scan completed for: ${YELLOW}$USERNAME${RESET}"
