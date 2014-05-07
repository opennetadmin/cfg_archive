############ Dont change the following ##############

# Delete the first line with the command name
1d
# Delete the last line. Removes any final CLI prompts
$d

# Delete lines with the the text defined between the /<deletethistext>/
#/uptime is/d
#/ntp clock-period/d
#/Uptime /d
#/Time since/d
#/System restarted/d

# Delete the clipaging commands at the top and/or bottom.
/ # disable clipaging/d
/ # enable clipaging/d

# remove status messages from UCS 'show system firmware expand' command
#/-Status:/d

# Delete from the word end to the end of the actual file, strips off extra crap
#/^end/,/G/ {
#  /^end/p;
#  d;
#}

