Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1C62C9EF3
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbgLAKRE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729735AbgLAKRD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:17:03 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0A9C0613D2;
        Tue,  1 Dec 2020 02:16:17 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id k10so1969504wmi.3;
        Tue, 01 Dec 2020 02:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkdxSr+ujfo26mxy95j9BEpww5e7bu2aPP7QXnKoeYg=;
        b=dE0xXAUISUM4GpNXSKkNtLE8OByeD2wErfEzXl9QDn6xKRteVaBF9tXQz6uBKZzleU
         Kl7kM7vSQwF4cEkuZTumMmlvWLopjOpfR+FE1lZ8vKWt7MrtN0Q+VLrBRga8CX7DK7JR
         eRlCWuJJDmRyZ/2s+7NegUr6/gGRKbp4/i83HE6SHHIbFT+Wuk/4/elo5JegfyBvDefv
         YYhXUeQerGlnGERRO6+xaWf4yKHQnpR90XhI5vADV3AohQ2Wv6YaGVUxSL7v+OlpHMLu
         iTRwis8b7dg5WauMiGBh1V8mJqpwy17Bfji1W7WWwGBASMQGIFNi0A9FGdkRUEqwdXEv
         UIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkdxSr+ujfo26mxy95j9BEpww5e7bu2aPP7QXnKoeYg=;
        b=SDxXFBzJu8pcPJcdU4bSL0xM0r4vI+pxPRI9j10geKpD49lgQzo5NuHAxB3v093pm1
         cVlyYXLqJlkpUyR0vrzTdD1kJ6lD7cQA8XMIe+Q+2rHQTQzskckFaQS5HYNeXJc/acYD
         HvM84deZicoVXQqryNzgjKht96aeQLfWPxBmILPDlWD0N56RMWXbIEe67kgXTybo5nGf
         lw2976mj6UkoDSikL6nSZyolfvWniwC6GM4MqXdp7naY35T51MGRvNqht5h6aSX9uzao
         v+rW0+pPuqSaVh5lKR3CB+fKDdT50nP6nvAgQ8bBfSmu1UPhoSTIZrxHahnISFeUPB5o
         y7/w==
X-Gm-Message-State: AOAM5322iapqVQU0/91IZBC+IJrxRXSMO3Ns8wHnDrB5wrBZgOPjVLeh
        dDqT6uX5Gww/1eDLdw5vfRo=
X-Google-Smtp-Source: ABdhPJxHI/6cAunw+VukPp2364+GyY23YCaPvYYCQiHLRNdSQyIAkZ1Q0CUNuJd5Nn6ENcKrWHdQLg==
X-Received: by 2002:a1c:bc57:: with SMTP id m84mr1869557wmf.163.1606817776244;
        Tue, 01 Dec 2020 02:16:16 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h2sm2253347wme.45.2020.12.01.02.16.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:16:15 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH 1/3] phy: ralink: phy-mt7621-pci: add include search path in Makefile
Date:   Tue,  1 Dec 2020 11:16:10 +0100
Message-Id: <20201201101612.28458-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
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

