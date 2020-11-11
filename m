Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7BF2AF941
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 20:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgKKToV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 14:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgKKToU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 14:44:20 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C519C0613D1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 11:44:20 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id s2so1503086plr.9
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T6+8pW5jZmBDXZbPZRIztWDaBT2x4DmsxSLQ6azETAc=;
        b=se9v8enfPUYbJTt74HhR/SX2RmXprJ24MmSz0B6V6vVydIBGmJrjoTIm2zNBupmNFO
         GJflYMImUSVaWMip1XV6MIJvQk82VwB1y+EnGYIkN2n/kRU+haT6WrD9zXhdlSZ4p6Cp
         ULCa12b5tboh7sjLVMaGR+hf4Z3Bd3PFQ3QmddVufhjy0HTI8Q6Ixh0F9m9t1K9qRI7n
         osu4eF9sgLT3VBpn0FLT5rTt7wtOGFsgb0lzjQQLDH8Jv6bywYx1l9Ry35K0eRZZBDbp
         s9+EBy8mW+KuK+gots4IIw0zgZX+zl9EbkwM9xZYdF5PQ3se2xIfqNRAy04N9t5Kpfot
         +oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6+8pW5jZmBDXZbPZRIztWDaBT2x4DmsxSLQ6azETAc=;
        b=F3D+f80FbjaXHId8EKAJq9dkHMbpliqJy9S8WVDE7jLiUPmT+nYZf5BH2ei5Fu2n47
         bDSBllzTOjCnKKv4YkaDA3dqmZkORlQ+GB/qMt2ZAgr0CXLQzQFWm2OEVPDX33wr4nig
         L8sa/rX/FWLx25PBsMogH9q8CH+byFTlnxhnrtR38UNNxosecOeVyZa0DYzLv4X7sdCr
         GZUaGxF8DAr8kOhYRcrbh/ptuI//sqWvJRKtQh8YI6V8TJdrOL9QhVHslB+bO49Q+hdA
         s5n34h6nxFoyfeJAxsXD/uYN8nEG98jv6V+6Ny41p0GeYvbGnskF3M7oMO2+L8pANkp0
         9OQQ==
X-Gm-Message-State: AOAM533QL17PPJ6v9gZUtzYd12v0Hd13WvrUQi59FAwpbvGrp7HmMCQq
        IaANRubF7Q3hT6UTCycfGshtYk4w5OhJzC1edkzFtA==
X-Google-Smtp-Source: ABdhPJyritjwALZYYkqE++zh/C6zeAGTLmlgOvj2cpbxrtYI+S9Fb6PTPQ53iLb1vLxINgC437M7aggmL3FxpAymu/k=
X-Received: by 2002:a17:902:8d95:b029:d8:c2ee:7dc with SMTP id
 v21-20020a1709028d95b02900d8c2ee07dcmr2295427plo.57.1605123860032; Wed, 11
 Nov 2020 11:44:20 -0800 (PST)
MIME-Version: 1.0
References: <000000000000fe575905b3cff92c@google.com> <bf31020f4e50b303fd0dd3dfda0e50de79ed25db.camel@redhat.com>
 <CAAeHK+yLgDYOS35sWT8=4_d-gZKU_B10D9ZEBPZDC1P6MO2D6Q@mail.gmail.com> <CAA5enKY8mBicpc7kZKKLG5LeVFhVJtRQ73MYVFM0Az2bbiGv8g@mail.gmail.com>
In-Reply-To: <CAA5enKY8mBicpc7kZKKLG5LeVFhVJtRQ73MYVFM0Az2bbiGv8g@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 11 Nov 2020 20:44:09 +0100
Message-ID: <CAAeHK+x4tWTY0ZuR6LHhm071bOnvZcfa=A-KLpSfUTkaxZHieA@mail.gmail.com>
Subject: Re: linux-next boot error: BUG: unable to handle kernel NULL pointer
 dereference in mempool_init_node
To:     Lorenzo Stoakes <lstoakes@gmail.com>
Cc:     Qian Cai <cai@redhat.com>,
        syzbot <syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 11, 2020 at 8:27 PM Lorenzo Stoakes <lstoakes@gmail.com> wrote:
>
> On Wed, 11 Nov 2020 at 17:44, Andrey Konovalov <andreyknvl@google.com> wrote:
> > I'll try to reproduce this and figure out the issue. Thanks for letting us know!
>
> I hope you don't mind me diving in here, I was taking a look just now
> and managed to reproduce this locally - I bisected the issue to
> 105397399 ("kasan: simplify kasan_poison_kfree").
>
> If I stick a simple check in as below it fixes the issue, so I'm
> guessing something is violating the assumptions in 105397399?
>
>
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 7a94cebc0324..16163159a017 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -387,6 +387,11 @@ void __kasan_slab_free_mempool(void *ptr, unsigned long ip)
>         struct page *page;
>
>         page = virt_to_head_page(ptr);
> +
> +       if (!PageSlab(page)) {
> +               return;
> +       }
> +
>         ____kasan_slab_free(page->slab_cache, ptr, ip, false);
>  }

Ah, by the looks of it, ceph's init_caches() functions asks for
kmalloc-backed mempool, but at the same time provides a size that
doesn't fit into any kmalloc cache, and kmalloc falls back onto
page_alloc. Hard to say whether this is an issue in ceph, but I guess
we'll have to make KASAN fool proof either way and keep the PageSlab()
check in kasan_slab_free_mempool().

Thank you for debugging this, Lorenzo. I'll fix this in v10.
