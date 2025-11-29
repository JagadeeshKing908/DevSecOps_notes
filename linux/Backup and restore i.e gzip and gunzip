Backup and restore i.e gzip and gunzip

what is backup:
It is making the copy of original data when some thing happend will transfer it some location.

How to take backup by different commands:
-----------------------------------------


backup and compression                                                                    (uncompression & restoration)
                                        transferring file to other system
/opt/etc/tar.gzip(After compression)  <-------------------------------------------->   /opt/etc/tar.gzip(After compression)
	  |                                         20mb                                                       |
	  |                                                                                                    |
      |                                                                                                    |
      |                                            190mb
/opt/etc.tar(after applying tar)     -------->-----------------------<--------------        /root/etc.tar(after unzipping of gzip file)
      |                                                                                                 |
	  |                                               200mb                                             |(after untaring the file)
/etc(Normal file)                    ---------->---------------------<--------------            /root /etc(Normal file)  
                                                                                                          (backup normal file)



for archive ---tar -cvf /opt/etc.tar /etc   (tar ( c-compression -v -verbose f -force fully ) (directory name)

for check size --->du -sh /opt/etc.tar--- (here du-disk usage -s for sort and h- human redable format)

for compression --->gzip /opt/etc.tar  (we will just archive the .tar file

for check --->du -sh --->(1)


For uncompression :
------------------

cp etc.tar.gz /root/

for check size --->du -sh etc.tar.gz

for unzip--->gunzip etc.tar.gz

check the size --->du -sh etc.tar 

To unarchive --->tar -xvf etc.tar

check the size --->du -sh etc

ls 
