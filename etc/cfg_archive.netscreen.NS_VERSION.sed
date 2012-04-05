############ Dont change the following ##############

# Delete the first line with the command etc
1d
# Delete the last line. Removes any final CLI prompts
$d

# Delete lines with the the text defined between the /<deletethistext>/
/^Date /d
/^Up .* Since/d
