Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CDA2B0706
	for <lists+linux-next@lfdr.de>; Thu, 12 Nov 2020 14:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgKLNvr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 08:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgKLNvq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2020 08:51:46 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841DBC0613D1
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 05:51:45 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id s9so6195912ljo.11
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t8cfrsKjQnUN/OsiactPd1ob2JZxW02VqUHHoZOWl6g=;
        b=cYCXhCMhENfDcRgxRkTCMmAXT5WYOIvAFRH/Wky2L+BBKUCgm0qkcteohQVavwzkr/
         Igbw3ZWOEOBqGZtL7cOcgUaVFKAslXhBD3uGLoEuiVRuE5JMO1Hmd1IMTbPpqn1Hol4G
         eWHH4ficXjNhPNfoKZFyyl7BsB9zlk6HjRs5WTy2q/fCXcj7xjyfjyRRSZM+kSBAYqou
         0wDc5xZrTYN580sCTyOss6TQEOwL61KALnB2zQ9NaAvoToAoXMoTAl4Rsecw85TEmFql
         rMSSxwiIPRT5ZLRUmO9FEhab/rW5whF2U58nhyaH5tzXA57ejddRQ5L/P4Q86oM+ORsG
         74cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t8cfrsKjQnUN/OsiactPd1ob2JZxW02VqUHHoZOWl6g=;
        b=sixJgfM6x0QklZG5Df79s1CQnajxT/3XQOBq7ASF8tWCMBMLmP9WBpEruTu+yaWrVx
         Akeh1NR9nhuo1h9z8HS30EY9a3XI97WR4fW/fcDe3Xmr98FHA3Yq6eWrfmxpO8BZlOBP
         hDxB4UDXYEBuxDMP4k/LtU5BjqQJU9qHWNnuOdOJe336kDQEo4zRX7JWTwRmJk0Nu37l
         CM1LvqhijS9xzGK6PGp1AgUAvoPMD++zoC73mXMtW7esWMvjrifPhCo+kVr4kiPoS1Vk
         4gZOG009O3usM3Le5PAeVsCUr7Pm6QUbRHLv1aLyiPAMteWR3uGSA6heStSUdWlXMpsy
         04lg==
X-Gm-Message-State: AOAM533i5tgF9E3KMxqGtBF3USZZwIaDHZtdhBPojHwaUtugtvJo8cfB
        +y8Z2xiENQ/dZBSsAjGU5+Jmp1cS4IUhyQ1ZRMcZgw==
X-Google-Smtp-Source: ABdhPJzsVckplrCPcXclwMujD9lYOZC4HyoGw7s7kA42dLjTTv0cslT9R6Bg2T/0q1HYF7alQXt7Y8moNGiwN4KaXuk=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr3305815ljy.293.1605189103738;
 Thu, 12 Nov 2020 05:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86> <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk> <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
 <20201109160643.GY1551@shell.armlinux.org.uk> <CAMj1kXFpJNFNCSShKfNTTAhJofvDYjpuQDjRaBO1cvNuEBGe+A@mail.gmail.com>
In-Reply-To: <CAMj1kXFpJNFNCSShKfNTTAhJofvDYjpuQDjRaBO1cvNuEBGe+A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Nov 2020 14:51:32 +0100
Message-ID: <CACRpkdZ1PwT13-mdPBw=ATAGOifu4Rr0mxUgb7qm-gN5Ssn0mg@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Nathan Chancellor <natechancellor@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 10, 2020 at 1:05 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Mon, 9 Nov 2020 at 17:07, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Nov 09, 2020 at 05:02:09PM +0100, Linus Walleij wrote:
> > > On Fri, Nov 6, 2020 at 4:16 PM Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > > On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> > >
> > > > > Aha. So shall we submit this to Russell? I figure that his git will not
> > > > > build *without* the changes from mmotm?
> > > > >
> > > > > That tree isn't using git either is it?
> > > > >
> > > > > Is this one of those cases where we should ask Stephen R
> > > > > to carry this patch on top of -next until the merge window?
> > > >
> > > > Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> > > > until the following merge window, and queue up the non-conflicing
> > > > ARM KASan fixes in my "misc" branch along with the rest of KASan,
> > > > and the conflicting patches along with 9017/2 in the following
> > > > merge window.
> > > >
> > > > That means delaying KASan enablement another three months or so,
> > > > but should result in less headaches about how to avoid build
> > > > breakage with different bits going through different trees.
> > > >
> > > > Comments?
> > >
> > > I suppose I would survive deferring it. Or we could merge the
> > > smaller enablement patch towards the end of the merge
> > > window once the MM changes are in.
> > >
> > > If it is just *one* patch in the MM tree I suppose we could also
> > > just apply that one patch also to the ARM tree, and then this
> > > fixup on top. It does look a bit convoluted in the git history with
> > > two hashes and the same patch twice, but it's what I've done
> > > at times when there was no other choice that doing that or
> > > deferring development. It works as long as the patches are
> > > textually identical: git will cope.
> >
> > I thought there was a problem that if I applied the fix then my tree
> > no longer builds without the changes in -mm?
> >
>
> Indeed. Someone is changing the __alias() wrappers [for no good reason
> afaict] in a way that does not allow for new users of those wrappers
> to come in concurrently.
>
> Hency my suggestion to switch to the raw __attribute__((alias("..")))
> notation for the time being, and switch back to __alias() somewhere
> after v5.11-rc1.
>
> Or we might add this to the file in question
>
> #undef __alias
> #define __alias(symbol) __attribute__((__alias__(symbol)))
>
> and switch to the quoted versions of the identifier. Then we can just
> drop these two lines again later, after v5.11-rc1

I was under the impression that there was some "post-next"
trick that mmot apply this patch after -next has been merged
so it's solved now?

Yours,
Linus Walleij
