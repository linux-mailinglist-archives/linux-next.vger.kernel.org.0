Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2393D2CA0A3
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730310AbgLAK5A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730281AbgLAK5A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:57:00 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31EFC0613D4;
        Tue,  1 Dec 2020 02:56:19 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id f190so4106574wme.1;
        Tue, 01 Dec 2020 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z6ol6e7klFedDuDmZExZMrwFT1Yc7vGtnMGzME94CxM=;
        b=g6UEmSr2DBzwXxODLx2ydU/djCG4U0eVuc12XEla56fefTOm68cE0dBfAJ8riORLAk
         OzlgD+YXikRmzU6gQD1uLfLGrBdoKfM5ldCdKbfywWZTy/LNPXom+/oRFJYfMiruOOYr
         fQqUIUOX3W6pQZDDE6ynyeB9uCt+VAcF+02I/3pFL7gdFfaZLOgXSZpRogVhYSmuNJEv
         xhPntBbqHxvUcFsfQwwJSqNqdaYEuerrAtTaHnv/Dyhtl61ZR4rpUsKxISaTQ5WBMWsy
         8oB/v7+K9si726mSMiQ/TqfU5npOs145b+vmB/kKzf0EQjEUeuluKrW4qKOCWgYM6Dd/
         V8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z6ol6e7klFedDuDmZExZMrwFT1Yc7vGtnMGzME94CxM=;
        b=MERm6D88q8nEIo4fUMbPCEpK/43hmdT62m+8hTmzh6+K9jX6mOsFsFNqdcGHojZ0wO
         Xf6JPXStkEhetwEcqPyybdx4aYD1Iev9SbqTJfiNdcLT9dpFWBvtHdZYN2rCxdY0WgIA
         lnJRjeoLPHPBWwleGcvgVBzpjj/PouIMnOog6gyPLncfjd8fA0QMgp/48X06J6Hqsjyj
         lWZRD7gMZvf0zWSuDfi5s8EdMWGRPQDiHyHZvU8aUFnuK0hFWooJh16XdWq7WzQtjPwv
         CFwDYnZvReLRMSQcDkt8i0oyMmnsB3g7mSBQZPvRmtl7zfa07E271+SbOMLq6LVGL8Qs
         UBng==
X-Gm-Message-State: AOAM5334ueIf+DBSQDMQ8tEIUaBowtLmEk1Bqu+cTX3NoH5UCeWuH1wz
        cCkQRwtFIMvCeoldMg28oAE=
X-Google-Smtp-Source: ABdhPJxSYynQT7WZwOsz3mCQ2mRZxS7WAnOdHaXICI90eSVQCzu6PFwdKtTvC+dIKhv5Vr2A0Aptow==
X-Received: by 2002:a1c:ddd5:: with SMTP id u204mr2107884wmg.174.1606820178556;
        Tue, 01 Dec 2020 02:56:18 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id u66sm2318138wmg.2.2020.12.01.02.56.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:56:18 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     sfr@canb.auug.org.au, kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH v2 3/3] phy: ralink: phy-mt7621-pci: set correct name in MODULE_DEVICE_TABLE macro
Date:   Tue,  1 Dec 2020 11:56:13 +0100
Message-Id: <20201201105613.23252-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
References: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Correct name passed into 'MODULE_DEVICE_TABLE' which was wrong and
was showing a warning when the driver is enabled for 'COMPILE_TEST'.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/phy/ralink/phy-mt7621-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ralink/phy-mt7621-pci.c b/drivers/phy/ralink/phy-mt7621-pci.c
index befa282e2447..072f848ec0cf 100644
--- a/drivers/phy/ralink/phy-mt7621-pci.c
+++ b/drivers/phy/ralink/phy-mt7621-pci.c
@@ -335,7 +335,7 @@ static const struct of_device_id mt7621_pci_phy_ids[] = {
 	{ .compatible = "mediatek,mt7621-pci-phy" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
+MODULE_DEVICE_TABLE(of, mt7621_pci_phy_ids);
 
 static struct platform_driver mt7621_pci_phy_driver = {
 	.probe = mt7621_pci_phy_probe,
-- 
2.25.1

