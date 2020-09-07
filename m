Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F8826044A
	for <lists+linux-next@lfdr.de>; Mon,  7 Sep 2020 20:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgIGSKG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 14:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgIGSKE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2020 14:10:04 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE0EC061573
        for <linux-next@vger.kernel.org>; Mon,  7 Sep 2020 11:10:03 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Blbsh3sXYzKmVm
        for <linux-next@vger.kernel.org>; Mon,  7 Sep 2020 20:10:00 +0200 (CEST)
Authentication-Results: spamfilter01.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1599502198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=l/6l6S0jRGpVsbnaorIYBbwwDw5H70bx92HrAP20bD4=;
        b=taojX+a2zxvg22Px+b1nvMPOp6N2NyjMjUwFsDLunQuJBwcDqOVkLxaABLjoN0BCFwbZMJ
        o0OSlgYQ3fGhU32Cf01oUZvLcQwxl4iqLil8+7PoxBKNfaI9I3sgUXvx1WjPDdQXU+JfXo
        KJARKgonE2tY8DBY6zlFDXjbgfQpyA3QooLZOORwDB6+c576t8gdiUDRORP+kSTq8Zwz6L
        ddmkVYZ2bLm2PSjkqjaUinsRzNkHbHdBbItJ4RiBtUKlHhbRxNa23b4e+tKGSZuIMHURU5
        OuUThoEZjRqgFYo8L4bXIdpt4VhuooIwX8epiegBMtv57DV3vivDk1IX8BdzpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:message-id:date:date
        :subject:subject:from:from:received; s=mail20150812; t=
        1599502194; bh=5NkPqOl4J4tOHJJQmQekouUo3Vu/bQIjqEQyuabQRBc=; b=E
        /1HbqNYgjBsBnO5Lz64sAsKBDZIkKIsf74wVnQctH9jHANy6e/ZeW5vxDAbjuHuE
        7Z2jCpyMH2f0K+1Y7E/AZ7lcozjJbhUHyvo1oyWNk7oGmL+q8sTi0IQrkIglpTja
        bfRRWb3p4xB7zWon7u0eqHonLQhUDoElNF/qGcWklLW+TQZv3gw4d+kb3tggkHdk
        GEv0B5QVfAAPiER6xXACO/InGcn2WtHTdmMPbjtK8sIgLyxTYIoUEDrsM0f7Fa7M
        b2hxscZEgaUhvkAfJ2QPGu9zAYAFEEM2Yr5l9bi0uvtKlYjN987tqT1bkWnvXVmB
        121ai72+orAcc7KUfEc0w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id zOhHUBsL-2TP; Mon,  7 Sep 2020 20:09:54 +0200 (CEST)
From:   "Issam E. Maghni" <issam.e.maghni@mailbox.org>
To:     linux-next@vger.kernel.org
Cc:     "Issam E. Maghni" <issam.e.maghni@mailbox.org>
Subject: [PATCH] Syntax "test ... -a|o ..." obsolescent
Date:   Mon,  7 Sep 2020 18:09:23 +0000
Message-Id: <20200907180923.24105-1-issam.e.maghni@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -7.14 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1EC7226D
X-Rspamd-UID: bb3c09
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

See
* https://pubs.opengroup.org/onlinepubs/9699919799/utilities/test.html#tag_20_128_16
* https://pubs.opengroup.org/onlinepubs/9699919799/help/codes.html#OB%20XSI

Also, fixes
* tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc

Signed-off-by: Issam E. Maghni <issam.e.maghni@mailbox.org>
---
 Documentation/admin-guide/acpi/ssdt-overlays.rst   |  2 +-
 Documentation/admin-guide/laptops/laptop-mode.rst  |  6 +++---
 Documentation/firmware_class/hotplug-script        |  2 +-
 Documentation/power/swsusp.rst                     |  2 +-
 Documentation/target/target-export-device          |  2 +-
 Makefile                                           |  8 ++++----
 arch/arm/boot/compressed/Makefile                  |  2 +-
 arch/arm/tools/syscalltbl.sh                       |  2 +-
 arch/powerpc/boot/wrapper                          | 12 ++++++++----
 arch/x86/boot/genimage.sh                          |  2 +-
 arch/x86/entry/syscalls/syscalltbl.sh              |  2 +-
 samples/mic/mpssd/micctrl                          |  2 +-
 ...tgen_sample06_numa_awared_queue_irq_affinity.sh |  2 +-
 scripts/coccicheck                                 | 10 +++++-----
 scripts/depmod.sh                                  |  4 ++--
 scripts/dtc/dtx_diff                               |  2 +-
 scripts/extract-ikconfig                           |  2 +-
 scripts/extract-vmlinux                            |  2 +-
 scripts/package/mkspec                             |  2 +-
 scripts/patch-kernel                               |  4 ++--
 scripts/setlocalversion                            |  4 ++--
 scripts/tags.sh                                    |  2 +-
 scripts/tracing/ftrace-bisect.sh                   |  4 ++--
 tools/build/tests/run.sh                           |  2 +-
 tools/lib/bpf/Makefile                             | 10 +++++-----
 tools/memory-model/scripts/checkalllitmus.sh       |  2 +-
 tools/memory-model/scripts/cmplitmushist.sh        |  2 +-
 tools/memory-model/scripts/judgelitmus.sh          | 10 +++++-----
 tools/memory-model/scripts/parseargs.sh            |  2 +-
 tools/memory-model/scripts/runlitmus.sh            |  4 ++--
 tools/memory-model/scripts/simpletest.sh           |  2 +-
 tools/perf/arch/powerpc/Makefile                   |  4 ++--
 tools/perf/arch/s390/Makefile                      |  2 +-
 tools/perf/perf-with-kcore.sh                      |  2 +-
 .../tests/shell/record+probe_libc_inet_pton.sh     |  2 +-
 tools/perf/util/PERF-VERSION-GEN                   |  2 +-
 tools/power/cpupower/cpupower-completion.sh        |  2 +-
 tools/power/cpupower/utils/version-gen.sh          |  2 +-
 tools/scripts/utilities.mak                        |  2 +-
 tools/testing/selftests/bpf/test_xdp_redirect.sh   |  2 +-
 .../selftests/cpu-hotplug/cpu-on-off-test.sh       |  2 +-
 tools/testing/selftests/cpufreq/cpufreq.sh         |  2 +-
 tools/testing/selftests/cpufreq/governor.sh        |  2 +-
 tools/testing/selftests/cpufreq/main.sh            |  2 +-
 .../drivers/net/netdevsim/udp_tunnel_nic.sh        |  4 ++--
 tools/testing/selftests/ftrace/ftracetest          | 12 ++++++------
 .../selftests/ftrace/test.d/00basic/basic1.tc      |  7 +++++--
 .../selftests/ftrace/test.d/00basic/basic4.tc      |  2 +-
 .../test.d/ftrace/func-filter-notrace-pid.tc       |  4 ++--
 .../ftrace/test.d/ftrace/func-filter-pid.tc        |  4 ++--
 .../test.d/ftrace/func_traceonoff_triggers.tc      |  2 +-
 tools/testing/selftests/ftrace/test.d/functions    |  2 +-
 .../trigger-onmatch-onmax-action-hist.tc           |  2 +-
 .../selftests/kexec/test_kexec_file_load.sh        |  4 ++--
 tools/testing/selftests/kexec/test_kexec_load.sh   |  2 +-
 .../selftests/memory-hotplug/mem-on-off-test.sh    |  2 +-
 tools/testing/selftests/net/fcnal-test.sh          |  2 +-
 tools/testing/selftests/net/fib-onlink-tests.sh    |  2 +-
 .../selftests/net/fib_nexthop_multiprefix.sh       |  2 +-
 tools/testing/selftests/net/fib_nexthops.sh        |  2 +-
 tools/testing/selftests/net/fib_tests.sh           |  4 ++--
 tools/testing/selftests/net/icmp_redirect.sh       |  2 +-
 tools/testing/selftests/net/l2tp.sh                |  2 +-
 tools/testing/selftests/net/pmtu.sh                |  8 ++++----
 tools/testing/selftests/net/traceroute.sh          |  2 +-
 .../testing/selftests/rcutorture/bin/functions.sh  |  2 +-
 .../testing/selftests/rcutorture/bin/kvm-build.sh  |  2 +-
 .../selftests/rcutorture/bin/kvm-find-errors.sh    |  2 +-
 .../selftests/rcutorture/bin/kvm-recheck-lock.sh   |  2 +-
 .../selftests/rcutorture/bin/kvm-recheck-rcu.sh    |  4 ++--
 .../rcutorture/bin/kvm-recheck-rcuscale.sh         |  2 +-
 .../rcutorture/bin/kvm-recheck-refscale.sh         |  2 +-
 .../selftests/rcutorture/bin/kvm-recheck-scf.sh    |  2 +-
 .../selftests/rcutorture/bin/kvm-test-1-run.sh     | 14 +++++++-------
 .../selftests/rcutorture/bin/parse-console.sh      |  2 +-
 usr/gen_initramfs.sh                               |  4 ++--
 76 files changed, 131 insertions(+), 124 deletions(-)

diff --git a/Documentation/admin-guide/acpi/ssdt-overlays.rst b/Documentation/admin-guide/acpi/ssdt-overlays.rst
index 5d7e25988085..72dd6a413766 100644
--- a/Documentation/admin-guide/acpi/ssdt-overlays.rst
+++ b/Documentation/admin-guide/acpi/ssdt-overlays.rst
@@ -142,7 +142,7 @@ variable with the content from a given file::
             exit 1
     }
 
-    [ -n "$name" -a -f "$filename" ] || usage
+    [ -n "$name" ] && [ -f "$filename" ] || usage
 
     EFIVARFS="/sys/firmware/efi/efivars"
 
diff --git a/Documentation/admin-guide/laptops/laptop-mode.rst b/Documentation/admin-guide/laptops/laptop-mode.rst
index c984c4262f2e..a46ceab7a8ae 100644
--- a/Documentation/admin-guide/laptops/laptop-mode.rst
+++ b/Documentation/admin-guide/laptops/laptop-mode.rst
@@ -617,7 +617,7 @@ Control script::
 				/sbin/hdparm -B 1 $THISHD > /dev/null 2>&1
 			done
 		fi
-		if [ $DO_CPU -eq 1 -a -e /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq ]; then
+		if [ $DO_CPU -eq 1 ] && [ -e /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq ]; then
 			if [ $CPU_MAXFREQ = 'slowest' ]; then
 				CPU_MAXFREQ=`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
 			fi
@@ -630,7 +630,7 @@ Control script::
 		B_AGE=$((100*$DEF_AGE))
 		echo -n "Stopping laptop_mode"
 		echo 0 > /proc/sys/vm/laptop_mode
-		if [ -f /proc/sys/fs/xfs/age_buffer -a ! -f /proc/sys/fs/xfs/lm_age_buffer ] ; then
+		if [ -f /proc/sys/fs/xfs/age_buffer ] && [ ! -f /proc/sys/fs/xfs/lm_age_buffer ] ; then
 			# These need to be restored, if there are no lm_*.
 			echo $(($XFS_HZ*$DEF_XFS_AGE_BUFFER))	 	> /proc/sys/fs/xfs/age_buffer
 			echo $(($XFS_HZ*$DEF_XFS_SYNC_INTERVAL)) 	> /proc/sys/fs/xfs/sync_interval
@@ -679,7 +679,7 @@ Control script::
 				/sbin/hdparm -B 255 $THISHD > /dev/null 2>&1
 			done
 		fi
-		if [ $DO_CPU -eq 1 -a -e /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq ]; then
+		if [ $DO_CPU -eq 1 ] && [ -e /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq ]; then
 			echo `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq` > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
 		fi
 		echo "."
diff --git a/Documentation/firmware_class/hotplug-script b/Documentation/firmware_class/hotplug-script
index 8143a950b607..3acf9cbdccb7 100644
--- a/Documentation/firmware_class/hotplug-script
+++ b/Documentation/firmware_class/hotplug-script
@@ -6,7 +6,7 @@
 
 HOTPLUG_FW_DIR=/usr/lib/hotplug/firmware/
 
-if [ "$SUBSYSTEM" == "firmware" -a "$ACTION" == "add" ]; then
+if [ "$SUBSYSTEM" == "firmware" ] && [ "$ACTION" == "add" ]; then
   if [ -f $HOTPLUG_FW_DIR/$FIRMWARE ]; then
     echo 1 > /sys/$DEVPATH/loading
     cat $HOTPLUG_FW_DIR/$FIRMWARE > /sys/$DEVPATH/data
diff --git a/Documentation/power/swsusp.rst b/Documentation/power/swsusp.rst
index 8524f079e05c..14e198c42db4 100644
--- a/Documentation/power/swsusp.rst
+++ b/Documentation/power/swsusp.rst
@@ -428,7 +428,7 @@ A:
         # the logic here is:
         # if image_size > 0 (without kernel support, IMG_SZ will be zero),
         # then try again with image_size set to zero.
-	if [ $RET -ne 0 -a $IMG_SZ -ne 0 ]; then # try again with minimal image size
+	if [ $RET -ne 0 ] && [ $IMG_SZ -ne 0 ]; then # try again with minimal image size
                 echo 0 > /sys/power/image_size
                 echo -n disk > /sys/power/state
                 RET=$?
diff --git a/Documentation/target/target-export-device b/Documentation/target/target-export-device
index b803f4f886b5..d7215c93b153 100755
--- a/Documentation/target/target-export-device
+++ b/Documentation/target/target-export-device
@@ -29,7 +29,7 @@ shift $(($OPTIND - 1))
 
 DEVICE=$1
 [ -n "$DEVICE" ] || die "Missing device or file argument"
-[ -b $DEVICE -o -f $DEVICE ] || die "Invalid device or file: ${DEVICE}"
+[ -b $DEVICE ] || [ -f $DEVICE ] || die "Invalid device or file: ${DEVICE}"
 IQN="iqn.2003-01.org.linux-iscsi.$(hostname):$(basename $DEVICE)"
 [ -n "$PORTAL" ] || PORTAL="0.0.0.0:3260"
 
diff --git a/Makefile b/Makefile
index 1cfa5029fd2f..a438119f8368 100644
--- a/Makefile
+++ b/Makefile
@@ -548,9 +548,9 @@ PHONY += outputmakefile
 # ignore whole output directory
 outputmakefile:
 ifdef building_out_of_srctree
-	$(Q)if [ -f $(srctree)/.config -o \
-		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
+	$(Q)if [ -f $(srctree)/.config ] || \
+		[ -d $(srctree)/include/config ] || \
+		[ -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
 		echo >&2 "***"; \
 		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "*** in $(abs_srctree)";\
@@ -719,7 +719,7 @@ else # !may-sync-config
 PHONY += include/config/auto.conf
 
 include/config/auto.conf:
-	$(Q)test -e include/generated/autoconf.h -a -e $@ || (		\
+	$(Q)test -e include/generated/autoconf.h && test -e $@ || (	\
 	echo >&2;							\
 	echo >&2 "  ERROR: Kernel configuration is invalid.";		\
 	echo >&2 "         include/generated/autoconf.h or $@ are missing.";\
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index b1147b7f2c8d..7d94b621a6d3 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -158,7 +158,7 @@ bad_syms=$$($(NM) $@ | sed -n 's/^.\{8\} [bc] \(.*\)/\1/p') && \
     echo "$$bad_syms" >&2; false )
 
 check_for_multiple_zreladdr = \
-if [ $(words $(ZRELADDR)) -gt 1 -a "$(CONFIG_AUTO_ZRELADDR)" = "" ]; then \
+if [ $(words $(ZRELADDR)) -gt 1 ] && [ "$(CONFIG_AUTO_ZRELADDR)" = "" ]; then \
 	echo 'multiple zreladdrs: $(ZRELADDR)'; \
 	echo 'This needs CONFIG_AUTO_ZRELADDR to be set'; \
 	false; \
diff --git a/arch/arm/tools/syscalltbl.sh b/arch/arm/tools/syscalltbl.sh
index ae7e93cfbfd3..65c2d0749d33 100644
--- a/arch/arm/tools/syscalltbl.sh
+++ b/arch/arm/tools/syscalltbl.sh
@@ -6,7 +6,7 @@ my_abis=`echo "($3)" | tr ',' '|'`
 
 grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
     while read nr abi name entry compat; do
-        if [ "$abi" = "eabi" -a -n "$compat" ]; then
+        if [ "$abi" = "eabi" ] && [ -n "$compat" ]; then
             echo "$in: error: a compat entry for an EABI syscall ($name) makes no sense" >&2
             exit 1
         fi
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index cd58a62e810d..5cc85f1d9500 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -144,7 +144,11 @@ while [ "$#" -gt 0 ]; do
     -Z)
 	shift
 	[ "$#" -gt 0 ] || usage
-        [ "$1" != "gz" -o "$1" != "xz" -o "$1" != "lzma" -o "$1" != "lzo" -o "$1" != "none" ] || usage
+		case "$1" in
+			gz|xz|lzma|lzo) ;;
+			none) ;;
+			*) usage ;;
+		esac
 
 	compression=".$1"
 	uboot_comp=$1
@@ -176,7 +180,7 @@ done
 
 
 if [ -n "$dts" ]; then
-    if [ ! -r "$dts" -a -r "$object/dts/$dts" ]; then
+    if [ ! -r "$dts" ] && [ -r "$object/dts/$dts" ]; then
 	dts="$object/dts/$dts"
     fi
     if [ -z "$dtb" ]; then
@@ -231,7 +235,7 @@ link_address='0x400000'
 make_space=y
 
 
-if [ -n "$esm_blob" -a "$platform" != "pseries" ]; then
+if [ -n "$esm_blob" ] && [ "$platform" != "pseries" ]; then
     echo "ESM blob not support on non-pseries platforms" >&2
     exit 1
 fi
@@ -371,7 +375,7 @@ vmz="$tmpdir/`basename \"$kernel\"`.$ext"
 ${CROSS}objcopy $objflags "$kernel" "$vmz.$$"
 strip_size=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" "$vmz.$$")
 
-if [ -z "$cacheit" -o ! -f "$vmz$compression" -o "$vmz$compression" -ot "$kernel" ]; then
+if [ -z "$cacheit" ] || [ ! -f "$vmz$compression" ] || [ "$vmz$compression" -ot "$kernel" ]; then
     # recompress the image if we need to
     case $compression in
     .xz)
diff --git a/arch/x86/boot/genimage.sh b/arch/x86/boot/genimage.sh
index 6a10d52a4145..29532fdbdd23 100644
--- a/arch/x86/boot/genimage.sh
+++ b/arch/x86/boot/genimage.sh
@@ -95,7 +95,7 @@ geniso() {
 				ldlinux=/usr/$i/$j/ldlinux.c32
 			fi
 		done
-		if [ -n "$isolinux" -a -n "$ldlinux" ] ; then
+		if [ -n "$isolinux" ] && [ -n "$ldlinux" ] ; then
 			break
 		fi
 	done
diff --git a/arch/x86/entry/syscalls/syscalltbl.sh b/arch/x86/entry/syscalls/syscalltbl.sh
index 929bde120d6b..1c89384b9004 100644
--- a/arch/x86/entry/syscalls/syscalltbl.sh
+++ b/arch/x86/entry/syscalls/syscalltbl.sh
@@ -18,7 +18,7 @@ emit() {
     local entry="$3"
     local compat="$4"
 
-    if [ "$abi" != "I386" -a -n "$compat" ]; then
+    if [ "$abi" != "I386" ] && [ -n "$compat" ]; then
 	echo "a compat entry ($abi: $compat) for a 64-bit syscall makes no sense" >&2
 	exit 1
     fi
diff --git a/samples/mic/mpssd/micctrl b/samples/mic/mpssd/micctrl
index 030a60b04046..fb92eccce3b8 100755
--- a/samples/mic/mpssd/micctrl
+++ b/samples/mic/mpssd/micctrl
@@ -110,7 +110,7 @@ shutdown()
 _wait()
 {
 	f=$sysfs/$1
-	while [ "`cat $f/state`" != "offline" -a "`cat $f/state`" != "online" ]
+	while [ "`cat $f/state`" != "offline" ] && [ "`cat $f/state`" != "online" ]
 	do
 		sleep 1
 		echo -e "Waiting for $1 to go offline"
diff --git a/samples/pktgen/pktgen_sample06_numa_awared_queue_irq_affinity.sh b/samples/pktgen/pktgen_sample06_numa_awared_queue_irq_affinity.sh
index 728106060a02..376be6bcbd8c 100755
--- a/samples/pktgen/pktgen_sample06_numa_awared_queue_irq_affinity.sh
+++ b/samples/pktgen/pktgen_sample06_numa_awared_queue_irq_affinity.sh
@@ -27,7 +27,7 @@ node=`get_iface_node $DEV`
 irq_array=(`get_iface_irqs $DEV`)
 cpu_array=(`get_node_cpus $node`)
 
-[ $THREADS -gt ${#irq_array[*]} -o $THREADS -gt ${#cpu_array[*]}  ] && \
+[ $THREADS -gt ${#irq_array[*]} ] || [ $THREADS -gt ${#cpu_array[*]} ] && \
 	err 1 "Thread number $THREADS exceeds: min (${#irq_array[*]},${#cpu_array[*]})"
 
 # (example of setting default params in your script)
diff --git a/scripts/coccicheck b/scripts/coccicheck
index e04d328210ac..7ca2d594da3f 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -24,7 +24,7 @@ $SPATCH --help | grep "\-\-jobs" > /dev/null && USE_JOBS="yes"
 # The verbosity may be set by the environmental parameter V=
 # as for example with 'make V=1 coccicheck'
 
-if [ -n "$V" -a "$V" != "0" ]; then
+if [ -n "$V" ] && [ "$V" != "0" ]; then
 	VERBOSE="$V"
 else
 	VERBOSE=0
@@ -58,7 +58,7 @@ fi
 COCCIINCLUDE=${LINUXINCLUDE//-I/-I }
 COCCIINCLUDE=${COCCIINCLUDE// -include/ --include}
 
-if [ "$C" = "1" -o "$C" = "2" ]; then
+if [ "$C" = "1" ] || [ "$C" = "2" ]; then
     ONLINE=1
 
     # Take only the last argument, which is the C file to test
@@ -111,7 +111,7 @@ if [ "$MODE" = "chain" ] ; then
 	echo 'You have selected the "chain" mode.'
 	echo 'All available modes will be tried (in that order): patch, report, context, org'
     fi
-elif [ "$MODE" = "report" -o "$MODE" = "org" ] ; then
+elif [ "$MODE" = "report" ] || [ "$MODE" = "org" ] ; then
     FLAGS="--no-show-diff $FLAGS"
 fi
 
@@ -189,7 +189,7 @@ coccinelle () {
 #
 #    $SPATCH -D $MODE $FLAGS -parse_cocci $COCCI $OPT > /dev/null
 
-    if [ $VERBOSE -ne 0 -a $ONLINE -eq 0 ] ; then
+    if [ $VERBOSE -ne 0 ] && [ $ONLINE -eq 0 ] ; then
 
 	FILE=${COCCI#$srctree/}
 
@@ -244,7 +244,7 @@ coccinelle () {
 
 }
 
-if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
+if [ "$DEBUG_FILE" != "/dev/null" ] && [ "$DEBUG_FILE" != "" ]; then
 	if [ -f $DEBUG_FILE ]; then
 		echo "Debug file $DEBUG_FILE exists, bailing"
 		exit
diff --git a/scripts/depmod.sh b/scripts/depmod.sh
index e083bcae343f..b18d3ca159b8 100755
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -27,8 +27,8 @@ depmod_hack_needed=true
 tmp_dir=$(mktemp -d ${TMPDIR:-/tmp}/depmod.XXXXXX)
 mkdir -p "$tmp_dir/lib/modules/$KERNELRELEASE"
 if "$DEPMOD" -b "$tmp_dir" $KERNELRELEASE 2>/dev/null; then
-	if test -e "$tmp_dir/lib/modules/$KERNELRELEASE/modules.dep" -o \
-		-e "$tmp_dir/lib/modules/$KERNELRELEASE/modules.dep.bin"; then
+	if test -e "$tmp_dir/lib/modules/$KERNELRELEASE/modules.dep" || \
+		test -e "$tmp_dir/lib/modules/$KERNELRELEASE/modules.dep.bin"; then
 		depmod_hack_needed=false
 	fi
 fi
diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index d3422ee15e30..729638679785 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -135,7 +135,7 @@ compile_to_dts() {
 
 		dtx_arch=`echo "/${dtx}" | sed -e 's|.*/arch/||' -e 's|/.*||'`
 
-		if [ "${dtx_arch}" != ""  -a "${dtx_arch}" != "${ARCH}" ] ; then
+		if [ "${dtx_arch}" != "" ] && [ "${dtx_arch}" != "${ARCH}" ] ; then
 			hint_given=1
 			echo ""                                              >&2
 			echo "  architecture ${dtx_arch} is in file path,"   >&2
diff --git a/scripts/extract-ikconfig b/scripts/extract-ikconfig
index 3b42f255e2ba..db93fe5c17c2 100755
--- a/scripts/extract-ikconfig
+++ b/scripts/extract-ikconfig
@@ -41,7 +41,7 @@ try_decompress()
 # Check invocation:
 me=${0##*/}
 img=$1
-if	[ $# -ne 1 -o ! -s "$img" ]
+if	[ $# -ne 1 ] || [ ! -s "$img" ]
 then
 	echo "Usage: $me <kernel-image>" >&2
 	exit 2
diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
index 8995cd304e6e..76a6a3f057ea 100755
--- a/scripts/extract-vmlinux
+++ b/scripts/extract-vmlinux
@@ -38,7 +38,7 @@ try_decompress()
 # Check invocation:
 me=${0##*/}
 img=$1
-if	[ $# -ne 1 -o ! -s "$img" ]
+if	[ $# -ne 1 ] || [ ! -s "$img" ]
 then
 	echo "Usage: $me <kernel-image>" >&2
 	exit 2
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 7c477ca7dc98..98ec059fef1c 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -108,7 +108,7 @@ $S$M	ln -sf /usr/src/kernels/$KERNELRELEASE source
 	rm -rf %{buildroot}
 
 	%post
-	if [ -x /sbin/installkernel -a -r /boot/vmlinuz-$KERNELRELEASE -a -r /boot/System.map-$KERNELRELEASE ]; then
+	if [ -x /sbin/installkernel ] && [ -r /boot/vmlinuz-$KERNELRELEASE ] && [ -r /boot/System.map-$KERNELRELEASE ]; then
 	cp /boot/vmlinuz-$KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm
 	cp /boot/System.map-$KERNELRELEASE /boot/.System.map-$KERNELRELEASE-rpm
 	rm -f /boot/vmlinuz-$KERNELRELEASE /boot/System.map-$KERNELRELEASE
diff --git a/scripts/patch-kernel b/scripts/patch-kernel
index 033d5916797d..f684cb6b7834 100755
--- a/scripts/patch-kernel
+++ b/scripts/patch-kernel
@@ -66,7 +66,7 @@ sourcedir=${1-/usr/src/linux}
 patchdir=${2-.}
 stopvers=${3-default}
 
-if [ "$1" = -h -o "$1" = --help -o ! -r "$sourcedir/Makefile" ]; then
+if [ "$1" = -h ] || [ "$1" = --help ] || [ ! -r "$sourcedir/Makefile" ]; then
 cat << USAGE
 usage: $PNAME [-h] [ sourcedir [ patchdir [ stopversion ] [ -acxx ] ] ]
   source directory defaults to /usr/src/linux,
@@ -194,7 +194,7 @@ grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefile > $TMP
 tr -d [:blank:] < $TMPFILE > $TMPFILE.1
 . $TMPFILE.1
 rm -f $TMPFILE*
-if [ -z "$VERSION" -o -z "$PATCHLEVEL" -o -z "$SUBLEVEL" ]
+if [ -z "$VERSION" ] || [ -z "$PATCHLEVEL" ] || [ -z "$SUBLEVEL" ]
 then
     echo "unable to determine current kernel version" >&2
     exit 1
diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 20f2efd57b11..a187c10ce97a 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -25,7 +25,7 @@ if test $# -gt 0; then
 	srctree=$1
 	shift
 fi
-if test $# -gt 0 -o ! -d "$srctree"; then
+if test $# -gt 0 || test ! -d "$srctree"; then
 	usage
 fi
 
@@ -98,7 +98,7 @@ scm_version()
 			printf '%s%s' -hg "$id"
 		else
 			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
-			if [ -z "$tag" -o "$tag" = tip ]; then
+			if [ -z "$tag" ] || [ "$tag" = tip ]; then
 				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
 				printf '%s%s' -hg "$id"
 			fi
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 850f4ccb6afc..69a5d41a2f7c 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -19,7 +19,7 @@ ignore="$ignore ( -name *.mod.c ) -prune -o"
 
 # Use make KBUILD_ABS_SRCTREE=1 {tags|cscope}
 # to force full paths for a non-O= build
-if [ "${srctree}" = "." -o -z "${srctree}" ]; then
+if [ "${srctree}" = "." ] || [ -z "${srctree}" ]; then
 	tree=
 else
 	tree=${srctree}/
diff --git a/scripts/tracing/ftrace-bisect.sh b/scripts/tracing/ftrace-bisect.sh
index 926701162bc8..41f0b7c1ef55 100755
--- a/scripts/tracing/ftrace-bisect.sh
+++ b/scripts/tracing/ftrace-bisect.sh
@@ -99,7 +99,7 @@ fi
 if [ -f $test ]; then
 	echo -n "$test exists, delete it? [y/N]"
 	read a
-	if [ "$a" != "y" -a "$a" != "Y" ]; then
+	if [ "$a" != "y" ] && [ "$a" != "Y" ]; then
 		exit 1
 	fi
 fi
@@ -107,7 +107,7 @@ fi
 if [ -f $nontest ]; then
 	echo -n "$nontest exists, delete it? [y/N]"
 	read a
-	if [ "$a" != "y" -a "$a" != "Y" ]; then
+	if [ "$a" != "y" ] && [ "$a" != "Y" ]; then
 		exit 1
 	fi
 fi
diff --git a/tools/build/tests/run.sh b/tools/build/tests/run.sh
index 2c54e4d43546..b9428ad4e133 100755
--- a/tools/build/tests/run.sh
+++ b/tools/build/tests/run.sh
@@ -27,7 +27,7 @@ function test_ex_suffix {
 	  exit -1
 	fi
 
-	if [ ! -f ./ex/ex.o -o ! -f ./ex/ex.i -o ! -f ./ex/ex.s ]; then
+	if [ ! -f ./ex/ex.o ] || [ ! -f ./ex/ex.i ] || [ ! -f ./ex/ex.s ]; then
 	  echo FAILED
 	  exit -1
 	fi
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index fccc4dcda4b6..3aeaca1d75f7 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -157,19 +157,19 @@ all: fixdep
 all_cmd: $(CMD_TARGETS) check
 
 $(BPF_IN_SHARED): force elfdep zdep bpfdep $(BPF_HELPER_DEFS)
-	@(test -f ../../include/uapi/linux/bpf.h -a -f ../../../include/uapi/linux/bpf.h && ( \
+	@(test -f ../../include/uapi/linux/bpf.h && test -f ../../../include/uapi/linux/bpf.h && ( \
 	(diff -B ../../include/uapi/linux/bpf.h ../../../include/uapi/linux/bpf.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/bpf.h' differs from latest version at 'include/uapi/linux/bpf.h'" >&2 )) || true
-	@(test -f ../../include/uapi/linux/bpf_common.h -a -f ../../../include/uapi/linux/bpf_common.h && ( \
+	@(test -f ../../include/uapi/linux/bpf_common.h && test -f ../../../include/uapi/linux/bpf_common.h && ( \
 	(diff -B ../../include/uapi/linux/bpf_common.h ../../../include/uapi/linux/bpf_common.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/bpf_common.h' differs from latest version at 'include/uapi/linux/bpf_common.h'" >&2 )) || true
-	@(test -f ../../include/uapi/linux/netlink.h -a -f ../../../include/uapi/linux/netlink.h && ( \
+	@(test -f ../../include/uapi/linux/netlink.h && test -f ../../../include/uapi/linux/netlink.h && ( \
 	(diff -B ../../include/uapi/linux/netlink.h ../../../include/uapi/linux/netlink.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' differs from latest version at 'include/uapi/linux/netlink.h'" >&2 )) || true
-	@(test -f ../../include/uapi/linux/if_link.h -a -f ../../../include/uapi/linux/if_link.h && ( \
+	@(test -f ../../include/uapi/linux/if_link.h && test -f ../../../include/uapi/linux/if_link.h && ( \
 	(diff -B ../../include/uapi/linux/if_link.h ../../../include/uapi/linux/if_link.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' differs from latest version at 'include/uapi/linux/if_link.h'" >&2 )) || true
-	@(test -f ../../include/uapi/linux/if_xdp.h -a -f ../../../include/uapi/linux/if_xdp.h && ( \
+	@(test -f ../../include/uapi/linux/if_xdp.h && test -f ../../../include/uapi/linux/if_xdp.h && ( \
 	(diff -B ../../include/uapi/linux/if_xdp.h ../../../include/uapi/linux/if_xdp.h >/dev/null) || \
 	echo "Warning: Kernel ABI header at 'tools/include/uapi/linux/if_xdp.h' differs from latest version at 'include/uapi/linux/if_xdp.h'" >&2 )) || true
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(SHARED_OBJDIR) CFLAGS="$(CFLAGS) $(SHLIB_FLAGS)"
diff --git a/tools/memory-model/scripts/checkalllitmus.sh b/tools/memory-model/scripts/checkalllitmus.sh
index 2d3ee850a839..06e48068bf7f 100755
--- a/tools/memory-model/scripts/checkalllitmus.sh
+++ b/tools/memory-model/scripts/checkalllitmus.sh
@@ -27,7 +27,7 @@
 . scripts/parseargs.sh
 
 litmusdir=litmus-tests
-if test -d "$litmusdir" -a -r "$litmusdir" -a -x "$litmusdir"
+if test -d "$litmusdir" && test -r "$litmusdir" && test -x "$litmusdir"
 then
 	:
 else
diff --git a/tools/memory-model/scripts/cmplitmushist.sh b/tools/memory-model/scripts/cmplitmushist.sh
index ca1ac8b64614..d50798fdc387 100755
--- a/tools/memory-model/scripts/cmplitmushist.sh
+++ b/tools/memory-model/scripts/cmplitmushist.sh
@@ -66,7 +66,7 @@ comparetest () {
 
 	grep '^Observation' $1 > $T/oldout
 	grep '^Observation' $2 > $T/newout
-	if test -s $T/oldout -o -s $T/newout
+	if test -s $T/oldout || test -s $T/newout
 	then
 		if cmp -s $T/oldout $T/newout
 		then
diff --git a/tools/memory-model/scripts/judgelitmus.sh b/tools/memory-model/scripts/judgelitmus.sh
index 1ec5d89fcfbb..c028b268c9fb 100755
--- a/tools/memory-model/scripts/judgelitmus.sh
+++ b/tools/memory-model/scripts/judgelitmus.sh
@@ -30,7 +30,7 @@
 
 litmus=$1
 
-if test -f "$litmus" -a -r "$litmus"
+if test -f "$litmus" && test -r "$litmus"
 then
 	:
 else
@@ -46,7 +46,7 @@ else
 		sed -e 's/\.litmus$/.litmus.'${LKMM_HW_MAP_FILE}'/'`.out"
 	lkmmout=$litmus.out
 fi
-if test -f "$LKMM_DESTDIR/$litmusout" -a -r "$LKMM_DESTDIR/$litmusout"
+if test -f "$LKMM_DESTDIR/$litmusout" && test -r "$LKMM_DESTDIR/$litmusout"
 then
 	:
 else
@@ -64,11 +64,11 @@ then
 	then
 		datarace_predicted=1
 	fi
-	if test -n "$datarace_predicted" -a -z "$datarace_modeled" -a -z "$LKMM_HW_MAP_FILE"
+	if test -n "$datarace_predicted" && test -z "$datarace_modeled" && test -z "$LKMM_HW_MAP_FILE"
 	then
 		echo '!!! Predicted data race not modeled' $litmus
 		exit 252
-	elif test -z "$datarace_predicted" -a -n "$datarace_modeled"
+	elif test -z "$datarace_predicted" && test -n "$datarace_modeled"
 	then
 		# Note that hardware models currently don't model data races
 		echo '!!! Unexpected data race modeled' $litmus
@@ -138,7 +138,7 @@ elif grep '^Observation' $LKMM_DESTDIR/$litmusout | grep -q $outcome || test "$o
 then
 	ret=0
 else
-	if test \( -n "$LKMM_HW_MAP_FILE" -a "$outcome" = Sometimes \) -o -n "$datarace_modeled"
+	if test -n "$LKMM_HW_MAP_FILE" && test "$outcome" = Sometimes || test -n "$datarace_modeled"
 	then
 		flag="--- Forgiven"
 		ret=0
diff --git a/tools/memory-model/scripts/parseargs.sh b/tools/memory-model/scripts/parseargs.sh
index 08ded5909860..b95fdcdc24bb 100755
--- a/tools/memory-model/scripts/parseargs.sh
+++ b/tools/memory-model/scripts/parseargs.sh
@@ -83,7 +83,7 @@ do
 			echo "Cannot create directory --destdir '$LKMM_DESTDIR'"
 			usage
 		fi
-		if test -d "$LKMM_DESTDIR" -a -x "$LKMM_DESTDIR"
+		if test -d "$LKMM_DESTDIR" && test -x "$LKMM_DESTDIR"
 		then
 			:
 		else
diff --git a/tools/memory-model/scripts/runlitmus.sh b/tools/memory-model/scripts/runlitmus.sh
index 94608d4b6502..835bbf639374 100755
--- a/tools/memory-model/scripts/runlitmus.sh
+++ b/tools/memory-model/scripts/runlitmus.sh
@@ -24,7 +24,7 @@
 # Author: Paul E. McKenney <paulmck@linux.ibm.com>
 
 litmus=$1
-if test -f "$litmus" -a -r "$litmus"
+if test -f "$litmus" && test -r "$litmus"
 then
 	:
 else
@@ -32,7 +32,7 @@ else
 	exit 255
 fi
 
-if test -z "$LKMM_HW_MAP_FILE" -o ! -e $LKMM_DESTDIR/$litmus.out
+if test -z "$LKMM_HW_MAP_FILE" || test ! -e $LKMM_DESTDIR/$litmus.out
 then
 	# LKMM run
 	herdoptions=${LKMM_HERD_OPTIONS--conf linux-kernel.cfg}
diff --git a/tools/memory-model/scripts/simpletest.sh b/tools/memory-model/scripts/simpletest.sh
index 7edc5d361665..e1660e70a5cb 100755
--- a/tools/memory-model/scripts/simpletest.sh
+++ b/tools/memory-model/scripts/simpletest.sh
@@ -14,7 +14,7 @@
 
 litmus=$1
 
-if test -f "$litmus" -a -r "$litmus"
+if test -f "$litmus" && test -r "$litmus"
 then
 	:
 else
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index e58d00d62f02..6f7813a89216 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -23,13 +23,13 @@ systbl := $(sysprf)/mksyscalltbl
 _dummy := $(shell [ -d '$(out)' ] || mkdir -p '$(out)')
 
 $(header64): $(sysdef) $(systbl)
-	@(test -d ../../kernel -a -d ../../tools -a -d ../perf && ( \
+	@(test -d ../../kernel && test -d ../../tools && test -d ../perf && ( \
 	(diff -B $(sysdef) $(syskrn) >/dev/null) \
 	|| echo "Warning: Kernel ABI header at '$(sysdef)' differs from latest version at '$(syskrn)'" >&2 )) || true
 	$(Q)$(SHELL) '$(systbl)' '64' $(sysdef) > $@
 
 $(header32): $(sysdef) $(systbl)
-	@(test -d ../../kernel -a -d ../../tools -a -d ../perf && ( \
+	@(test -d ../../kernel && test -d ../../tools && test -d ../perf && ( \
 	(diff -B $(sysdef) $(syskrn) >/dev/null) \
 	|| echo "Warning: Kernel ABI header at '$(sysdef)' differs from latest version at '$(syskrn)'" >&2 )) || true
 	$(Q)$(SHELL) '$(systbl)' '32' $(sysdef) > $@
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index 6ac8887be7c9..ab254f41ebad 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -21,7 +21,7 @@ systbl := $(sysprf)/mksyscalltbl
 _dummy := $(shell [ -d '$(out)' ] || mkdir -p '$(out)')
 
 $(header): $(sysdef) $(systbl)
-	@(test -d ../../kernel -a -d ../../tools -a -d ../perf && ( \
+	@(test -d ../../kernel && test -d ../../tools && test -d ../perf && ( \
         (diff -B $(sysdef) $(syskrn) >/dev/null) \
         || echo "Warning: Kernel ABI header at '$(sysdef)' differs from latest version at '$(syskrn)'" >&2 )) || true
 	$(Q)$(SHELL) '$(systbl)' $(sysdef) > $@
diff --git a/tools/perf/perf-with-kcore.sh b/tools/perf/perf-with-kcore.sh
index 0b96545c8184..67ac7f245f62 100644
--- a/tools/perf/perf-with-kcore.sh
+++ b/tools/perf/perf-with-kcore.sh
@@ -161,7 +161,7 @@ record()
 				true
 			elif echo "${PERF_OPTIONS[@]}" | grep -q ' -t \|^-t \| -t$\|^-t$' ; then
 				true
-			elif [ ! -r /sys/kernel/debug -o ! -x /sys/kernel/debug ] ; then
+			elif [ ! -r /sys/kernel/debug ] || [ ! -x /sys/kernel/debug ] ; then
 				echo "*** WARNING *** /sys/kernel/debug permissions prevent tracepoint (sched_switch) use" >&2
 			fi
 		fi
diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index f12a4e217968..b507803f3ef2 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -22,7 +22,7 @@ add_libc_inet_pton_event() {
 	event_name=$(perf probe -f -x $libc -a inet_pton 2>&1 | tail -n +2 | head -n -5 | \
 			grep -P -o "$event_pattern(?=[[:space:]]\(on inet_pton in $libc\))")
 
-	if [ $? -ne 0 -o -z "$event_name" ] ; then
+	if [ $? -ne 0 ] || [ -z "$event_name" ] ; then
 		printf "FAIL: could not add event\n"
 		return 1
 	fi
diff --git a/tools/perf/util/PERF-VERSION-GEN b/tools/perf/util/PERF-VERSION-GEN
index 59241ff342be..8b7291f402fe 100755
--- a/tools/perf/util/PERF-VERSION-GEN
+++ b/tools/perf/util/PERF-VERSION-GEN
@@ -16,7 +16,7 @@ LF='
 #
 CID=
 TAG=
-if test -d ../../.git -o -f ../../.git
+if test -d ../../.git || test -f ../../.git
 then
 	TAG=$(git describe --abbrev=0 --match "v[0-9].[0-9]*" 2>/dev/null )
 	CID=$(git log -1 --abbrev=12 --pretty=format:"%h" 2>/dev/null) && CID="-g$CID"
diff --git a/tools/power/cpupower/cpupower-completion.sh b/tools/power/cpupower/cpupower-completion.sh
index e10839cfcfc1..ac2b7922b41b 100644
--- a/tools/power/cpupower/cpupower-completion.sh
+++ b/tools/power/cpupower/cpupower-completion.sh
@@ -105,7 +105,7 @@ _cpupower ()
 	done
 
 	# Complete name of subcommand if the user has not finished typing it yet.
-	if test $c -eq $COMP_CWORD -a -z "$command"; then
+	if test $c -eq $COMP_CWORD && test -z "$command"; then
 		COMPREPLY=($(compgen -W "help -v --version -c --cpu $_cpupower_commands" -- "${COMP_WORDS[COMP_CWORD]}"))
 		return
 	fi
diff --git a/tools/power/cpupower/utils/version-gen.sh b/tools/power/cpupower/utils/version-gen.sh
index c70de2eabffb..041378feafdf 100755
--- a/tools/power/cpupower/utils/version-gen.sh
+++ b/tools/power/cpupower/utils/version-gen.sh
@@ -11,7 +11,7 @@ LF='
 
 # First check if there is a .git to get the version from git describe
 # otherwise try to get the version from the kernel makefile
-if test -d ../../../.git -o -f ../../../.git &&
+if test -d ../../../.git || test -f ../../../.git &&
 	VN=$(git describe --abbrev=4 HEAD 2>/dev/null) &&
 	case "$VN" in
 	*$LF*) (exit 1) ;;
diff --git a/tools/scripts/utilities.mak b/tools/scripts/utilities.mak
index c16ce833079c..5cab3b8316b4 100644
--- a/tools/scripts/utilities.mak
+++ b/tools/scripts/utilities.mak
@@ -153,7 +153,7 @@ _l-sh = $(call shell-sq,command -v $(shell-sq) | $(call shell-escape-nl,))
 #
 is-executable = $(call _is-executable-helper,$(shell-sq))
 _is-executable-helper = $(shell sh -c $(_is-executable-sh))
-_is-executable-sh = $(call shell-sq,test -f $(1) -a -x $(1) && echo y)
+_is-executable-sh = $(call shell-sq,test -f $(1) && test -x $(1) && echo y)
 
 # get-executable
 #
diff --git a/tools/testing/selftests/bpf/test_xdp_redirect.sh b/tools/testing/selftests/bpf/test_xdp_redirect.sh
index dd80f0c84afb..da5c4819659f 100755
--- a/tools/testing/selftests/bpf/test_xdp_redirect.sh
+++ b/tools/testing/selftests/bpf/test_xdp_redirect.sh
@@ -62,7 +62,7 @@ test_xdp_redirect()
 	ip netns exec ns2 ping -c 1 10.1.1.11 &> /dev/null
 	local ret2=$?
 
-	if [ $ret1 -eq 0 -a $ret2 -eq 0 ]; then
+	if [ $ret1 -eq 0 ] && [ $ret2 -eq 0 ]; then
 		echo "selftests: test_xdp_redirect $xdpmode [PASS]";
 	else
 		ret=1
diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index 0d26b5e3f966..0bc136e4d294 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -178,7 +178,7 @@ while getopts e:ahp: opt; do
 	esac
 done
 
-if ! [ "$error" -ge -4095 -a "$error" -lt 0 ]; then
+if [ "$error" -lt -4095 ] || [ "$error" -ge 0 ]; then
 	echo "error code must be -4095 <= errno < 0" >&2
 	exit 1
 fi
diff --git a/tools/testing/selftests/cpufreq/cpufreq.sh b/tools/testing/selftests/cpufreq/cpufreq.sh
index b583a2fb4504..ba5e2b650a53 100755
--- a/tools/testing/selftests/cpufreq/cpufreq.sh
+++ b/tools/testing/selftests/cpufreq/cpufreq.sh
@@ -208,7 +208,7 @@ do_suspend()
 	printf "** Test: Running ${FUNCNAME[0]}: Trying $1 for $2 loops **\n\n"
 
 	# Is the directory available
-	if [ ! -d $SYSFS/power/ -o ! -f $SYSFS/power/state ]; then
+	if [ ! -d $SYSFS/power/ ] || [ ! -f $SYSFS/power/state ]; then
 		printf "$SYSFS/power/state not available\n"
 		return 1
 	fi
diff --git a/tools/testing/selftests/cpufreq/governor.sh b/tools/testing/selftests/cpufreq/governor.sh
index fe37df79c087..78ef6c0ce592 100755
--- a/tools/testing/selftests/cpufreq/governor.sh
+++ b/tools/testing/selftests/cpufreq/governor.sh
@@ -110,7 +110,7 @@ switch_show_governor()
 
 	printf "\nSwitched governor for $1 to $2\n\n"
 
-	if [ $2 == "userspace" -o $2 == "powersave" -o $2 == "performance" ]; then
+	if [ $2 == "userspace" ] || [ $2 == "powersave" ] || [ $2 == "performance" ]; then
 		printf "No files to read for $2 governor\n\n"
 		return
 	fi
diff --git a/tools/testing/selftests/cpufreq/main.sh b/tools/testing/selftests/cpufreq/main.sh
index 31f8c9a76c5f..22a295b5072c 100755
--- a/tools/testing/selftests/cpufreq/main.sh
+++ b/tools/testing/selftests/cpufreq/main.sh
@@ -104,7 +104,7 @@ do_test()
 	# Check if CPUs are managed by cpufreq or not
 	count=$(count_cpufreq_managed_cpus)
 
-	if [ $count = 0 -a $FUNC != "modtest" ]; then
+	if [ $count = 0 ] && [ $FUNC != "modtest" ]; then
 		echo "No cpu is managed by cpufreq core, exiting"
 		exit 2;
 	fi
diff --git a/tools/testing/selftests/drivers/net/netdevsim/udp_tunnel_nic.sh b/tools/testing/selftests/drivers/net/netdevsim/udp_tunnel_nic.sh
index ba1d53b9f815..aa40e885a057 100644
--- a/tools/testing/selftests/drivers/net/netdevsim/udp_tunnel_nic.sh
+++ b/tools/testing/selftests/drivers/net/netdevsim/udp_tunnel_nic.sh
@@ -153,10 +153,10 @@ function check_table {
     fi
 
     for i in "${!expected[@]}"; do
-	if [ -n "$HAS_ETHTOOL" -a ${expected[i]} -ne 0 ]; then
+	if [ -n "$HAS_ETHTOOL" ] && [ ${expected[i]} -ne 0 ]; then
 	    pp_expected=`pre_ethtool ${expected[i]}`
 	    ethtool --show-tunnels $NSIM_NETDEV | grep "$pp_expected" >/dev/null
-	    if [ $? -ne 0 -a $last -ne 0 ]; then
+	    if [ $? -ne 0 ] && [ $last -ne 0 ]; then
 		err_cnt "ethtool table $1 on port $port: $pfx - $msg"
 		echo "       check_table: ethtool does not contain '$pp_expected'"
 		ethtool --show-tunnels $NSIM_NETDEV
diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 8ec1922e974e..2f2fb66868da 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -189,7 +189,7 @@ parse_opts $*
 [ $DEBUG -ne 0 ] && set -x
 
 # Verify parameters
-if [ -z "$TRACING_DIR" -o ! -d "$TRACING_DIR" ]; then
+if [ -z "$TRACING_DIR" ] || [ ! -d "$TRACING_DIR" ]; then
   errexit "No ftrace directory found"
 fi
 
@@ -211,7 +211,7 @@ color_red=
 color_green=
 color_blue=
 # If stdout exists and number of colors is eight or more, use them
-if [ -t 1 -a "$ncolors" -ge 8 ]; then
+if [ -t 1 ] && [ "$ncolors" -ge 8 ]; then
   color_reset="\033[0m"
   color_red="\033[31m"
   color_green="\033[32m"
@@ -394,9 +394,9 @@ run_test() { # testfile
   eval_result $SIG_RESULT
   if [ $? -eq 0 ]; then
     # Remove test log if the test was done as it was expected.
-    [ $KEEP_LOG -eq 0 -a ! -z "$LOG_FILE" ] && rm $testlog
+    [ $KEEP_LOG -eq 0 ] && [ ! -z "$LOG_FILE" ] && rm $testlog
   else
-    [ $VERBOSE -eq 1 -o $VERBOSE -eq 2 ] && catlog $testlog
+    [ $VERBOSE -eq 0 ] || [ $VERBOSE -eq 2 ] && catlog $testlog
     TOTAL_RESULT=1
   fi
   rm -rf $TMPDIR
@@ -408,7 +408,7 @@ run_test() { # testfile
 # Main loop
 for t in $TEST_CASES; do
   run_test $t
-  if [ $STOP_FAILURE -ne 0 -a $TOTAL_RESULT -ne 0 ]; then
+  if [ $STOP_FAILURE -ne 0 ] && [ $TOTAL_RESULT -ne 0 ]; then
     echo "A failure detected. Stop test."
     exit 1
   fi
@@ -423,7 +423,7 @@ for t in $TEST_CASES; do
   run_test $t
   rmdir $TRACING_DIR
   TRACING_DIR=$SAVED_TRACING_DIR
-  if [ $STOP_FAILURE -ne 0 -a $TOTAL_RESULT -ne 0 ]; then
+  if [ $STOP_FAILURE -ne 0 ] && [ $TOTAL_RESULT -ne 0 ]; then
     echo "A failure detected. Stop test."
     exit 1
   fi
diff --git a/tools/testing/selftests/ftrace/test.d/00basic/basic1.tc b/tools/testing/selftests/ftrace/test.d/00basic/basic1.tc
index 9980ff14ae44..6893d996247f 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/basic1.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/basic1.tc
@@ -1,3 +1,6 @@
-#!/bin/sh
+#!/bin/sh -e
 # description: Basic trace file check
-test -f README -a -f trace -a -f tracing_on -a -f trace_pipe
+test -f README
+test -f trace
+test -f tracing_on
+test -f trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/00basic/basic4.tc b/tools/testing/selftests/ftrace/test.d/00basic/basic4.tc
index 0696098d6408..7f57768dbb21 100644
--- a/tools/testing/selftests/ftrace/test.d/00basic/basic4.tc
+++ b/tools/testing/selftests/ftrace/test.d/00basic/basic4.tc
@@ -1,5 +1,5 @@
 #!/bin/sh
 # description: Basic event tracing check
-test -f available_events -a -f set_event -a -d events
+test -f available_events && test -f set_event && test -d events
 # check scheduler events are available
 grep -q sched available_events && exit_pass || exit_fail
diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc
index acb17ce543d2..8d7a903e5e4d 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc
@@ -56,7 +56,7 @@ do_test() {
     count_other=`cat trace | grep -v ^# | grep -v $PID | wc -l`
 
     # count_pid should be 0
-    if [ $count_pid -ne 0 -o $count_other -eq 0 ]; then
+    if [ $count_pid -ne 0 ] || [ $count_other -eq 0 ]; then
 	fail "PID filtering not working? traced task = $count_pid; other tasks = $count_other "
     fi
 
@@ -82,7 +82,7 @@ do_test() {
     count_other=`cat trace | grep -v ^# | grep -v $PID | wc -l`
 
     # both should be zero
-    if [ $count_pid -ne 0 -o $count_other -ne 0 ]; then
+    if [ $count_pid -ne 0 ] || [ $count_other -ne 0 ]; then
 	fail "PID filtering not following fork? traced task = $count_pid; other tasks = $count_other "
     fi
 }
diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
index 9f0a9687c773..cf2183d1fe8b 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
@@ -56,7 +56,7 @@ do_test() {
     count_other=`cat trace | grep -v ^# | grep -v $PID | wc -l`
 
     # count_other should be 0
-    if [ $count_pid -eq 0 -o $count_other -ne 0 ]; then
+    if [ $count_pid -eq 0 ] || [ $count_other -ne 0 ]; then
 	fail "PID filtering not working?"
     fi
 
@@ -77,7 +77,7 @@ do_test() {
     count_other=`cat trace | grep -v ^# | grep -v $PID | wc -l`
 
     # count_other should NOT be 0
-    if [ $count_pid -eq 0 -o $count_other -eq 0 ]; then
+    if [ $count_pid -eq 0 ] || [ $count_other -eq 0 ]; then
 	fail "PID filtering not following fork?"
     fi
 }
diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc
index aee22289536b..6ebd82dc637f 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc
@@ -51,7 +51,7 @@ fi
 # powerpc uses .schedule
 func="schedule"
 available_file=available_filter_functions
-if [ -d ../../instances -a -f ../../available_filter_functions ]; then
+if [ -d ../../instances ] && [ -f ../../available_filter_functions ]; then
    available_file=../../available_filter_functions
 fi
 x=`grep '^\.schedule$' available_filter_functions | wc -l`
diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index c5dec55b7d95..f90983268608 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -58,7 +58,7 @@ reset_ftrace_filter() { # reset all triggers in set_ftrace_filter
 		continue;
 	fi
 	name=`echo $t | cut -d: -f1 | cut -d' ' -f1`
-	if [ $tr = "enable_event" -o $tr = "disable_event" ]; then
+	if [ $tr = "enable_event" ] || [ $tr = "disable_event" ]; then
 	    tr=`echo $t | cut -d: -f2-4`
 	    limit=`echo $t | cut -d: -f5`
 	else
diff --git a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc
index f4b03ab7c287..86d235ba9276 100644
--- a/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc
+++ b/tools/testing/selftests/ftrace/test.d/trigger/inter-event/trigger-onmatch-onmax-action-hist.tc
@@ -23,7 +23,7 @@ echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0:onmatch(sched.sc
 echo 'hist:keys=comm,pid,lat:wakeup_lat=lat:sort=lat' > events/synthetic/wakeup_latency/trigger
 
 ping $LOCALHOST -c 5
-if [ ! grep -q "ping" events/synthetic/wakeup_latency/hist -o ! grep -q "max:" events/sched/sched_switch/hist]; then
+if ! grep -q "ping" events/synthetic/wakeup_latency/hist || ! grep -q "max:" events/sched/sched_switch/hist; then
     fail "Failed to create onmatch-onmax action inter-event histogram"
 fi
 
diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index 2ff600388c30..d8f73a7f890a 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -128,7 +128,7 @@ kexec_file_load_test()
 			log_fail "$succeed_msg (missing sig)"
 		fi
 
-		if [ $kexec_sig_required -eq 1 -o $pe_sig_required -eq 1 ] \
+		if [ $kexec_sig_required -eq 1 ] || [ $pe_sig_required -eq 1 ] \
 		     && [ $pe_signed -eq 0 ]; then
 			log_fail "$succeed_msg (missing PE sig)"
 		fi
@@ -165,7 +165,7 @@ kexec_file_load_test()
 		fi
 	fi
 
-	if [ $kexec_sig_required -eq 1 -o $pe_sig_required -eq 1 ] \
+	if [ $kexec_sig_required -eq 1 ] || [ $pe_sig_required -eq 1 ] \
 	     && [ $pe_signed -eq 0 ]; then
 		log_pass "$failed_msg (missing PE sig)"
 	fi
diff --git a/tools/testing/selftests/kexec/test_kexec_load.sh b/tools/testing/selftests/kexec/test_kexec_load.sh
index 49c6aa929137..7501c9650f11 100755
--- a/tools/testing/selftests/kexec/test_kexec_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_load.sh
@@ -34,7 +34,7 @@ if [ $? -eq 0 ]; then
 	kexec --unload
 	if [ $secureboot -eq 1 ] && [ $arch_policy -eq 1 ]; then
 		log_fail "kexec_load succeeded"
-	elif [ $ima_appraise -eq 0 -o $arch_policy -eq 0 ]; then
+	elif [ $ima_appraise -eq 0 ] || [ $arch_policy -eq 0 ]; then
 		log_info "Either IMA or the IMA arch policy is not enabled"
 	fi
 	log_pass "kexec_load succeeded"
diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
index b37585e6aa38..68c7b7236374 100755
--- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
+++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
@@ -162,7 +162,7 @@ while getopts e:hp:r: opt; do
 	esac
 done
 
-if ! [ "$error" -ge -4095 -a "$error" -lt 0 ]; then
+if [ "$error" -lt -4095 ] || [ "$error" -ge 0 ]; then
 	echo "error code must be -4095 <= errno < 0" >&2
 	exit 1
 fi
diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
index fb5c55dd6df8..38091642e4a2 100755
--- a/tools/testing/selftests/net/fcnal-test.sh
+++ b/tools/testing/selftests/net/fcnal-test.sh
@@ -190,7 +190,7 @@ do_run_cmd()
 
 	out=$($cmd 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "$out"
 	fi
 
diff --git a/tools/testing/selftests/net/fib-onlink-tests.sh b/tools/testing/selftests/net/fib-onlink-tests.sh
index c287b90b8af8..ea1ed7918ac5 100755
--- a/tools/testing/selftests/net/fib-onlink-tests.sh
+++ b/tools/testing/selftests/net/fib-onlink-tests.sh
@@ -132,7 +132,7 @@ run_cmd()
 
 	out=$(eval $cmd 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 	fi
 
diff --git a/tools/testing/selftests/net/fib_nexthop_multiprefix.sh b/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
index 51df5e305855..13f7cb5a2249 100755
--- a/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
+++ b/tools/testing/selftests/net/fib_nexthop_multiprefix.sh
@@ -56,7 +56,7 @@ run_cmd()
 
 	out=$(eval $cmd 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "$out"
 	fi
 
diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index b74884d52913..7dca6445d056 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -81,7 +81,7 @@ run_cmd()
 
 	out=$(eval $cmd $stderr)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 	fi
 
diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index 84205c3a55eb..874f4d455d71 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -492,7 +492,7 @@ add_rt()
 
 	out=$(eval $cmd 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 	fi
 	log_test $rc $erc "$desc"
@@ -652,7 +652,7 @@ run_cmd()
 
 	out=$(eval $cmd $stderr)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 	fi
 
diff --git a/tools/testing/selftests/net/icmp_redirect.sh b/tools/testing/selftests/net/icmp_redirect.sh
index bf361f30d6ef..9e2f10fed96a 100755
--- a/tools/testing/selftests/net/icmp_redirect.sh
+++ b/tools/testing/selftests/net/icmp_redirect.sh
@@ -99,7 +99,7 @@ run_cmd()
 
 	out=$(eval $cmd 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "$out"
 	fi
 
diff --git a/tools/testing/selftests/net/l2tp.sh b/tools/testing/selftests/net/l2tp.sh
index 5782433886fc..ea61a65fd67d 100755
--- a/tools/testing/selftests/net/l2tp.sh
+++ b/tools/testing/selftests/net/l2tp.sh
@@ -59,7 +59,7 @@ run_cmd()
 
 	out=$(eval ip netns exec ${ns} ${cmd} 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 	fi
 
diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
index 6bbf69a28e12..c338d4c40ccb 100755
--- a/tools/testing/selftests/net/pmtu.sh
+++ b/tools/testing/selftests/net/pmtu.sh
@@ -336,7 +336,7 @@ run_cmd() {
 
 	out="$($cmd 2>&1)"
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 		echo
 	fi
@@ -836,7 +836,7 @@ mtu_parse() {
 
 	next=0
 	for i in ${input}; do
-		[ ${next} -eq 1 -a "${i}" = "lock" ] && next=2 && continue
+		[ ${next} -eq 1 ] && [ "${i}" = "lock" ] && next=2 && continue
 		[ ${next} -eq 1 ] && echo "${i}" && return
 		[ ${next} -eq 2 ] && echo "lock ${i}" && return
 		[ "${i}" = "mtu" ] && next=1
@@ -1463,7 +1463,7 @@ test_pmtu_vti4_link_add_mtu() {
 		# This can fail, or MTU can be adjusted to a proper value
 		[ $? -ne 0 ] && continue
 		mtu="$(link_get_mtu "${ns_a}" vti4_a)"
-		if [ ${mtu} -lt ${min} -o ${mtu} -gt ${max} ]; then
+		if [ ${mtu} -lt ${min} ] || [ ${mtu} -gt ${max} ]; then
 			err "  vti tunnel created with invalid MTU ${mtu}"
 			fail=1
 		fi
@@ -1501,7 +1501,7 @@ test_pmtu_vti6_link_add_mtu() {
 		# This can fail, or MTU can be adjusted to a proper value
 		[ $? -ne 0 ] && continue
 		mtu="$(link_get_mtu "${ns_a}" vti6_a)"
-		if [ ${mtu} -lt ${min} -o ${mtu} -gt ${max} ]; then
+		if [ ${mtu} -lt ${min} ] || [ ${mtu} -gt ${max} ]; then
 			err "  vti6 tunnel created with invalid MTU ${v}"
 			fail=1
 		fi
diff --git a/tools/testing/selftests/net/traceroute.sh b/tools/testing/selftests/net/traceroute.sh
index de9ca97abc30..90aa708f838b 100755
--- a/tools/testing/selftests/net/traceroute.sh
+++ b/tools/testing/selftests/net/traceroute.sh
@@ -48,7 +48,7 @@ run_cmd()
 
 	out=$(eval ip netns exec ${ns} ${cmd} 2>&1)
 	rc=$?
-	if [ "$VERBOSE" = "1" -a -n "$out" ]; then
+	if [ "$VERBOSE" = "1" ] && [ -n "$out" ]; then
 		echo "    $out"
 	fi
 
diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
index 51f3464b96d3..37453170ec98 100644
--- a/tools/testing/selftests/rcutorture/bin/functions.sh
+++ b/tools/testing/selftests/rcutorture/bin/functions.sh
@@ -211,7 +211,7 @@ identify_qemu_args () {
 	qemu-system-ppc64)
 		echo -enable-kvm -M pseries -nodefaults
 		echo -device spapr-vscsi
-		if test -n "$TORTURE_QEMU_INTERACTIVE" -a -n "$TORTURE_QEMU_MAC"
+		if test -n "$TORTURE_QEMU_INTERACTIVE" && test -n "$TORTURE_QEMU_MAC"
 		then
 			echo -device spapr-vlan,netdev=net0,mac=$TORTURE_QEMU_MAC
 			echo -netdev bridge,br=br0,id=net0
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-build.sh b/tools/testing/selftests/rcutorture/bin/kvm-build.sh
index 115e1822b26f..1e326d18e5f6 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-build.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-build.sh
@@ -16,7 +16,7 @@ then
 fi
 
 config_template=${1}
-if test -z "$config_template" -o ! -f "$config_template" -o ! -r "$config_template"
+if test -z "$config_template" || test ! -f "$config_template" || test ! -r "$config_template"
 then
 	echo "kvm-build.sh :$config_template: Not a readable file"
 	exit 1
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-find-errors.sh b/tools/testing/selftests/rcutorture/bin/kvm-find-errors.sh
index 6f50722f251f..e22c2cb4604b 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-find-errors.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-find-errors.sh
@@ -18,7 +18,7 @@
 # Author: Paul E. McKenney <paulmck@linux.ibm.com>
 
 rundir="${1}"
-if test -z "$rundir" -o ! -d "$rundir"
+if test -z "$rundir" || test ! -d "$rundir"
 then
 	echo Directory "$rundir" not found.
 	echo Usage: $0 directory
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-recheck-lock.sh b/tools/testing/selftests/rcutorture/bin/kvm-recheck-lock.sh
index f3a7a5e2b89d..abef3cf6c9a6 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-recheck-lock.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-recheck-lock.sh
@@ -10,7 +10,7 @@
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
 i="$1"
-if test -d "$i" -a -r "$i"
+if test -d "$i" && test -r "$i"
 then
 	:
 else
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcu.sh b/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcu.sh
index 1706cd4466b4..3c4abda144cb 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcu.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcu.sh
@@ -10,7 +10,7 @@
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
 i="$1"
-if test -d "$i" -a -r "$i"
+if test -d "$i" && test -r "$i"
 then
 	:
 else
@@ -66,7 +66,7 @@ else
 	fi
 	# Compute number of close calls per tenth of an hour
 	nclosecalls10=`awk -v nclosecalls=$nclosecalls -v dur=$dur 'BEGIN { print int(nclosecalls * 36000 / dur) }' < /dev/null`
-	if test $nclosecalls10 -gt 5 -a $nclosecalls -gt 1
+	if test $nclosecalls10 -gt 5 && test $nclosecalls -gt 1
 	then
 		print_bug $nclosecalls "Reader Batch close calls in" $(($dur/60)) minute run: $i
 	else
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcuscale.sh b/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcuscale.sh
index aa745152a525..dbbdb4edf851 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcuscale.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-recheck-rcuscale.sh
@@ -10,7 +10,7 @@
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
 i="$1"
-if test -d "$i" -a -r "$i"
+if test -d "$i" && test -r "$i"
 then
 	:
 else
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-recheck-refscale.sh b/tools/testing/selftests/rcutorture/bin/kvm-recheck-refscale.sh
index 35a463dddffe..813639127b00 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-recheck-refscale.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-recheck-refscale.sh
@@ -10,7 +10,7 @@
 # Authors: Paul E. McKenney <paulmck@linux.ibm.com>
 
 i="$1"
-if test -d "$i" -a -r "$i"
+if test -d "$i" && test -r "$i"
 then
 	:
 else
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-recheck-scf.sh b/tools/testing/selftests/rcutorture/bin/kvm-recheck-scf.sh
index 671bfee4fcef..b20c4f6edd3e 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-recheck-scf.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-recheck-scf.sh
@@ -10,7 +10,7 @@
 # Authors: Paul E. McKenney <paulmck@kernel.org>
 
 i="$1"
-if test -d "$i" -a -r "$i"
+if test -d "$i" && test -r "$i"
 then
 	:
 else
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh b/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh
index d04966ab88cc..b579308fbe99 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh
@@ -37,7 +37,7 @@ config_dir=`echo $config_template | sed -e 's,/[^/]*$,,'`
 title=`echo $config_template | sed -e 's/^.*\///'`
 builddir=${2}
 resdir=${3}
-if test -z "$resdir" -o ! -d "$resdir" -o ! -w "$resdir"
+if test -z "$resdir" || test ! -d "$resdir" || test ! -w "$resdir"
 then
 	echo "kvm-test-1-run.sh :$resdir: Not a writable directory, cannot store results into it"
 	exit 1
@@ -73,7 +73,7 @@ config_override_param "--kconfig argument" KcList "$TORTURE_KCONFIG_ARG"
 cp $T/KcList $resdir/ConfigFragment
 
 base_resdir=`echo $resdir | sed -e 's/\.[0-9]\+$//'`
-if test "$base_resdir" != "$resdir" -a -f $base_resdir/bzImage -a -f $base_resdir/vmlinux
+if test "$base_resdir" != "$resdir" && test -f $base_resdir/bzImage && test -f $base_resdir/vmlinux
 then
 	# Rerunning previous test, so use that test's kernel.
 	QEMU="`identify_qemu $base_resdir/vmlinux`"
@@ -199,7 +199,7 @@ then
 fi
 while :
 do
-	if test -z "$qemu_pid" -a -s "$resdir/qemu_pid"
+	if test -z "$qemu_pid" && test -s "$resdir/qemu_pid"
 	then
 		qemu_pid=`cat "$resdir/qemu_pid"`
 	fi
@@ -232,11 +232,11 @@ do
 		break
 	fi
 done
-if test -z "$qemu_pid" -a -s "$resdir/qemu_pid"
+if test -z "$qemu_pid" && test -s "$resdir/qemu_pid"
 then
 	qemu_pid=`cat "$resdir/qemu_pid"`
 fi
-if test $commandcompleted -eq 0 -a -n "$qemu_pid"
+if test $commandcompleted -eq 0 && test -n "$qemu_pid"
 then
 	if ! test -f "$TORTURE_STOPFILE"
 	then
@@ -269,11 +269,11 @@ then
 		then
 			last_ts=0
 		fi
-		if test "$newline" != "$oldline" -a "$last_ts" -lt $((seconds + $TORTURE_SHUTDOWN_GRACE))
+		if test "$newline" != "$oldline" && test "$last_ts" -lt $((seconds + $TORTURE_SHUTDOWN_GRACE))
 		then
 			must_continue=yes
 		fi
-		if test $must_continue = no -a $kruntime -ge $((seconds + $TORTURE_SHUTDOWN_GRACE))
+		if test $must_continue = no && test $kruntime -ge $((seconds + $TORTURE_SHUTDOWN_GRACE))
 		then
 			echo "!!! PID $qemu_pid hung at $kruntime vs. $seconds seconds" >> $resdir/Warnings 2>&1
 			kill -KILL $qemu_pid
diff --git a/tools/testing/selftests/rcutorture/bin/parse-console.sh b/tools/testing/selftests/rcutorture/bin/parse-console.sh
index e03338091a06..c96ace4cf0e9 100755
--- a/tools/testing/selftests/rcutorture/bin/parse-console.sh
+++ b/tools/testing/selftests/rcutorture/bin/parse-console.sh
@@ -20,7 +20,7 @@ trap 'rm -f $T.seq $T.diags' 0
 . functions.sh
 
 # Check for presence and readability of console output file
-if test -f "$file" -a -r "$file"
+if test -f "$file" && test -r "$file"
 then
 	:
 else
diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
index 8ae831657e5d..cfc851cf87dd 100755
--- a/usr/gen_initramfs.sh
+++ b/usr/gen_initramfs.sh
@@ -50,7 +50,7 @@ filetype() {
 		echo "file"
 	elif [ -d "${argv1}" ]; then
 		echo "dir"
-	elif [ -b "${argv1}" -o -c "${argv1}" ]; then
+	elif [ -b "${argv1}" ] || [ -c "${argv1}" ]; then
 		echo "nod"
 	elif [ -p "${argv1}" ]; then
 		echo "pipe"
@@ -74,7 +74,7 @@ print_mtime() {
 }
 
 list_parse() {
-	if [ -z "$dep_list" -o -L "$1" ]; then
+	if [ -z "$dep_list" ] || [ -L "$1" ]; then
 		return
 	fi
 	echo "$1" | sed 's/:/\\:/g; s/$/ \\/' >> $dep_list
-- 
2.28.0

