Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A0030E093
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 18:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhBCRKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 12:10:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:37732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232013AbhBCRKt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Feb 2021 12:10:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B3E864F5D;
        Wed,  3 Feb 2021 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612372208;
        bh=nQETsKaXi6oufw4kuZ5Eytq8DCwUI85JEjUsc1C8gAg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cT/2B1eLsL61Ysv/HqMAouZ9kPQgzuSC9IratmGQtvH3wav/AMwc+FsiJqt1dEYYL
         fSV2v0y35CjEZSm8Y4jsWghL6W6vCrWxwEVWfUhIn6VmBmAJsE/H4K4oQQNdLnikGn
         CIgzTWKOPNa/3JIgPaA1oxOlCaTf/sN+4H8aB58ZF4y+sVJMbVxhqu+wNM2b5Qe+8o
         9xWBR0uBjs9DVMTRX+r/z5ldvVPWLdQqfaExJjWIH7i+HoRIJK2EUN4ZGHi32cdodW
         wGNMVXlGcIjKu/ieI2CNWHk6igVwIV6Pu1ZL6bKVnRE47mGOQbuslavt7U/gIuCBW+
         skz6ibf5Cr6AQ==
Received: by mail-ot1-f44.google.com with SMTP id 36so578277otp.2;
        Wed, 03 Feb 2021 09:10:08 -0800 (PST)
X-Gm-Message-State: AOAM530HpSsPDmvnZj1W6V1DOGW3/cKjPWRZTr3wv4AU8UZ9/g6t/uOD
        qE56sW80h2EDIOk07e2ZkIFrEJ8/9mgURm5DZbM=
X-Google-Smtp-Source: ABdhPJzjecSPR278MfEY/4Nn2UgkqXfz70UdyPsqX527Cl5z6fwF0+HIHATVMkO9uhicOQGg8NqCJGxurPq4PvqsJAM=
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr2788459otp.251.1612372207595;
 Wed, 03 Feb 2021 09:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20210202200324.5179db33@canb.auug.org.au>
In-Reply-To: <20210202200324.5179db33@canb.auug.org.au>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 3 Feb 2021 18:09:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
Message-ID: <CAK8P3a3uJfyt6vsgTdSjnE23V4E_Mw=N89nrMPLJ6bhA363nqw@mail.gmail.com>
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

On Tue, Feb 2, 2021 at 10:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>
>   983cb10d3f90 ("mm/gup: do not migrate zero page")
>
> I have applied the following patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Feb 2021 19:49:00 +1100
> Subject: [PATCH] make is_pinnable_page a macro
>
> As it is currently defined before page_to_section() which it needs.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I still see the same problem in next-20210203, and your patch below
fixes it for me.
Did you drop it from the latest build?

       Arnd

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 58f250cabea6..a608feb0d42e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1128,11 +1128,9 @@ static inline bool is_zone_movable_page(const struct page *page)
>  }
>
>  /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
> -static inline bool is_pinnable_page(struct page *page)
> -{
> -       return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
> -               is_zero_pfn(page_to_pfn(page));
> -}
> +#define is_pinnable_page(page)         \
> +       (!(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||  \
> +               is_zero_pfn(page_to_pfn(page)))
>
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
>  void free_devmap_managed_page(struct page *page);
