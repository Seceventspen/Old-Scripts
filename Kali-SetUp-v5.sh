#!/bin/bash
# Kali Post Install SetUp - v0.5
# By @AlternativeSec
#
# This script sets up a fresh Kali Linux Vm/OS with a few secuirty hardening
# changes and additonal tools which I find really useful.
#
# License---------------------------------------------------------------------------#
#
# "THE BEER O'CLOCK LICENSE" (Version 0.1):
#
# As long as you retain this notice you can do
# whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
#
# Note: This is a first attempt at a setup script and therefore
# is a work in progress.
#
# Please Read-----------------------------------------------------------------------#
#
# If your Kali instance is being run locally via a VM on your host
# You might want to enable 'Shared Folders'.
# To do this with a fresh Kali Vm, do the following MANUALLY prior to
# Running this script. Open a terminal:
#
# uname -r // will state kernal version
#
# apt install -y linux-headers-<Kernel_version> // latest should be in use
#
# cp /media/cdrom/VBoxLinuxAdditions.run /root/Desktop/
# cd /root/Desktop/
#
# ./VBoxLinuxAdditions.run
#
# reboot now
#
# Please Read-----------------------------------------------------------------------#
#
# *** Run this script from the root directory ***
#
# ----------------------------------------------------------------------------------#

# Defaults #

##### Location information --- WORK IN PROGRESS #
#keyboardLayout=""           # Set keyboard layout                                       [ --keyboard gb]
#timezone=""                 # Set timezone location                                     [ --timezone Europe/London ]

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

STAGE=0                                                         # Where are we up to
TOTAL=$( grep '(${STAGE}/${TOTAL})' $0 | wc -l );(( TOTAL-- )) # How many things have we got todo

#### Additional Tools
add_tools="veil-evasion crackmapexec gobuster bettercap bloodhound bc tor filezilla nfs-common terminator python3-pip remmina gnome-screenshot openvpn network-manager-openvpn network-manager-openvpn-gnome libssl-dev libffi-dev python-dev build-essential"

# ----------------------------------------------------------------------------------#


##### ROOT User Check - Just incase You're Running a Non-Root User
if [[ "${UID}" -ne 0 ]]; then
  echo -e ' '${RED}'[!]'${RESET}" This script must be ${RED}run as root${RESET}" 1>&2
  echo -e ' '${RED}'[!]'${RESET}" Quitting..." 1>&2
  exit 1
else
  echo -e "${BLUE}[*]${RESET} ${BOLD}Kali Post-Install Script${RESET}"
  sleep 3s
fi
echo
echo

##### Check Internet Access
(( STAGE++ )); echo -e "${YELLOW}[!]${RESET} (${STAGE}/${TOTAL}) ${YELLOW}Checking Internet Access.${RESET}\n"

#--- Pinging Google for Confirmation
if ping -q -c 1 -W 1 google.com; then
  echo -en "\n${GREEN}[!]${RESET} ${BOLD}We have internet access. ${BOLD}${GREEN}Continuing${RESET} ${BOLD}Kali Post-Install Script${RESET}\n"
else
  echo -en "\n${RED}[!]${RESET} ${BOLD}Internet access is ${RED}DOWN${RESET}. ${BOLD}Aborting Kali Post-Install Script${RESET}\n\n"
  exit 1
fi


###Time and Date That Script Starts
echo
(( STAGE++ )); echo -en "${GREEN}[+]${RESET} (${STAGE}/${TOTAL})${GREEN}Start time: ${RESET}" && date
echo

#### Go Make a Coffee
echo -en "${BLUE}Go make a coffee.\n"
echo

echo -en "${BLUE}No seriously, go make a coffee!\n"
echo

echo -en "${BLUE}This might take a while ....\n${RESET}"
echo


#### Update & Upgrade Kali Repo's
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Beginning OS update ***${RESET}\n"
echo
apt-get update && apt-get upgrade -y
echo
echo

#### Installing Additional Items:
(( STAGE++ ));echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Installing Additional Items ***${RESET}\n"
echo
apt-get install $add_tools -y
echo
echo

#### Make Tools & Wordlists Directory
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Making New Directories ***${RESET}\n"
echo
echo -en "${BLUE}[*]${RESET} ${BOLD}/root/Tools${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}/root/Tools/Git${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}/root/Tools/Wordlists${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}/root/Tools/Scripts${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}/root/Tools/Eicar${RESET}\n"
echo
mkdir /root/Tools
mkdir /root/Tools/Git
mkdir /root/Tools/Wordlists
mkdir /root/Tools/Scripts
mkdir /root/Tools/Eicar
echo

#### Adding Additional Tools
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Installing Additional Tools ***${RESET}\n"
echo
echo -en "${BOLD}Installing Wordlist files to:${RESET} ${BOLD}/root/Tools/Git/${RESET}\n"
cd /root/Tools/Git/
git clone https://github.com/EmpireProject/Empire
git clone https://github.com/byt3bl33d3r/DeathStar
git clone https://github.com/huntergregal/mimipenguin
git clone https://github.com/drwetter/testssl.sh
git clone https://github.com/aboul3la/Sublist3r
git clone https://github.com/ChrisTruncer/EyeWitness
git clone https://github.com/lgandx/Responder.git
git clone https://github.com/CoreSecurity/impacket.git
git clone https://github.com/m4ll0k/WAScan.git
git clone https://github.com/mdsecactivebreach/SharpShooter.git
git clone https://github.com/jhaddix/domain
git clone https://github.com/1N3/XSSTracer
git clone https://github.com/nccgroup/vlan-hopping---frogger.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/D4Vinci/One-Lin3r.git
echo
echo -en "${YELLOW}[!]${RESET} ${BOLD}Please Note That Additional Setup is Required for Several of the Downloaded Tools. ${YELLOW}[!]${RESET}\n"
echo -en "${YELLOW}[!]${RESET} ${BOLD}This Will Need to be Done MANUALLY ${YELLOW}[!]${RESET}\n\n"
echo

#### Download Additonal Wordlists
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Installing Additional Wordlists ***${RESET}\n\n"
echo
echo -en "${YELLOW}${BOLD}Installing Wordlist files to:${RESET} ${BOLD}/root/Tools/Wordlists/${RESET}\n\n"
cd /root/Tools/Wordlists/
git clone https://github.com/danielmiessler/SecLists # Latest version with updated directory structure
git clone https://github.com/danielmiessler/RobotsDisallowed
cd /root/Tools/Wordlists/SecLists/Passwords/Leaked-Databases/
tar xvzf rockyou.txt.tar.gz # Unpacks RockYou file
echo
echo

#### Download Linux Priv. Esc. Scripts
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Installing Additional Scripts ***${RESET}\n"
echo
echo -en "${YELLOW}${BOLD}Installing Script files to:${RESET} ${BOLD}/root/Tools/Scripts/${RESET}"
cd /root/Tools/Scripts/
wget http://www.securitysift.com/download/linuxprivchecker.py
wget http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz
git clone https://github.com/rebootuser/LinEnum.git
tar xvzf unix-privesc-check-1.4.tar.gz # Unpacks files
rm -rf unix-privesc-check-1.4.tar.gz # This will remove the .gz file
echo
echo

#### Download Eicar Files for AV Testing
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Installing Additional Eicar Files ***${RESET}\n"
echo
echo -en "${YELLOW}${BOLD}Installing Eicar files to:${RESET} ${BOLD}/root/Tools/Eicar/${RESET}\n\n"
cd /root/Tools/Eicar/
wget https://secure.eicar.org/eicar.com
wget https://secure.eicar.org/eicar.com.txt
wget https://secure.eicar.org/eicar_com.zip
wget https://secure.eicar.org/eicarcom2.zip
echo
echo

##### Install Conky -- "Borrowed" from @g0tm11k and his OS Script Setup. Taking no Credit for This Bit ...
(( STAGE++ )); echo -e "\n\n ${YELLOW}[+]${RESET} (${STAGE}/${TOTAL}) ${BOLD}Installing CONKY: GUI desktop monitor${RESET}\n"
export DISPLAY=:0.0
apt -y -qq install conky \
  || echo -e ' '${RED}'[!] Issue with apt install'${RESET} 1>&2
#--- Configure conky
file=~/.conkyrc; [ -e "${file}" ] && cp -n $file{,.bkup}
if [[ -f "${file}" ]]; then
  echo -e ' '${RED}'[!]'${RESET}" ${file} detected. Skipping..." 1>&2
else
  cat <<EOF > "${file}"
--# Useful: http://forums.opensuse.org/english/get-technical-help-here/how-faq-forums/unreviewed-how-faq/464737-easy-configuring-conky-conkyconf.html
conky.config = {
    background = false,
    font = 'monospace:size=8:weight=bold',
    use_xft = true,
    update_interval = 2.0,
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = true,
    own_window_class = 'conky-semi',
    own_window_argb_visual = false,
    own_window_colour = 'brown',
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    double_buffer = true,
    maximum_width = 260,
    draw_shades = true,
    draw_outline = false,
    draw_borders = false,
    stippled_borders = 3,
    border_inner_margin = 9,
    border_width = 10,
    default_color = 'grey',
    alignment = 'bottom_right',
    gap_x = 5,
    gap_y = 0,
    uppercase = false,
    use_spacer = 'right',
};
conky.text = [[
\${color dodgerblue3}SYSTEM \${hr 2}\$color
#\${color white}\${time %A},\${time %e} \${time %B} \${time %G}\${alignr}\${time %H:%M:%S}
\${color white}Host\$color: \$nodename  \${alignr}\${color white}Uptime\$color: \$uptime
\${color dodgerblue3}CPU \${hr 2}\$color
#\${font Arial:bold:size=8}\${execi 99999 grep "model name" -m1 /proc/cpuinfo | cut -d":" -f2 | cut -d" " -f2- | sed "s#Processor ##"}\$font\$color
\${color white}MHz\$color: \${freq} \${alignr}\${color white}Load\$color: \${exec uptime | awk -F "load average: "  '{print \$2}'}
\${color white}Tasks\$color: \$running_processes/\$processes \${alignr}\${color white}CPU0\$color: \${cpu cpu0}% \${color white}CPU1\$color: \${cpu cpu1}%
#\${color #c0ff3e}\${acpitemp}C
#\${execi 20 sensors |grep "Core0 Temp" | cut -d" " -f4}\$font\$color\${alignr}\${freq_g 2} \${execi 20 sensors |grep "Core1 Temp" | cut -d" " -f4}
\${cpugraph cpu0 25,120 000000 white} \${alignr}\${cpugraph cpu1 25,120 000000 white}
\${color white}\${cpubar cpu1 3,120} \${alignr}\${color white}\${cpubar cpu2 3,120}\$color
\${color dodgerblue3}PROCESSES \${hr 2}\$color
\${color white}NAME             PID     CPU     MEM
\${color white}\${top name 1}\${top pid 1}  \${top cpu 1}  \${top mem 1}\$color
\${top name 2}\${top pid 2}  \${top cpu 2}  \${top mem 2}
\${top name 3}\${top pid 3}  \${top cpu 3}  \${top mem 3}
\${top name 4}\${top pid 4}  \${top cpu 4}  \${top mem 4}
\${top name 5}\${top pid 5}  \${top cpu 5}  \${top mem 5}
\${color dodgerblue3}MEMORY & SWAP \${hr 2}\$color
\${color white}RAM\$color  \$alignr\$memperc%  \${membar 6,170}\$color
\${color white}Swap\$color  \$alignr\$swapperc%  \${swapbar 6,170}\$color
\${color dodgerblue3}FILESYSTEM \${hr 2}\$color
\${color white}root\$color \${fs_free_perc /}% free\${alignr}\${fs_free /}/ \${fs_size /}
\${fs_bar 3 /}\$color
#\${color white}home\$color \${fs_free_perc /home}% free\${alignr}\${fs_free /home}/ \${fs_size /home}
#\${fs_bar 3 /home}\$color
\${color dodgerblue3}LAN eth0 (\${addr eth0}) \${hr 2}\$color
\${color white}Down\$color:  \${downspeed eth0} KB/s\${alignr}\${color white}Up\$color: \${upspeed eth0} KB/s
\${color white}Downloaded\$color: \${totaldown eth0} \${alignr}\${color white}Uploaded\$color: \${totalup eth0}
\${downspeedgraph eth0 25,120 000000 00ff00} \${alignr}\${upspeedgraph eth0 25,120 000000 ff0000}\$color
EOF
ip addr show eth1 &>/dev/null \
  && cat <<EOF >> "${file}"
\${color dodgerblue3}LAN eth1 (\${addr eth1}) \${hr 2}\$color
\${color white}Down\$color:  \${downspeed eth1} KB/s\${alignr}\${color white}Up\$color: \${upspeed eth1} KB/s
\${color white}Downloaded\$color: \${totaldown eth1} \${alignr}\${color white}Uploaded\$color: \${totalup eth1}
\${downspeedgraph eth1 25,120 000000 00ff00} \${alignr}\${upspeedgraph eth1 25,120 000000 ff0000}\$color
EOF
cat <<EOF >> "${file}"
\${color dodgerblue3}Wi-Fi (\${addr wlan0}) \${hr 2}\$color
\${color white}Down\$color:  \${downspeed wlan0} KB/s\${alignr}\${color white}Up\$color: \${upspeed wlan0} KB/s
\${color white}Downloaded\$color: \${totaldown wlan0} \${alignr}\${color white}Uploaded\$color: \${totalup wlan0}
\${downspeedgraph wlan0 25,120 000000 00ff00} \${alignr}\${upspeedgraph wlan0 25,120 000000 ff0000}\$color
\${color dodgerblue3}CONNECTIONS \${hr 2}\$color
\${color white}Inbound: \$color\${tcp_portmon 1 32767 count}  \${alignc}\${color white}Outbound: \$color\${tcp_portmon 32768 61000 count}\${alignr}\${color white}Total: \$color\${tcp_portmon 1 65535 count}
\${color white}Inbound \${alignr}Local Service/Port\$color
\$color \${tcp_portmon 1 32767 rhost 0} \${alignr}\${tcp_portmon 1 32767 lservice 0}
\$color \${tcp_portmon 1 32767 rhost 1} \${alignr}\${tcp_portmon 1 32767 lservice 1}
\$color \${tcp_portmon 1 32767 rhost 2} \${alignr}\${tcp_portmon 1 32767 lservice 2}
\${color white}Outbound \${alignr}Remote Service/Port\$color
\$color \${tcp_portmon 32768 61000 rhost 0} \${alignr}\${tcp_portmon 32768 61000 rservice 0}
\$color \${tcp_portmon 32768 61000 rhost 1} \${alignr}\${tcp_portmon 32768 61000 rservice 1}
\$color \${tcp_portmon 32768 61000 rhost 2} \${alignr}\${tcp_portmon 32768 61000 rservice 2}
]]
EOF
fi
#--- Create start script
mkdir -p /usr/local/bin/
file=/usr/local/bin/start-conky; [ -e "${file}" ] && cp -n $file{,.bkup}
cat <<EOF > "${file}" \
  || echo -e ' '${RED}'[!] Issue with writing file'${RESET} 1>&2
#!/bin/bash
[[ -z \${DISPLAY} ]] && export DISPLAY=:0.0
$(which timeout) 10 $(which killall) -9 -q -w conky
$(which sleep) 20s
$(which conky) &
EOF
chmod -f 0500 "${file}"
#--- Run now
bash /usr/local/bin/start-conky >/dev/null 2>&1 &
#--- Add to startup (each login)
mkdir -p ~/.config/autostart/
file=~/.config/autostart/conkyscript.desktop; [ -e "${file}" ] && cp -n $file{,.bkup}
cat <<EOF > "${file}" \
  || echo -e ' '${RED}'[!] Issue with writing file'${RESET} 1>&2
[Desktop Entry]
Name=conky
Exec=/usr/local/bin/start-conky
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Type=Application
Comment=
EOF
echo
echo

#### Security Hardening
# Kali Ships With Deafult SSH Keys
# In theory, If SSH was enabled Another Kali User Could
# use their SSH Key to Auth To Your Box....
# Change your Kali default ssh keys
echo -en "${YELLOW}${BOLD}[+] *** Security Hardening - Changing Default SSH Keys ***${RESET}\n"
echo
(( STAGE++ )); echo -en "${BLUE}[+]${RESET} (${STAGE}/${TOTAL})${BOLD} *** Making New Directory for Default SSH Keys ***${RESET}\n"
echo
echo -en "${YELLOW}${BOLD}New Directory:${RESET} ${BOLD}default_kali_keys/ Added to /etc/ssh/${RESET}\n"
cd /etc/ssh/
mkdir default_kali_keys
mv ssh_host_* default_kali_keys/ # This will move your default keys to the new folder...
echo
echo

#### Regenerate the keys
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Reconfiguring OpenSSH Server ***${RESET}\n"
echo
dpkg-reconfigure openssh-server
echo
echo

#### Verify ssh key hashes are different
echo
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Verify New SSH Keys ***${RESET}\n"
echo
md5sum ssh_host_*
echo
echo

#### Compare new key hashes to the hashes below
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Compare SSH Keys Below, Against the New SSH Keys Above ***${RESET}\n"
cd default_kali_keys/
echo
md5sum ssh_host_*
echo
echo

#### Password Change
(( STAGE++ )); echo -en "${YELLOW}[+]${RESET} (${STAGE}/${TOTAL})${YELLOW} *** Changing Default Password ***${RESET}\n\n"
echo
passwd root
echo
echo


##### Remember Notes
echo -en "${YELLOW}[!]${RESET} ${BOLD}Remember to change the Following to Suit you if you haven't already done so:${RESET}\n\n"
echo
echo -en "${BLUE}[*]${RESET} ${BOLD}Keyboard i.e UK or Other${RESET}\n\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}Region & Language${RESET}\n\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}Time Zone/Date & Time Settings${RESET}\n\n"
sleep 2s
echo

echo -en "${YELLOW}[!]${RESET} ${BOLD}Remember to check the additional setup of the following tools ${YELLOW}[!]${RESET}\n"
sleep 2s
echo
echo -en "${BLUE}[*]${RESET} ${BOLD}Empire Set-up\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}cd Tools/Git/Empire/setup/${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}./install.sh${RESET}\n\n"

echo -en "${BLUE}[*]${RESET} ${BOLD}DeathStar Set-up\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}cd Tools/Git/DeathStar/${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}pip3 install -r requirements.txt${RESET}\n\n"

echo -en "${BLUE}[*]${RESET} ${BOLD}Impacket Set-up\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}cd Tools/Git/impacket${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}pip install -r requirements.txt${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}python setup.py install${RESET}\n\n"

echo -en "${BLUE}[*]${RESET} ${BOLD}Sublist3r Set-up\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}cd Tools/Git/Sublist3r${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}pip install -r requirements.txt${RESET}\n\n"

echo -en "${BLUE}[*]${RESET} ${BOLD}WAScan Set-up\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}cd Tools/Git/WAScan${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}pip install -r requirements.txt${RESET}\n\n"

echo -en "${BLUE}[*]${RESET} ${BOLD}One-Lin3r Set-up\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}cd Tools/Git/One-Lin3r${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}chmod 777 -R One_Lin3r${RESET}\n"
echo -en "${BLUE}[*]${RESET} ${BOLD}python setup.py install${RESET}\n"
sleep 2s
echo

#### We're Done Message ...
echo -en "${GREEN}... And we're done!\n"
sleep 1s
echo

echo -en "${GREEN}But we are haxors and haxors do cool thingz with terminals\n"
sleep 1s
echo

echo -en "${GREEN}${BOLD}Hack The Planet!!${RESET}\n"
sleep 1s
echo

echo -en "${BOLD}Completion time: ${RESET}" && date
echo

exit 0
