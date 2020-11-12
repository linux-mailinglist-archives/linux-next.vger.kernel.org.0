Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8305D2B0BA6
	for <lists+linux-next@lfdr.de>; Thu, 12 Nov 2020 18:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgKLRwT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 12:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgKLRwT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2020 12:52:19 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5A2C0613D1
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 09:52:19 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id z13so1232707qvs.4
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MV5o1y23M6b0t2UlHjVlNzL4uzRL01omBINxln5TdCQ=;
        b=MMfgWC4Zy6KQDFVRuppfuq4P5nBlHlt4vVEz6Tme1TGsdmsmafbdljmiU+g/x85W13
         HSMho/kP8YGtI506/BGAKE3B/+ju1VXKG5ezURDoRjzoBUi7XWf1Jj9CCNbDYS8LWSBi
         fzPHUconGbSLmEeD5C9q0vkaIvqeAPKq1Kc43dIxRuEZNx5DptpjvR0CjKJ05q7y4NZ8
         Onweg2ldWMZhbHesNv+Wtglaemn3LInkvRgS+OrKir/gBp2zU4R7IT+H2UEmublNKTzU
         iP7weuI9YMf/+aBewl5Ix7XLH/2tsB0wv5vi6khWuJ90MhEPsC4vcKMlUUkwuq4HNBSi
         nebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MV5o1y23M6b0t2UlHjVlNzL4uzRL01omBINxln5TdCQ=;
        b=dzP72+xDkNuU74zNd9L47t6sFaUwxEiQFJhtDEJ7HGBZ0MdPqJ8xEx6zLRx8rDpu/8
         WKg9IebhnqjvvmeEBP2rzPQwxlvKvCjzBnvUfvr86AVvOwkbIX42ESKrWGnYK3Ic/XKg
         rHLS4WvAatbpCe4Y236hEdcm3jZjpKx7ohqaXC/HcrwSQk3xrc4ZQGa6x+4m+xPdKwrk
         6sRWP/sDIousRBf/Fj//6JVeVFJVVvpQHcOsTcZUCDJ3IjLmPdDK4RGCgSAamaMM9Vob
         2YBXQEHGf5sxGb+J2L/UJ5lYQkgvIB4cGmLxlMzJ6AwbH5stoUm2cC7cNl2TihfXKDk/
         dJ9g==
X-Gm-Message-State: AOAM5339TChzV3phSa4fpIEPT6oDwNlSbScMHCODOQlm24qUCeQh3JYf
        W8YVfkY7QT4QF8FX0WlrDYM=
X-Google-Smtp-Source: ABdhPJxnBevAdWjFPnYT13kO9g6OzXiSBIgK0nm2il49lpkpQ1jQOyNPKGdPDhhnhV0zncnrwIy8vw==
X-Received: by 2002:a0c:bd19:: with SMTP id m25mr831736qvg.52.1605203538329;
        Thu, 12 Nov 2020 09:52:18 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id k64sm5255179qkc.97.2020.11.12.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:52:17 -0800 (PST)
Date:   Thu, 12 Nov 2020 10:52:16 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
Message-ID: <20201112175216.GB934563@ubuntu-m3-large-x86>
References: <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86>
 <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk>
 <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
 <20201109160643.GY1551@shell.armlinux.org.uk>
 <CAMj1kXFpJNFNCSShKfNTTAhJofvDYjpuQDjRaBO1cvNuEBGe+A@mail.gmail.com>
 <CACRpkdZ1PwT13-mdPBw=ATAGOifu4Rr0mxUgb7qm-gN5Ssn0mg@mail.gmail.com>
 <CAMj1kXGXPnC8k2MRxVzCtGu4X=nZ8yHg7F3NUM8S_9xMxreA9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGXPnC8k2MRxVzCtGu4X=nZ8yHg7F3NUM8S_9xMxreA9Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 12, 2020 at 04:05:52PM +0100, Ard Biesheuvel wrote:
> On Thu, 12 Nov 2020 at 14:51, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Tue, Nov 10, 2020 at 1:05 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Mon, 9 Nov 2020 at 17:07, Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Mon, Nov 09, 2020 at 05:02:09PM +0100, Linus Walleij wrote:
> > > > > On Fri, Nov 6, 2020 at 4:16 PM Russell King - ARM Linux admin
> > > > > <linux@armlinux.org.uk> wrote:
> > > > > > On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> > > > >
> > > > > > > Aha. So shall we submit this to Russell? I figure that his git will not
> > > > > > > build *without* the changes from mmotm?
> > > > > > >
> > > > > > > That tree isn't using git either is it?
> > > > > > >
> > > > > > > Is this one of those cases where we should ask Stephen R
> > > > > > > to carry this patch on top of -next until the merge window?
> > > > > >
> > > > > > Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> > > > > > until the following merge window, and queue up the non-conflicing
> > > > > > ARM KASan fixes in my "misc" branch along with the rest of KASan,
> > > > > > and the conflicting patches along with 9017/2 in the following
> > > > > > merge window.
> > > > > >
> > > > > > That means delaying KASan enablement another three months or so,
> > > > > > but should result in less headaches about how to avoid build
> > > > > > breakage with different bits going through different trees.
> > > > > >
> > > > > > Comments?
> > > > >
> > > > > I suppose I would survive deferring it. Or we could merge the
> > > > > smaller enablement patch towards the end of the merge
> > > > > window once the MM changes are in.
> > > > >
> > > > > If it is just *one* patch in the MM tree I suppose we could also
> > > > > just apply that one patch also to the ARM tree, and then this
> > > > > fixup on top. It does look a bit convoluted in the git history with
> > > > > two hashes and the same patch twice, but it's what I've done
> > > > > at times when there was no other choice that doing that or
> > > > > deferring development. It works as long as the patches are
> > > > > textually identical: git will cope.
> > > >
> > > > I thought there was a problem that if I applied the fix then my tree
> > > > no longer builds without the changes in -mm?
> > > >
> > >
> > > Indeed. Someone is changing the __alias() wrappers [for no good reason
> > > afaict] in a way that does not allow for new users of those wrappers
> > > to come in concurrently.
> > >
> > > Hency my suggestion to switch to the raw __attribute__((alias("..")))
> > > notation for the time being, and switch back to __alias() somewhere
> > > after v5.11-rc1.
> > >
> > > Or we might add this to the file in question
> > >
> > > #undef __alias
> > > #define __alias(symbol) __attribute__((__alias__(symbol)))
> > >
> > > and switch to the quoted versions of the identifier. Then we can just
> > > drop these two lines again later, after v5.11-rc1
> >
> > I was under the impression that there was some "post-next"
> > trick that mmot apply this patch after -next has been merged
> > so it's solved now?
> >
> 
> Yes, it appears that [0] has been picked up, I guess we weren't cc'ed
> on the version that was sent to akpm [which is fine btw, although a
> followup reply here that things are all good now would have been
> appreciated]
> 
> 
> https://lore.kernel.org/linux-arm-kernel/20201109001712.3384097-1-natechancellor@gmail.com/

Hi Ard,

Odd, you were on the list of people to receive that patch and you acked
it but it seems that Andrew did not CC you when he actually applied the
patch:

https://lore.kernel.org/mm-commits/20201110212436.yGYhesom8%25akpm@linux-foundation.org/

My apologies for not following up, we appear to be all good now for the
time being (aside from the futex issue that I reported earlier).

Cheers,
Nathan
