Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1271A172594
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 18:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgB0RpJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 12:45:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36563 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbgB0RpI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 12:45:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id j16so2960278wrt.3
        for <linux-next@vger.kernel.org>; Thu, 27 Feb 2020 09:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WixaM9tNI8jnTh9C4+zTeTZp1lxDIM/c/EPF+3v0ZBE=;
        b=KDUCet3qoAEaSacVzuXwe3JXolr9HmgHhC00ZjEyN12KdAZzPjkwxMYSF3VaIUHJoM
         bpu5F79pIc91/TImFBOK34U/6TrFa0dvkKANTi4aZL8uJpMsvb1t/ywuXH8nUdEIvLmO
         XlGtPRbZi9RWArB5f43EpVdrrn3vhnykxhPXDhT/jLvH/+smjUGkohWMJfAoZFO31hcM
         tKc7ABcXYFEC2ysVSQRGKuCZyrBbMnW/Joy9VqtMH5/FFljEqQaxq7FioaRIcR/HcbWc
         86CYOefkozOo91gDg/8hiBPn4UeCJSH/ZxIDDxJH7FxuFAaRUGBY037M5wjHACD545C0
         TQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WixaM9tNI8jnTh9C4+zTeTZp1lxDIM/c/EPF+3v0ZBE=;
        b=qX3yApXbkeYAm0jQR+G3PLz7QRAwRigzTvlEmkbRxI8oRAMKANOw0ZoolwUIGCBGig
         lZ7jymCv9T0CMBVoLK0wtVdI2E1x3vyw0A1co4XA+b9rj2t11FmxRvK8X8kQ2gSKcw2J
         BElP9xTYPg4YHnYGQKF8Ho6PVlqG07TEKqo5y99JxWLX+LXu8UHVHwQ0x+qkzjbKmsn6
         aR3l3Ewd1HBx93Wq5FdrZ57gsEo9N11mMtQ+wk6oxAlw7q8NwJmljZMiA7tSii+1koID
         4rEwdn7oWihOzjIPaYxvIOxZiBX84JX1FA6zdBavE5GoxpUBMNUemnGJR4J9so6QsN3E
         I9BQ==
X-Gm-Message-State: APjAAAW4HBJV2HeWuvZr/ZSMP6ryI/CB9Bu6JqJyalqHLItwCupgankx
        eza8ygc3Wbs41CMVU1/J2Qwto08mKzj3CwYT8fz0Vw0U
X-Google-Smtp-Source: APXvYqz21p2um6MK62mRZ+SLuFxx5C/Fc3SSLuIrFollTsWhEO4W2YdbT0+eur1+lWAujIwnB6aoW5WY0MRu3tAN8TA=
X-Received: by 2002:a5d:674d:: with SMTP id l13mr8276wrw.11.1582825505785;
 Thu, 27 Feb 2020 09:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20200227151143.6a6edaf9@canb.auug.org.au> <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
 <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com>
In-Reply-To: <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com>
From:   Arjun Roy <arjunroy@google.com>
Date:   Thu, 27 Feb 2020 09:44:54 -0800
Message-ID: <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Feb 27, 2020 at 9:13 AM Arjun Roy <arjunroy@google.com> wrote:
>
> On Thu, Feb 27, 2020 at 1:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Stephen et al,
> >
> > On Thu, Feb 27, 2020 at 5:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > After merging the akpm tree, today's linux-next build (sparc defconfig)
> > > failed like this:
> > >
> > > In file included from include/linux/list.h:9:0,
> > >                  from include/linux/smp.h:12,
> > >                  from include/linux/kernel_stat.h:5,
> > >                  from mm/memory.c:42:
> > > mm/memory.c: In function 'insert_pages':
> > > mm/memory.c:1523:41: error: implicit declaration of function 'pte_index'; did you mean 'page_index'? [-Werror=implicit-function-declaration]
> > >    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
> > >                                          ^
> > > include/linux/kernel.h:842:40: note: in definition of macro '__typecheck'
> > >    (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
> > >                                         ^
> > > include/linux/kernel.h:866:24: note: in expansion of macro '__safe_cmp'
> > >   __builtin_choose_expr(__safe_cmp(x, y), \
> > >                         ^~~~~~~~~~
> > > include/linux/kernel.h:934:27: note: in expansion of macro '__careful_cmp'
> > >  #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
> > >                            ^~~~~~~~~~~~~
> > > mm/memory.c:1522:26: note: in expansion of macro 'min_t'
> > >   pages_to_write_in_pmd = min_t(unsigned long,
> > >                           ^~~~~
> >
> > Same issue on m68k, as per a report from kisskb.
> >
> > > Caused by patch
> > >
> > >   "mm/memory.c: add vm_insert_pages()"
> > >
> > > sparc32 does not implement pte_index at all :-(
> >
> > Seems like about only half of the architectures do.
> >
>
> :/ I begin to suspect the only sane way to make this work is to have a
> per-arch header defined method, returning a bool saying whether
> pte_index() is meaningful or not on that arch, and early on in
> vm_insert_pages() if that bool returns true, to just call
> vm_insert_page() in a loop.
>

So, here is what I propose: something like the following macro in a
per-arch header:

#define PTE_INDEX_DEFINED 1 // or 0 if it is not

In mm/memory.c, another macro:

#ifndef PTE_INDEX_DEFINED
#define PTE_INDEX_DEFINED 0
#endifndef

And inside vm_insert_pages:

int vm_insert_pages() {

#if PTE_INDEX_DEFINED

// The existing method

#else

for (i=0; i<n; ++i)
        vm_insert_page(i)

#endif
}

That way:
1. No playing whack-a-mole with different architectures
2. Architecture that knows pte_index is meaningful works can define
this explicitly
3. Can remove the sparc patches modifying pte_index that Stephen and I
contributed.

If that sounds acceptable I can cook a patch.

Thanks,
-Arjun

> -Arjun
>
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
