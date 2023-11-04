echo "say hello"
read
ans=$REPLY

if [ $ans == 'h' ]; then
    echo 'yes'
else
    echo 'no'
fi

echo $ans
