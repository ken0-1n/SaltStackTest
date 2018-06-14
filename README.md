# SaltStackTest

## Give the example

### Create EC2 instances
```
salt-cloud -P -p base_ec2_private ami.efs_client1 ami.efs_client2
```
  
### Copy some scripts to EC2 instances
```
cd script
salt-cp 'ami.efs_client*' ./*.sh ~/.
```
  
### Run
```
# mount efs  
salt 'ami.efs_client*' cmd.run 'bash ./efs_settings.sh'  
# install bwa   
salt 'ami.efs_client*' cmd.run 'bash ./bwa_install.sh'  
# run bwa  
salt 'ami.efs_client*' cmd.run 'bash ./run_bwa.sh'  
# unmount efs  
salt 'ami.efs_client*' cmd.run 'bash ./efs_umount.sh'  
```
  
### Get computing time from the bwa.log
```
salt 'ami.efs_client*' cmd.run 'grep Real output/bwa.log'
```
