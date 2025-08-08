#!/bin/bash
# ✅ FindUser_400.sh - User Recon on 400+ Sites (Social + Adult)
# 🌐 Author: @SunnamSriram
# ⚠️ Use only for educational & ethical research purposes

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 🧼 Clear and Banner
clear
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

             v1. Codded by Sunnam_Sriram
EOF
echo -e "${NC}"

# 🔍 Username input
read -p "🔎 Enter username to check: " USERNAME
echo -e "\n🔍 Searching for user: ${YELLOW}$USERNAME${NC} ...\n"

# 🌐 Sites List (70+ examples shown)
SITES=(
"https://facebook.com/$USERNAME"
"https://instagram.com/$USERNAME"
"https://twitter.com/$USERNAME"
"https://youtube.com/$USERNAME"
"https://t.me/$USERNAME"
"https://linkedin.com/in/$USERNAME"
"https://github.com/$USERNAME"
"https://pinterest.com/$USERNAME"
"https://snapchat.com/add/$USERNAME"
"https://reddit.com/user/$USERNAME"
"https://medium.com/@$USERNAME"
"https://soundcloud.com/$USERNAME"
"https://dev.to/$USERNAME"
"https://flickr.com/people/$USERNAME"
"https://vk.com/$USERNAME"
"https://tumblr.com/$USERNAME"
"https://imgur.com/user/$USERNAME"
"https://mastodon.social/@$USERNAME"
"https://kaggle.com/$USERNAME"
"https://quora.com/profile/$USERNAME"
"https://dribbble.com/$USERNAME"
"https://behance.net/$USERNAME"
"https://500px.com/$USERNAME"
"https://replit.com/@$USERNAME"
"https://hackerrank.com/$USERNAME"
"https://leetcode.com/$USERNAME"
"https://bitbucket.org/$USERNAME"
"https://codepen.io/$USERNAME"
"https://twitch.tv/$USERNAME"
"https://tryhackme.com/p/$USERNAME"
"https://hub.docker.com/u/$USERNAME"
"https://ask.fm/$USERNAME"
"https://about.me/$USERNAME"
"https://steamcommunity.com/id/$USERNAME"
"https://keybase.io/$USERNAME"
"https://strava.com/athletes/$USERNAME"
"https://cash.app/$USERNAME"
"https://venmo.com/$USERNAME"
"https://bandcamp.com/$USERNAME"
"https://flipboard.com/@$USERNAME"
"https://x.com/$USERNAME"

# 🔞 Adult Sites (partial list)
"https://xvideos.com/profiles/$USERNAME"
"https://xvideos.com/search/$USERNAME"
"https://www.xnxx.com/search/$USERNAME"
"https://www.xnxx.com/profiles/$USERNAME"
"https://www.sexvid.porn/s/$USERNAME"
"https://www.sexvid.porn/search/$USERNAME"
"https://www.sexvid.porn/profiles/$USERNAME"
"https://pornhub.com/users/$USERNAME"
"https://pornhub.com/search/$USERNAME"
"https://pornhub.com/profiles/$USERNAME"
"https://xhamster.desi/search/$USERNAME"
"https://xhamster.desi/profiles/$USERNAME"
"https://xhamster.desi/pornstars/$USERNAME"
"https://xhamster.com/users/$USERNAME"
"https://xhamster.com/search/$USERNAME"
"https://xhamster.com/profiles/$USERNAME"
"https://xvideos.com/$USERNAME"
"https://www.pornhub.org/video/search?search/$USERNAME"
"https://www.sexvid.porn/pornstars/$USERNAME"
"https://www.xvideos.com/channels/$USERNAME"
"https://xvideos.com/profiles/$USERNAME"
"https://www.xnxx.com/search/$USERNAME"
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
"https://nsfw.xxx/@$USERNAME"
"https://nudogram.com/$USERNAME"
"https://wikifeet.com/$USERNAME"
"https://xrares.com/@$USERNAME"
"https://lustery.com/partners/$USERNAME"
"https://javhub.net/users/$USERNAME"
"https://porn.com/users/$USERNAME"
"https://beeg.com/users/$USERNAME"
"https://sextvx.com/users/$USERNAME"
"https://pornflip.com/users/$USERNAME"
)

# 🔁 Scan loop
for url in "${SITES[@]}"; do
    full_url="${url//$USERNAME/$USERNAME}"
    domain=$(echo "$full_url" | awk -F/ '{print $3}' | sed 's/www.//g')
    response=$(curl -s -o /dev/null -w "%{http_code}" "$full_url")

    echo -ne "${YELLOW}$domain${NC} → "
    if [[ $response == 200 || $response == 301 || $response == 302 ]]; then
        echo -e "${GREEN}[FOUND]${NC} $full_url"
    else
        echo -e "${RED}[NOT FOUND]${NC} $full_url"
    fi
done

# ✅ Final Message
echo -e "\n✅ Scan completed for: ${YELLOW}$USERNAME${NC}"
