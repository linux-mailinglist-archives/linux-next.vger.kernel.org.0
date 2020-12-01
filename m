Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6A72CA0A6
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbgLAK5C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730281AbgLAK5B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:57:01 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E7EC0613D6;
        Tue,  1 Dec 2020 02:56:21 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id d3so2121448wmb.4;
        Tue, 01 Dec 2020 02:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R4ckBwxZKMeIrRYpqbJom2hXs/293kRyY1Ug4C+A7wo=;
        b=LD/ulT6r/c9oJ/OCck9DfDOZY+iEHPT1cb/2v7plVA+g2HHkvAK17vkuqS/Jgf75rX
         x63fnUrOqic9CTv2Oi3BUAfioXn/djvw/4gc8OCncZQojOSHq5Agh7JrfmbSNaJcdOmr
         a0kt51TpsPzeoaf99BeoDOPMzTEXey5xAtt3LhN3rU6J37SLHXqEHkKUikGU5qptYXkm
         qbsqVN0boOmdVClkbifZ3uTa3iGzmNX/5G9IgsBcPy8OPG5rnMKRYOTaFnM3HzIwOZA4
         eFpB9PB5XodsE5FLLlY2Jx8n8rJlBCTYq8+f0Tgs57hRurU9jjf/tdFOGCR6IGvB9fUA
         dhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R4ckBwxZKMeIrRYpqbJom2hXs/293kRyY1Ug4C+A7wo=;
        b=qxbYhsvVSAfBaq5KixCosHIv0Sn6TGzVC85ZpFj4IX9SmHMOpcCbhs+ZxO9mlUl4Mt
         z7eQzBofJZVK4WDoUMPsL26m+GlfGM2jETq5gtx//0v/ME7MAWLDtQvrvoDTfOFhCFta
         ipTmWGi9vSKrjxnHjPOV+ZSW+TZH7ql7UCNUTi3+TU8wMUNYYvawn3Z8H63FYr83KQjy
         9I8w5CqACPIzw1Nj+gBUEpZlREDMhTikU7gfWwBN9pRneFcvLvjiiwmKVLyWr1g2A5ow
         t/4BLYTqGwGQnLd8auAPOcorqXcuDls+h2xlC452wvaYiTVt7CDKqdmMIozvRLMTntnf
         VlGA==
X-Gm-Message-State: AOAM532ZZ0Wk3a7OBcWHadxWcDtDyZO5Rk9Jy2JYNJE6c3xlsIIqXMGt
        GE63EluDc7GV1DxrCYqslFU=
X-Google-Smtp-Source: ABdhPJws+z8oMurPg4of0gMftdZwaD9rBy8cM1CjHEV6FPCZ1sw2h9tZkPhml+rLcs+Xripc2z1rRw==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr2033922wmi.157.1606820177570;
        Tue, 01 Dec 2020 02:56:17 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id u66sm2318138wmg.2.2020.12.01.02.56.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:56:17 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     sfr@canb.auug.org.au, kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH v2 2/3] phy: ralink: phy-mt7621-pci: avoid warning if COMPILE_TEST is enabled
Date:   Tue,  1 Dec 2020 11:56:12 +0100
Message-Id: <20201201105613.23252-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
References: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
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

