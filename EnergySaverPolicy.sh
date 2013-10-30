#!/bin/bash

# Script to set energy saving settings as per a chosen preset

# Author      : r.purves@arts.ac.uk
# Version 1.0 : 30-10-2012 - Initial Version
# Version 1.1 : 1-11-2012 - Implemented specific site policies
# Version 1.2 : 28-11-2012 - Implemented CS site policy
# Version 1.3 : 21-12-2012 - Added wake on specific days for system update.

# Version 2.0 : 18-01-2013 - Revamped to separate wired/laptops.
# 							 Also makes sure that laptops don't power on during the night.
# Version 2.1 : 08-03-2013 - Unified profiles to bring in sync with Windows.

# This script has three separate energy saver profiles.
# Choose a predefined profile by passing 1 - 10 to parameter 4.

# All profiles have the following:

/usr/bin/pmset -a displaysleep 30
/usr/bin/pmset -a disksleep 0
/usr/bin/pmset -a sleep 0
/usr/bin/pmset -a womp 1
/usr/bin/pmset -a ring 0
/usr/bin/pmset -a autorestart 1
/usr/bin/pmset -a powerbutton 0

# As of 18-01-2013, the profiles are for:
# Profile 1: CCW Laptops
# Profile 2: CCW Wired
# Profile 3: CS Laptops
# Profile 4: CS Wired
# Profile 5: CSM Laptops
# Profile 6: CSM Wired
# Profile 7: LCC Laptops
# Profile 8: LCC Wired
# Profile 9: LCF Laptops
# Profile 10: LCF Wired

# Set case variable from parameter 4

EnergySaverChoice=$4

# Set energy saver prefs based on choice.

case "$EnergySaverChoice" in

'1')

/usr/bin/pmset repeat cancel

;;

'2')

# Now set wake up/shut down times for Thursday so the update policies can work
# 2am - 6am should be enough.
/usr/bin/pmset repeat wakeorpoweron R 02:00:00 shutdown R 04:00:00

;;

'3')

/usr/bin/pmset repeat cancel

;;

'4')

# Now set wake up/shut down times for Friday so the update policies can work
# 2am - 6am should be enough.
/usr/bin/pmset repeat wakeorpoweron F 02:00:00 shutdown F 04:00:00

;;

'5')

/usr/bin/pmset repeat cancel

;;

'6')

# Now set wake up/shut down times for Wednesday so the update policies can work
# 2am - 4am should be enough.
/usr/bin/pmset repeat wakeorpoweron W 02:00:00 shutdown W 04:00:00

;;

'7')

/usr/bin/pmset repeat cancel

;;

'8')

# Now set wake up/shut down times for Monday so the update policies can work
# 2am - 4am should be enough.
/usr/bin/pmset repeat wakeorpoweron M 02:00:00 shutdown M 04:00:00

;;

'9')

/usr/bin/pmset repeat cancel

;;

'10')

# Now set wake up/shut down times for Tuesday so the update policies can work
# 2am - 4am should be enough.
/usr/bin/pmset repeat wakeorpoweron T 02:00:00 shutdown T 04:00:00

;;

esac

exit 0
