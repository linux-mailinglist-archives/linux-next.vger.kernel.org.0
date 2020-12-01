Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450EE2C9EF1
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgLAKRA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbgLAKQ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:16:59 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C159C0613D4;
        Tue,  1 Dec 2020 02:16:19 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e7so1771755wrv.6;
        Tue, 01 Dec 2020 02:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z6ol6e7klFedDuDmZExZMrwFT1Yc7vGtnMGzME94CxM=;
        b=I7y35IPyBJbVJ/Aeb2S52R5I2DVvSFEv672cs2gl8mAMYUMSdb0KzDez4etdpFNObM
         IB2Nah3ym59ESogCor6cyXpBmWywziPakSOJ/Z/lSjvJznxnR+iQCeJRJoa+cITNWGl5
         Lz1lQylsPuSknuYAqlfcNs/XwNfmcc6rno1tcZtv1vaPfk6VBvsx9ITxbYpZq5LJJDNT
         9hlgd5+KOJxSqjaSZhQPsWhtoWgQrHjkCrugy7udlNNQcOqXtZdA5SYEXVrcvxDL9Aji
         3poHv8IVueJ9vAk/uo1URoTvgcqDFltGGl/ocP+ecj76vpbGx+UCsMES6B4ebIZok2yu
         wScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z6ol6e7klFedDuDmZExZMrwFT1Yc7vGtnMGzME94CxM=;
        b=ONsXHGQozCvp0fPd+Oz0VxjR6s6NX5ROnTm8Sl4nkv6F8CfjB4+9Z4eFQhsJxSyzZD
         4UEvYSUKRnLwbSrnZUrxdYu4VMZV/Yu2IR6Am6fMgFDxPSna8kiKq8WOtT2SuYgc0UrE
         1XopPleryj870vmkJPdkt0IgbdQg4tkoloOJDegankOJI1OwUbij25NauTr79nMAxpwq
         5ihQBHB9ehy3Aqrsuglo2WdnKNkdCBGNXGswhi2lP+6KfUiH2JxaN6x2EBhmndM0WjQX
         J0eDXEp2IuHjSdmXjndJYabIv1JbWO/jYj9FpgcfQNOKC1gCnDj4vwslApDZ7Oebmubs
         Vqug==
X-Gm-Message-State: AOAM531pmZT7FdkjCcEApfxbJOOTy3d4fajUIhsIZGUMHoBNjrsYdCG2
        Nez2SwiN9fY0dbjALGMp+bc=
X-Google-Smtp-Source: ABdhPJw3oqpUIUXCxNPGkicoJFlnt2ITESDWscm+NfUxSOZR4jOC1qnvOGSQ/sTTjIqZWELaCf3wlQ==
X-Received: by 2002:adf:fe48:: with SMTP id m8mr2863213wrs.89.1606817778278;
        Tue, 01 Dec 2020 02:16:18 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h2sm2253347wme.45.2020.12.01.02.16.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:16:17 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH 3/3] phy: ralink: phy-mt7621-pci: set correct name in MODULE_DEVICE_TABLE macro
Date:   Tue,  1 Dec 2020 11:16:12 +0100
Message-Id: <20201201101612.28458-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
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

