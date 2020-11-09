Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BC82AAE7E
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 01:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgKIATQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 19:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727929AbgKIATP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 19:19:15 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F6CC0613CF;
        Sun,  8 Nov 2020 16:19:15 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id m65so4939254qte.11;
        Sun, 08 Nov 2020 16:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3LcMZKLiUPDXMEpD6ZsN+QTNJLzBAx+sHH3KFfJGyJ0=;
        b=R8zuVCcdEeO0C5i/vvcm5HkmQPlTg9fjAhMuHmzfp6238Ab9nux7MHsAvHyVEFwDO+
         xXOyJBVQ92hyI0zt5wxzCYWiWdNsESwhtV74DkxY/ZdjfBlF01azPxswWdUc0ombkp5M
         7bLuwiv8USRYsvEfijTpW9IU6Ynpai653OR9Y/ipPTlyQ7A5lkPpp0kw0NYPlmwhKKGf
         HGsokQK+v+fVutJ2yIlW5OhHGlCe5eifq0b1bm0/2eNyEkJUiyqZI90xsA0le08gpYAL
         24OZDCB4C4//iGp+Iu97ibjZxVyvO8JwJtbwOFCT9KkeCz0oZ5oKKzzowHaWQaqpCRBz
         xSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LcMZKLiUPDXMEpD6ZsN+QTNJLzBAx+sHH3KFfJGyJ0=;
        b=gIJ2YAl8XU/vYHVlSWRrgq8OMEwEgEp1JY2OapOcmxFXMbyD+fMy56VCM7Bs3uhOrV
         5LSzXaW+xCxbj0kKmelbUoF4zRhzPirhAxKEjilF3wWw1qSaVG/lbhGB6wpVKVPB0WZ/
         U6axVARbt2M9tmPiw5tm3ZgD72pr+Gs/oKeio4qJHquWZ+P83K5HH6zgiLttZVFrCpNX
         4C86Xoyut8AJQEs+hl1Qidass+ezyvfKWdOe4PxmOeBbfFyGuY1RKhr8LtCJfem/57uI
         cX2bDZRnV3z9Ko/atKn3e+Nj5sRRlNdx1AxWFfSJW5VHrygktFwGAGMPjodQcE3VuKUO
         GIVw==
X-Gm-Message-State: AOAM532OQhGbI2x/9JvNHmfzErwHpkS7h3MwvQzvTts++zfOl4iYfB9q
        PAngBRDpUQyTPVnVs+v6iSs=
X-Google-Smtp-Source: ABdhPJyNLjeJUNhbcyqUseLKn/AOHETzyR0kNnjuJyNiW0lOPUD945guUsng+bjTQJfHD9zVJ5tCig==
X-Received: by 2002:ac8:13cb:: with SMTP id i11mr11094139qtj.390.1604881154657;
        Sun, 08 Nov 2020 16:19:14 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id r19sm4851517qtm.4.2020.11.08.16.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:19:13 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Abbott Liu <liuwenliang@huawei.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joe Perches <joe@perches.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Subject: [PATCH] ARM: boot: Quote aliased symbol names in string.c
Date:   Sun,  8 Nov 2020 17:17:13 -0700
Message-Id: <20201109001712.3384097-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201108222156.GA1049451@ubuntu-m3-large-x86>
References: <20201108222156.GA1049451@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Patch "treewide: Remove stringification from __alias macro definition"
causes arguments to __alias to no longer be quoted automatically, which
breaks CONFIG_KASAN on ARM after commit d6d51a96c7d6 ("ARM: 9014/2:
Replace string mem* functions for KASan"):

arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias' argument not a string
   24 | void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
      | ^~~~
arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias' argument not a string
   25 | void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
      | ^~~~
arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias' argument not a string
   26 | void *__memset(void *s, int c, size_t count) __alias(memset);
      | ^~~~
make[3]: *** [scripts/Makefile.build:283: arch/arm/boot/compressed/string.o] Error 1

Quote the names like the treewide patch does so there is no more error.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Valdis Klētnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Hi Andrew,

Stephen said I should send this along to you so that it can be applied
as part of the post -next series. Please let me know if you need any
more information or clarification, I tried to document it succinctly in
the commit message.

Cheers,
Nathan

 arch/arm/boot/compressed/string.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed/string.c
index 8c0fa276d994..cc6198f8a348 100644
--- a/arch/arm/boot/compressed/string.c
+++ b/arch/arm/boot/compressed/string.c
@@ -21,9 +21,9 @@
 #undef memcpy
 #undef memmove
 #undef memset
-void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
-void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
-void *__memset(void *s, int c, size_t count) __alias(memset);
+void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias("memcpy");
+void *__memmove(void *__dest, __const void *__src, size_t count) __alias("memmove");
+void *__memset(void *s, int c, size_t count) __alias("memset");
 #endif
 
 void *memcpy(void *__dest, __const void *__src, size_t __n)
-- 
2.29.2

