# Scripts (Note: Most of these scripts need work, like error handling etc but they work as is!)

A collection of scripts I've been collecting, put together or tweaked to how I want them to work. The majority of these are not rocket science, I do not claim to be a master scripter! They just make some things I personally do a little easier!

**Scripts Overview:**

**Up-or-down.sh -** This allows you to check a host/service/applictaion to see whether it is up or down. Connection intervals can be adjusted to suit.

**GetSSLCert.sh -** This simplly connects to the target, gets the SSL cert, ditches the unnecessary stuff and displays the x509 info in a nice readbale format.

**GoFetchIt.sh -** This script does a few things, basically a wrapper for a few tools. It resolves a user supplied host name, then runs Dig, Whois, grabs HTTP Headers and finally incorporates the functionality from GetSSLCert. Handy for Web App/web server enumeration etc. Its really easy to add additonal functionality to it. 

**Kali-SetUp-v4.sh -** This script does a few things! Basically, after downloading the latest Kali VM image, this script is designed to be run after the first log in. The script will update, upgrade, create du=irectories, install new tools and one of two other things. At this point it still requires some user interaction and therefore isn't a fully autonumous process. It's really easy to add additonal functionality to.

**encode-deocde.sh -** A small script to take some user input, Base64 encode it and then provides a sanity check to allow you to decode the string again. Its most likely pretty useless but I thought I'd put it here all the same.


**SE-VPS-SetUp.sh -**
Delpoying this script will pull down some useful tools to aid in remote SE engagements. Run on a new pentesting VPS instance.

Note: This script requires that you run the shell script as root. Enjoy!

**Responder-VPS-SetUp.sh-**
This script is run on a separate VPS instance, though us designed to be used in conjuction with 'SE-VPS' instance. Delpoying this script will pull down lgandxs Responder to aid in remote SE engagements. Run on a new pentesting VPS instance.

Note: This script requires that you run the shell script as root. Enjoy!
