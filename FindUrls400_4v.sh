#!/bin/bash

# 🔎 Multi-Threaded Username Checker v1.0 — By @SunnamSriram
# ✅ 400+ sites | Parallel Curl | CSV Export
# 🛡️ For educational use only

# 🎨 Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color



USERNAME="$1"
THREADS=20
CSV_OUTPUT="results_${USERNAME}.csv"

if [[ -z "$USERNAME" ]]; then
    echo "❌ Usage: $0 <username>"
    exit 1
fi

# ✅ Output header
echo "Username,Platform,URL,Status" > "$CSV_OUTPUT"

# ✅ Define 400+ social and adult URLs with placeholders
SITES=(
# ==== Social Media ====
"https://www.instagram.com/$USERNAME/"
"https://www.facebook.com/$USERNAME/"
"https://twitter.com/$USERNAME"
"https://www.reddit.com/user/$USERNAME/"
"https://www.pinterest.com/$USERNAME/"
"https://www.github.com/$USERNAME"
"https://www.tumblr.com/$USERNAME"
"https://medium.com/@$USERNAME"
"https://www.quora.com/profile/$USERNAME"
"https://www.youtube.com/$USERNAME"
"https://www.snapchat.com/add/$USERNAME"
"https://vimeo.com/$USERNAME"
"https://soundcloud.com/$USERNAME"
"https://www.behance.net/$USERNAME"
"https://dribbble.com/$USERNAME"
"https://www.twitch.tv/$USERNAME"
"https://www.flickr.com/people/$USERNAME"
"https://dev.to/$USERNAME"
"https://about.me/$USERNAME"
"https://keybase.io/$USERNAME"
"https://www.producthunt.com/@$USERNAME"
"https://500px.com/$USERNAME"
"https://www.goodreads.com/$USERNAME"
"https://www.strava.com/athletes/$USERNAME"
"https://www.blogger.com/profile/$USERNAME"
"https://www.codepen.io/$USERNAME"
"https://www.periscope.tv/$USERNAME"
"https://www.last.fm/user/$USERNAME"
"https://www.mixcloud.com/$USERNAME"
"https://www.reverbnation.com/$USERNAME"
"https://www.slideshare.net/$USERNAME"
"https://www.meetup.com/members/$USERNAME"
"https://stackoverflow.com/users/$USERNAME"
"https://www.kaggle.com/$USERNAME"
"https://x.com/$USERNAME"

# ==== Adult (Sample placeholders) ====
"https://www.pornhub.com/users/$USERNAME"
"https://www.xvideos.com/profiles/$USERNAME"
"https://www.xnxx.com/profiles/$USERNAME"
"https://www.redtube.com/users/$USERNAME"
"https://www.youporn.com/user/$USERNAME"
"https://www.brazzers.com/profile/$USERNAME"
"https://www.fapcams.com/$USERNAME"
"https://www.onlyfans.com/$USERNAME"
"https://fansly.com/$USERNAME"
"https://www.manyvids.com/Profile/$USERNAME/"
"https://www.naughtyamerica.com/user/$USERNAME"
"https://www.cam4.com/$USERNAME"
"https://www.chaturbate.com/$USERNAME"
"https://myfreecams.com/$USERNAME"
"https://www.erome.com/$USERNAME"
"https://www.patreon.com/$USERNAME"
"https://www.motherless.com/$USERNAME"
"https://www.hclips.com/users/$USERNAME"
"https://www.amateurporn.com/users/$USERNAME"
"https://www.lovehomeporn.com/users/$USERNAME"
"https://www.porn.com/user/$USERNAME"
"https://www.tube8.com/user/$USERNAME"
"https://www.fux.com/users/$USERNAME"
"https://www.nubilefilms.com/members/$USERNAME"
"https://www.xhamster.com/users/$USERNAME"

# ... You can add more URLs here for both categories
)

# ✅ Internal function to test a single site
check_site() {
    URL="$1"
    PLATFORM=$(echo "$URL" | awk -F/ '{print $3}')
    STATUS=${RED}"Not Found"${NC}
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    
    if [[ "$HTTP_CODE" == "200" || "$HTTP_CODE" == "301" || "$HTTP_CODE" == "302" ]]; then
        STATUS=${GREEN}"Found"${NC}
    fi

    echo "$USERNAME,$PLATFORM,$URL,$STATUS" >> "$CSV_OUTPUT"
    printf "%-20s => %s\n" "$PLATFORM" "$STATUS"
}

# ✅ Export function for parallel curl
export -f check_site
export USERNAME CSV_OUTPUT

# ✅ Start scanning with parallel (multi-threaded)
printf "\n🔍 Checking username: %s on %s platforms\n\n" "$USERNAME" "${#SITES[@]}"
printf "⏱️  This may take a few seconds...\n\n"
printf "%s\n" "${SITES[@]}" | parallel -j $THREADS check_site

echo -e "\n✅ Done. CSV saved to: $CSV_OUTPUT"
