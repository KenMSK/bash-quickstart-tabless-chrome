### This script starts chrome without Location Bar and tabs for a cleanest reading

#If clipboard contains a valid URL, use it and exit
addr=`pbpaste`
if [[ ! -z "$addr" ]];
then
  echo "Check Clipboard"
fi
if [[ ! $addr == http* ]];
then
  addr="https://$addr"
fi
if wget -q "$addr";
then
  echo 'using URL from CLIPBOARD'
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=$addr
  osascript -e 'tell application "Terminal" to close first window' & exit
fi

#If clipboard does not contain a valid url, let user enter it
while true
do
  echo "Enter URL to start chrome without Location Bar:"
  read addr
  if [[ -z "$addr" ]];
  then
    continue
  fi

  if [[ ! $addr == http* ]];
  then
    addr="https://$addr"
    echo $addr
  fi
  if ! wget -q "$addr";
    then echo "Address is not valid!? Input again:"
    else /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=$addr
  fi
done
