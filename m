Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263733DBAE6
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 16:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239424AbhG3Omj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 10:42:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239546AbhG3Omg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jul 2021 10:42:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC08260EFD;
        Fri, 30 Jul 2021 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627656151;
        bh=Sqprs7ukr1mxsrddFo4WiemW0iwbqiiI/Le4/JOdiE8=;
        h=From:To:Cc:Subject:Date:From;
        b=w8F4wxllomV6ABr+71Vq4S2v7ioIAxKfn4jqlKxgU9qI/A9z4ZEi+JuJkFSHETNfB
         LsDe2pFSogWqwIeWEoyfBGO/FRmNq25Qf6jPYxQaDJ1/S8DxZirTW0nFkff7KCe7ti
         zV3R4nL0LLWSYpN5xLidcseoHJUs8jEg7hgx7uQ0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-staging@lists.linux.dev
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Phillip Potter <phil@philpotter.co.uk>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] staging: r8188eu: fix include directory mess
Date:   Fri, 30 Jul 2021 16:42:27 +0200
Message-Id: <20210730144227.1770212-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=71893; h=from:subject; bh=Sqprs7ukr1mxsrddFo4WiemW0iwbqiiI/Le4/JOdiE8=; b=owGbwMvMwCRo6H6F97bub03G02pJDIks/JfcbbZMjbix/d/hvS+8NEwjNvFUCTAwSPROjrvzrCeS bdeFjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIrU0MC9rFnp6vZ2dXc1LsX/pu9b rQKu3jdxgWbDTwYu84V3Wvzfmyv9qG06ttN8/fDgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The driver seems to want to include a specific directory for all include
files on the build path, but that breaks when trying to build only the
module directory, or when building with "O=" option.

Fix this up by making all includes for the driver be relative locations.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/Makefile              |  2 -
 drivers/staging/r8188eu/core/rtw_ap.c         |  8 ++--
 drivers/staging/r8188eu/core/rtw_br_ext.c     | 32 ++++++-------
 drivers/staging/r8188eu/core/rtw_cmd.c        | 14 +++---
 drivers/staging/r8188eu/core/rtw_debug.c      |  4 +-
 drivers/staging/r8188eu/core/rtw_efuse.c      |  6 +--
 drivers/staging/r8188eu/core/rtw_ieee80211.c  | 12 ++---
 drivers/staging/r8188eu/core/rtw_io.c         | 10 ++--
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  | 12 ++---
 drivers/staging/r8188eu/core/rtw_iol.c        |  2 +-
 drivers/staging/r8188eu/core/rtw_led.c        |  4 +-
 drivers/staging/r8188eu/core/rtw_mlme.c       | 22 ++++-----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 14 +++---
 drivers/staging/r8188eu/core/rtw_mp.c         |  7 ++-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   | 10 ++--
 drivers/staging/r8188eu/core/rtw_p2p.c        |  6 +--
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  8 ++--
 drivers/staging/r8188eu/core/rtw_recv.c       | 18 ++++----
 drivers/staging/r8188eu/core/rtw_rf.c         |  8 ++--
 drivers/staging/r8188eu/core/rtw_security.c   |  8 ++--
 drivers/staging/r8188eu/core/rtw_sreset.c     |  2 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    | 12 ++---
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  6 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       | 14 +++---
 drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c  |  4 +-
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  2 +-
 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  5 +-
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |  4 +-
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |  5 +-
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  2 +-
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |  2 +-
 drivers/staging/r8188eu/hal/hal_com.c         | 10 ++--
 drivers/staging/r8188eu/hal/hal_intf.c        |  6 +--
 drivers/staging/r8188eu/hal/odm.c             |  2 +-
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |  2 +-
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    |  2 +-
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  2 +-
 drivers/staging/r8188eu/hal/odm_debug.c       |  2 +-
 drivers/staging/r8188eu/hal/odm_interface.c   |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    | 16 +++----
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  7 ++-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 15 +++---
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     |  8 ++--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  8 ++--
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  7 ++-
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  6 +--
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c |  4 +-
 drivers/staging/r8188eu/hal/rtl8188e_xmit.c   |  6 +--
 drivers/staging/r8188eu/hal/rtl8188eu_led.c   |  8 ++--
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  | 24 +++++-----
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  | 12 ++---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 18 ++++----
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 12 ++---
 .../staging/r8188eu/include/HalPwrSeqCmd.h    |  2 +-
 drivers/staging/r8188eu/include/cmd_osdep.h   |  4 +-
 drivers/staging/r8188eu/include/drv_types.h   | 46 +++++++++----------
 drivers/staging/r8188eu/include/hal_intf.h    |  6 +--
 drivers/staging/r8188eu/include/ieee80211.h   |  4 +-
 .../staging/r8188eu/include/ieee80211_ext.h   |  4 +-
 drivers/staging/r8188eu/include/mlme_osdep.h  |  4 +-
 drivers/staging/r8188eu/include/odm_precomp.h |  6 +--
 drivers/staging/r8188eu/include/odm_types.h   |  2 +-
 drivers/staging/r8188eu/include/osdep_intf.h  |  4 +-
 .../staging/r8188eu/include/osdep_service.h   |  2 +-
 drivers/staging/r8188eu/include/recv_osdep.h  |  4 +-
 .../staging/r8188eu/include/rtl8188e_led.h    |  4 +-
 .../staging/r8188eu/include/rtl8188e_sreset.h |  6 +--
 drivers/staging/r8188eu/include/rtw_ap.h      |  4 +-
 drivers/staging/r8188eu/include/rtw_cmd.h     | 10 ++--
 drivers/staging/r8188eu/include/rtw_debug.h   |  4 +-
 drivers/staging/r8188eu/include/rtw_eeprom.h  |  4 +-
 drivers/staging/r8188eu/include/rtw_efuse.h   |  2 +-
 drivers/staging/r8188eu/include/rtw_event.h   |  4 +-
 drivers/staging/r8188eu/include/rtw_ht.h      |  2 +-
 drivers/staging/r8188eu/include/rtw_io.h      |  4 +-
 drivers/staging/r8188eu/include/rtw_ioctl.h   |  4 +-
 .../staging/r8188eu/include/rtw_ioctl_rtl.h   |  4 +-
 .../staging/r8188eu/include/rtw_ioctl_set.h   |  2 +-
 drivers/staging/r8188eu/include/rtw_iol.h     |  4 +-
 drivers/staging/r8188eu/include/rtw_led.h     |  4 +-
 drivers/staging/r8188eu/include/rtw_mlme.h    |  8 ++--
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  6 +--
 drivers/staging/r8188eu/include/rtw_mp.h      |  2 +-
 .../staging/r8188eu/include/rtw_mp_ioctl.h    | 12 ++---
 drivers/staging/r8188eu/include/rtw_p2p.h     |  2 +-
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  4 +-
 drivers/staging/r8188eu/include/rtw_recv.h    |  4 +-
 drivers/staging/r8188eu/include/rtw_rf.h      |  2 +-
 .../staging/r8188eu/include/rtw_security.h    |  4 +-
 drivers/staging/r8188eu/include/rtw_sreset.h  |  6 +--
 drivers/staging/r8188eu/include/rtw_xmit.h    |  6 +--
 drivers/staging/r8188eu/include/sta_info.h    |  6 +--
 drivers/staging/r8188eu/include/usb_ops.h     |  8 ++--
 drivers/staging/r8188eu/include/usb_osintf.h  |  6 +--
 drivers/staging/r8188eu/include/xmit_osdep.h  |  4 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 34 +++++++-------
 drivers/staging/r8188eu/os_dep/mlme_linux.c   |  6 +--
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 18 ++++----
 .../staging/r8188eu/os_dep/osdep_service.c    | 10 ++--
 drivers/staging/r8188eu/os_dep/recv_linux.c   | 14 +++---
 drivers/staging/r8188eu/os_dep/rtw_android.c  | 11 ++---
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 21 ++++-----
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  6 +--
 drivers/staging/r8188eu/os_dep/xmit_linux.c   | 19 ++++----
 104 files changed, 399 insertions(+), 414 deletions(-)

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index a97cced2e61a..152d6325b4d9 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -11,8 +11,6 @@ EXTRA_CFLAGS += -Wno-unused
 
 EXTRA_CFLAGS += -Wno-uninitialized
 
-EXTRA_CFLAGS += -I$(src)/include
-
 ccflags-y += -D__CHECK_ENDIAN__
 
 CONFIG_R8188EU = m
diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 407c62cf803c..c7c892ab4ae6 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -3,10 +3,10 @@
 
 #define _RTW_AP_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
-#include <ieee80211.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wifi.h"
+#include "../include/ieee80211.h"
 
 #ifdef CONFIG_88EU_AP_MODE
 
diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index e00302137a60..6e42ecd0b53f 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -3,26 +3,26 @@
 
 #define _RTW_BR_EXT_C_
 
-#include <linux/if_arp.h>
-#include <net/ip.h>
-#include <net/ipx.h>
-#include <linux/atalk.h>
-#include <linux/udp.h>
-#include <linux/if_pppox.h>
-
-#include <drv_types.h>
-#include "rtw_br_ext.h"
-#include <usb_osintf.h>
-#include <recv_osdep.h>
+#include "../include/linux/if_arp.h"
+#include "../include/net/ip.h"
+#include "../include/net/ipx.h"
+#include "../include/linux/atalk.h"
+#include "../include/linux/udp.h"
+#include "../include/linux/if_pppox.h"
+
+#include "../include/drv_types.h"
+#include "../include/rtw_br_ext.h"
+#include "../include/usb_osintf.h"
+#include "../include/recv_osdep.h"
 
 #ifndef csum_ipv6_magic
-#include <net/ip6_checksum.h>
+#include "../include/net/ip6_checksum.h"
 #endif
 
-#include <linux/ipv6.h>
-#include <linux/icmpv6.h>
-#include <net/ndisc.h>
-#include <net/checksum.h>
+#include "../include/linux/ipv6.h"
+#include "../include/linux/icmpv6.h"
+#include "../include/net/ndisc.h"
+#include "../include/net/checksum.h"
 
 #define NAT25_IPV4		01
 #define NAT25_IPV6		02
diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 159346d97110..4e17972ee66e 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -3,13 +3,13 @@
 
 #define _RTW_CMD_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <cmd_osdep.h>
-#include <mlme_osdep.h>
-#include <rtw_br_ext.h>
-#include <rtw_mlme_ext.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/cmd_osdep.h"
+#include "../include/mlme_osdep.h"
+#include "../include/rtw_br_ext.h"
+#include "../include/rtw_mlme_ext.h"
 
 /*
 Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
diff --git a/drivers/staging/r8188eu/core/rtw_debug.c b/drivers/staging/r8188eu/core/rtw_debug.c
index a0ca61d8c3b8..30ef77842787 100644
--- a/drivers/staging/r8188eu/core/rtw_debug.c
+++ b/drivers/staging/r8188eu/core/rtw_debug.c
@@ -3,8 +3,8 @@
 
 #define _RTW_DEBUG_C_
 
-#include <rtw_debug.h>
-#include <drv_types.h>
+#include "../include/rtw_debug.h"
+#include "../include/drv_types.h"
 
 int proc_get_drv_version(char *page, char **start,
 			  off_t offset, int count,
diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 216ec4036c1a..82eb2134c1e4 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -3,9 +3,9 @@
 
 #define _RTW_EFUSE_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtw_efuse.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_efuse.h"
 
 /*------------------------Define local variable------------------------------*/
 u8 fakeEfuseBank;
diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 7f98ffc7442d..270a3848c3d6 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -3,12 +3,12 @@
 
 #define _IEEE80211_C
 
-#include <drv_types.h>
-#include <ieee80211.h>
-#include <wifi.h>
-#include <osdep_service.h>
-#include <wlan_bssdef.h>
-#include <usb_osintf.h>
+#include "../include/drv_types.h"
+#include "../include/ieee80211.h"
+#include "../include/wifi.h"
+#include "../include/osdep_service.h"
+#include "../include/wlan_bssdef.h"
+#include "../include/usb_osintf.h"
 
 u8 RTW_WPA_OUI_TYPE[] = { 0x00, 0x50, 0xf2, 1 };
 u16 RTW_WPA_VERSION = 1;
diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index ca7d27a24080..e0909d3d6307 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -23,11 +23,11 @@ jackson@realtek.com.tw
 */
 
 #define _RTW_IO_C_
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtw_io.h>
-#include <osdep_intf.h>
-#include <usb_ops.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_io.h"
+#include "../include/osdep_intf.h"
+#include "../include/usb_ops.h"
 
 #define rtw_le16_to_cpu(val)		le16_to_cpu(val)
 #define rtw_le32_to_cpu(val)		le32_to_cpu(val)
diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 34c27ecbd55a..12a99588fbe2 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -3,13 +3,13 @@
 
 #define _RTW_IOCTL_SET_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtw_ioctl_set.h>
-#include <hal_intf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_ioctl_set.h"
+#include "../include/hal_intf.h"
 
-#include <usb_osintf.h>
-#include <usb_ops.h>
+#include "../include/usb_osintf.h"
+#include "../include/usb_ops.h"
 
 extern void indicate_wx_scan_complete_event(struct adapter *padapter);
 
diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index e93610d7c8c6..2f38ff8cacef 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include<rtw_iol.h>
+#include "../include/rtw_iol.h"
 
 struct xmit_frame	*rtw_IOL_accquire_xmit_frame(struct adapter  *adapter)
 {
diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index ee90e52adc90..70e989d11e44 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2012 Realtek Corporation. */
 
-#include <drv_types.h>
-#include "rtw_led.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_led.h"
 
 /*  */
 /*	Description: */
diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 8266e9a88e01..fe826e5831a3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -4,17 +4,17 @@
 #define _RTW_MLME_C_
 
 #include <linux/version.h>
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <xmit_osdep.h>
-#include <hal_intf.h>
-#include <mlme_osdep.h>
-#include <sta_info.h>
-#include <wifi.h>
-#include <wlan_bssdef.h>
-#include <rtw_ioctl_set.h>
-#include <usb_osintf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/xmit_osdep.h"
+#include "../include/hal_intf.h"
+#include "../include/mlme_osdep.h"
+#include "../include/sta_info.h"
+#include "../include/wifi.h"
+#include "../include/wlan_bssdef.h"
+#include "../include/rtw_ioctl_set.h"
+#include "../include/usb_osintf.h"
 
 extern unsigned char	MCS_rate_2R[16];
 extern unsigned char	MCS_rate_1R[16];
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 36b4e073d24c..3fa89ef293d1 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3,13 +3,13 @@
 
 #define _RTW_MLME_EXT_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
-#include <rtw_mlme_ext.h>
-#include <wlan_bssdef.h>
-#include <mlme_osdep.h>
-#include <recv_osdep.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wifi.h"
+#include "../include/rtw_mlme_ext.h"
+#include "../include/wlan_bssdef.h"
+#include "../include/mlme_osdep.h"
+#include "../include/recv_osdep.h"
 
 static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
diff --git a/drivers/staging/r8188eu/core/rtw_mp.c b/drivers/staging/r8188eu/core/rtw_mp.c
index ece34de548f9..c300af4eee8d 100644
--- a/drivers/staging/r8188eu/core/rtw_mp.c
+++ b/drivers/staging/r8188eu/core/rtw_mp.c
@@ -3,10 +3,9 @@
 
 #define _RTW_MP_C_
 
-#include <drv_types.h>
-
-#include "odm_precomp.h"
-#include "rtl8188e_hal.h"
+#include "../include/drv_types.h"
+#include "../include/odm_precomp.h"
+#include "../include/rtl8188e_hal.h"
 
 u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz)
 {
diff --git a/drivers/staging/r8188eu/core/rtw_mp_ioctl.c b/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
index 3dd7dff233ee..b6145c7b5893 100644
--- a/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
+++ b/drivers/staging/r8188eu/core/rtw_mp_ioctl.c
@@ -3,12 +3,10 @@
 
 #define _RTW_MP_IOCTL_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <mlme_osdep.h>
-
-/* include <rtw_mp.h> */
-#include <rtw_mp_ioctl.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/mlme_osdep.h"
+#include "../include/rtw_mp_ioctl.h"
 
 /*   rtl8188eu_oid_rtl_seg_81_85   section start **************** */
 int rtl8188eu_oid_rt_wireless_mode_hdl(struct oid_par_priv *poid_par_priv)
diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index 3ec988fad6ea..f94fc7ba9a01 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -3,9 +3,9 @@
 
 #define _RTW_P2P_C_
 
-#include <drv_types.h>
-#include <rtw_p2p.h>
-#include <wifi.h>
+#include "../include/drv_types.h"
+#include "../include/rtw_p2p.h"
+#include "../include/wifi.h"
 
 #ifdef CONFIG_88EU_P2P
 
diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index a7b63413000b..d67eeb045002 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -3,10 +3,10 @@
 
 #define _RTW_PWRCTRL_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <osdep_intf.h>
-#include <linux/usb.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/osdep_intf.h"
+#include "../include/linux/usb.h"
 
 void ips_enter(struct adapter *padapter)
 {
diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 3872aa5cb982..610cc699caf9 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -3,15 +3,15 @@
 
 #define _RTW_RECV_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <mlme_osdep.h>
-#include <ip.h>
-#include <if_ether.h>
-#include <ethernet.h>
-#include <usb_ops.h>
-#include <wifi.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/mlme_osdep.h"
+#include "../include/ip.h"
+#include "../include/if_ether.h"
+#include "../include/ethernet.h"
+#include "../include/usb_ops.h"
+#include "../include/wifi.h"
 
 static u8 SNAP_ETH_TYPE_IPX[2] = {0x81, 0x37};
 static u8 SNAP_ETH_TYPE_APPLETALK_AARP[2] = {0x80, 0xf3};
diff --git a/drivers/staging/r8188eu/core/rtw_rf.c b/drivers/staging/r8188eu/core/rtw_rf.c
index caa3d68d93e2..321546c40446 100644
--- a/drivers/staging/r8188eu/core/rtw_rf.c
+++ b/drivers/staging/r8188eu/core/rtw_rf.c
@@ -3,10 +3,10 @@
 
 #define _RTW_RF_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <xmit_osdep.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/xmit_osdep.h"
 
 struct ch_freq {
 	u32 channel;
diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 136ba1e61dca..ee4775b8284b 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -3,10 +3,10 @@
 
 #define  _RTW_SECURITY_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
-#include <osdep_intf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wifi.h"
+#include "../include/osdep_intf.h"
 
 /* WEP related ===== */
 
diff --git a/drivers/staging/r8188eu/core/rtw_sreset.c b/drivers/staging/r8188eu/core/rtw_sreset.c
index a4705736a153..5084bc036424 100644
--- a/drivers/staging/r8188eu/core/rtw_sreset.c
+++ b/drivers/staging/r8188eu/core/rtw_sreset.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2012 Realtek Corporation. */
 
-#include <rtw_sreset.h>
+#include "../include/rtw_sreset.h"
 
 void sreset_init_value(struct adapter *padapter)
 {
diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index 9a459eef861d..dc72b78877b0 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -3,12 +3,12 @@
 
 #define _RTW_STA_MGT_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <xmit_osdep.h>
-#include <mlme_osdep.h>
-#include <sta_info.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/xmit_osdep.h"
+#include "../include/mlme_osdep.h"
+#include "../include/sta_info.h"
 
 static void _rtw_init_stainfo(struct sta_info *psta)
 {
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 738298ebbc3c..15edccef9f1d 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -3,9 +3,9 @@
 
 #define _RTW_WLAN_UTIL_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wifi.h"
 
 static unsigned char ARTHEROS_OUI1[] = {0x00, 0x03, 0x7f};
 static unsigned char ARTHEROS_OUI2[] = {0x00, 0x13, 0x74};
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index c2a3d62facd1..7ecffadcb61f 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -3,13 +3,13 @@
 
 #define _RTW_XMIT_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
-#include <osdep_intf.h>
-#include <ip.h>
-#include <usb_ops.h>
-#include <usb_osintf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wifi.h"
+#include "../include/osdep_intf.h"
+#include "../include/ip.h"
+#include "../include/usb_ops.h"
+#include "../include/usb_osintf.h"
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
diff --git a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
index 7df715ab2f6e..48ede610cd28 100644
--- a/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
+++ b/drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "Hal8188EPwrSeq.h"
-#include <rtl8188e_hal.h>
+#include "../include/Hal8188EPwrSeq.h"
+#include "../include/rtl8188e_hal.h"
 
 /*
     drivers should parse below arrays and do the corresponding actions
diff --git a/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c b/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c
index 8db90778ab6c..2baea6141fe2 100644
--- a/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c
+++ b/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c
@@ -12,7 +12,7 @@ Major Change History:
 	2011-08-12 Page            Create.
 
 --*/
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 /*  Rate adaptive parameters */
 
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
index 5eaf79ae6c93..fc58d5fb1264 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
@@ -1,9 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
-
-#include <rtw_iol.h>
+#include "../include/odm_precomp.h"
+#include "../include/rtw_iol.h"
 
 #define read_next_pair(array, v1, v2, i)		\
 	 do {						\
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
index dc9ef87af99a..06ef2c04cebf 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
-#include <rtw_iol.h>
+#include "../include/odm_precomp.h"
+#include "../include/rtw_iol.h"
 
 static bool Checkcondition(const u32  condition, const u32  hex)
 {
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
index b0df4eb8413d..7659b0953100 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
@@ -1,9 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
-
-#include <rtw_iol.h>
+#include "../include/odm_precomp.h"
+#include "../include/rtw_iol.h"
 
 static bool CheckCondition(const u32  Condition, const u32  Hex)
 {
diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 8b34842b4a30..1eb459532da5 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 /*---------------------------Define Local Constant---------------------------*/
 /*  2010/04/25 MH Define the max tx power tracking tx agc power. */
diff --git a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
index 77bb61ab9789..c31f01c0fdd2 100644
--- a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
@@ -17,7 +17,7 @@ Major Change History:
 
 --*/
 
-#include <HalPwrSeqCmd.h>
+#include "../include/HalPwrSeqCmd.h"
 
 /*	Description: */
 /*		This routine deals with the Power Configuration CMDs parsing
diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index 9094aba21379..ca50c3c85578 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
 
-#include <hal_intf.h>
-#include <hal_com.h>
-#include <rtl8188e_hal.h>
+#include "../include/hal_intf.h"
+#include "../include/hal_com.h"
+#include "../include/rtl8188e_hal.h"
 
 #define _HAL_INIT_C_
 
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 02d76ac782d8..cb0635850aa8 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -2,9 +2,9 @@
 /* Copyright(c) 2007 - 2012 Realtek Corporation. */
 
 #define _HAL_INTF_C_
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <hal_intf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/hal_intf.h"
 
 void rtw_hal_chip_configure(struct adapter *adapt)
 {
diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index a26b2ae35b73..c6c184d95fee 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -3,7 +3,7 @@
 
 /*  include files */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 static const u16 dB_Invert_Table[8][12] = {
 	{1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4},
diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 19222c0eddf7..93a91cce21ec 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 #define READ_AND_CONFIG     READ_AND_CONFIG_MP
 
diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 17dca886b17c..baa9c1c977c7 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 void ODM_DIG_LowerBound_88E(struct odm_dm_struct *dm_odm)
 {
diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index 132f5cbd0697..a26c36cf8786 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
 			   u32 Data, enum rf_radio_path RF_PATH,
diff --git a/drivers/staging/r8188eu/hal/odm_debug.c b/drivers/staging/r8188eu/hal/odm_debug.c
index a969ba48ddb9..fad1c3cca25b 100644
--- a/drivers/staging/r8188eu/hal/odm_debug.c
+++ b/drivers/staging/r8188eu/hal/odm_debug.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm)
 {
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index e26a6461e70b..507baf9fd913 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include "odm_precomp.h"
+#include "../include/odm_precomp.h"
 /*  ODM IO Relative API. */
 
 u8 ODM_Read1Byte(struct odm_dm_struct *pDM_Odm, u32 RegAddr)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index dc4d790837ce..4bd471873531 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -3,14 +3,14 @@
 
 #define _RTL8188E_CMD_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <cmd_osdep.h>
-#include <mlme_osdep.h>
-#include <rtw_ioctl_set.h>
-
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/cmd_osdep.h"
+#include "../include/mlme_osdep.h"
+#include "../include/rtw_ioctl_set.h"
+
+#include "../include/rtl8188e_hal.h"
 
 #define RTL88E_MAX_H2C_BOX_NUMS		4
 #define RTL88E_MAX_CMD_LEN		7
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 88ae9c5a8507..294b082a6c09 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -4,10 +4,9 @@
 /*  This file is for 92CE/92CU dynamic mechanism only */
 #define _RTL8188E_DM_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtl8188e_hal.h"
 
 static void dm_CheckStatistics(struct adapter *Adapter)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 02ba495b6d2c..27bc1db07f55 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -3,15 +3,12 @@
 
 #define _HAL_INIT_C_
 
-#include <linux/firmware.h>
-#include <drv_types.h>
-#include <rtw_efuse.h>
-
-#include <rtl8188e_hal.h>
-
-#include <rtw_iol.h>
-
-#include <usb_ops.h>
+#include "../include/linux/firmware.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_efuse.h"
+#include "../include/rtl8188e_hal.h"
+#include "../include/rtw_iol.h"
+#include "../include/usb_ops.h"
 
 static void iol_mode_enable(struct adapter *padapter, u8 enable)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_mp.c b/drivers/staging/r8188eu/hal/rtl8188e_mp.c
index 3937c1f5d588..626741087391 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_mp.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_mp.c
@@ -3,10 +3,10 @@
 
 #define _RTL8188E_MP_C_
 
-#include <drv_types.h>
-#include <rtw_mp.h>
-#include <rtl8188e_hal.h>
-#include <rtl8188e_dm.h>
+#include "../include/drv_types.h"
+#include "../include/rtw_mp.h"
+#include "../include/rtl8188e_hal.h"
+#include "../include/rtl8188e_dm.h"
 
 s32 Hal_SetPowerTracking(struct adapter *padapter, u8 enable)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index f23e69ebee35..37f2342ddbaa 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -3,10 +3,10 @@
 
 #define _RTL8188E_PHYCFG_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtw_iol.h>
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_iol.h"
+#include "../include/rtl8188e_hal.h"
 
 /*---------------------------Define Local Constant---------------------------*/
 /* Channel switch:The size of command tables for switch channel*/
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 0bba0130cfa6..335b120ce603 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -25,10 +25,9 @@
 
 #define _RTL8188E_RF6052_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtl8188e_hal.h"
 
 /*---------------------------Define Local Constant---------------------------*/
 /*  Define local structure for debug!!!!! */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index 9ce6527cb75a..20f7f449b106 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -3,9 +3,9 @@
 
 #define _RTL8188E_REDESC_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtl8188e_hal.h"
 
 static void process_rssi(struct adapter *padapter, struct recv_frame *prframe)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_sreset.c b/drivers/staging/r8188eu/hal/rtl8188e_sreset.c
index 88bc607b3698..16fa249e35d3 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_sreset.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_sreset.c
@@ -3,8 +3,8 @@
 
 #define _RTL8188E_SRESET_C_
 
-#include <rtl8188e_sreset.h>
-#include <rtl8188e_hal.h>
+#include "../include/rtl8188e_sreset.h"
+#include "../include/rtl8188e_hal.h"
 
 void rtl8188e_silentreset_for_specific_platform(struct adapter *padapter)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
index fe32ba366338..164ec6650dec 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
@@ -3,9 +3,9 @@
 
 #define _RTL8188E_XMIT_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtl8188e_hal.h"
 
 void dump_txrpt_ccx_88e(void *buf)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_led.c b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
index 29aee1345577..51fd30b25a5f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_led.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_led.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtl8188e_hal.h>
-#include <rtl8188e_led.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtl8188e_hal.h"
+#include "../include/rtl8188e_led.h"
 
 /*  LED object. */
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 7ca1a101e100..2e3f624d0f22 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -2,18 +2,18 @@
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
 #define _RTL8188EU_RECV_C_
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <mlme_osdep.h>
-#include <ip.h>
-#include <if_ether.h>
-#include <ethernet.h>
-
-#include <usb_ops.h>
-#include <wifi.h>
-
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/mlme_osdep.h"
+#include "../include/ip.h"
+#include "../include/if_ether.h"
+#include "../include/ethernet.h"
+
+#include "../include/usb_ops.h"
+#include "../include/wifi.h"
+
+#include "../include/rtl8188e_hal.h"
 
 void rtl8188eu_init_recvbuf(struct adapter *padapter, struct recv_buf *precvbuf)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index ca543bdc119d..e44a01af7f5c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -2,12 +2,12 @@
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
 #define _RTL8188E_XMIT_C_
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
-#include <osdep_intf.h>
-#include <usb_ops.h>
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wifi.h"
+#include "../include/osdep_intf.h"
+#include "../include/usb_ops.h"
+#include "../include/rtl8188e_hal.h"
 
 s32	rtl8188eu_init_xmit_priv(struct adapter *adapt)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f784d8dcdd34..d50a887ad7ea 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -3,15 +3,15 @@
 
 #define _HCI_HAL_INIT_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtw_efuse.h>
-
-#include <rtl8188e_hal.h>
-#include <rtl8188e_led.h>
-#include <rtw_iol.h>
-#include <usb_ops.h>
-#include <usb_osintf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/rtw_efuse.h"
+
+#include "../include/rtl8188e_hal.h"
+#include "../include/rtl8188e_led.h"
+#include "../include/rtw_iol.h"
+#include "../include/usb_ops.h"
+#include "../include/usb_osintf.h"
 
 #define		HAL_MAC_ENABLE	1
 #define		HAL_BB_ENABLE		1
diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 3c6abedb313d..577090db84be 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -3,12 +3,12 @@
 
 #define _HCI_OPS_OS_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <osdep_intf.h>
-#include <usb_ops.h>
-#include <recv_osdep.h>
-#include <rtl8188e_hal.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/osdep_intf.h"
+#include "../include/usb_ops.h"
+#include "../include/recv_osdep.h"
+#include "../include/rtl8188e_hal.h"
 
 static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u8 request, u16 value, u16 index, void *pdata, u16 len, u8 requesttype)
 {
diff --git a/drivers/staging/r8188eu/include/HalPwrSeqCmd.h b/drivers/staging/r8188eu/include/HalPwrSeqCmd.h
index 3b8e263ea6e1..fe7ac910beb8 100644
--- a/drivers/staging/r8188eu/include/HalPwrSeqCmd.h
+++ b/drivers/staging/r8188eu/include/HalPwrSeqCmd.h
@@ -4,7 +4,7 @@
 #ifndef __HALPWRSEQCMD_H__
 #define __HALPWRSEQCMD_H__
 
-#include <drv_types.h>
+#include "drv_types.h"
 
 /*---------------------------------------------*/
 /* 3 The value of cmd: 4 bits */
diff --git a/drivers/staging/r8188eu/include/cmd_osdep.h b/drivers/staging/r8188eu/include/cmd_osdep.h
index 75ba595f2301..3954d6350cc6 100644
--- a/drivers/staging/r8188eu/include/cmd_osdep.h
+++ b/drivers/staging/r8188eu/include/cmd_osdep.h
@@ -4,8 +4,8 @@
 #ifndef __CMD_OSDEP_H_
 #define __CMD_OSDEP_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 extern int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 extern int _rtw_init_evt_priv(struct evt_priv *pevtpriv);
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index d8faea4f6045..8cefb5c288f3 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -14,29 +14,29 @@
 #define CONFIG_88EU_AP_MODE 1
 #define CONFIG_88EU_P2P 1
 
-#include <osdep_service.h>
-#include <wlan_bssdef.h>
-#include <rtw_ht.h>
-#include <rtw_cmd.h>
-#include <rtw_xmit.h>
-#include <rtw_recv.h>
-#include <hal_intf.h>
-#include <hal_com.h>
-#include <rtw_security.h>
-#include <rtw_pwrctrl.h>
-#include <rtw_io.h>
-#include <rtw_eeprom.h>
-#include <sta_info.h>
-#include <rtw_mlme.h>
-#include <rtw_debug.h>
-#include <rtw_rf.h>
-#include <rtw_event.h>
-#include <rtw_led.h>
-#include <rtw_mlme_ext.h>
-#include <rtw_p2p.h>
-#include <rtw_ap.h>
-#include <rtw_mp.h>
-#include <rtw_br_ext.h>
+#include "osdep_service.h"
+#include "wlan_bssdef.h"
+#include "rtw_ht.h"
+#include "rtw_cmd.h"
+#include "rtw_xmit.h"
+#include "rtw_recv.h"
+#include "hal_intf.h"
+#include "hal_com.h"
+#include "rtw_security.h"
+#include "rtw_pwrctrl.h"
+#include "rtw_io.h"
+#include "rtw_eeprom.h"
+#include "sta_info.h"
+#include "rtw_mlme.h"
+#include "rtw_debug.h"
+#include "rtw_rf.h"
+#include "rtw_event.h"
+#include "rtw_led.h"
+#include "rtw_mlme_ext.h"
+#include "rtw_p2p.h"
+#include "rtw_ap.h"
+#include "rtw_mp.h"
+#include "rtw_br_ext.h"
 
 #define DRIVERVERSION	"v4.1.4_6773.20130222"
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index d64fcda37100..81d959c6fd4e 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -4,9 +4,9 @@
 #ifndef __HAL_INTF_H__
 #define __HAL_INTF_H__
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <Hal8188EPhyCfg.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "Hal8188EPhyCfg.h"
 
 enum RTL871X_HCI_TYPE {
 	RTW_PCIE	= BIT0,
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index bc9a875cdf35..4dfa817175e7 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -4,8 +4,8 @@
 #ifndef __IEEE80211_H
 #define __IEEE80211_H
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 #include "wifi.h"
 #include <linux/wireless.h>
 
diff --git a/drivers/staging/r8188eu/include/ieee80211_ext.h b/drivers/staging/r8188eu/include/ieee80211_ext.h
index cc53c71d2d8b..e7ade835d478 100644
--- a/drivers/staging/r8188eu/include/ieee80211_ext.h
+++ b/drivers/staging/r8188eu/include/ieee80211_ext.h
@@ -4,8 +4,8 @@
 #ifndef __IEEE80211_EXT_H
 #define __IEEE80211_EXT_H
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define WMM_OUI_TYPE 2
 #define WMM_OUI_SUBTYPE_INFORMATION_ELEMENT 0
diff --git a/drivers/staging/r8188eu/include/mlme_osdep.h b/drivers/staging/r8188eu/include/mlme_osdep.h
index 096232b0f95b..5b9f688f9424 100644
--- a/drivers/staging/r8188eu/include/mlme_osdep.h
+++ b/drivers/staging/r8188eu/include/mlme_osdep.h
@@ -4,8 +4,8 @@
 #ifndef	__MLME_OSDEP_H_
 #define __MLME_OSDEP_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 void rtw_init_mlme_timer(struct adapter *padapter);
 void rtw_os_indicate_disconnect(struct adapter *adapter);
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index b3d8f6463658..2ff2e93a759c 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -10,9 +10,9 @@
 
 /* 2 Config Flags and Structs - defined by each ODM Type */
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <hal_intf.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "hal_intf.h"
 
 /* 2 OutSrc Header Files */
 
diff --git a/drivers/staging/r8188eu/include/odm_types.h b/drivers/staging/r8188eu/include/odm_types.h
index 4a6c4d33e20e..e2e5aa8e8054 100644
--- a/drivers/staging/r8188eu/include/odm_types.h
+++ b/drivers/staging/r8188eu/include/odm_types.h
@@ -25,7 +25,7 @@ enum RT_SPINLOCK_TYPE {
 	RT_TEMP = 1,
 };
 
-#include <basic_types.h>
+#include "basic_types.h"
 
 #define DEV_BUS_TYPE	RT_USB_INTERFACE
 
diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
index b585c239c64e..1915c926faac 100644
--- a/drivers/staging/r8188eu/include/osdep_intf.h
+++ b/drivers/staging/r8188eu/include/osdep_intf.h
@@ -4,8 +4,8 @@
 #ifndef __OSDEP_INTF_H_
 #define __OSDEP_INTF_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 struct intf_priv {
 	u8 *intf_dev;
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index df59fa325e6e..05cbc9b0dadd 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -5,7 +5,7 @@
 #define __OSDEP_SERVICE_H_
 
 #include <linux/sched/signal.h>
-#include <basic_types.h>
+#include "basic_types.h"
 
 #define _FAIL		0
 #define _SUCCESS	1
diff --git a/drivers/staging/r8188eu/include/recv_osdep.h b/drivers/staging/r8188eu/include/recv_osdep.h
index eebd06e6329e..7308f21c428f 100644
--- a/drivers/staging/r8188eu/include/recv_osdep.h
+++ b/drivers/staging/r8188eu/include/recv_osdep.h
@@ -4,8 +4,8 @@
 #ifndef __RECV_OSDEP_H_
 #define __RECV_OSDEP_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void _rtw_free_recv_priv(struct recv_priv *precvpriv);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_led.h b/drivers/staging/r8188eu/include/rtl8188e_led.h
index e1b4e078fd8b..b00954198764 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_led.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_led.h
@@ -4,8 +4,8 @@
 #ifndef __RTL8188E_LED_H__
 #define __RTL8188E_LED_H__
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 /*  */
 /*  Interface to manipulate LED objects. */
diff --git a/drivers/staging/r8188eu/include/rtl8188e_sreset.h b/drivers/staging/r8188eu/include/rtl8188e_sreset.h
index 6158ba19a920..880c5792d5dd 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_sreset.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_sreset.h
@@ -4,9 +4,9 @@
 #ifndef _RTL8188E_SRESET_H_
 #define _RTL8188E_SRESET_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <rtw_sreset.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "rtw_sreset.h"
 
 void rtl8188e_silentreset_for_specific_platform(struct adapter *padapter);
 void rtl8188e_sreset_xmit_status_check(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/include/rtw_ap.h b/drivers/staging/r8188eu/include/rtw_ap.h
index 3662941ce9a8..b20edab3bb00 100644
--- a/drivers/staging/r8188eu/include/rtw_ap.h
+++ b/drivers/staging/r8188eu/include/rtw_ap.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_AP_H_
 #define __RTW_AP_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #ifdef CONFIG_88EU_AP_MODE
 
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 9eefafd7ad7d..0f64b72bb5de 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -4,14 +4,14 @@
 #ifndef __RTW_CMD_H_
 #define __RTW_CMD_H_
 
-#include <wlan_bssdef.h>
-#include <rtw_rf.h>
-#include <rtw_led.h>
+#include "wlan_bssdef.h"
+#include "rtw_rf.h"
+#include "rtw_led.h"
 
 #define C2H_MEM_SZ (16*1024)
 
-#include <osdep_service.h>
-#include <ieee80211.h> /*  <ieee80211/ieee80211.h> */
+#include "osdep_service.h"
+#include "ieee80211.h" /*  <ieee80211/ieee80211.h> */
 
 #define FREE_CMDOBJ_SZ	128
 
diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index f8a969e339b1..56af0751f70e 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define _drv_always_			1
 #define _drv_emerg_			2
diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index dcd6b8523865..9f8a9c070339 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_EEPROM_H__
 #define __RTW_EEPROM_H__
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define	RTL8712_EEPROM_ID		0x8712
 
diff --git a/drivers/staging/r8188eu/include/rtw_efuse.h b/drivers/staging/r8188eu/include/rtw_efuse.h
index 60f9f59d1efd..b3ff46db2091 100644
--- a/drivers/staging/r8188eu/include/rtw_efuse.h
+++ b/drivers/staging/r8188eu/include/rtw_efuse.h
@@ -4,7 +4,7 @@
 #ifndef __RTW_EFUSE_H__
 #define __RTW_EFUSE_H__
 
-#include <osdep_service.h>
+#include "osdep_service.h"
 
 #define	EFUSE_ERROE_HANDLE		1
 
diff --git a/drivers/staging/r8188eu/include/rtw_event.h b/drivers/staging/r8188eu/include/rtw_event.h
index c0fa91591b9e..54dc1ea437fc 100644
--- a/drivers/staging/r8188eu/include/rtw_event.h
+++ b/drivers/staging/r8188eu/include/rtw_event.h
@@ -4,9 +4,9 @@
 #ifndef _RTW_EVENT_H_
 #define _RTW_EVENT_H_
 
-#include <osdep_service.h>
+#include "osdep_service.h"
 
-#include <wlan_bssdef.h>
+#include "wlan_bssdef.h"
 #include <linux/semaphore.h>
 #include <linux/sem.h>
 
diff --git a/drivers/staging/r8188eu/include/rtw_ht.h b/drivers/staging/r8188eu/include/rtw_ht.h
index b3a978e905d0..2b56b7c38c86 100644
--- a/drivers/staging/r8188eu/include/rtw_ht.h
+++ b/drivers/staging/r8188eu/include/rtw_ht.h
@@ -4,7 +4,7 @@
 #ifndef _RTW_HT_H_
 #define _RTW_HT_H_
 
-#include <osdep_service.h>
+#include "osdep_service.h"
 #include "wifi.h"
 
 struct ht_priv {
diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index e2aae349d8fd..f1b3074fa075 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -4,8 +4,8 @@
 #ifndef _RTW_IO_H_
 #define _RTW_IO_H_
 
-#include <osdep_service.h>
-#include <osdep_intf.h>
+#include "osdep_service.h"
+#include "osdep_intf.h"
 
 #include <asm/byteorder.h>
 #include <linux/semaphore.h>
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl.h b/drivers/staging/r8188eu/include/rtw_ioctl.h
index 2cdeb244d23e..8c03c16bb998 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl.h
@@ -4,8 +4,8 @@
 #ifndef _RTW_IOCTL_H_
 #define _RTW_IOCTL_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #ifndef OID_802_11_CAPABILITY
 	#define OID_802_11_CAPABILITY	0x0d010122
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_rtl.h b/drivers/staging/r8188eu/include/rtw_ioctl_rtl.h
index 18014dd8476f..6d3d1ef923f6 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_rtl.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_rtl.h
@@ -4,8 +4,8 @@
 #ifndef _RTW_IOCTL_RTL_H_
 #define _RTW_IOCTL_RTL_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 /*  oid_rtl_seg_01_01 ************** */
 int oid_rt_get_signal_quality_hdl(struct oid_par_priv *poid_par_priv);/* 84 */
diff --git a/drivers/staging/r8188eu/include/rtw_ioctl_set.h b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
index 2214cee35ae7..6216b8ab3a79 100644
--- a/drivers/staging/r8188eu/include/rtw_ioctl_set.h
+++ b/drivers/staging/r8188eu/include/rtw_ioctl_set.h
@@ -4,7 +4,7 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-#include <drv_types.h>
+#include "drv_types.h"
 
 typedef u8 NDIS_802_11_PMKID_VALUE[16];
 
diff --git a/drivers/staging/r8188eu/include/rtw_iol.h b/drivers/staging/r8188eu/include/rtw_iol.h
index 89668122a876..471f9ca092a8 100644
--- a/drivers/staging/r8188eu/include/rtw_iol.h
+++ b/drivers/staging/r8188eu/include/rtw_iol.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_IOL_H_
 #define __RTW_IOL_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define IOREG_CMD_END_LEN	4
 
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index def9d04a20ce..f0965aa5b470 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_LED_H_
 #define __RTW_LED_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define MSECS(t)        (HZ * ((t) / 1000) + (HZ * ((t) % 1000)) / 1000)
 
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index d5b479ae7799..8c54da73f1a7 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -4,10 +4,10 @@
 #ifndef __RTW_MLME_H_
 #define __RTW_MLME_H_
 
-#include <osdep_service.h>
-#include <mlme_osdep.h>
-#include <drv_types.h>
-#include <wlan_bssdef.h>
+#include "osdep_service.h"
+#include "mlme_osdep.h"
+#include "drv_types.h"
+#include "wlan_bssdef.h"
 
 #define	MAX_BSS_CNT	128
 #define   MAX_JOIN_TIMEOUT	6500
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index eaaedf7d7305..b9c76f04445c 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -4,9 +4,9 @@
 #ifndef __RTW_MLME_EXT_H_
 #define __RTW_MLME_EXT_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wlan_bssdef.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "wlan_bssdef.h"
 
 /*	Commented by Albert 20101105 */
 /*	Increase the SURVEY_TO value from 100 to 150  ( 100ms to 150ms ) */
diff --git a/drivers/staging/r8188eu/include/rtw_mp.h b/drivers/staging/r8188eu/include/rtw_mp.h
index c0974189e92d..b64b16554343 100644
--- a/drivers/staging/r8188eu/include/rtw_mp.h
+++ b/drivers/staging/r8188eu/include/rtw_mp.h
@@ -125,7 +125,7 @@ struct mp_tx {
 	void *PktTxThread;
 };
 
-#include <Hal8188EPhyCfg.h>
+#include "Hal8188EPhyCfg.h"
 
 #define MP_MAX_LINES		1000
 #define MP_MAX_LINES_BYTES	256
diff --git a/drivers/staging/r8188eu/include/rtw_mp_ioctl.h b/drivers/staging/r8188eu/include/rtw_mp_ioctl.h
index b23ca88ceb9e..e856fd0ad036 100644
--- a/drivers/staging/r8188eu/include/rtw_mp_ioctl.h
+++ b/drivers/staging/r8188eu/include/rtw_mp_ioctl.h
@@ -4,12 +4,12 @@
 #ifndef _RTW_MP_IOCTL_H_
 #define _RTW_MP_IOCTL_H_
 
-#include <drv_types.h>
-#include <mp_custom_oid.h>
-#include <rtw_ioctl.h>
-#include <rtw_ioctl_rtl.h>
-#include <rtw_efuse.h>
-#include <rtw_mp.h>
+#include "drv_types.h"
+#include "mp_custom_oid.h"
+#include "rtw_ioctl.h"
+#include "rtw_ioctl_rtl.h"
+#include "rtw_efuse.h"
+#include "rtw_mp.h"
 
 /*  */
 struct cfg_dbg_msg_struct {
diff --git a/drivers/staging/r8188eu/include/rtw_p2p.h b/drivers/staging/r8188eu/include/rtw_p2p.h
index 29f908f36598..92b9bfe3ea0b 100644
--- a/drivers/staging/r8188eu/include/rtw_p2p.h
+++ b/drivers/staging/r8188eu/include/rtw_p2p.h
@@ -4,7 +4,7 @@
 #ifndef __RTW_P2P_H_
 #define __RTW_P2P_H_
 
-#include <drv_types.h>
+#include "drv_types.h"
 
 u32 build_beacon_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pbuf);
 u32 build_probe_resp_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pbuf);
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index bd86666d0f66..543f928e8089 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_PWRCTRL_H_
 #define __RTW_PWRCTRL_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define FW_PWR0		0
 #define FW_PWR1		1
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 9a81e66d93fd..857269ae4209 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -4,8 +4,8 @@
 #ifndef _RTW_RECV_H_
 #define _RTW_RECV_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define NR_RECVFRAME 256
 
diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index 17d34dead8e0..0f790da7e0aa 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -4,7 +4,7 @@
 #ifndef	__RTW_RF_H_
 #define __RTW_RF_H_
 
-#include <rtw_cmd.h>
+#include "rtw_cmd.h"
 
 #define OFDM_PHY		1
 #define MIXED_PHY		2
diff --git a/drivers/staging/r8188eu/include/rtw_security.h b/drivers/staging/r8188eu/include/rtw_security.h
index 2d8522c01027..f8863926c905 100644
--- a/drivers/staging/r8188eu/include/rtw_security.h
+++ b/drivers/staging/r8188eu/include/rtw_security.h
@@ -4,8 +4,8 @@
 #ifndef __RTW_SECURITY_H_
 #define __RTW_SECURITY_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define _NO_PRIVACY_			0x0
 #define _WEP40_				0x1
diff --git a/drivers/staging/r8188eu/include/rtw_sreset.h b/drivers/staging/r8188eu/include/rtw_sreset.h
index 1ac7d566362a..9ecd75258310 100644
--- a/drivers/staging/r8188eu/include/rtw_sreset.h
+++ b/drivers/staging/r8188eu/include/rtw_sreset.h
@@ -4,8 +4,8 @@
 #ifndef _RTW_SRESET_C_
 #define _RTW_SRESET_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 struct sreset_priv {
 	struct mutex	silentreset_mutex;
@@ -15,7 +15,7 @@ struct sreset_priv {
 	unsigned long last_tx_complete_time;
 };
 
-#include <rtl8188e_hal.h>
+#include "rtl8188e_hal.h"
 
 #define	WIFI_STATUS_SUCCESS		0
 #define	USB_VEN_REQ_CMD_FAIL	BIT0
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 7155d3fa4bb5..e1418a3f7ed1 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -4,8 +4,8 @@
 #ifndef _RTW_XMIT_H_
 #define _RTW_XMIT_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 #define MAX_XMITBUF_SZ	(20480)	/*  20k */
 #define NR_XMITBUFF		(4)
@@ -362,6 +362,6 @@ int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms);
 void rtw_ack_tx_done(struct xmit_priv *pxmitpriv, int status);
 
 /* include after declaring struct xmit_buf, in order to avoid warning */
-#include <xmit_osdep.h>
+#include "xmit_osdep.h"
 
 #endif	/* _RTL871X_XMIT_H_ */
diff --git a/drivers/staging/r8188eu/include/sta_info.h b/drivers/staging/r8188eu/include/sta_info.h
index 97233f85c4bd..8ff99fc6381d 100644
--- a/drivers/staging/r8188eu/include/sta_info.h
+++ b/drivers/staging/r8188eu/include/sta_info.h
@@ -4,9 +4,9 @@
 #ifndef __STA_INFO_H_
 #define __STA_INFO_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wifi.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "wifi.h"
 
 #define IBSS_START_MAC_ID	2
 #define NUM_STA 32
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 6267d0999400..273bc2705558 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -4,9 +4,9 @@
 #ifndef __USB_OPS_H_
 #define __USB_OPS_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <osdep_intf.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "osdep_intf.h"
 
 #define REALTEK_USB_VENQT_READ		0xC0
 #define REALTEK_USB_VENQT_WRITE		0x40
@@ -21,7 +21,7 @@ enum {
 #define MAX_VENDOR_REQ_CMD_SIZE	254	/* 8188cu SIE Support */
 #define MAX_USB_IO_CTL_SIZE	(MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
 
-#include <usb_ops_linux.h>
+#include "usb_ops_linux.h"
 
 void rtl8188eu_set_hw_type(struct adapter *padapter);
 #define hal_set_hw_type rtl8188eu_set_hw_type
diff --git a/drivers/staging/r8188eu/include/usb_osintf.h b/drivers/staging/r8188eu/include/usb_osintf.h
index 71f6273e69c5..d1a1f739309c 100644
--- a/drivers/staging/r8188eu/include/usb_osintf.h
+++ b/drivers/staging/r8188eu/include/usb_osintf.h
@@ -4,9 +4,9 @@
 #ifndef __USB_OSINTF_H
 #define __USB_OSINTF_H
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <usb_vendor_req.h>
+#include "osdep_service.h"
+#include "drv_types.h"
+#include "usb_vendor_req.h"
 
 extern char *rtw_initmac;
 extern int rtw_mc2u_disable;
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 4a6685d93582..191c36361b63 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -4,8 +4,8 @@
 #ifndef __XMIT_OSDEP_H_
 #define __XMIT_OSDEP_H_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "osdep_service.h"
+#include "drv_types.h"
 
 struct pkt_file {
 	struct sk_buff *pkt;
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 100369a79666..ffce43f99dd6 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3,21 +3,21 @@
 
 #define _IOCTL_LINUX_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <wlan_bssdef.h>
-#include <rtw_debug.h>
-#include <wifi.h>
-#include <rtw_mlme.h>
-#include <rtw_mlme_ext.h>
-#include <rtw_ioctl.h>
-#include <rtw_ioctl_set.h>
-#include <rtw_mp_ioctl.h>
-#include <usb_ops.h>
-#include <rtl8188e_hal.h>
-
-#include <rtw_mp.h>
-#include <rtw_iol.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/wlan_bssdef.h"
+#include "../include/rtw_debug.h"
+#include "../include/wifi.h"
+#include "../include/rtw_mlme.h"
+#include "../include/rtw_mlme_ext.h"
+#include "../include/rtw_ioctl.h"
+#include "../include/rtw_ioctl_set.h"
+#include "../include/rtw_mp_ioctl.h"
+#include "../include/usb_ops.h"
+#include "../include/rtl8188e_hal.h"
+
+#include "../include/rtw_mp.h"
+#include "../include/rtw_iol.h"
 
 #define RTL_IOCTL_WPA_SUPPLICANT	(SIOCIWFIRSTPRIV + 30)
 
@@ -5587,7 +5587,7 @@ static int rtw_hostapd_ioctl(struct net_device *dev, struct iw_point *p)
 }
 #endif
 
-#include <rtw_android.h>
+#include "../include/rtw_android.h"
 static int rtw_wx_set_priv(struct net_device *dev,
 				struct iw_request_info *info,
 				union iwreq_data *awrq,
@@ -8132,7 +8132,7 @@ static int rtw_ioctl_wext_private(struct net_device *dev, union iwreq_data *wrq_
 	return err;
 }
 
-#include <rtw_android.h>
+#include "../include/rtw_android.h"
 int rtw_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
 	struct iwreq *wrq = (struct iwreq *)rq;
diff --git a/drivers/staging/r8188eu/os_dep/mlme_linux.c b/drivers/staging/r8188eu/os_dep/mlme_linux.c
index fe434c8c167c..766b346afbb8 100644
--- a/drivers/staging/r8188eu/os_dep/mlme_linux.c
+++ b/drivers/staging/r8188eu/os_dep/mlme_linux.c
@@ -3,9 +3,9 @@
 
 #define _MLME_OSDEP_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <mlme_osdep.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/mlme_osdep.h"
 
 void rtw_join_timeout_handler (struct timer_list *t)
 {
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index fa20d0f753db..5f1ec883d6ed 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -3,15 +3,15 @@
 
 #define _OS_INTFS_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <xmit_osdep.h>
-#include <recv_osdep.h>
-#include <hal_intf.h>
-#include <rtw_ioctl.h>
-
-#include <usb_osintf.h>
-#include <rtw_br_ext.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/xmit_osdep.h"
+#include "../include/recv_osdep.h"
+#include "../include/hal_intf.h"
+#include "../include/rtw_ioctl.h"
+
+#include "../include/usb_osintf.h"
+#include "../include/rtw_br_ext.h"
 #include <linux/version.h>
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index c7e83c87ad4a..99ddc535e5ea 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -3,11 +3,11 @@
 
 #define _OSDEP_SERVICE_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <linux/vmalloc.h>
-#include <rtw_ioctl_set.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/linux/vmalloc.h"
+#include "../include/rtw_ioctl_set.h"
 
 /*
 * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 410bfbb8a187..1fd3f1bf1fe5 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -3,15 +3,15 @@
 
 #define _RECV_OSDEP_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
 
-#include <wifi.h>
-#include <recv_osdep.h>
+#include "../include/wifi.h"
+#include "../include/recv_osdep.h"
 
-#include <osdep_intf.h>
-#include <ethernet.h>
-#include <usb_ops.h>
+#include "../include/osdep_intf.h"
+#include "../include/ethernet.h"
+#include "../include/usb_ops.h"
 
 /* init os related resource in struct recv_priv */
 int rtw_os_recv_resource_init(struct recv_priv *precvpriv,
diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
index 56fd19138218..ce02bfc6d02a 100644
--- a/drivers/staging/r8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
@@ -4,12 +4,11 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/version.h>
-
-#include <rtw_android.h>
-#include <osdep_service.h>
-#include <rtw_debug.h>
-#include <ioctl_cfg80211.h>
-#include <rtw_ioctl_set.h>
+#include "../include/rtw_android.h"
+#include "../include/osdep_service.h"
+#include "../include/rtw_debug.h"
+#include "../include/ioctl_cfg80211.h"
+#include "../include/rtw_ioctl_set.h"
 
 static const char *android_wifi_cmd_str[ANDROID_WIFI_CMD_MAX] = {
 	"START",
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 314a3504168e..bc7f4bd7ce0b 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -3,18 +3,17 @@
 
 #define _HCI_INTF_C_
 
-#include <osdep_service.h>
-#include <drv_types.h>
-#include <recv_osdep.h>
-#include <xmit_osdep.h>
-#include <hal_intf.h>
 #include <linux/usb.h>
-#include <osdep_intf.h>
-
-#include <usb_vendor_req.h>
-#include <usb_ops.h>
-#include <usb_osintf.h>
-#include <rtw_ioctl.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/recv_osdep.h"
+#include "../include/xmit_osdep.h"
+#include "../include/hal_intf.h"
+#include "../include/osdep_intf.h"
+#include "../include/usb_vendor_req.h"
+#include "../include/usb_ops.h"
+#include "../include/usb_osintf.h"
+#include "../include/rtw_ioctl.h"
 
 int ui_pid[3] = {0, 0, 0};
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 399d7d91eb4a..dd4bd14b76c2 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -3,9 +3,9 @@
 
 #define _USB_OPS_LINUX_C_
 
-#include <drv_types.h>
-#include <usb_ops_linux.h>
-#include <rtw_sreset.h>
+#include "../include/drv_types.h"
+#include "../include/usb_ops_linux.h"
+#include "../include/rtw_sreset.h"
 
 unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 {
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index c82ae1fdd0d2..421328173984 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -4,16 +4,15 @@
 #define _XMIT_OSDEP_C_
 
 #include <linux/version.h>
-#include <osdep_service.h>
-#include <drv_types.h>
-
-#include <if_ether.h>
-#include <ip.h>
-#include <wifi.h>
-#include <mlme_osdep.h>
-#include <xmit_osdep.h>
-#include <osdep_intf.h>
-#include <usb_osintf.h>
+#include "../include/osdep_service.h"
+#include "../include/drv_types.h"
+#include "../include/if_ether.h"
+#include "../include/ip.h"
+#include "../include/wifi.h"
+#include "../include/mlme_osdep.h"
+#include "../include/xmit_osdep.h"
+#include "../include/osdep_intf.h"
+#include "../include/usb_osintf.h"
 
 uint rtw_remainder_len(struct pkt_file *pfile)
 {
-- 
2.32.0

