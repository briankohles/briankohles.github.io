## if regex
if [[ $SERVER =~ ".test." ]]; then
        PASS=test;
else
        PASS=prod;
fi
