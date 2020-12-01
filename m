Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545022CA09F
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 12:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730282AbgLAK45 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730281AbgLAK45 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 05:56:57 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F4AC0613D2;
        Tue,  1 Dec 2020 02:56:16 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v14so2141264wml.1;
        Tue, 01 Dec 2020 02:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98T7yvmxwJNuYReheK/WRvR4azv53/hMDfFHmnj8JAo=;
        b=aylhf/cChK/A+g+oQfp0ak+LFbmPYu+l29I9ZokGkkPoe48Ud71Gh757EUCdZ4ZRHz
         AzXUCIVBOEmPgtoBFD73Z611UScxlgtmJsWXRpMaROBgE0vWywZMy/zbBOvBHdLmYSrM
         big0Pjiu886cUyobh7zB7VhytHNfGe5bQZs8VL/p114NmYHWkFFkYkkma/O7cnZRYCNq
         C4zG+7RP/bAl/9gYLem2LvZipn3ISCDny0WInlVvUYXAkXurEY0lP6HDr38KTbYCffUq
         VQl4GxRXf3siJt2hW2gimUY+e27ppXLDXewZ9Im+Eu5ik2dNQshu056elE/oG5yDuqC3
         gEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=98T7yvmxwJNuYReheK/WRvR4azv53/hMDfFHmnj8JAo=;
        b=WUfLz3G8bFyJ/c4JHcle7AedEFvY3G7KqGpdgrU3GgFnHr3ICosSuEigm2gV6vWjo0
         Jp2ZVAMMvqVyodLEbkxEFbFcUrhistEculrBRfpXe3Yc9FLjnCICBQ5NTrFn+mgHBfIL
         YEzXKbxu+WBiBNPQgKcT5tv6UkBMJtBUw2huTi6D7TMnTKmXNqyRsjB5lh3Kmwbn+qX9
         NON7O/yUgw3zeNQARNbiqOQ3zYxIhxhKFY6HZ0HwdKTa7eIF6XNHCSjbzjryadvEpnV3
         7MYNwaC1VL6D1uKgLXCzU4ET51hL/dqUsNLBCC6/ed5qaGcTBahPT/uoEa3ouoNVYdFt
         eCBA==
X-Gm-Message-State: AOAM531QalteobIhR4M0LRzD/zmOFIRZKO0fdbaMaaM1n7hnS5xK5gZ1
        kW2Cg2QAN6WEg1TMjIH3Dj+Lk54vH7I=
X-Google-Smtp-Source: ABdhPJzi8W0j373ES1lFCGrl6tQ0fXdeZAo87UvDl/XHLAFYaKwfX9oG8hhR1Jo9kXjv5QcKBg1biw==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr2085407wmd.159.1606820175537;
        Tue, 01 Dec 2020 02:56:15 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id u66sm2318138wmg.2.2020.12.01.02.56.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 02:56:14 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     vkoul@kernel.org
Cc:     sfr@canb.auug.org.au, kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: [PATCH v2 0/3] phy: ralink: phy-mt7621-pci: some fixes for COMPILE_TEST
Date:   Tue,  1 Dec 2020 11:56:10 +0100
Message-Id: <20201201105613.23252-1-sergio.paracuellos@gmail.com>
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

Changes in v2:
    - Added 'Reported-by' tag in PATCH 1/3.

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

