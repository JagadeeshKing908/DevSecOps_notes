vim disk_space.sh

df -hTP | awk 'NR>1 {print $1, $7, $6}' | while read fs mountedon usage

do
        use=${usage%\%}
        if [ "$use" -ge "$Threshold" ]; then
                echo "warning of Disk space is above threshold on serverg: $(hostname)"

               echo "$fs $mountedon $usage  "
               echo "=====================Or========================"
               echo "hostname : $(hostname) "
               echo "File system : $fs "
               echo "mounted on : $mountedon "
               echo "usage : $usage "
        fi
done

[root@server-1 ~]# sh script.sh
warning of Disk space is above threshold on serverg: server-1
/dev/xvda1 / 21%
=====================Or========================
hostname : server-1
File system : /dev/xvda1
mounted on : /
usage : 21%
[root@server-1 ~]# cat script.sh
Threshold=20
