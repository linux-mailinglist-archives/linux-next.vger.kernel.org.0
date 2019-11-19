Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9282A102C20
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 19:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfKSS5v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 13:57:51 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:35761 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbfKSS5v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 13:57:51 -0500
Received: by mail-wr1-f44.google.com with SMTP id s5so25214893wrw.2
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AlF55tHmwaf4MqjtYLnLUKyMqEVxUolFQJuCOS0Pms8=;
        b=VVN/i5s/Renk6ZqhXJHaifiNV0eK1Jv06CHOHabk7FjtFCrzdto980JIjcUBDomjqM
         2A3EDvrgK9aI4+xOrwBDTWjBH4bEhmLybHc1QTD89S7FBq0MuMsCfSHSdSrZLofkEoN3
         2PCk7LR7nC0lbkAks/IoIDI4AYg2DitsMp4WJsYGQFJ/2mPq1A/m6GJdFeIUxbXPF7dP
         /k9b1m0YOxfF/5x8oY77VoGo6O4mI8EVaCqEE/7UHpsRGC+0Ud+fnuwbV+B5kmx4Fnqb
         90EjuR0Ow6UQuudhzobkic1iUk8oJ+OvIgYiNsZmfcDMpbhn3whol1ZZ0S1YcR56nr8+
         pgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AlF55tHmwaf4MqjtYLnLUKyMqEVxUolFQJuCOS0Pms8=;
        b=AiHxAlB4K96w7PaVLNpb/f6H/7HV2W5QOvWtXjcJCBKgLK7Jb2oUlIiBvRg73HuYf9
         8RvTCraAP4L3v2JD3iCq6oDXpugKxqh+v3xUCifs33QYVdh+6U46RWQS5DJ4hXqTytZi
         60f1gPh7Wm9GpHPjMOHHno+GvocdRoOb812FGUVwnqUUquVwyGWausALCz1FXiegjMod
         KYCi41yhYHaJBFMLsdek74upGhtKvPs6doCdQuKhHJSUiZiX/4g7u8kr8uaAqyTMIC4P
         abQoh6ry6StP9mMutG3TTDZ7wXN3JpPBm1lkHijM0y6xgts+XgrhBzPqFpMQjIhmHqdc
         qP4Q==
X-Gm-Message-State: APjAAAW/Xevarj3F5Teulcxft7zJcn+l6ISiSGIw1D5ia7nB9+kWScOF
        CyY7IhHMnPzWY8Vl/WycUFk7PQ==
X-Google-Smtp-Source: APXvYqx44dVWxeofUPw2ECrAUt9b+aQ0z04SPU2FAjq5d9VN80N7u2IjvfOMQ9+ajcMmquhIBsKI7Q==
X-Received: by 2002:adf:ed4e:: with SMTP id u14mr40406481wro.132.1574189868998;
        Tue, 19 Nov 2019 10:57:48 -0800 (PST)
Received: from google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id 19sm31875516wrc.47.2019.11.19.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:57:48 -0800 (PST)
Date:   Tue, 19 Nov 2019 19:57:42 +0100
From:   Marco Elver <elver@google.com>
To:     Marco Elver <elver@google.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH -next] kcsan, ubsan: Make KCSAN+UBSAN work together
Message-ID: <20191119185742.GB68739@google.com>
References: <20191119194658.39af50d0@canb.auug.org.au>
 <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
 <20191119183407.GA68739@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119183407.GA68739@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Context:
http://lkml.kernel.org/r/fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/Makefile | 1 +
 lib/Makefile          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
index dd15b62ec0b5..df6b7799e492 100644
--- a/kernel/kcsan/Makefile
+++ b/kernel/kcsan/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 KCSAN_SANITIZE := n
 KCOV_INSTRUMENT := n
+UBSAN_SANITIZE := n
 
 CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)
 
diff --git a/lib/Makefile b/lib/Makefile
index 778ab704e3ad..9d5bda950f5f 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -279,6 +279,7 @@ obj-$(CONFIG_UBSAN) += ubsan.o
 
 UBSAN_SANITIZE_ubsan.o := n
 KASAN_SANITIZE_ubsan.o := n
+KCSAN_SANITIZE_ubsan.o := n
 CFLAGS_ubsan.o := $(call cc-option, -fno-stack-protector) $(DISABLE_STACKLEAK_PLUGIN)
 
 obj-$(CONFIG_SBITMAP) += sbitmap.o
-- 
2.24.0.432.g9d3f5f5b63-goog
