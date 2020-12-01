Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB0E2CA0A2
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730296AbgLAK47 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:56:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730281AbgLAK46 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:56:58 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C339BC0613D3;
        Tue,  1 Dec 2020 02:56:17 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id v14so2141344wml.1;
        Tue, 01 Dec 2020 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GxGy9xqXVVSiWYrcgBKhtSzhPUbjkEF5wnI2eWh00k=;
        b=PRRMW5mAJIRG4uFf6m9lYzRpeqO/vzYTNjq0vGEX9k5dRbs+e3ATKUzMKmaLUaRSZq
         CCEVRWn+iE69blokqOTg8AEfKfLlpjthyBs3EohG332sd7+RzkV79FICFW5eCLc54Sz0
         msErZPj5ilmXCdOPRYhDyhHtSuA/X7EUEoCSWXWcoicDqMihJ/dKEAKmd1Z1usMBRSyo
         WSoK4ko7mlxcC7hzSbOS+NR321gbffVJtSGbVMAp3GOaE1PXjbnyjwrhGxJ8DSWg72SR
         iHa4unmbkBkYr3K2loElS+0fB1ffLU05nd/rzzDIHod3uvn9dAx9Zb0Z2TokMfrRVQ0D
         1DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GxGy9xqXVVSiWYrcgBKhtSzhPUbjkEF5wnI2eWh00k=;
        b=jHQ25Y4F8IAkW+WsZJcehhLAxP3ZqgNyowe7KpzzR71/uoRmamWvDpZ+Lwt2cPUm0h
         +jPajnhxFW/VGG0CtIilopQt2adpYTM7/oelJtE8/Lhi4eWXqyJHuvu3v3eyrsryObAq
         P4ERzHA9ynhtYFdITqXZgeo7/mqSrrbGQAKthsnLJrTGYBq5XwV5fn1QRJL5a/dSFM7N
         u05uT3WYlThBiQXdj0tJLY7hzZU+tPfhVoMK5pNl/1giGLlPmi/wiGiPsAcKobXGDY8k
         QtS9+NoTIhD1db7cLvOdyAemI+uKOMX5tBJkH61kL6DD0Fy+V5JV3tY7Y5fSDi4kNswl
         iP5Q==
X-Gm-Message-State: AOAM5305RNGALKSYjfGDXCAOYA1MJ6hJ7c1zs4YPyKkIAmD6+YK7p1Ll
        F4MSJ5y2OvPCMYBv/3uCNDg=
X-Google-Smtp-Source: ABdhPJywq+ag4aGPb4SzzHF4ujLHJ+o+aKF8rtHQCVO4ZcjiSud7/0o7fDdPnyjHitaZKCOc9qk2bw==
X-Received: by 2002:a1c:730c:: with SMTP id d12mr2046824wmb.3.1606820176522;
        Tue, 01 Dec 2020 02:56:16 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id u66sm2318138wmg.2.2020.12.01.02.56.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:56:16 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     sfr@canb.auug.org.au, kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH v2 1/3] phy: ralink: phy-mt7621-pci: add include search path in Makefile
Date:   Tue,  1 Dec 2020 11:56:11 +0100
Message-Id: <20201201105613.23252-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
References: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
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

Fix this problem adding include search path for ralink in
ralink phy directory Makefile.

Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/ralink/Makefile b/drivers/phy/ralink/Makefile
index cda2a4a7ca5e..c8f9adba0d82 100644
--- a/drivers/phy/ralink/Makefile
+++ b/drivers/phy/ralink/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+ccflags-y	+= -I$(srctree)/arch/mips/include/asm/mach-ralink
+
 obj-$(CONFIG_PHY_MT7621_PCI)	+= phy-mt7621-pci.o
 obj-$(CONFIG_PHY_RALINK_USB)	+= phy-ralink-usb.o
-- 
2.25.1

