## lvextend - increase size of disk
lvextend -L 40G /dev/vg01/lv_opendj
	- increase disk to 40GB
resize2fs /dev/vg01/lv_opendj
	- increase filesystem to fill disk
df -h
	- to verify
