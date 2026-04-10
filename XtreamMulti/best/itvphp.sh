
#\!/bin/bash
# Variables
while true; do
MAC=$(shuf -n 1 /data/data/com.termux/files/home/xtreammulti/best/bestmac.txt | awk '{print $1}')
URL="http://maxhd.eu:8000"
channel="$1"
# First command
link=$(curl -s -H "User-Agent: Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG250 stbapp ver: 4 rev: 2721 Mobile Safari/533.3" -H "Cookie: mac=$MAC; stb_lang=en; timezone=Europe/Amsterdam;" -H "Authorization: Bearer $token" "$URL/portal.php?type=itv&action=create_link&cmd=$channel&series=&forced_storage=undefined&disable_ad=0&download=0&JsHttpRequest=1-xml" | jq)
ffplay=$(echo $link | jq | grep ffmpeg  | sed 's#    "cmd": "ffmpeg ##g' | sed 's#"##g')

  user=$(echo $ffplay | awk -F/ '{print $4}')
  pw=$(echo $ffplay | awk -F/ '{print $5}')

url="$URL/player_api.php?username=$user&password=$pw"
  active_cons=$(curl -s "$url" | jq -r '.user_info.active_cons')

if [ "$active_cons" -eq 0 ]; then

echo "$ffplay"

exit 0
    break  # Beenden Sie die Schleife, wenn 'active_cons' 0 ist
  else
    # Fügen Sie hier die Aktionen hinzu, die Sie in der Schleife ausführen möchten
 echo 1  2>1& 
  fi

  # Fügen Sie hier optional eine Verzögerung ein, um die Anfrage in Intervallen auszuführen
  # Beispiel: Hier wird alle 5 Sekunden eine Anfrage ausgeführt
done
exit 0 

