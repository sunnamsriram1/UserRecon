#!/bin/bash
# ✅ FindUser_400_Full.sh - Advanced Username Recon Tool
# 🔐 Coded & Enhanced by @SunnamSriram
# ⚠️ Use only for educational & ethical security research

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# 🌐 URL List (Minimal demo; add more as needed)
SITES=(
    "https://www.instagram.com"
    "https://www.youtube.com"
    "https://www.facebook.com"
    "https://www.twitter.com"
    "https://www.reddit.com/user"
    "https://www.pinterest.com"
    "https://www.tiktok.com/@"
    "https://soundcloud.com"
    "https://www.github.com"
)

# 🔍 Function to check username
check_user() {
    local user="$1"
    echo -e "${CYAN}🔍 Searching for username: ${YELLOW}$user${RESET}"
    echo "---------------------------------------------------"

    for site in "${SITES[@]}"; do
        fullurl="$site/$user"

        # 🕵️ Search URL exists check via curl
        response=$(curl -s -o /dev/null -w "%{http_code}" "$fullurl")

        if [[ "$response" =~ ^2|3 ]]; then
            echo -e "${GREEN}✔️ Found on: $fullurl${RESET}"

            # 🎥 Image/Video/Tag Check (Search page or API)
            if [[ "$site" =~ "youtube" ]]; then
                echo -e "    🎞️ Checking YouTube Videos..."
                yturl="https://www.youtube.com/results?search_query=$user"
                if curl -s "$yturl" | grep -iq "$user"; then
                    echo -e "    🔎 Videos Found: ${GREEN}Yes${RESET}"
                else
                    echo -e "    🔎 Videos Found: ${RED}No${RESET}"
                fi
            elif [[ "$site" =~ "instagram" ]]; then
                echo -e "    🖼️ Checking Instagram Tags..."
                tagurl="https://www.instagram.com/explore/tags/$user/"
                if curl -s "$tagurl" | grep -iq "$user"; then
                    echo -e "    🔖 Tagged Posts Found: ${GREEN}Yes${RESET}"
                else
                    echo -e "    🔖 Tagged Posts Found: ${RED}No${RESET}"
                fi
            fi

        else
            echo -e "${RED}❌ Not Found on: $site${RESET}"
        fi
        sleep 1
    done
    echo "---------------------------------------------------"
}

# 📥 Input username
if [[ -z "$1" ]]; then
    echo -e "${YELLOW}❌ Usage: bash $0 <username>${RESET}"
    exit 1
fi

USERNAME="$1"
check_user "$USERNAME"
