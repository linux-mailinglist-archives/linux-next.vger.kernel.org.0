Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47AAC3B2407
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 01:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhFWXma (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 19:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhFWXm3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 19:42:29 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D22C061756
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 16:40:11 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id d25so5214928lji.7
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m22T5sLi5MlC7izMU83G6XELshO1TaCPD5d1ECbMfac=;
        b=kYlOcxydYne7K3UofWUlouyNMEFl8Ul06Flm3MVhkhmJfe8bLDR4bHZD4KvVWkBIgY
         qc7E/sbFvHltDrrnGBn2x3sRPKJdT9KHVxas98fbgfi819yGP1WrsW4XoNjKrtPmR95k
         rJQjQI5F69ZukAtJI9FbH5wpS0KsBHnMhBO0WtuK0v8nXQF1tslMUK3qwlyuFtWCuNnD
         nX4JA1CGHRfrzv0fqmwVktpzPHfGivDVn3xnRoODT0pOIm82K0BJru6bzzmSZbpigUBA
         MbjYbgrN4PuClJvu7Szn/WhFGiUSxOXCc3JPiQNbgrnRUQK3fbOSMfYmUvhY1hnEa7Qd
         CHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m22T5sLi5MlC7izMU83G6XELshO1TaCPD5d1ECbMfac=;
        b=uQ/QmCrpBeeqP1qODYwg59pr1IN3bCXqbyCYTR1sXdGA25wMkYzqBStcSMdjKW2yct
         hDWGYtxM+Cv/KlDzOTic87+fLdr/6y+79y+BbexsBWLUO57l7XVuRcRHfu+nTAX0HtDJ
         Ehy33+GtXsiE956vSxJNID7OmjaZBnXGvMRHywdBRSXYbO6NR59Akf0s+aCr0Rk2DDK9
         +V6vWdqdpQDec/FjtdlyUScKEyT28dYxw6fAh6pI4KVdK5KcpLzhkNsKQC5dDxglmKf3
         8PgSoeuiCpNWuowdWoL42cRKu0Xvmuee3CZzfQJGYZ+2S9CaC5L9S9U60qBsGtsgdigJ
         CRQg==
X-Gm-Message-State: AOAM530tt05YNipHTR/tvVnqfge4JM2nKlh5TzWcL8pcjrETcvxEhho+
        Fs7k+PeOSllloCFLt1HRS9OhCuSCnfClxa6gWnxEyg==
X-Google-Smtp-Source: ABdhPJzOF4Ju7gn+qrrFwHzrEs5fB36HGogB9jife7y/otPbrov9r4mj4mrsoTx3PREkTDMDLa3Qw1NKN87uyvS8OPo=
X-Received: by 2002:a2e:a492:: with SMTP id h18mr1567944lji.495.1624491609801;
 Wed, 23 Jun 2021 16:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
 <YMtTdU2b9fI3dnFD@casper.infradead.org> <YMuOSnJsL9qkxweY@archlinux-ax161>
 <6f3c5317-2877-9a57-0126-e9305f000269@linux.ibm.com> <YM0mrZIPM+sWTDHf@Ryzen-9-3900X.localdomain>
In-Reply-To: <YM0mrZIPM+sWTDHf@Ryzen-9-3900X.localdomain>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 23 Jun 2021 16:39:56 -0700
Message-ID: <CAKwvOd=w0iPT_LLHQ48Mq3XCZcW9dZNRTpq+0OyVEjsg-VRXOw@mail.gmail.com>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

An additional report:
https://lore.kernel.org/lkml/20210623223015.GA315292@paulmck-ThinkPad-P17-Gen-1/
EOM

On Fri, Jun 18, 2021 at 4:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Jun 18, 2021 at 10:32:42AM +0530, Aneesh Kumar K.V wrote:
> > On 6/17/21 11:32 PM, Nathan Chancellor wrote:
> > > Rebuilt the CC list because most people were added based on the
> > > incorrect bisect result.
> > >
> > > On Thu, Jun 17, 2021 at 02:51:49PM +0100, Matthew Wilcox wrote:
> > > > On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
> > > > > On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > > > x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> > > > > > mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
> > > > >
> > > > > The git bisect pointed out the first bad commit.
> > > > >
> > > > > The first bad commit:
> > > > > commit 928cf6adc7d60c96eca760c05c1000cda061604e
> > > > > Author: Stephen Boyd <swboyd@chromium.org>
> > > > > Date:   Thu Jun 17 15:21:35 2021 +1000
> > > > >      module: add printk formats to add module build ID to stacktraces
> > > >
> > > > Your git bisect probably went astray.  There's no way that commit
> > > > caused that regression.
> > >
> > > My bisect landed on commit 83f85ac75855 ("mm/mremap: convert huge PUD
> > > move to separate helper"). flush_pud_tlb_range() evaluates to
> > > BUILD_BUG() when CONFIG_TRANSPARENT_HUGEPAGE is unset but this function
> > > is present just based on the value of
> > > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> > >
> > > $ make -skj(nproc) ARCH=x86_64 CC=clang O=build/x86_64 distclean allnoconfig mm/mremap.o
> > >
> > > $ llvm-readelf -s build/x86_64/mm/mremap.o &| rg __compiletime_assert
> > >      21: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT   UND __compiletime_assert_337
> > >
> > > $ rg TRANSPARENT_ build/x86_64/.config
> > > 450:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> > > 451:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
> > > 562:# CONFIG_TRANSPARENT_HUGEPAGE is not set
> > >
> > > Not sure why this does not happen on newer clang versions, presumably
> > > something with inlining decisions? Still seems like a legitimate issue
> > > to me.
> > >
> >
> > gcc 10 also doesn't give a build error. I guess that is because we evaluate
> >
> >      if (pud_trans_huge(*old_pud) || pud_devmap(*old_pud)) {
> >
> >  to if (0) with CONFIG_TRANSPARENT_HUGEPAGE disabled.
> >
> > switching that to if (1) do results in BUILD_BUG triggering.
>
> Thanks for pointing that out. I think what happens with clang-10 and
> clang-11 is that move_huge_pud() gets inlined into move_pgt_entry() but
> then the compiler does not figure out that the HPAGE_PUD case is dead so
> the code sticks around, where as GCC and newer clang versions can figure
> that out and eliminate that case.
>
> > Should we fix this ?
>
> Yes, I believe that we should.
>
> > modified   mm/mremap.c
> > @@ -336,7 +336,7 @@ static inline bool move_normal_pud(struct vm_area_struct
> > *vma,
> >  }
> >  #endif
> >
> > -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > +#if defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
> > defined(CONFIG_TRANSPARENT_HUGEPAGE)
> >  static bool move_huge_pud(struct vm_area_struct *vma, unsigned long
> > old_addr,
> >                         unsigned long new_addr, pud_t *old_pud, pud_t *new_pud)
> >  {
>
> That works or we could mirror what has already been done for the
> HPAGE_PMD case. No personal preference.
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 9a7fbec31dc9..5989d3990020 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -460,7 +460,8 @@ static bool move_pgt_entry(enum pgt_entry entry, struct vm_area_struct *vma,
>                                       new_entry);
>                 break;
>         case HPAGE_PUD:
> -               moved = move_huge_pud(vma, old_addr, new_addr, old_entry,
> +               moved = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> +                       move_huge_pud(vma, old_addr, new_addr, old_entry,
>                                       new_entry);
>                 break;
>
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers
