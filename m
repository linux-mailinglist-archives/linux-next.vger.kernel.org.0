Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF9C2136AF5
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 11:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgAJKW2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 05:22:28 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39177 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbgAJKW2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 05:22:28 -0500
Received: by mail-wm1-f68.google.com with SMTP id 20so1371257wmj.4;
        Fri, 10 Jan 2020 02:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Eu2bs9SVEYgGGD1mosILhHkiZtknham97n87Dpy2QYk=;
        b=YKWYw7k5tWr/1EBsWXBPMMRFr0mgUy5wTbRK+znL6YKL3V8YVdEwjblkg54S1af21Z
         M5hDSF3HHOKVliDVIjxgqNRnqMmeTRMyQnan3oEtExVVpoFgoCaML4EXja7X1hTta+Sm
         dsiNad+706c5Wt141n1kcMJHVb+Iao3hZvUq8dZ8D574oaEpFn+4oCK2CR3OCcA8hjeG
         NuI2LuayDZLTY7MGPiaTI9X/AdfGHlL6kqfFcGet6tQ8FASnNfdKhVlI4FBkAqxbNfP+
         +2aUeC7Q64i8RlthrhqVizRXTBi+Lh7EESCwAsU6VeSozzO2ISkodicM1gMhjVZKZn7V
         o4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Eu2bs9SVEYgGGD1mosILhHkiZtknham97n87Dpy2QYk=;
        b=KRfqG40npfTsPtJdP48zfu8ISRSx6+VWcqLV1/xkqshUVRvkqfmZLiBCN7uy03jY6V
         54y56S8My3kC4cWLWolVXFp/ae5gdA75iT+Xs4Kq/5ip3ANTZdMPex3PSK+Ar7VPs777
         Zrl2cnQFZmBiXNew+M48dJ7bU2nzEXxvcI15hHkvS7YZuL/b1MWYkDrBI25rVH5eFCCw
         0/7WddIt+r7TOKI6u0Y+Zbf8BGBjevk0P/HLX2p1IjaeLUoGIqofYDYFPWUzXzQC6DXi
         RWiptSbiq57/sMbA1Qu22KXOfExzOxRqeFOwfljvKlqs3OpRrVnEEeC8R5NxOU9oKSh6
         bkkQ==
X-Gm-Message-State: APjAAAWteOa5hMc3IdWKvqIWvLg0CZA4fr/4c5WLFKWrgrkHe2d/jihN
        XTJ7WoFp/FiatntLL84z9B/l4EAuqPwj0w==
X-Google-Smtp-Source: APXvYqwW7vXFS8fLGrWHmzHotWV2mTu0+RO1XGTmHdNAT2EDeQyhlj0IRNs961Atc2FucCAfy9pLng==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr3387345wmj.75.1578651746285;
        Fri, 10 Jan 2020 02:22:26 -0800 (PST)
Received: from localhost.localdomain (p5B3F6BF6.dip0.t-ipconnect.de. [91.63.107.246])
        by smtp.gmail.com with ESMTPSA id g25sm6734475wmh.3.2020.01.10.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 02:22:25 -0800 (PST)
From:   Saravanan Sekar <sravanhome@gmail.com>
To:     sravanhome@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        sfr@canb.auug.org.au
Cc:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] regulator: mpq7920: Fix Woverflow warning on conversion
Date:   Fri, 10 Jan 2020 11:22:20 +0100
Message-Id: <20200110102220.7163-1-sravanhome@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fix warning Woverflow on type conversion reported on x86.

Fixes: 6501c1f54a17 (regulator: mpq7920: add mpq7920 regulator driver)
Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
---

Notes:
      Changes in V2:
       - updated commit message

 drivers/regulator/mpq7920.c | 2 +-
 drivers/regulator/mpq7920.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mpq7920.c b/drivers/regulator/mpq7920.c
index c603d60fb87b..ab1b847c57e5 100644
--- a/drivers/regulator/mpq7920.c
+++ b/drivers/regulator/mpq7920.c
@@ -221,7 +221,7 @@ static int mpq7920_parse_cb(struct device_node *np,
 	if (of_property_read_bool(np, "mps,buck-ovp-disable")) {
 		regmap_update_bits(config->regmap,
 				MPQ7920_BUCK1_REG_B + (rdesc->id * 4),
-				BIT(6), ~BIT(6));
+				MPQ7920_MASK_OVP, MPQ7920_OVP_DISABLE);
 	}
 
 	ret = of_property_read_u8(np, "mps,buck-phase-delay", &val);
diff --git a/drivers/regulator/mpq7920.h b/drivers/regulator/mpq7920.h
index 6a93bfbc750c..1498a1e3f4f5 100644
--- a/drivers/regulator/mpq7920.h
+++ b/drivers/regulator/mpq7920.h
@@ -55,6 +55,8 @@
 #define MPQ7920_MASK_SWITCH_FREQ	0x30
 #define MPQ7920_MASK_BUCK_PHASE_DEALY	0x30
 #define MPQ7920_MASK_DVS_SLEWRATE	0xc0
+#define MPQ7920_MASK_OVP		0x40
+#define MPQ7920_OVP_DISABLE		~(0x40)
 #define MPQ7920_DISCHARGE_ON		0x1
 
 #define MPQ7920_REGULATOR_EN_OFFSET	7
-- 
2.17.1

