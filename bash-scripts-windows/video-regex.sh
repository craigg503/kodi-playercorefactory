#!/bin/bash

VIDEOFILE=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(mkv|mp4|avi|flv)')
M3U8=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_,@&%-]*\.(m3u8)')
M3U8TOKEN=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(m3u8)\?token=[a-zA-Z0-9&=]*')
M3U8UAG=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(m3u8)[a-zA-Z0-9?&=%*]*[^|]')
XFORWARD=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9./?=_@%-]*\.(m3u8)\|X-Forwarded-For=[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
XFORWARDIP=$(printf "%s" "$XFORWARD" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
USEREF=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(mkv|mp4|avi|flv)|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+-]*\&r?Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*')
USERAGENT=$(printf "%s" "$VIDEOURL" | grep -Eo 'u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]')
USERAGENT2=$(printf "%s" "$VIDEOURL" | grep -Eo 'u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]' | sed 's/User-Agent=//g')
REFERER=$(printf "%s" "$VIDEOURL" | grep -Eo 'r?Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*' | sed 's/Referer=//')
M3U8USERAGENT=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(m3u8)[a-zA-Z0-9?&=%*]*\|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]')
M3U8USERAGENT2=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9./?=_@%-]*\.(m3u8)[a-zA-Z0-9?&=%*]*\|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]')
M3U8UAGENTREFERER=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_&@%-]*\.(m3u8)|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;&@%+-]*\&r?Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*')
REFUSERAGENT=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_-]*\|r?Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*\&u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+-]*')
HTTP=$(printf "%s" "$VIDEOURL" | grep -Eo '^(http|https)://[a-zA-Z0-9:0-9/.&;,~*?%@_=-]*')
RTMP=$(printf "%s" "$VIDEOURL" | grep -Eo '^(rtmp|rtmpe)://[-/.&;,~*?[:blank:]#%@!()_=:a-zA-Z0-9\]*')
COOKIEM3U8=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_,@&%-]*\.(m3u8)\?nltid=[a-zA-Z0-9&%_*=]*')
COOKIEURL=$(printf "%s" "$VIDEOURL" | grep -Eo 'nltid=[a-zA-Z0-9&%_*=]*')
COOKIEDOMAIN=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9.-]*[^/]' | sed 's/^http\(\|s\):\/\///g')
COOKIEMEDIA=$(printf "%s" "$VIDEOURL" | grep -Eo 'mediaAuth=[a-zA-Z0-9]*')
COOKIEM3U8UAGENT=$(printf "%s" "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_,@&%-]*\.(m3u8)\|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*&Cookie=mediaAuth=[a-zA-Z0-9]*')
