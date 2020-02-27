Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA620171396
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 10:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgB0JDM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 04:03:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38209 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgB0JDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 04:03:11 -0500
Received: by mail-ot1-f66.google.com with SMTP id z9so2227820oth.5;
        Thu, 27 Feb 2020 01:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZL+I4nVgZ/8Uy61b+0pKrzahttB7GnkzgyYhltcyIvs=;
        b=GgzP9SMR1pIzkpBrM4X5lMMffd9gfprlZFyRFGYllIedrpYLM+Od7mE800PA9wKbNO
         LaPFqCkwyLOklNnDvndxu6lj5MFcpWAyoSD9j8G7U1a5wKOvE9/8jYOUgD8MzgXD6vht
         Rjsq4B5Vb7OZdlvl0ownr0Z4nx5dUwFsnD7p1IGTrNdXtFYf1bCr6FZweMR9ekj8sbvm
         G4boh2y56un+R/oHLHF/E06NRWydpxujZaDFESMteJTExMMLCHNW7nAcdwNaBLKEKFIK
         nYuccYGGmI0PVd+d1bsfoErQdhU3QSbIoGm4WOMMI1Vp7TSiGILcDDLkQpLehqPw/7tE
         WdOw==
X-Gm-Message-State: APjAAAXpKnuemhGSaeBYF1tO+irN/QvkOQeh0bPKxLqzTL6pTWffGsdn
        VBEBNbVThFSviGV+GKXl/4Tsax6a+LXTjVxYoAo=
X-Google-Smtp-Source: APXvYqy4aqBm/JcKX4BPk9y39XWmGVtopDIQXYPC7dO64xAgEWmuEeIoxj8y76quXoqGO6UBFsuyFEWu2nl3O9eCryk=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr2433887ots.250.1582794190767;
 Thu, 27 Feb 2020 01:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20200227151143.6a6edaf9@canb.auug.org.au>
In-Reply-To: <20200227151143.6a6edaf9@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 10:02:59 +0100
Message-ID: <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arjun Roy <arjunroy@google.com>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen et al,

On Thu, Feb 27, 2020 at 5:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the akpm tree, today's linux-next build (sparc defconfig)
> failed like this:
>
> In file included from include/linux/list.h:9:0,
>                  from include/linux/smp.h:12,
>                  from include/linux/kernel_stat.h:5,
>                  from mm/memory.c:42:
> mm/memory.c: In function 'insert_pages':
> mm/memory.c:1523:41: error: implicit declaration of function 'pte_index'; did you mean 'page_index'? [-Werror=implicit-function-declaration]
>    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
>                                          ^
> include/linux/kernel.h:842:40: note: in definition of macro '__typecheck'
>    (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>                                         ^
> include/linux/kernel.h:866:24: note: in expansion of macro '__safe_cmp'
>   __builtin_choose_expr(__safe_cmp(x, y), \
>                         ^~~~~~~~~~
> include/linux/kernel.h:934:27: note: in expansion of macro '__careful_cmp'
>  #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
>                            ^~~~~~~~~~~~~
> mm/memory.c:1522:26: note: in expansion of macro 'min_t'
>   pages_to_write_in_pmd = min_t(unsigned long,
>                           ^~~~~

Same issue on m68k, as per a report from kisskb.

> Caused by patch
>
>   "mm/memory.c: add vm_insert_pages()"
>
> sparc32 does not implement pte_index at all :-(

Seems like about only half of the architectures do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
