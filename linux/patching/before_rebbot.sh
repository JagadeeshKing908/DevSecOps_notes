echo -e " \n ==== HOSTNAME ====="
hostname
echo -e " \n ==== DATE ====="
date
echo -e " \n ======= subscription-manager identity ======"
subscription-manager identity
echo -e " \n ===== Yum List Kernel ======"
yum list kernel | grep -v "plugins"
echo -e " \n ===== Hardware Vendor ===== "
/usr/sbin/dmidecode -t system
echo -e " \n ======lsmod | grep -i lin_tape ---> Checking lin_tape module installed or not"
/sbin/lsmod | grep -i lin_tape
rpm -qa | grep -i lin_ta
echo -e " \n ============ RG Manager cluster status  ==============="
/usr/sbin/clustat
echo -e " \n ============== PCS Status ==============="
/sbin/pcs status
echo -e " \n === DOCKER SERVICE STATUS ===="
/sbin/service docker status
systemctl status docker
ps -ef | grep -i docker
echo -e " \n ==== ORACLE CRS STATUS --> For RAC Server ===="
ps -ef | grep -i crsd.bin
echo -e " \n ==== PMON  STATUS ====== "
ps -ef | grep -i pmon
echo -e " \n ==== ASM package Installed or not ==="
rpm -qa | grep -i asm
echo -e " \n ===== NTP Status  ====="
/usr/sbin/ntpq -pn
/sbin/ntpq -pn
systemctl status chronyd
echo -e " \n===== IP Tables Status ====="
/sbin/iptables -L -n
echo -e " \n  ==== Systemctl Status Firewalld ====="
systemctl status firewalld
echo -e " \n  ===== Redhat-release =========="
cat /etc/redhat-release
echo -e " \n ===== Kernel version Running ====="
uname -r
echo -e " \n ===== UPTIME ==== "
uptime
echo -e " \n ======= Proxy variable is set in root .bash_profile or /etc/profile ====="
cat ~/.bash_profile | grep -i proxy
cat /etc/profile | grep -i proxy
cat /etc/profile.d/* | grep -i proxy
echo -e " \n ==== IP A ======  "
/sbin/ip a
echo -e " \n ==== Selinux Status ====="
/usr/sbin/getenforce
echo -e " \n ======= /etc/resolv.conf Modified Date ======"
ls -ld /etc/resolv.conf
echo -e " \n ==== FSTAB Entries ===="
cat /etc/fstab
echo -e " \n ====DF -TH ==="
df -TPh
echo -e " \n ====  Routing Table ====="
/sbin/ip route show
echo -e " \n ==== cat /etc/exports  --> Checking any NFS Exports ===== "
cat /etc/exports
echo -e " \n ==== resolv.conf Entries ====="
cat /etc/resolv.conf
echo -e " \n ==== LVS;PVS;VGS OUTPUT ==== "
/sbin/lvs
/sbin/pvs
/sbin/vgs
echo -e " \n ========= multipath -ll | wc -l  --> Total number of Luns ================"
/sbin/multipath -ll | wc -l
/sbin/multipath -ll
echo -e " \n =========  ps -ef | grep -i sisi  && rpm -qa | grep -i dcs---> Checking symantec process "
ps -ef | grep -i sisi
rpm -qa | grep -i dcs
echo -e " \n =========  ps -ef | grep -i symantec for SEP ======"
ps -ef | grep -i symantec
echo -e " \n ======SEP package rpm -qa | grep -i sep and modules foe symantec======="
rpm -qa | grep -i sep
/sbin/lsmod | grep -i sy
echo -e "\n ============== SOFTWARE RAID MD STAT staus =========="
cat /proc/mdstat
