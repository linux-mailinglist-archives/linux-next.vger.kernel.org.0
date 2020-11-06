Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B372A9BA3
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 19:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgKFSJc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 13:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727812AbgKFSJc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 13:09:32 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B89C0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 10:09:32 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id g17so1395282qts.5
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 10:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xthdb0sB+nBkUrNgfEbY4fZLBO1/mKnLmjZCET3QDvM=;
        b=O88uSA+pp+wnNHXd1L6+BaP369KYxI1ylNhjSYsjk6Tx+qrZWWBV8q/Nk5ekbOS8uF
         7ciLey03KSdT7DJ4GDoBu+l2XkewwNpqaw8TAn4QzLBu5/fZ2a83g0+zc1m2/7P7CWSq
         RkWZPvMxeiLjT9wFrVQUfRLJbMspkDtrmv5h2/eIIR7gXjgANttZtoVs85xzQbvi2RQz
         AUzIuMmL4KT52NPCuGWGmRdd0krfmlypmlJI51ScJqa5TZCiZFO3O04637FFrVHAnMGN
         KcTKQ+S1xqK+YK/8sQ2IJL78f/bx7vshje/aHDPfU4M1Krbs4SL9yqS0G3h2K0vICvKU
         nhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xthdb0sB+nBkUrNgfEbY4fZLBO1/mKnLmjZCET3QDvM=;
        b=q3OUrGKPLRNE6A6tRwoOg/3l3ENWGEjzHnnMgDuVx0F1kYdW9gNPjYneYSYBF2iU4a
         M844Ooy+RodQl+HERz0fWdlb2TjUdmQBTk9f8roBFW9RTIksgdQFZVx/oCKWUemz8Qai
         0kRLIxjdxInRpAx8XwV242LMSk5e9naFEaHfwxqD7XKVi02HfDbAI1zIzX6DXNtpJ8JV
         bdu1GNIkF4T8ZgDLDVuNn9Dls/43nP3LkqIWnhtd4g81rBZTmrDvEeOzTK/0wdcOnhaV
         loTndMLkcOcKVTVGvH3oe1SgJlH73NQwhJD41XptY+cbdNRPGTb974dqWFqz+WJcrsck
         sQHQ==
X-Gm-Message-State: AOAM530KnXLxYmZff9bmFnGPRKcDE7syl6Z3xs2Qw4d0Nvk+j7ld0OfN
        BPPZ85WZN8QYQIi964pJPv0=
X-Google-Smtp-Source: ABdhPJy/Y+6whoSViluhA3jbaewBq1iXBrn7f4S1sA1vE26Ctd28vMW0KfzLn98A+1+5qnQWuE2qtQ==
X-Received: by 2002:aed:32c7:: with SMTP id z65mr2713718qtd.266.1604686171309;
        Fri, 06 Nov 2020 10:09:31 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id p8sm1067648qtc.37.2020.11.06.10.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 10:09:30 -0800 (PST)
Date:   Fri, 6 Nov 2020 11:09:29 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
Message-ID: <20201106180929.GD2959494@ubuntu-m3-large-x86>
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org>
 <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86>
 <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106151554.GU1551@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 06, 2020 at 03:15:54PM +0000, Russell King - ARM Linux admin wrote:
> On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> > On Fri, Nov 6, 2020 at 10:44 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > > On Fri, Nov 06, 2020 at 09:28:09AM +0100, Ard Biesheuvel wrote:
> > 
> > > > AFAIK there is an incompatible change in -next to change the
> > > > definition of the __alias() macro
> > >
> > > Indeed. The following diff needs to be applied as a fixup to
> > > treewide-remove-stringification-from-__alias-macro-definition.patch in
> > > mmotm.
> > >
> > > Cheers,
> > > Nathan
> > >
> > > diff --git a/arch/arm/boot/compressed/string.c b/arch/arm/boot/compressed/string.c
> > > index 8c0fa276d994..cc6198f8a348 100644
> > > --- a/arch/arm/boot/compressed/string.c
> > > +++ b/arch/arm/boot/compressed/string.c
> > > @@ -21,9 +21,9 @@
> > >  #undef memcpy
> > >  #undef memmove
> > >  #undef memset
> > > -void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
> > > -void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
> > > -void *__memset(void *s, int c, size_t count) __alias(memset);
> > > +void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias("memcpy");
> > > +void *__memmove(void *__dest, __const void *__src, size_t count) __alias("memmove");
> > > +void *__memset(void *s, int c, size_t count) __alias("memset");
> > >  #endif
> > >
> > >  void *memcpy(void *__dest, __const void *__src, size_t __n)
> > 
> > Aha. So shall we submit this to Russell? I figure that his git will not
> > build *without* the changes from mmotm?

Yeah, I do not think that you can apply that diff to Russell's tree
without the patch from -mm.

> > That tree isn't using git either is it?
> > 
> > Is this one of those cases where we should ask Stephen R
> > to carry this patch on top of -next until the merge window?

I believe so, I do not think Stephen has any issues with carrying that
diff to keep everything building properly (although I won't speak for
him heh).

> Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> until the following merge window, and queue up the non-conflicing
> ARM KASan fixes in my "misc" branch along with the rest of KASan,
> and the conflicting patches along with 9017/2 in the following
> merge window.
> 
> That means delaying KASan enablement another three months or so,
> but should result in less headaches about how to avoid build
> breakage with different bits going through different trees.
> 
> Comments?

That could certainly work but as far as I am aware, that is really the
only breakage. In theory, Andrew could just hold off on sending that
patch until after yours is merged into Linus' tree so that it could be
added to that patch and everything stays building properly. Requires a
minor amount of coordination but that would avoid delaying KASAN
enablement for three months. I do not have any preference since this is
not my code.

Cheers,
Nathan
