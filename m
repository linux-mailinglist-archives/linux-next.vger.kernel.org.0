Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFF32CA12C
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730526AbgLALVg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgLALVf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 06:21:35 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47524C0613D6;
        Tue,  1 Dec 2020 03:20:55 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id i2so2066759wrs.4;
        Tue, 01 Dec 2020 03:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJmGoB56ldpzthXbqv0ewqe8LD+Bo6ZT7nS096LzM5k=;
        b=ABl82+TcPXzWGwmJnpduKXPVmMdl/8N/HJDO477bAnnI08ihskpbLYC0XR/fnJK9y9
         Bsca245HAWC8keY/84bmAaBC6DuTa0/1I9VabfKD6qoTyrNWMLHoN8IlHMJImOAT5q9N
         uXEh8UFHWY7FKUUpFIYM/+fP+aovPIK4qRAv18Ynq7JQZwfP4TFtgcL/JbqKAGIGUrbV
         44rvpcVnTZUFPT0zd8LUZOm5mF8vbzw4NoQ89vecmuxbp0e+02f+bdrFGzlXdhoiK+7i
         978n4xwpEWPXpJCfoEff6IslAfuxdw1XOE7Aa0gLmSTpwT8MbejEGrl04H7LSIhzQAJN
         vmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJmGoB56ldpzthXbqv0ewqe8LD+Bo6ZT7nS096LzM5k=;
        b=AkXNJ6L57Zux8dA0cnJrSdaJqAX5zjg2LK0TumCcK4DXhalAE1Q7dUYK9Uk/EObVLZ
         XBOyf9Fcd2MBb6vQnx1N1eSCmu7P8ZwdUf8DwOJkkxdC5h6kGTlxNjE6P5Hh+lKyihoN
         eYRgsDNFY6MpOGf+Rcbbe5BOqLCroAG3cUp7giSVr5yfKeMlszSWqgJJo71xpJjg2bh6
         Ehr+oPY/ZDMqRbnA62sUnnX3Tj5z+kMDPCwS2zxKWkXfBer3kSnrjpYzr33NTHbnhtRw
         39MV8u/YaKkW2AjsyXGiem9XQDTW6Q6k0p7K71XL0WSvtZkJULULXFKvWk8nhj/eB1EG
         U8tQ==
X-Gm-Message-State: AOAM532PGKjAbmAinmuzjMHgwfVUP+VDp/lUFYKfvO0skKmXWdy3dvHp
        bwnNOZGOBashnjA6jVpfgLQ=
X-Google-Smtp-Source: ABdhPJxrSRALocDDBa8C6QF++D2V+qPSAShMV/o/sCE3II8cI4HpNSIA9+xzXtElapE1R017olnCQQ==
X-Received: by 2002:adf:e551:: with SMTP id z17mr3215166wrm.374.1606821654101;
        Tue, 01 Dec 2020 03:20:54 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id v20sm2223818wmh.44.2020.12.01.03.20.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 03:20:53 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3 1/2] phy: ralink: phy-mt7621-pci: drop 'COMPILE_TEST' from Kconfig
Date:   Tue,  1 Dec 2020 12:20:50 +0100
Message-Id: <20201201112051.17463-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
References: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This driver includes the following two files directly:
- mt7621.h
- ralink_regs.h

Compilation for its related platform properly works because
its real path is included in 'arch/mips/ralink/Platform' as
cflags.

This driver depends on RALINK but also is enabled for COMPILE_TEST
where nothing about its platform is known and this directly
included files are not found at all breaking compilation.

If we want 'COMPILE_TEST' we have to change cflags also inside
'phy/ralink' subdirectory Makefile which seems that does not
like to linux-phy maintainers. Hence remove COMPILE_TEST from
Kconfig to avoid the problem.

Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ralink/Kconfig b/drivers/phy/ralink/Kconfig
index 2fabb14d2998..ecc309ba9fee 100644
--- a/drivers/phy/ralink/Kconfig
+++ b/drivers/phy/ralink/Kconfig
@@ -4,7 +4,7 @@
 #
 config PHY_MT7621_PCI
 	tristate "MediaTek MT7621 PCI PHY Driver"
-	depends on (RALINK || COMPILE_TEST) && OF
+	depends on RALINK && OF
 	select GENERIC_PHY
 	select REGMAP_MMIO
 	help
-- 
2.25.1

