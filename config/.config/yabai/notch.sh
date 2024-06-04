NOTCH_UUID="37D8832A-2D66-02CA-B9F7-8F30A301B230"
NORMAL_BAR=32
NOTCH_BAR=0
NOTCH_OFFSET=$((NOTCH_BAR-NORMAL_BAR))

yabai -m config top_padding $NORMAL_BAR
# if the notched display is added set external bar to "main:$NOTCH_OFFSET:0". This will decrease the padding on the main (notched) screen
yabai -m signal --add event=display_added action"if [[ \"\$(yabai -m query --displays | jq \".[] | select(.id == \$YABAI_DISPLAY_ID) | .uuid\")\" =~ \"$NOTCH_UUID\" ]]; then yabai -m config external_bar \"main:$NOTCH_OFFSET:0\"; fi"
# If the notched display is removed, set external_bar to off so the main screen (which is now not notched) no longer has a padding decrease
yabai -m signal --add event=display_removed action="if [[ ! \"\$(yabai -m query --displays | jq '.[].uuid')\" =~ \"$NOTCH_UUID\" ]]; then yabai -m config external_bar off:0:0; fi"
# Apply those effects at startup
if [[ "$(yabai -m query --displays | jq '.[].uuid')" =~ "$NOTCH_UUID" ]]; then yabai -m config external_bar "main:$NOTCH_OFFSET:0"; else yabai -m config external_bar off:0:0; fi
