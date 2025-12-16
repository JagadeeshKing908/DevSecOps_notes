read -p "Enter threshold value : " threshold

df -hTP | awk 'NR>1 {print $1, $7 , $6}' | while read fs mountedon usage
do
        use=${usage%\%}

        if [[ use -gt threshold ]];then
                {

                        echo -e "Hostname \t :\t $(hostname)"
                        echo -e "FileSystem \t: \t$fs "
                        echo -e "Mountedon \t:\t $mountedon "
                        echo -e "Usage \t: \t$usage "
                        df -hTP $fs
                } | mail -s "Disk space alert" "jagadeeshyeddula90888@gmail.com"
        fi
done
