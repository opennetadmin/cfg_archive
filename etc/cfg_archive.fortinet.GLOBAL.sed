############ Dont change the following ##############

# Delete the first line with the command name or first two lines if term len is found
/term len/,2d
1d
# Delete the last line. Removes any final CLI prompts
$d

# Delete lines with the the text defined between the /<deletethistext>/
/uptime is/d
/ntp clock-period/d
/Uptime /d
/Time since/d
/System restarted/d
# remove status messages from UCS 'show system firmware expand' command
/-Status:/d

