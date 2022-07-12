#!/bin/bash
#
#
#
#

sudo chown  -R $USER:$USER $HOME


chmod --change 700 $HOME


find $HOME -type d -exec chmod --change 700 {} \;








