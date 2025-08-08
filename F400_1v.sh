#!/data/data/com.termux/files/usr/bin/bash
# ✅ FindUser_400_Fast.sh - Ultra Fast User Recon on 400+ Sites
# 🌐 Author: @SunnamSriram | 🛡️ Use for ethical research only

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

clear
echo -e "${YELLOW}\n>>> Please turn on Data connection to get correct results <<<${RESET}"
sleep 1

# 🔥 Banner
echo -e "${CYAN}"
cat << "EOF"
     ___  _           _         _   _                 
    | __|(_)__ _ _ __| |_  ___ | | | |___ _ _ _  _ ___
    | _| | / _` | '_ \ ' \/ -_)| |_| / _ \ '_| || (_-<
    |_| |_|_\__,_| .__/_||_\___| \___/\___/_|  \_,_/__/
               |_|    v1.0 Fast Recon by @SunnamSriram
EOF
echo -e "${RESET}"

# 🧑‍💻 Input Username
read -p "🔎 Enter username to check: " USERNAME
echo -e "\n🔍 Searching for user: ${YELLOW}$USERNAME${RESET} ...\n"

# 🌐 Sites to check
SITES=(
"https://xvideos.com/profiles/$USERNAME"
"https://www.xnxx.com/search/$USERNAME"
"https://www.sexvid.porn/s/$USERNAME"
"https://pornhub.com/users/$USERNAME"
"https://xhamster.com/users/$USERNAME"
"https://xhamster.desi/pornstars/$USERNAME"
"https://qorno.com/pornstar/$USERNAME"
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
# ✅ You can add more URLs (Social, Developer, Gaming, etc)
)

# ⚙️ Parallel Settings
MAX_THREADS=20
count=0

# 🔄 Start loop
for url in "${SITES[@]}"; do
  {
    # Check with curl and timeout
    response=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 3 --max-time 5 "$url")
    
    if [[ $response == 200 || $response == 301 || $response == 302 ]]; then
      echo -e "${GREEN}[FOUND]${RESET} $url"
    else
      echo -e "${RED}[NOT FOUND]${RESET} $url"
    fi
  } &
  
  ((count++))
  if (( count % MAX_THREADS == 0 )); then
    wait  # Wait after every MAX_THREADS
  fi
done

wait  # Final wait for all background jobs to finish
echo -e "\n✅ ${CYAN}Scan completed for: ${YELLOW}$USERNAME${RESET}"
