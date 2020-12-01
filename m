Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B0E2CA12A
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbgLALVf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgLALVe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 06:21:34 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498EFC0613D4;
        Tue,  1 Dec 2020 03:20:54 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id d3so2211787wmb.4;
        Tue, 01 Dec 2020 03:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pk+AeFtfxfYd0H7QNYNcMFIbA1b9N2btxjSaZ5WRW3A=;
        b=aIuwQi17yJnH2ibYAI18vWnyks8GCl5QTIlX6svAZQfs3rNXWP9RNeH2kafZdT6jX1
         lskn0GWMdbucmrxgnB50lQBxL9z4PnyCfOpVnAMOI/vWytEvmVcE7+Z3Xb0EnCbRUA1f
         f/TmcQ95TSKpjkA3rHYT912Wb0pQHelfhn236gxW3W8bH8NOjYUdT8TMNep5DxHy0nih
         bTREO/V1LikQAyXAUKey1u4cjXKArUakCv/DRs5mQ9br8dlCrvSpTiRAOOfm5sJK5op0
         TAgExHHUK4qrB4Vd1h+CuWcWq8QOONF5/VNw+b0Z1wM2YyuhuCB9FhS+EtA1hhYlHQo1
         wbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pk+AeFtfxfYd0H7QNYNcMFIbA1b9N2btxjSaZ5WRW3A=;
        b=WMEOdmOVIRg3hPQ9B9QXf7WXRkKcSBN9gQ2iLSSetG2nG1Wzw9761DN47WXJeEB5yi
         6JDQNtf0xsi7uyl37JrQsh4FO8TzMKzLJuF/jQkA7Ld4D/CFdB5JnnNuWzs/c/75iOis
         ocGFVoh58sfEy9oe+PSmEiXXm9+f5NbbyiSBEENoh1KOLGVvWl7PnlDkfB5NgVS3W0Ke
         V5kM8DY5VS0bnVLCt1BgCb6CdsoAC2IaD/Ht7dLq/fIVFg1Cij0qL8eBI3QGPRSl1lZZ
         /sjLw8wiJTI80FLJOt8P9mrOwHUXB9sxdEAeOChNk0AtbowAXhRnKnfzypiOA52D9EPw
         91+g==
X-Gm-Message-State: AOAM532GyefK133xsyoXKwp08tTVQQquRRUGqHTGTUNDSjRM//gd1rzG
        ddSSPywIZjiSfjQMf3lO4zexaX/3+Rc=
X-Google-Smtp-Source: ABdhPJyvNFubnoZjuqm8G6k3SSBe8kjjgWLjs06/RwEhs44/pCGrDZbGUjelrshESFRpXH8SW5I3ig==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr2194360wmb.175.1606821653099;
        Tue, 01 Dec 2020 03:20:53 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id v20sm2223818wmh.44.2020.12.01.03.20.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 03:20:52 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH v3 0/2] phy: ralink: phy-mt7621-pci: some fixes for COMPILE_TEST
Date:   Tue,  1 Dec 2020 12:20:49 +0100
Message-Id: <20201201112051.17463-1-sergio.paracuellos@gmail.com>
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

Adding the include search path to the phy ralink directory fix the problem but
as you told me I finally end up removing COMPILE_TEST from Kconfig.

Making 'allmodconfig' in x86_64 also showed two warnings for this driver
because of pointer size and not valid name for MODULE_DEVICE_TABLE ids.

Ids for the macro has been also included in this series.

Changes in v3:
    - PATCH 1/3 completely changed:
        - Makefile is not touched.
        - Drop 'COMPILE_TEST' in Kconfig.
    - Drop PATCH 2/3 in previous series because COMPILE_TEST does not apply anymore.

Changes in v2:
    - Added 'Reported-by' tag in PATCH 1/3.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (2):
  phy: ralink: phy-mt7621-pci: drop 'COMPILE_TEST' from Kconfig
  phy: ralink: phy-mt7621-pci: set correct name in MODULE_DEVICE_TABLE
    macro

 drivers/phy/ralink/Kconfig          | 2 +-
 drivers/phy/ralink/phy-mt7621-pci.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

