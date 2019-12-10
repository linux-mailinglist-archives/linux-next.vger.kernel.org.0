Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B88118E40
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 17:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbfLJQz3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 11:55:29 -0500
Received: from UCOL19PA34.eemsg.mail.mil ([214.24.24.194]:63525 "EHLO
        UCOL19PA34.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbfLJQz3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 11:55:29 -0500
X-EEMSG-check-017: 59769345|UCOL19PA34_ESA_OUT01.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="59769345"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by UCOL19PA34.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 10 Dec 2019 16:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575996928; x=1607532928;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5xuJZ2Ul4JC1PjxCa51g2iIegrYxnhPpNPYexIlAVwI=;
  b=WttlvMjBx0WKIEwbGbe0dNsuLvfc5mDenXF137ehj8dQBLNrb45Me4Cj
   i2qaNVdxiVfwOgk+B4MBQepyKjfQDnSX0b4c79DDLV83RwgABQRleEUXF
   zywAP593sordJT8tQcZzLNvWGtei/BUupbn9xrYzT6vMCvXSBkwlYMXRa
   bUXvpiKj9UWnd8hSvJRjTI9SKV+egXF+Mv3MTP4txsanOPQ721pPiMy40
   +60VAZf5I7rlgK14zvPtU96ZiN4xage0MMvJ3IMtSaVkhNP+fDl83+8tJ
   voDbJsm5IY1HiVv8KNTwUYvqG35Qqgf1R0gRfxdkatuAzdhYsT2S5dvDA
   A==;
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="36556496"
IronPort-PHdr: =?us-ascii?q?9a23=3AEguPERTr2GpgUVVECOVLW1I149psv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa67ZBCCt8tkgFKBZ4jH8fUM07OQ7/m7HzVRut3Q6jgrS99lb1?=
 =?us-ascii?q?c9k8IYnggtUoauKHbQC7rUVRE8B9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUh?=
 =?us-ascii?q?rwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9IRmrowjdrNQajI9sJ6o+zh?=
 =?us-ascii?q?bFvGZDdvhLy29vOV+dhQv36N2q/J5k/SRQuvYh+NBFXK7nYak2TqFWASo/PW?=
 =?us-ascii?q?wt68LlqRfMTQ2U5nsBSWoWiQZHAxLE7B7hQJj8tDbxu/dn1ymbOc32Sq00WS?=
 =?us-ascii?q?in4qx2RhLklDsLOjgk+27ZkMxwiL9QrgynqRJx3oXYZJiZOfp6c6/Ye94RWG?=
 =?us-ascii?q?hPUdtLVyFZAo2ycZYBAeQCM+hfoIbzqEADoQe9CAS2GO/i0CNEimPw0KYn0+?=
 =?us-ascii?q?ohCwbG3Ak4EtwTrHTbss31NKcMXuCz0aLG0DDDYOlS2Tf59ofJcg0qrPaXXb?=
 =?us-ascii?q?1tasrc0lUvFgPZgVWQrozpJTWV1v8XvGSB4OpgUvyvhnchpgpsoTav3t8hhp?=
 =?us-ascii?q?TGi48a0FzJ9Th1zJwrKdC3VkJ3e8OoHZ1NvC+ALYR2WNktQ2RwtSY/zb0JpI?=
 =?us-ascii?q?C0cTARyJQi2x7fc/uHc5WU4h77VOaePzN4hHV9dbKjnRmy60mgyvDnVsWu0V?=
 =?us-ascii?q?ZKqCRFkt7Xtn8TyxPf8NSHS/th8Ueh3jaDzQbT5f1fIU8oj6bbLp8hwroomp?=
 =?us-ascii?q?oSt0TMADP2lV3rgKKZeUgo4Oil5/n9brn4qZKQKZV4hhzmPqQrgMO/AOA4Mg?=
 =?us-ascii?q?YUX2ic/OSxzKbj8lDiQLhRkv03krXWsJDdJcgBoK65GBVa3pws6xa4ETeqyM?=
 =?us-ascii?q?4YkmUfLFJZZBKHiJDkO1PUL/D9Cve/mU6skDZwx/3dOr3hA5PNLmXMkbv7eL?=
 =?us-ascii?q?Z96lJTyBA0zdBE4JJUBK0BLOjvVU/2sdzSFgU5PBCsw+b7FNV90ZsTWWaOAq?=
 =?us-ascii?q?+fLaPTvkaE5uQxLOiDeI8Yoyj9K/c76P70l3M5mkESfbOv3ZQJbHC0BPNmI1?=
 =?us-ascii?q?+WYXD0mNcODX8KvhYiTOztkFCCVT9TZ3CvX6Mz/z07E5ypApveRoC3gbyBwC?=
 =?us-ascii?q?e6EoRTZmBBF1+MDHPoeJufVvcSZyKdPNVhniYHVbe/UY8h0w+htAvgx7pgNO?=
 =?us-ascii?q?rU9TUStYj/29ht++3TiRYy+CRvD8uD12GNTmd0nn4HRjItwqB/rlJyyk2Z3a?=
 =?us-ascii?q?h7nfNYD9pT6O1NUgsgMp7c1eN6AcjoWg3dZteJVEqmQtK+DDEpVN0x3tsObl?=
 =?us-ascii?q?1lG9q4kxDD2zOmA7oSl7yMHpw77LjQ0GT2J8Z4mD760/w5hkQiatNGKGnjg6?=
 =?us-ascii?q?l47QWVDInMwGuDkKP/TrgRxC7A8i+4yGOKuExJGFprXb7tQWEUZkyQq8/woE?=
 =?us-ascii?q?zFUen9WvwcLgJdxJvaeeNxYdrzgAADGabu?=
X-IPAS-Result: =?us-ascii?q?A2AxAABzze9d/wHyM5BlHAEBAQEBBwEBEQEEBAEBgWoHA?=
 =?us-ascii?q?QELAQGBcoFtIBIqjCZghmgBAQEBAQEGiyCPS4F7CQEBAQEBAQEBARscAQGEQ?=
 =?us-ascii?q?IIpNAkOAhABAQEEAQEBAQEFAwEBbIVDQgEMAYFrKYMzAUaBUYJjP4JTJbASi?=
 =?us-ascii?q?Q+BSIE2AYc+hHN5gQeBR4MbhBKBBIUhBJdClyKCOYI7kykMG5o3AS2qSDmBW?=
 =?us-ascii?q?CsIAhgIIQ+DJ1ARFJtKIwMwiDiEMoJBAQE?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 10 Dec 2019 16:55:27 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xBAGtCxD051071;
        Tue, 10 Dec 2019 11:55:13 -0500
From:   Stephen Smalley <sds@tycho.nsa.gov>
To:     paul@paul-moore.com
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: [PATCH] security: only build lsm_audit if CONFIG_SECURITY=y
Date:   Tue, 10 Dec 2019 11:55:41 -0500
Message-Id: <20191210165541.85245-1-sds@tycho.nsa.gov>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The lsm_audit code is only required when CONFIG_SECURITY is enabled.
It does not have a build dependency on CONFIG_AUDIT since audit.h
provides trivial static inlines for audit_log*() when CONFIG_AUDIT
is disabled.  Hence, the Makefile should only add lsm_audit to the
obj lists based on CONFIG_SECURITY, not CONFIG_AUDIT.

Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
---
 security/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/Makefile b/security/Makefile
index be1dd9d2cb2f..746438499029 100644
--- a/security/Makefile
+++ b/security/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_SECURITY)			+= security.o
 obj-$(CONFIG_SECURITYFS)		+= inode.o
 obj-$(CONFIG_SECURITY_SELINUX)		+= selinux/
 obj-$(CONFIG_SECURITY_SMACK)		+= smack/
-obj-$(CONFIG_AUDIT)			+= lsm_audit.o
+obj-$(CONFIG_SECURITY)			+= lsm_audit.o
 obj-$(CONFIG_SECURITY_TOMOYO)		+= tomoyo/
 obj-$(CONFIG_SECURITY_APPARMOR)		+= apparmor/
 obj-$(CONFIG_SECURITY_YAMA)		+= yama/
-- 
2.23.0

