Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA671725C4
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 18:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729433AbgB0R5j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 12:57:39 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41033 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgB0R5i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 12:57:38 -0500
Received: by mail-ot1-f65.google.com with SMTP id v19so3746960ote.8;
        Thu, 27 Feb 2020 09:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AE8wb0HG+3vuy1qodVFMwqdvcyEFEcaDAhlJidYfCs0=;
        b=sXvgBWBybj8Pin0WtXpzccj6sQB8c80C6mV06prDPwqlvT5xdkfH2i1zUngz+KZIVe
         HMwInSeuQH+aySGAFQkI5BYWMTF5XGkQcawDMGrYlRi+VlarJwIlSPT5UUXdAjBCNk+U
         dmH7vaobepfo8lJpl/748+IsVr4KETSIjZTnN+EB/kj8SA4cmgD3zs4P/basbDWiFl18
         gPfLaxc2ClcCzbwHhRVtmIyBxrjn4V+gA+/+dcRKf/2YeipoySnsS6CxgYSDCmmwB4WO
         oolZBmNS5ManzMgu1E51xXoJaEgbzaMZVMJHZwGkeQ6Pt8sHc7xhrQNtQdeSH/BZJNtJ
         bm+w==
X-Gm-Message-State: APjAAAVrsXOE0TRtUWxr1X8PSuZSzJ2vY3LIqiI4PgbprJWSdo/0zky0
        lCZq5VZhSPguP33R/p1Pq7wrlWeSHIKNthywOXA=
X-Google-Smtp-Source: APXvYqy3ggWLS/5mUneApKM2x+tXn239hPyRVnHqSbQHT+/fvBYj77PEXaw0d7lsEwKOkN6sn5MDEP7+B/X6E22cwvE=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr67639otk.145.1582826257924;
 Thu, 27 Feb 2020 09:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20200227151143.6a6edaf9@canb.auug.org.au> <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
 <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com> <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
In-Reply-To: <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 18:57:26 +0100
Message-ID: <CAMuHMdW-0xuxK_Cd2t3=BZwwOUhrYf-Ctn+frW_1tTsO5eQxOw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Arjun Roy <arjunroy@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Soheil Hassas Yeganeh <soheil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arjun,

On Thu, Feb 27, 2020 at 6:45 PM Arjun Roy <arjunroy@google.com> wrote:
> On Thu, Feb 27, 2020 at 9:13 AM Arjun Roy <arjunroy@google.com> wrote:
> > On Thu, Feb 27, 2020 at 1:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Thu, Feb 27, 2020 at 5:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > After merging the akpm tree, today's linux-next build (sparc defconfig)
> > > > failed like this:
> > > >
> > > > In file included from include/linux/list.h:9:0,
> > > >                  from include/linux/smp.h:12,
> > > >                  from include/linux/kernel_stat.h:5,
> > > >                  from mm/memory.c:42:
> > > > mm/memory.c: In function 'insert_pages':
> > > > mm/memory.c:1523:41: error: implicit declaration of function 'pte_index'; did you mean 'page_index'? [-Werror=implicit-function-declaration]
> > > >    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
> > > >                                          ^
> > > > include/linux/kernel.h:842:40: note: in definition of macro '__typecheck'
> > > >    (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
> > > >                                         ^
> > > > include/linux/kernel.h:866:24: note: in expansion of macro '__safe_cmp'
> > > >   __builtin_choose_expr(__safe_cmp(x, y), \
> > > >                         ^~~~~~~~~~
> > > > include/linux/kernel.h:934:27: note: in expansion of macro '__careful_cmp'
> > > >  #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
> > > >                            ^~~~~~~~~~~~~
> > > > mm/memory.c:1522:26: note: in expansion of macro 'min_t'
> > > >   pages_to_write_in_pmd = min_t(unsigned long,
> > > >                           ^~~~~
> > >
> > > Same issue on m68k, as per a report from kisskb.
> > >
> > > > Caused by patch
> > > >
> > > >   "mm/memory.c: add vm_insert_pages()"
> > > >
> > > > sparc32 does not implement pte_index at all :-(
> > >
> > > Seems like about only half of the architectures do.
> > >
> >
> > :/ I begin to suspect the only sane way to make this work is to have a
> > per-arch header defined method, returning a bool saying whether
> > pte_index() is meaningful or not on that arch, and early on in
> > vm_insert_pages() if that bool returns true, to just call
> > vm_insert_page() in a loop.
> >
>
> So, here is what I propose: something like the following macro in a
> per-arch header:
>
> #define PTE_INDEX_DEFINED 1 // or 0 if it is not

pte_index is already a #define on architectures where it exists, so
you can just use that.

> In mm/memory.c, another macro:
>
> #ifndef PTE_INDEX_DEFINED
> #define PTE_INDEX_DEFINED 0
> #endifndef

No need for the above...

> And inside vm_insert_pages:
>
> int vm_insert_pages() {
>
> #if PTE_INDEX_DEFINED

... if you use "#ifdef" here.

>
> // The existing method
>
> #else
>
> for (i=0; i<n; ++i)
>         vm_insert_page(i)
>
> #endif
> }
>
> That way:
> 1. No playing whack-a-mole with different architectures
> 2. Architecture that knows pte_index is meaningful works can define
> this explicitly
> 3. Can remove the sparc patches modifying pte_index that Stephen and I
> contributed.
>
> If that sounds acceptable I can cook a patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
