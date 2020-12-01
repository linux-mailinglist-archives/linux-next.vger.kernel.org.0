Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734BB2C9EED
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgLAKQ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgLAKQ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:16:56 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A28AC0613CF;
        Tue,  1 Dec 2020 02:16:16 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h21so3853343wmb.2;
        Tue, 01 Dec 2020 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oWpOYPqDXcaHQ+GA9gFX+bGGwx0YRkUwwB7v6yS/9a8=;
        b=t2gZR19pDQassvzDElYJl9mBW/3Pf/oqaRpETPyAekGnxqeplxh9cIpxxqDS6CDs1W
         KnfcIbnPEq8Y0PnoINDfGGAKrPTXZ4jsIAYp2oQrcTjt4vmIzGPg3oMM6fU7FhXqRccF
         NmcTOV/bm2Ibg2npioyKB2hXctC5uFpGya6uzF3e0wBn04aiB1TqNv5Ot15/rY4DaoJL
         bsOwTKFG3o5m29woTHrVEIx303Rh12YkMSlqmqS1zjpBMaCqSWHI7KSytuyEIVYqATpO
         PCbCgOr+xMXp74RUD+Pqbkys+vk3RNws4RgM68SRb6Eli2QgTYVnAykrHD0V68RZL4A9
         Z3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oWpOYPqDXcaHQ+GA9gFX+bGGwx0YRkUwwB7v6yS/9a8=;
        b=drKui3OWibvusWahrICpxQo9O+EyLAWru+WY8f1FJ0+iZgOmJMclI1lH9NlOLo9SRN
         Aa3+f1LWS4+2ib1YQw1+agrG+vY8lvLo9KLUgwN4iG7ksm9hNGzxwfPMcliayybhgq6C
         ygpVJogEshQzYM+2gmkW0c4txl7VYTA1hD8bR3CYY7gZFvJo3W1JNLPCNLe09xjrrUNI
         2lKNU8c9Hrds57SlAIhrbd4WI8j/TqL1SPURhKroHxT0bKeXPdd4/iPM31mfG39EZc+8
         Qms3XqCfXm3VFiD07W7/17o4ZFiZcpf/X4cs+YbXRlWu+5HwVj9HYfWzx391YRPoh6fC
         9VLQ==
X-Gm-Message-State: AOAM5324Rm3fX1oTg/ydtdRb6BS65/dyt6Fo/T95LV8RJK3ofHWHM4OY
        araHq6fdN+5dRFXa8p16voo=
X-Google-Smtp-Source: ABdhPJxN/l2E3yqoUeysVjeiMXi3GCK2DLgcwxhpoEf5+NH3k6WA+lfBZUqV8zWDZDP0zoyKkEfFkA==
X-Received: by 2002:a1c:6746:: with SMTP id b67mr1994382wmc.8.1606817775272;
        Tue, 01 Dec 2020 02:16:15 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id h2sm2253347wme.45.2020.12.01.02.16.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:16:14 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH 0/3] phy: ralink: phy-mt7621-pci: some fixes for COMPILE_TEST
Date:   Tue,  1 Dec 2020 11:16:09 +0100
Message-Id: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Vinod,

After merging the phy-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/phy/ralink/phy-mt7621-pci.c:17:10: fatal error: mt7621.h: No such file or directory
17 | #include <mt7621.h>
 |          ^~~~~~~~~~

This driver has two includes which are in
"arch/mips/include/asm/mach-ralink" and are directly included in the
driver:
* mt7621.h
* ralink_regs.h

This is because this path is directly included in 'arch/mips/ralink/Platform'
for "ralink".

Adding the include search path to the phy ralink directory fix the problem.

Making 'allmodconfig' in x86_64 also showed two warnings for this driver
because of pointer size and not valid name for MODULE_DEVICE_TABLE ids.

This two have been also fixed and included in this series.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (3):
  phy: ralink: phy-mt7621-pci: add include search path in Makefile
  phy: ralink: phy-mt7621-pci: avoid warning if COMPILE_TEST is enabled
  phy: ralink: phy-mt7621-pci: set correct name in MODULE_DEVICE_TABLE
    macro

 drivers/phy/ralink/Makefile         | 3 +++
 drivers/phy/ralink/phy-mt7621-pci.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.25.1

