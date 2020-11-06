Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038132A9308
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 10:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgKFJoj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 04:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFJoi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 04:44:38 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AABFC0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 01:44:38 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id o11so811718ioo.11
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 01:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kKXmeFK4IT0iUDxEvASZoWTF63u7wMJJ7vCAA7uoI5w=;
        b=tJ/08p9Bp5If8OPmIlMsLxShek2Rd3cEB79sXWLGNzaA3L8AXpDxU+xV8Aw4TBwV+5
         I+Mk1d1QO9zKAMwb7guSbtwBJbsGBseBX2+u3NMaa9uwRm2NRnwsndCmzt24tjmmkCvG
         O14WgRMIwuIxNDogIfm+oCW2F0WpW0Bx0tjRW03EJ2syyj1qGW8RUSoAysNcTZ7S/YvE
         YvpKBoWjsFCjDL8Qy/hcSygSVJF05pB0JCq8CpxpatBDpQnrg0x/NMWe9Op84L+vd9de
         Z50Zv4MM6E7sTjLgxJDHOgx1v9zGUbhPEochlP53BMMWoDc0SByLIOQl2ONd0WoylC73
         NXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kKXmeFK4IT0iUDxEvASZoWTF63u7wMJJ7vCAA7uoI5w=;
        b=iZc7kFVfBtTrU/tzfnjexQD9agkeBVdHddF4yqI/sSqyGggggGIA3TGhBkcxuiOQpm
         x/tzCy5Kle50n11PzVLKY/7p9fiUixC4Se1aDQkBRr3rxHR76v4JFXiBfo054kJAFOC3
         jIApZS70IjFRd4ukDTMZ/gmUvZlKA6XlpMiwCpCzSc4RYStgKIe4EXKgp6s7StZeaEGh
         1hzA3qnlJtQGN06ZJG/epX6dG0Oz/cJR6oqZ5MoQhYY+xyI3LTRyvKmkpJpT8ShRhRpD
         GpOZRtqLE8d9nS44YCT3r+4fZF0/ULR3kLiQD62yFmnP1zmGyqqrWR/923fGQtSzQp3A
         1G+g==
X-Gm-Message-State: AOAM533ucOjsrTFZ65PYz57ivkEYuPSHYuniGZOKtdmx5Z1aa9R8zlFh
        9Kgk+VuDdsjlXDxfRiWKd9i2PQMSKlJiFg==
X-Google-Smtp-Source: ABdhPJyq/7bnDoHfJY+eHTgGntwyNB00YWedJD95DZ6Xpx8xtF90aa+TO80FgGvISHa2QQCsmbipNQ==
X-Received: by 2002:a5e:8916:: with SMTP id k22mr826518ioj.6.1604655877579;
        Fri, 06 Nov 2020 01:44:37 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id r4sm694366ilj.43.2020.11.06.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 01:44:36 -0800 (PST)
Date:   Fri, 6 Nov 2020 02:44:34 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Alexander Potapenko <glider@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
Message-ID: <20201106094434.GA3268933@ubuntu-m3-large-x86>
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org>
 <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 06, 2020 at 09:28:09AM +0100, Ard Biesheuvel wrote:
> On Fri, 6 Nov 2020 at 09:26, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Fri, Nov 6, 2020 at 8:49 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > > arm KASAN build failure noticed on linux next 20201106 tag.
> > > gcc: 9.x
> > >
> > > Build error:
> > > ---------------
> > > arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias'
> > > argument not a string
> > >    24 | void *__memcpy(void *__dest, __const void *__src, size_t __n)
> > > __alias(memcpy);
> > >       | ^~~~
> > > arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias'
> > > argument not a string
> > >    25 | void *__memmove(void *__dest, __const void *__src, size_t
> > > count) __alias(memmove);
> > >       | ^~~~
> > > arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias'
> > > argument not a string
> > >    26 | void *__memset(void *s, int c, size_t count) __alias(memset);
> > >       | ^~~~
> > >
> > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > >
> > > Build details link,
> > > https://builds.tuxbuild.com/1juBs4tXRA6Cwhd1Qnhh4vzCtDx/
> >
> > This looks like a randconfig build.
> >
> > Please drill down and try to report which combination of config
> > options that give rise to this problem so we have a chance of
> > amending it.
> >
> 
> AFAIK there is an incompatible change in -next to change the
> definition of the __alias() macro

Indeed. The following diff needs to be applied as a fixup to
treewide-remove-stringification-from-__alias-macro-definition.patch in
mmotm.

Cheers,
Nathan

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
