## Remove EOL from a file
tr -d '\r' $file
tr -d '\n' < input.txt > output.txt

## Convert file contents to lower case
tr A-Z a-z < file.txt
