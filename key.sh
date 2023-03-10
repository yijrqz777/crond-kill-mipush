author="`grep_prop author $TMPDIR/module.prop`"
name="`grep_prop name $TMPDIR/module.prop`"
description="`grep_prop description $TMPDIR/module.prop`"
id="`grep_prop id $TMPDIR/module.prop`"

function get_magisk_lite(){
local until_function=/data/adb/magisk/util_functions.sh
grep -q lite_modules $until_function && echo "๏ผ ๐ๅฝๅไธบ: Magisk Liteโ$MAGISK_VER_CODE" || echo "๏ผ โๅฝๅไธบ: Magisk Officialโ$MAGISK_VER_CODE" 
}

function hello_master(){
if test -n "$(getprop persist.sys.device_name)" ;then
	echo ""
	echo "๏ผ โๆจๅฅฝ๏ผ"$(getprop persist.sys.device_name)"๏ผโ"
	echo "๏ผ โๆฌข่ฟไฝฟ็จๆฌๆจกๅ๏ผโ"
	get_magisk_lite
	echo ""
elif test -n "$(pm list users | cut -d : -f2 )" ;then
	echo ""
	echo - โๆจๅฅฝ๏ผ $(pm list users | cut -d : -f2 )๏ผโ
	echo "๏ผ โๆฌข่ฟไฝฟ็จๆฌๆจกๅ๏ผโ"
	get_magisk_lite
	echo ""
fi
}


echo ""
echo "โโโโโโโโโโโโโโโโโโโโโโโโโโ"
hello_master
echo "๏ผๅ็: `getprop ro.product.brand`"
echo "๏ผไปฃๅท: `getprop ro.product.device`"
echo "๏ผๆจกๅ: `getprop ro.product.model`"
echo "๏ผๅฎๅ็ๆฌ: `getprop ro.build.version.release`"
test "`getprop ro.miui.ui.version.name`" != "" && echo "๏ผMIUI็ๆฌ: MIUI `getprop ro.miui.ui.version.name` - `getprop ro.build.version.incremental` "
echo "๏ผๅๆ ธ็ๆฌ: `uname -a `"
echo "๏ผ่ฟๅญๅคงๅฐ: `free -m|grep "Mem"|awk '{print $2}'`MB  ๅทฒ็จ:`free -m|grep "Mem"|awk '{print $3}'`MB  ๅฉไฝ:$((`free -m|grep "Mem"|awk '{print $2}'`-`free -m|grep "Mem"|awk '{print $3}'`))MB"
echo "๏ผSwapๅคงๅฐ: `free -m|grep "Swap"|awk '{print $2}'`MB  ๅทฒ็จ:`free -m|grep "Swap"|awk '{print $3}'`MB  ๅฉไฝ:`free -m|grep "Swap"|awk '{print $4}'`MB"
echo "โโโโโโโโโโโโโโโโโโโโโโโโโโ"
echo ""
echo "โโโโโโโโโโโโโโโโโโโโโโโโโโ"
echo "- ๆจกๅไฟกๆฏ"
echo "- ๅ็งฐ: $name    "
echo "- ไฝ่๏ผ$author"
echo "- $description    "
echo "โโโโโโโโโโโโโโโโโโโโโโโโโโ"
echo ""

