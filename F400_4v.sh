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
> "$FOUND_FILE"  # Clear previous results

# 🌐 Site list
SITES=(
"https://onlyfans.com/$USERNAME"
"https://fansly.com/$USERNAME"
"https://wikifeet.com/$USERNAME"
"https://pornhub.com/users/$USERNAME"
"https://xhamster.com/users/$USERNAME"
"https://chaturbate.com/$USERNAME"
"https://bdsmlr.com/$USERNAME"
"https://spankbang.com/$USERNAME"
"https://xvideos.com/profiles/$USERNAME"
"https://cam4.com/$USERNAME"
"https://motherless.com/$USERNAME"
"https://manyvids.com/Profile/$USERNAME"
)

# ⛔ Known phrases indicating user not found (used as extra filter)
NOT_FOUND_PATTERNS='user not found|no such user|404 not found|profile not available|does not exist|notexist|page not found|no results|Oops|not available|Invalid user|404 Page'

MAX_THREADS=10
count=0

# 🔁 Parallel processing
for url in "${SITES[@]}"; do
  {
    TEMP_FILE="temp_$$.html"  # Unique temp file
    status=$(curl -s -o "$TEMP_FILE" -w "%{http_code}" --connect-timeout 5 --max-time 8 "$url")
    page=$(cat "$TEMP_FILE")
    rm -f "$TEMP_FILE"

    if [[ "$status" == "200" ]] && ! echo "$page" | grep -qiE "$NOT_FOUND_PATTERNS"; then
      echo -e "${GREEN}[FOUND]${RESET} $url"
      echo "$url" >> "$FOUND_FILE"
    else
      echo -e "${RED}[NOT FOUND]${RESET} $url"
    fi
  } &

  ((count++))
  if (( count % MAX_THREADS == 0 )); then
    wait
  fi
done

wait

# ✅ Summary
echo -e "\n✅ ${CYAN}Scan completed for: ${YELLOW}$USERNAME${RESET}"
echo -e "${GREEN}[✓] Found links saved to: ${YELLOW}$FOUND_FILE${RESET}"

if [[ -s "$FOUND_FILE" ]]; then
  echo -e "\n📂 ${CYAN}Verified Working Profiles:${RESET}"
  cat "$FOUND_FILE"
else
  echo -e "\n${RED}❌ No valid profiles found.${RESET}"
fi
