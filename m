Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDD53B2437
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 02:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFXAUw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 20:20:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:34358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhFXAUw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 20:20:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2552460FF2;
        Thu, 24 Jun 2021 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624493914;
        bh=ZJfBFi3KwT9asgMeGguDFHNB56CL9D64fcrSpqs1UDc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SqAq0u92p2Zm//ynPYWu73ivv8rtKpwuWp3WWv281V6lDA21cZrhE3JFELxUiYxt4
         rOUH7AYsvcgzbHI0+a1WnBkHzFzESC1FeQmCppYh0SQ+e560dFMRdVg3h/VeGajvRR
         7RtFe3OohZUoD/HVAXFbDFQdpjvbpjBxXWQVm2mIcISVRwVkqvIusr25bpjAOEhCrh
         FUxmVwHSxAfEtxvZfmYk/kZudeFtpVjbXi0puXNtcTgv1px6DtC3EV4OolQj1RjOUW
         o60AthFuSfqGpeiZqN5CF9QtIORndwzjHpimHkKd6x/0Z6KgX51K+v/7AkrKAiEdTu
         pumVyIyaZ+DGw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id E515B5C08D8; Wed, 23 Jun 2021 17:18:33 -0700 (PDT)
Date:   Wed, 23 Jun 2021 17:18:33 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to
 `__compiletime_assert_342'
Message-ID: <20210624001833.GR4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
 <YMtTdU2b9fI3dnFD@casper.infradead.org>
 <YMuOSnJsL9qkxweY@archlinux-ax161>
 <6f3c5317-2877-9a57-0126-e9305f000269@linux.ibm.com>
 <YM0mrZIPM+sWTDHf@Ryzen-9-3900X.localdomain>
 <CAKwvOd=w0iPT_LLHQ48Mq3XCZcW9dZNRTpq+0OyVEjsg-VRXOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=w0iPT_LLHQ48Mq3XCZcW9dZNRTpq+0OyVEjsg-VRXOw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 23, 2021 at 04:39:56PM -0700, Nick Desaulniers wrote:
> An additional report:
> https://lore.kernel.org/lkml/20210623223015.GA315292@paulmck-ThinkPad-P17-Gen-1/
> EOM
> 
> On Fri, Jun 18, 2021 at 4:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Fri, Jun 18, 2021 at 10:32:42AM +0530, Aneesh Kumar K.V wrote:
> > > On 6/17/21 11:32 PM, Nathan Chancellor wrote:
> > > > Rebuilt the CC list because most people were added based on the
> > > > incorrect bisect result.
> > > >
> > > > On Thu, Jun 17, 2021 at 02:51:49PM +0100, Matthew Wilcox wrote:
> > > > > On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
> > > > > > On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > > > > x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> > > > > > > mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
> > > > > >
> > > > > > The git bisect pointed out the first bad commit.
> > > > > >
> > > > > > The first bad commit:
> > > > > > commit 928cf6adc7d60c96eca760c05c1000cda061604e
> > > > > > Author: Stephen Boyd <swboyd@chromium.org>
> > > > > > Date:   Thu Jun 17 15:21:35 2021 +1000
> > > > > >      module: add printk formats to add module build ID to stacktraces
> > > > >
> > > > > Your git bisect probably went astray.  There's no way that commit
> > > > > caused that regression.
> > > >
> > > > My bisect landed on commit 83f85ac75855 ("mm/mremap: convert huge PUD
> > > > move to separate helper"). flush_pud_tlb_range() evaluates to
> > > > BUILD_BUG() when CONFIG_TRANSPARENT_HUGEPAGE is unset but this function
> > > > is present just based on the value of
> > > > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> > > >
> > > > $ make -skj(nproc) ARCH=x86_64 CC=clang O=build/x86_64 distclean allnoconfig mm/mremap.o
> > > >
> > > > $ llvm-readelf -s build/x86_64/mm/mremap.o &| rg __compiletime_assert
> > > >      21: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT   UND __compiletime_assert_337
> > > >
> > > > $ rg TRANSPARENT_ build/x86_64/.config
> > > > 450:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> > > > 451:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
> > > > 562:# CONFIG_TRANSPARENT_HUGEPAGE is not set
> > > >
> > > > Not sure why this does not happen on newer clang versions, presumably
> > > > something with inlining decisions? Still seems like a legitimate issue
> > > > to me.
> > > >
> > >
> > > gcc 10 also doesn't give a build error. I guess that is because we evaluate
> > >
> > >      if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {
> > >
> > >  to if (0) with CONFIG_TRANSPARENT_HUGEPAGE disabled.
> > >
> > > switching that to if (1) do results in BUILD_BUG triggering.
> >
> > Thanks for pointing that out. I think what happens with clang-10 and
> > clang-11 is that move_huge_pud() gets inlined into move_pgt_entry() but
> > then the compiler does not figure out that the HPAGE_PUD case is dead so
> > the code sticks around, where as GCC and newer clang versions can figure
> > that out and eliminate that case.
> >
> > > Should we fix this ?
> >
> > Yes, I believe that we should.
> >
> > > modified   mm/mremap.c
> > > @@ -336,7 +336,7 @@ static inline bool move_normal_pud(struct vm_area_struct
> > > *vma,
> > >  }
> > >  #endif
> > >
> > > -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > > +#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
> > > defined(CONFIG_TRANSPARENT_HUGEPAGE)
> > >  static bool move_huge_pud(struct vm_area_struct *vma, unsigned long
> > > old_addr,
> > >                         unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
> > >  {

Making the above change does the trick for my repeat-by, thank you!

> > That works or we could mirror what has already been done for the
> > HPAGE_PMD case. No personal preference.
> >
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 9a7fbec31dc9..5989d3990020 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -460,7 +460,8 @@ static bool move_pgt_entry(enum pgt_entry entry, struct vm_area_struct *vma,
> >                                       new_entry);
> >                 break;
> >         case HPAGE_PUD:
> > -               moved = move_huge_pud(vma, old_addr, new_addr, old_entry,
> > +               moved = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> > +                       move_huge_pud(vma, old_addr, new_addr, old_entry,
> >                                       new_entry);
> >                 break;

This one is already in -next, but you knew that already.  I am happy to
test the resulting patch, when and if.

						Thanx, Paul
