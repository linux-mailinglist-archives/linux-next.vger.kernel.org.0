Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB9B2B48F7
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 16:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730310AbgKPPRN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 10:17:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:47008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730179AbgKPPRN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 10:17:13 -0500
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9CDE20DD4
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605539832;
        bh=e1HQYiwm1KTWlMXlYVtIGSInMYW1f6CbIyrdNrjQM1w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DYCEsQqUHzypvuDoA3QH7/BpgCDEHRRR/lYHnhV1dGmhHV/kdsGrAQGNNRNXRhlSv
         NcBq+tXRJOLuTyVPzVoszOmgCdyVsjj47rdHRStaCqxMlvDty0Mwpibz/p31QVLu3K
         fHp6j0JaKqb9k5RyvhpNrzj56TjbbIwL28F50aqM=
Received: by mail-oi1-f176.google.com with SMTP id f11so5446272oij.6
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 07:17:12 -0800 (PST)
X-Gm-Message-State: AOAM531zMx0b4EwksKpplMDIzlcv14VyLGubwjsYbBQadXRHnodikXIF
        9SpRxHLwE9oxJCVOQVB7jXrA3cEYrSTx/sQPl9o=
X-Google-Smtp-Source: ABdhPJzIX9uSkSBDpa98QYmM1gkjMrN5Kf2eL2O4I4ozWhXuuZLyCBicuVQCTGVMuUz86HI7IczZAmNX4pNOi4o7Ozk=
X-Received: by 2002:aca:c60c:: with SMTP id w12mr10610302oif.174.1605539832094;
 Mon, 16 Nov 2020 07:17:12 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdZL7=0U6ns3tV972si-fLu3F_A6GbaPcCa9=m28KFZK0w@mail.gmail.com>
 <CAMj1kXFTbPL6J+p7LucwP-+eJhk7aeFFjhJdLW_ktRX=KiaoWQ@mail.gmail.com>
 <20201106094434.GA3268933@ubuntu-m3-large-x86> <CACRpkdaBnLsQB-b8fYaXGV=_i2y7pyEaVX=8pCAdjPEVHtqV4Q@mail.gmail.com>
 <20201106151554.GU1551@shell.armlinux.org.uk> <CACRpkdaaDMCmYsEptrcQdngqFW6E+Y0gWEZHfKQdUqgw7hiX1Q@mail.gmail.com>
 <20201109160643.GY1551@shell.armlinux.org.uk> <CAMj1kXFpJNFNCSShKfNTTAhJofvDYjpuQDjRaBO1cvNuEBGe+A@mail.gmail.com>
 <CACRpkdZ1PwT13-mdPBw=ATAGOifu4Rr0mxUgb7qm-gN5Ssn0mg@mail.gmail.com>
 <CAMj1kXGXPnC8k2MRxVzCtGu4X=nZ8yHg7F3NUM8S_9xMxreA9Q@mail.gmail.com> <20201112175216.GB934563@ubuntu-m3-large-x86>
In-Reply-To: <20201112175216.GB934563@ubuntu-m3-large-x86>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 16 Nov 2020 16:16:58 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGjw4-a-Qsh6W8Kp8RaLGU3LXq-VU6paZ5EucJJuP0ScQ@mail.gmail.com>
Message-ID: <CAMj1kXGjw4-a-Qsh6W8Kp8RaLGU3LXq-VU6paZ5EucJJuP0ScQ@mail.gmail.com>
Subject: Re: [PATCH 2/5 v16] ARM: Replace string mem* functions for KASan
To:     Nathan Chancellor <natechancellor@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 12 Nov 2020 at 18:52, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 04:05:52PM +0100, Ard Biesheuvel wrote:
> > On Thu, 12 Nov 2020 at 14:51, Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Tue, Nov 10, 2020 at 1:05 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > On Mon, 9 Nov 2020 at 17:07, Russell King - ARM Linux admin
> > > > <linux@armlinux.org.uk> wrote:
> > > > >
> > > > > On Mon, Nov 09, 2020 at 05:02:09PM +0100, Linus Walleij wrote:
> > > > > > On Fri, Nov 6, 2020 at 4:16 PM Russell King - ARM Linux admin
> > > > > > <linux@armlinux.org.uk> wrote:
> > > > > > > On Fri, Nov 06, 2020 at 02:37:21PM +0100, Linus Walleij wrote:
> > > > > >
> > > > > > > > Aha. So shall we submit this to Russell? I figure that his git will not
> > > > > > > > build *without* the changes from mmotm?
> > > > > > > >
> > > > > > > > That tree isn't using git either is it?
> > > > > > > >
> > > > > > > > Is this one of those cases where we should ask Stephen R
> > > > > > > > to carry this patch on top of -next until the merge window?
> > > > > > >
> > > > > > > Another solution would be to drop 9017/2 ("Enable KASan for ARM")
> > > > > > > until the following merge window, and queue up the non-conflicing
> > > > > > > ARM KASan fixes in my "misc" branch along with the rest of KASan,
> > > > > > > and the conflicting patches along with 9017/2 in the following
> > > > > > > merge window.
> > > > > > >
> > > > > > > That means delaying KASan enablement another three months or so,
> > > > > > > but should result in less headaches about how to avoid build
> > > > > > > breakage with different bits going through different trees.
> > > > > > >
> > > > > > > Comments?
> > > > > >
> > > > > > I suppose I would survive deferring it. Or we could merge the
> > > > > > smaller enablement patch towards the end of the merge
> > > > > > window once the MM changes are in.
> > > > > >
> > > > > > If it is just *one* patch in the MM tree I suppose we could also
> > > > > > just apply that one patch also to the ARM tree, and then this
> > > > > > fixup on top. It does look a bit convoluted in the git history with
> > > > > > two hashes and the same patch twice, but it's what I've done
> > > > > > at times when there was no other choice that doing that or
> > > > > > deferring development. It works as long as the patches are
> > > > > > textually identical: git will cope.
> > > > >
> > > > > I thought there was a problem that if I applied the fix then my tree
> > > > > no longer builds without the changes in -mm?
> > > > >
> > > >
> > > > Indeed. Someone is changing the __alias() wrappers [for no good reason
> > > > afaict] in a way that does not allow for new users of those wrappers
> > > > to come in concurrently.
> > > >
> > > > Hency my suggestion to switch to the raw __attribute__((alias("..")))
> > > > notation for the time being, and switch back to __alias() somewhere
> > > > after v5.11-rc1.
> > > >
> > > > Or we might add this to the file in question
> > > >
> > > > #undef __alias
> > > > #define __alias(symbol) __attribute__((__alias__(symbol)))
> > > >
> > > > and switch to the quoted versions of the identifier. Then we can just
> > > > drop these two lines again later, after v5.11-rc1
> > >
> > > I was under the impression that there was some "post-next"
> > > trick that mmot apply this patch after -next has been merged
> > > so it's solved now?
> > >
> >
> > Yes, it appears that [0] has been picked up, I guess we weren't cc'ed
> > on the version that was sent to akpm [which is fine btw, although a
> > followup reply here that things are all good now would have been
> > appreciated]
> >
> >
> > https://lore.kernel.org/linux-arm-kernel/20201109001712.3384097-1-natechancellor@gmail.com/
>
> Hi Ard,
>
> Odd, you were on the list of people to receive that patch and you acked
> it but it seems that Andrew did not CC you when he actually applied the
> patch:
>
> https://lore.kernel.org/mm-commits/20201110212436.yGYhesom8%25akpm@linux-foundation.org/
>
> My apologies for not following up, we appear to be all good now for the
> time being (aside from the futex issue that I reported earlier).
>

No worries - at least it is fixed now. And KASAN is already shaking
out bugs, so it is great that we finally managed to enable this for
ARM.
