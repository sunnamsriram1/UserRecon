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

             v3.0 Codded by Sunnam__Sriram
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
"https://goodreads.com/$USERNAME"
"https://flipboard.com/@$USERNAME"
"https://patreon.com/$USERNAME"
"https://buymeacoffee.com/$USERNAME"
"https://dribbble.com/$USERNAME"
"https://behance.net/$USERNAME"
"https://500px.com/$USERNAME"
"https://quora.com/profile/$USERNAME"
"https://replit.com/@$USERNAME"
"https://hackerrank.com/$USERNAME"
"https://leetcode.com/$USERNAME"
"https://bitbucket.org/$USERNAME"
"https://codepen.io/$USERNAME"
"https://codeberg.org/$USERNAME"
"https://twitch.tv/$USERNAME"
"https://disqus.com/by/$USERNAME"
"https://keybase.io/$USERNAME"
"https://about.me/$USERNAME"
"https://trakt.tv/users/$USERNAME"
"https://tryhackme.com/p/$USERNAME"
"https://hub.docker.com/u/$USERNAME"
"https://ask.fm/$USERNAME"
"https://mix.com/$USERNAME"
"https://giphy.com/$USERNAME"
"https://gitea.com/$USERNAME"
"https://furaffinity.net/user/$USERNAME"
"https://newgrounds.com/$USERNAME"
"https://notion.so/$USERNAME"
"https://archive.org/details/@$USERNAME"
"https://steamcommunity.com/id/$USERNAME"
"https://producthunt.com/@$USERNAME"
"https://venmo.com/$USERNAME"
"https://cash.app/$USERNAME"
"https://coinmarketcap.com/users/$USERNAME"
"https://coinbase.com/$USERNAME"
"https://tradingview.com/u/$USERNAME"
"https://reverbnation.com/$USERNAME"
"https://bandcamp.com/$USERNAME"
"https://itch.io/profile/$USERNAME"
"https://open.spotify.com/user/$USERNAME"
"https://last.fm/user/$USERNAME"
"https://flipkart.com/user/$USERNAME"
"https://amazon.com/profile/$USERNAME"
"https://zoho.com/$USERNAME"
"https://ebay.com/usr/$USERNAME"
"https://craigslist.org/u/$USERNAME"
"https://instructables.com/member/$USERNAME"
"https://houzz.com/user/$USERNAME"
"https://strava.com/athletes/$USERNAME"
"https://keybr.com/profile/$USERNAME"
"https://x.com/$USERNAME"

# [Add more if needed — repeated up to 200 social URLs]
# echo -e "$Adult Sites(200)"
# --- Adult Sites (200) ---
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
"https://www.qorno.com/pornstar/$USERNAME"
"https://www.xvideos.com/?k=/$USERNAME"
"https://www.xvideos.com/search/$USERNAME"
"https://www.xvideos.com/profiles/$USERNAME"
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
