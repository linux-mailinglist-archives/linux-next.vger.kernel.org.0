Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F76B1B054E
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 11:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgDTJN2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 05:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbgDTJN1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 05:13:27 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5ADFC061A0C;
        Mon, 20 Apr 2020 02:13:27 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y25so4650847pfn.5;
        Mon, 20 Apr 2020 02:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=1Zq1SVeqBSBlpUsG8Y64zKxLU8Vy6Etqwon99J3evYk=;
        b=jWneeJGKXZijAZriP6gBEkQiWrAq/rgVgFVrITNNZLiVvE78IqUm/Gd4Xzj4XvYwfa
         3s3qrMTh75NWdwiSMDWiYQHjI/4Si73DTINs8ZMyYQdblwAqJ/1RM8yNDX7cQV1gDPws
         D9ieEZZ0B6/4nk/OEvqYpPeINpaeC5cvMrMGMXHF+gNGNjlWeRQo7hYIZn0aKMVSB9sq
         hIJbtnssohy3TC95PihtUO4L3jv3s6MSXjzYCI+sK/s7ir7PqRH3YwN6o0T2ISK6/U8X
         4Ao2xZ1Mqw2VilNnKdZE5hMdgSE7gVKvGdpWTwyuNCSgsc62QfUIf0mcQpy8lAD03m/T
         l5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=1Zq1SVeqBSBlpUsG8Y64zKxLU8Vy6Etqwon99J3evYk=;
        b=n50GYY4aRYpUNw8RYcgUBRoz0XR1VojDXmcfAMu9qwqd4BL8f1Fzr0AqzbL7754eJ5
         MFTMQbKGKV4hNoXgm9BMCmf/x1RQ3111PTYm8O5QQURAJaKmTd8bJ8VHColOc1ue5+rg
         rcQU2Fsf4Ew7OD84viZxiOtG/3s9xFy4MdUevHP2JZTe2Awfsb7NVtl9RymVZzLpkJ72
         sTPYTg61iJEL7irdxA4Fxsz+yb6gPtirEQDXTFjxs7ginwA7EucsvX5UjqKDumXy1SYq
         GQeMginJqg8Gl9B6BlGSAirAAzpLufCm81EZtH6hxWJT1VMxpYAP5XVqurOs8iRx/YbX
         DDDw==
X-Gm-Message-State: AGi0PuY6UqhNCgkegvv/dAyiouXplsRLklv2hxttNByPKSSbabJai9PN
        JFfv07TrqdT73HT+Ef4zkrbHoTa8
X-Google-Smtp-Source: APiQypLoA/6h9RLWIgNmnKC0KqhJDURb+BoiUnVEIslSjxHF1lVJYX8xpsqAnWtodov+sPBMaG1a0g==
X-Received: by 2002:a63:9d8c:: with SMTP id i134mr15154731pgd.152.1587374007131;
        Mon, 20 Apr 2020 02:13:27 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id d36sm553737pgb.93.2020.04.20.02.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 02:13:26 -0700 (PDT)
Date:   Mon, 20 Apr 2020 17:13:18 +0800
From:   Murphy Zhou <jencce.kernel@gmail.com>
To:     linux-crypto@vger.kernel.org, Hadar Gat <hadar.gat@arm.com>
Cc:     linux-next@vger.kernel.org
Subject: [PATCH] [linux-next] hwrng: cctrng - fix missing fips header
Message-ID: <20200420091318.bj533ppmetonqygn@xzhoux.usersys.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

In linux-next tree, this is causing build error:

drivers/char/hw_random/cctrng.c: In function ‘cc_trng_compwork_handler’:
drivers/char/hw_random/cctrng.c:334:49: error: ‘fips_enabled’ undeclared (first use in this function); did you mean ‘nx_enabled’?
  if (CC_REG_FLD_GET(RNG_ISR, CRNGT_ERR, isr) && fips_enabled) {
                                                 ^~~~~~~~~~~~
                                                 nx_enabled
drivers/char/hw_random/cctrng.c:334:49: note: each undeclared identifier is reported only once for each function it appears in
drivers/char/hw_random/cctrng.c:335:3: error: implicit declaration of function ‘fips_fail_notify’; did you mean ‘sysfs_notify’?
[-Werror=implicit-function-declaration]
   fips_fail_notify();
   ^~~~~~~~~~~~~~~~
   sysfs_notify
cc1: some warnings being treated as errors

Signed-off-by: Murphy Zhou <jencce.kernel@gmail.com>
---
 drivers/char/hw_random/cctrng.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/hw_random/cctrng.c b/drivers/char/hw_random/cctrng.c
index bdcd56243104..e82716c12c3a 100644
--- a/drivers/char/hw_random/cctrng.c
+++ b/drivers/char/hw_random/cctrng.c
@@ -15,6 +15,7 @@
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/bitfield.h>
+#include <linux/fips.h>
 
 #include "cctrng.h"
 
-- 
2.18.1
