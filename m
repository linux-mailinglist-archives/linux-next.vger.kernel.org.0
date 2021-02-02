Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD9E30BC21
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 11:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhBBKgJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 05:36:09 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:36355 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhBBKgI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 05:36:08 -0500
Received: by mail-oi1-f181.google.com with SMTP id d18so22249521oic.3;
        Tue, 02 Feb 2021 02:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SDaLV+HWALbbtXb48Ve+mhVAzVueh3MiwiWIcXEV1JA=;
        b=eruJmtqDvNBQpD19TRj0nYFoEkZauUQ61Ks2YJmqK6JiY/gGgY7lFYYQ1AsQ7SJMwH
         GBfPwycjhNCD67lquCpOFiVn+GJ9hjTwTwXyaVluEPic9XQQvE89P3eQj3grBYtkQUBE
         DSCB9CHFH8epkBCbVQ3KaQcT+V4nK1zzL4fZilAR9oHE/48SDHsfjNfaAfRwKUQWjRuX
         oUNVSnrlhauZ0i+LBshUXydYrGNyQiAaLTuweOo91IBDX2ehtihSSXngv0XwZuK2iTFM
         oujER3bVM5sNxI24cV5Cbqb6DZ0ofRK6YznB100qeY1sQnMeKNTA6mZa/1saMqdKv7eW
         Hfxg==
X-Gm-Message-State: AOAM5313FjC8VacZ5Oc2vlGs6jF6/gdxEEjR6rVBagBwbVArJBITjL85
        nDc2yiN9L/o6vLA1hccxAM6CX/EpbkImtZ2oZ5kFm7we4Ho=
X-Google-Smtp-Source: ABdhPJzYhm34xe/jhzhtlNiIRIECWDgB6A8qnsP+nN4x6e97EvMDX1hP84QvrJ0SW1MUid8+sRRFk/6nIvQdlclFC1Q=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2160665oiy.148.1612262126894;
 Tue, 02 Feb 2021 02:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20210202200324.5179db33@canb.auug.org.au>
In-Reply-To: <20210202200324.5179db33@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Feb 2021 11:35:15 +0100
Message-ID: <CAMuHMdXcKrCBq7gytvD07NBRjuLMdJRahQ3Dfa_mMdZBHdds6w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 2, 2021 at 10:13 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the akpm-current tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
>
> In file included from arch/x86/include/asm/page.h:76,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:56,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:51,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from include/linux/crypto.h:20,
>                  from arch/x86/kernel/asm-offsets.c:9:
> include/linux/mm.h: In function 'is_pinnable_page':
> include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section'; did you mean 'present_section'? [-Werror=implicit-function-declaration]
>    64 |  int __sec = page_to_section(__pg);   \
>       |              ^~~~~~~~~~~~~~~
> include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
>    81 | #define page_to_pfn __page_to_pfn
>       |                     ^~~~~~~~~~~~~
> include/linux/mm.h:1134:15: note: in expansion of macro 'page_to_pfn'
>  1134 |   is_zero_pfn(page_to_pfn(page));
>       |               ^~~~~~~~~~~

In addition, noreply@ellerman.id.au reports for m68k/m5272c3_defconfig:

    include/linux/mm.h:1133:3: error: implicit declaration of function
'is_zero_pfn'; did you mean 'is_zero_ino'?
[-Werror=implicit-function-declaration]

is_zero_pfn() is only defined if CONFIG_MMU=y.

Hence using it in mm/gup.c in commit 3f509f6aef4bb868 ("mm/gup: migrate
pinned pages out of movable zone") breaks compilation of gup.c, too.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
