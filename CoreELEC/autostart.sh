#!/bin/sh
# change GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW for sys_led
new_val=$(fdtget -t i /flash/dtb.img /gpioleds/sys_led gpios | sed "s|\([0-9]*\) \([0-9]*\) .*|\1 \2 0|")
if [ -n "$new_val" ]; then
	mount -o remount,rw /flash
	fdtput -t i /flash/dtb.img /gpioleds/sys_led gpios $new_val
	sync
	mount -o remount,ro /flash
fi
