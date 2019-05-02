#!/bin/sh
URL=`curl -s 'http://thecatapi.com/api/images/get?format=xml' | xmllint --xpath "string(//url)" -`
FILE=`wget -q $URL`
NAME=${URL#http*com/}
img2txt $NAME
rm -f $NAME

curl --silent 'http://api.icndb.com/jokes/random' | jq '.value.joke' |recode html..ascii
