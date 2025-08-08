#!/data/data/com.termux/files/usr/bin/bash
# ✅ FindUser_400_Fast.sh - Ultra Fast User Recon on 400+ Sites (Improved Detection)
# 🌐 Author: @SunnamSriram | 🛡️ Use only for ethical research & OSINT

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

# 🧑‍💻 Input
read -p "🔎 Enter username to check: " USERNAME
echo -e "\n🔍 Searching for user: ${YELLOW}$USERNAME${RESET} ...\n"
FOUND_FILE="found_${USERNAME}.txt"
> "$FOUND_FILE"  # clear previous results

# 🌐 URL list
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
)

# ⚙️ Parallel scan setup
MAX_THREADS=20
count=0

# 🔁 Loop through sites
for url in "${SITES[@]}"; do
  {
    page=$(curl -s --connect-timeout 5 --max-time 8 "$url")

    if [[ -z "$page" ]]; then
      echo -e "${RED}[NOT FOUND]${RESET} $url"
    elif echo "$page" | grep -qiE 'user not found|no such user|404 not found|profile not available|not exist|doesn.t exist'; then
      echo -e "${RED}[NOT FOUND]${RESET} $url"
    else
      echo -e "${GREEN}[FOUND]${RESET} $url"
      echo "$url" >> "$FOUND_FILE"
    fi
  } &

  ((count++))
  if (( count % MAX_THREADS == 0 )); then
    wait
  fi
done

wait

echo -e "\n✅ ${CYAN}Scan completed for: ${YELLOW}$USERNAME${RESET}"
echo -e "${GREEN}[✓] Found links saved to: ${YELLOW}$FOUND_FILE${RESET}"
