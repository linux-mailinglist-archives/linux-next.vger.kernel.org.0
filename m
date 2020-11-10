Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DB22AD5D8
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 13:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKJMFL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 07:05:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgKJMFL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Nov 2020 07:05:11 -0500
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D44F207BB
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605009910;
        bh=NjacH6bkcOERzYDNFL45MT7Ds4rqSNazlK8WgXpbazs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gzwnYvaiL8Hiu4yUfeLiaAQkp+6mfwgzNU5izEJVYn2kyUBV/B7ghEpmqurfQEFld
         yHXYB9ZIKG3Ww/yNa+J9mcCJT5cR4AfmHKFedUHFYOE5aCPR6emsxLH4HIlqYXd1qz
         klUtDLq9NKVogPjiAvjKAWg/XcAay81DqiudM24k=
Received: by mail-oi1-f172.google.com with SMTP id t16so14002937oie.11
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 04:05:10 -0800 (PST)
X-Gm-Message-State: AOAM530MthWo37nOlgdKDmOdto4wc+HhHqaKcM5U4gAy2JUpyhRaxwsu
        9qFs2xYleON0kBhd7jP//lcaVkY9Lh39DDPKqqA=
X-Google-Smtp-Source: ABdhPJzSceMQUItQANolUTBd7Qkg1uc6HvQKnyle/28wSk5luTfJN+WxQ73JYHADIEnY2mfDP3qUOBnEPBfO2aM7Yb4=
X-Received: by 2002:aca:d583:: with SMTP id m125mr2309350oig.47.1605009909177;
 Tue, 10 Nov 2020 04:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20201019084140.4532-1-linus.walleij@linaro.org>
 <20201019084140.4532-3-linus.walleij@linaro.org> <CA+G9fYvfL8QqFkNDK69KBBnougtJb5dj6LTy=xmhBz33fjssgQ@mail.gmail.com>
 <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86> <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk> <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
 <20201109160643.GY1551@shell.armlinux.org.uk>
In-Reply-To: <20201109160643.GY1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 10 Nov 2020 13:04:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFpJNFNCSShKfNTTAhJofvDYjpuQDjRaBO1cvNuEBGe+A@mail.gmail.com>
Message-ID: <CAMj1kXFpJNFNCSShKfNTTAhJofvDYjpuQDjRaBO1cvNuEBGe+A@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Mon, 9 Nov 2020 at 17:07, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Mon, Nov 09, 2020 at 05:02:09PM +0100, Linus Walleij wrote:
> > On Fri, Nov 6, 2020 at 4:16 PM Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> >
> > > > Aha. So shall we submit this to Russell? I figure that his git will not
> > > > build *without* the changes from mmotm?
> > > >
> > > > That tree isn't using git either is it?
> > > >
> > > > Is this one of those cases where we should ask Stephen R
> > > > to carry this patch on top of -next until the merge window?
> > >
> > > Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> > > until the following merge window, and queue up the non-conflicing
> > > ARM KASan fixes in my "misc" branch along with the rest of KASan,
> > > and the conflicting patches along with 9017/2 in the following
> > > merge window.
> > >
> > > That means delaying KASan enablement another three months or so,
> > > but should result in less headaches about how to avoid build
> > > breakage with different bits going through different trees.
> > >
> > > Comments?
> >
> > I suppose I would survive deferring it. Or we could merge the
> > smaller enablement patch towards the end of the merge
> > window once the MM changes are in.
> >
> > If it is just *one* patch in the MM tree I suppose we could also
> > just apply that one patch also to the ARM tree, and then this
> > fixup on top. It does look a bit convoluted in the git history with
> > two hashes and the same patch twice, but it's what I've done
> > at times when there was no other choice that doing that or
> > deferring development. It works as long as the patches are
> > textually identical: git will cope.
>
> I thought there was a problem that if I applied the fix then my tree
> no longer builds without the changes in -mm?
>

Indeed. Someone is changing the __alias() wrappers [for no good reason
afaict] in a way that does not allow for new users of those wrappers
to come in concurrently.

Hency my suggestion to switch to the raw __attribute__((alias("..")))
notation for the time being, and switch back to __alias() somewhere
after v5.11-rc1.

Or we might add this to the file in question

#undef __alias
#define __alias(symbol) __attribute__((__alias__(symbol)))

and switch to the quoted versions of the identifier. Then we can just
drop these two lines again later, after v5.11-rc1
