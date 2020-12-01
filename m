Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA592C9EF0
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgLAKQ7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:16:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgLAKQ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:16:58 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7161EC0613D3;
        Tue,  1 Dec 2020 02:16:18 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id d3so1965772wmb.4;
        Tue, 01 Dec 2020 02:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4ckBwxZKMeIrRYpqbJom2hXs/293kRyY1Ug4C+A7wo=;
        b=LBi9240sJt51av5HQ9+PaWrXSxc48EJYc5b7XIZOE2Ow+F85rfnhOVfJgRFWnOLW+e
         k2AEoclIo8hnXaTd2YsGQV/RGdS9ZCizv2GvvkmNpgAGob9ycWiSaTMc65xm6OEz7M6+
         0N2Mbi+MGkxlsxxtWY5p/8q5ZpYF4pn+gg/K9qEYMYeU+0U56RMtlUwH1+RSo6S5rq54
         lopULDdyG0dLrbaTJzVlvUGMEhXBvspfZhEdbLvC9f3RPjTku/zXjhqFBbl3OMvIJD95
         s8xqQV2Kk/zrqiCfImBszPLuoHfc9YRogrNv9IfnuGCNBjUtXEGIhjBaypjUU6bVeNUa
         db6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4ckBwxZKMeIrRYpqbJom2hXs/293kRyY1Ug4C+A7wo=;
        b=SGqRJhvtPGndTWa5R4lyojk2yCjwCPbUE67Ers9c9CfzO3Ot1h3qcpftdzK3uYOv/1
         C7r1XFDD50g+G9JdWhBTOQEYBW90oAJ8h3pKXeT0QykXm5TcqplhILA38RHuZ1SQMMrD
         dcnSAg3zpyXrpixBEbtKLEufmedsj0JthO+KoYSl9AxiFKrmQy+HWX4807Wx5ZlHXJJ1
         QW6zppj3WRI2aAaOWLJDUiIw04+KLelUinsPEAxQys6LWqwnxq0xp0t9n/Cl3nubcTVW
         Q7j8RswaSvxmrBGHcz2oeikQBVNjQhriNhgysQfadIuwRnpjAgZs+s0MyCIq+6zWxGmq
         fSwg==
X-Gm-Message-State: AOAM530/F0ugjc/czPOi4t+mYzkY80pB3Mxb9Jc98oXCY5Fn8+hkr4ai
        XpGluDGGjpdfPa8McAG+BK8=
X-Google-Smtp-Source: ABdhPJyNlJcffcUfhagGACh6tzgtaDdjShZ22jqzyPFBlXs8kfUVRhAawHCAYW38dexdEoPXEFFujw==
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr1937935wmg.55.1606817777215;
        Tue, 01 Dec 2020 02:16:17 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h2sm2253347wme.45.2020.12.01.02.16.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:16:16 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH 2/3] phy: ralink: phy-mt7621-pci: avoid warning if COMPILE_TEST is enabled
Date:   Tue,  1 Dec 2020 11:16:11 +0100
Message-Id: <20201201101612.28458-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This driver can be enabled for COMPILE_TEST. Casting to unsigned
int for address shows a compilation warning because of size of the
pointer in x86_64 architecture using 'make allmodconfig' target.
Avoid the warning in any architecture casting to unsigned long and
properly setting format also for 'dev_info' macro.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index db79088d5362..befa282e2447 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -272,8 +272,8 @@ static struct phy *mt7621_pcie_phy_of_xlate(struct device *dev,
 
 	mt7621_phy->has_dual_port = args->args[0];
 
-	dev_info(dev, "PHY for 0x%08x (dual port = %d)\n",
-		 (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
+	dev_info(dev, "PHY for 0x%08lx (dual port = %d)\n",
+		 (unsigned long)mt7621_phy->port_base, mt7621_phy->has_dual_port);
 
 	return mt7621_phy->phy;
 }
-- 
2.25.1

