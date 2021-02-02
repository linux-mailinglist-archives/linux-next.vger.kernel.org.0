Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0DD30BEDB
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 13:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhBBM4K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 07:56:10 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33176 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhBBM4J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 07:56:09 -0500
Received: by mail-oi1-f169.google.com with SMTP id j25so22636816oii.0;
        Tue, 02 Feb 2021 04:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6SfDUe7/OY8cjfEJ/wkB27yKdW8TDMTt/5dkOh0M/x8=;
        b=nM7jMqrnQu2KDs1RlR9006jJh0505LtPHOOSJ/BpxDJfVGCVribPWu4qxvnDPr5g3i
         8XMkzQeho54YoCF4hQpcYoWhAiNG4n8hSJ22RgsWTIrpXEPc590R7gIRUkeX7mZBWsZi
         6+yEUOKBDsg1EMWDhTIZZwlQUZNdqAOlGrK6xcoxD87JKBk1E4EhrV/IpbiE6UWqmbxB
         LAcG+1872lghKhnfksvQzKYe92EcpS7neycwk+yzafEk1pysb6t0nslsWl+J+8U/cArS
         nfcpNmxIBvvVBHsIuiKRk+Uh1PTXw5cknDbE5EVii/AHp4IrIg2WE8V6a2ZallljPZ2O
         Nalw==
X-Gm-Message-State: AOAM5330Z2/xo1J7iG2IbHEb6afQkgvbdo31yJ/J45sNQcZ/8SjL1xV5
        dEVV2T7/Qx/IiAaZrsmutZ8XhYu9KbkHPbVDx7LEqaktjKM=
X-Google-Smtp-Source: ABdhPJwbI4/sMQcnIs9ZWWI6KwM3kVpjGKymej14kHBgL3CjI+NPDzzjeUx0/AmR8pR6FNSEAc425pGsMWVOLF2ZTOk=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2492382oiy.148.1612270528326;
 Tue, 02 Feb 2021 04:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20210202200324.5179db33@canb.auug.org.au> <CAMuHMdXcKrCBq7gytvD07NBRjuLMdJRahQ3Dfa_mMdZBHdds6w@mail.gmail.com>
 <CA+CK2bBrU2Ky2TL0o_4Ugt+NW6MArTPKexczRij-V5BHgxh7rA@mail.gmail.com>
In-Reply-To: <CA+CK2bBrU2Ky2TL0o_4Ugt+NW6MArTPKexczRij-V5BHgxh7rA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Feb 2021 13:55:16 +0100
Message-ID: <CAMuHMdUrgdxkkLq_5sSjTmiY8xZW9+XQE9Szgp4hP9A8R_eT9Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Pavel,

On Tue, Feb 2, 2021 at 1:34 PM Pavel Tatashin <pasha.tatashin@soleen.com> wrote:
> The fix is here:
> https://lore.kernel.org/linux-mm/CA+CK2bBjC8=cRsL5VhWkcevPsqSXWhsANVjsFNMERLT8vWtiQw@mail.gmail.com/

Thanks, that fixed the m68k/m5272c3_defconfig build.

> On Tue, Feb 2, 2021 at 5:35 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Feb 2, 2021 at 10:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > After merging the akpm-current tree, today's linux-next build (x86_64
> > > allnoconfig) failed like this:
> > >
> > > In file included from arch/x86/include/asm/page.h:76,
> > >                  from arch/x86/include/asm/thread_info.h:12,
> > >                  from include/linux/thread_info.h:56,
> > >                  from arch/x86/include/asm/preempt.h:7,
> > >                  from include/linux/preempt.h:78,
> > >                  from include/linux/spinlock.h:51,
> > >                  from include/linux/mmzone.h:8,
> > >                  from include/linux/gfp.h:6,
> > >                  from include/linux/slab.h:15,
> > >                  from include/linux/crypto.h:20,
> > >                  from arch/x86/kernel/asm-offsets.c:9:
> > > include/linux/mm.h: In function 'is_pinnable_page':
> > > include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section'; did you mean 'present_section'? [-Werror=implicit-function-declaration]
> > >    64 |  int __sec = page_to_section(__pg);   \
> > >       |              ^~~~~~~~~~~~~~~
> > > include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
> > >    81 | #define page_to_pfn __page_to_pfn
> > >       |                     ^~~~~~~~~~~~~
> > > include/linux/mm.h:1134:15: note: in expansion of macro 'page_to_pfn'
> > >  1134 |   is_zero_pfn(page_to_pfn(page));
> > >       |               ^~~~~~~~~~~
> >
> > In addition, noreply@ellerman.id.au reports for m68k/m5272c3_defconfig:
> >
> >     include/linux/mm.h:1133:3: error: implicit declaration of function
> > 'is_zero_pfn'; did you mean 'is_zero_ino'?
> > [-Werror=implicit-function-declaration]
> >
> > is_zero_pfn() is only defined if CONFIG_MMU=y.
> >
> > Hence using it in mm/gup.c in commit 3f509f6aef4bb868 ("mm/gup: migrate
> > pinned pages out of movable zone") breaks compilation of gup.c, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
