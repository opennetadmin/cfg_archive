############ Dont change the following ##############

# Delete the first line with the command name or first two lines if term len is found
/term len/,2d
1d
# Delete the last line. Removes any final CLI prompts
$d
