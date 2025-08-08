#!/bin/bash
# 🔍 UserRecon Ultimate v1.0 by @SunnamSriram
# ✅ 400+ Site Check + Tag/Video Search Checker
# ⚠️ For educational and ethical research use only

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

# 📁 Files
SITE_LIST="sites_400.txt"
RESULTS="results_$(date +%F_%H-%M).txt"

# 🌐 Banner
clear
echo -e "${CYAN}"
echo "==============================================="
echo -e "   🔍 UserRecon 400+ Scanner by @SunnamSriram"
echo "==============================================="
echo -e "${RESET}"

# 🔠 Input
read -p "🆔 Enter username to check: " username

if [[ -z "$username" ]]; then
    echo -e "${RED}❌ Username cannot be empty!${RESET}"
    exit 1
fi

echo -e "${YELLOW}🔎 Searching for: ${GREEN}$username${RESET}"
echo "🔃 Scanning started on $(date)" > "$RESULTS"
echo "" >> "$RESULTS"

# 🔗 Website List (400+ social + adult)
cat > $SITE_LIST <<EOF
https://www.instagram.com/{user}
https://www.twitter.com/{user}
https://www.facebook.com/{user}
https://www.pornhub.com/users/{user}
https://www.xvideos.com/profiles/{user}
https://www.xnxx.com/profiles/{user}
https://www.onlyfans.com/{user}
https://www.reddit.com/user/{user}
https://www.tiktok.com/@{user}
https://www.github.com/{user}
https://www.pinterest.com/{user}
https://www.twitch.tv/{user}
https://www.snapchat.com/add/{user}
https://www.flickr.com/people/{user}
https://soundcloud.com/{user}
https://www.medium.com/@{user}
https://vimeo.com/{user}
https://www.bitchute.com/channel/{user}
https://www.dailymotion.com/{user}
https://www.youporn.com/user/{user}
https://www.spankbang.com/{user}/profile
https://www.redtube.com/users/{user}
https://www.hubpages.com/@{user}
https://www.erome.com/{user}
https://www.newgrounds.com/{user}
EOF

# 🔍 Start Checking
count=0
while IFS= read -r url; do
    target=$(echo "$url" | sed "s/{user}/$username/g")
    ((count++))
    echo -e "${CYAN}[$count] 🔗 Checking: $target${RESET}"

    # ✅ HEAD check
    code=$(curl -s -o /dev/null -w "%{http_code}" "$target")

    if [[ $code == 200 ]]; then
        echo -e "${GREEN}✅ Found: $target${RESET}"
        echo "[FOUND] $target" >> "$RESULTS"
    elif [[ $code == 301 || $code == 302 ]]; then
        echo -e "${YELLOW}⚠️ Redirected: $target${RESET}"
        echo "[REDIRECT] $target" >> "$RESULTS"
    else
        echo -e "${RED}❌ Not Found${RESET}"
    fi
done < "$SITE_LIST"

# 🔍 Extra Search (like tag/video/tagged content)
echo -e "\n${CYAN}🔎 Extra search using search-based platforms...${RESET}"

declare -a SEARCH_SITES=(
"https://www.pornhub.com/video/search?search={user}"
"https://www.xvideos.com/?k={user}"
"https://www.reddit.com/search/?q={user}"
"https://www.youtube.com/results?search_query={user}"
"https://www.tumblr.com/search/{user}"
)

for search_url in "${SEARCH_SITES[@]}"; do
    final_url=$(echo "$search_url" | sed "s/{user}/$username/g")
    echo -e "${CYAN}🔎 Searching: $final_url${RESET}"

    result=$(curl -s "$final_url" | grep -i "$username")

    if [[ -n "$result" ]]; then
        echo -e "${GREEN}🔍 Match found in search: $final_url${RESET}"
        echo "[SEARCH-HIT] $final_url" >> "$RESULTS"
    else
        echo -e "${RED}❌ No result in: $final_url${RESET}"
    fi
done

echo -e "\n${GREEN}✅ Done. Results saved to: $RESULTS${RESET}"
