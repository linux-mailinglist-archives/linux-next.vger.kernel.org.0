Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 374A1451A99
	for <lists+linux-next@lfdr.de>; Tue, 16 Nov 2021 00:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355287AbhKOXkm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 18:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354803AbhKOXid (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 18:38:33 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9D5C061228;
        Mon, 15 Nov 2021 14:36:03 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f18so47602540lfv.6;
        Mon, 15 Nov 2021 14:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L7wjMKym1iMd/x5Kjut5c6PDKNIJ9EL2VN54UvWJZZw=;
        b=Yjkbgh+oa5zveEDmy8P/BF/Usf0QRAps1N9OyxvzOIUe5ljjrZVDNCZzfEqqtSiuzU
         c+2kGosVC4yd8YJSunfnje7x0hPNBm9ER5gQQhibfMv28F8ttittB0rqt+1jJh2ZyRrE
         mKmG2Su8n6jxLhJ6WvYSjSr5+Er3Jb5XtOaLLiiktmogpg7RJP7G382KZlw/EJKYL8Gx
         MturHg0r/SvTt/NhA6OX9Wu0E1jfdiKy8QQ+iilMqzQFdejBwUENhDbszBB3PmU/qpu1
         pgGpKVCkwDSCQ9UFdZohWGWndgxvArLEWSOqXiT6GawDLDs2dvsdLKpqm6gUPG6SnC/0
         s/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L7wjMKym1iMd/x5Kjut5c6PDKNIJ9EL2VN54UvWJZZw=;
        b=CI7WORYe9JrJHq7ZDeJtFvAkGSvzFLT5TBoCo11/1n9v+8XPRFi0tWgBpBzTqB3XeX
         3YxtjM5e+6ZkYdivyzy8+5xSiojmjSgmJI7ZWlVaBmzf+DmRBTydv9x1+i81X9btVYB3
         RN6lBfDvtGzETbLRVjdLApAJclxo6trU0xRBS1T7gfvtr+670Jf4/mdviMit/qMbwDUi
         09pWGuAl1q6HDQDb6HOI3GtSI64XYGRscuYFmoMXOHx421ZJk2Q5cvv+isVkeFbvvwYT
         gVR9tTp/xTH6YrnOuqEVLo5E0PkxVPXrnwv4Hg/EL5cQ//MIzhoMH/nKPpaR7OVwcLLB
         YNsQ==
X-Gm-Message-State: AOAM5335pKPoOWjJ95LOvRXnzpRXZVNpqT/sAOrCqeEwgqMpQFPrqoMu
        1hYEBNDSuIGKMJ84pNMcvSRFIrdF3bQFXkABSnGzB7QK
X-Google-Smtp-Source: ABdhPJx00ms+KXlRHKdrUHVbotkSm9uTYFm1ZRh275XxGQRY2Og5BB+xGAXcP8M4mLt+G6y6pQezE0i5D/X0bAA2onA=
X-Received: by 2002:ac2:5ddb:: with SMTP id x27mr1999679lfq.595.1637015761909;
 Mon, 15 Nov 2021 14:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20211116091702.3e2c4550@canb.auug.org.au>
In-Reply-To: <20211116091702.3e2c4550@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Mon, 15 Nov 2021 16:35:51 -0600
Message-ID: <CAH2r5mu6qbpFc23DtDj_pAD1zF9foJ5bSocGQiOzEurZ4ULYFQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        chiminghao <chi.minghao@zte.com.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

patch removed pending author fix

On Mon, Nov 15, 2021 at 4:17 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the cifs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from fs/cifs/dns_resolve.c:18:
> fs/cifs/cifsglob.h: In function 'cifs_get_tlink':
> fs/cifs/cifsglob.h:1169:14: error: passing argument 1 of 'atomic_inc' from incompatible pointer type [-Werror=incompatible-pointer-types]
>  1169 |   atomic_inc(&tlink->tl_count);
>       |              ^~~~~~~~~~~~~~~~
>       |              |
>       |              refcount_t * {aka struct refcount_struct *}
> In file included from include/linux/atomic.h:82,
>                  from include/linux/cpumask.h:13,
>                  from include/linux/smp.h:13,
>                  from include/linux/lockdep.h:14,
>                  from include/linux/spinlock.h:62,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from fs/cifs/dns_resolve.c:15:
> include/linux/atomic/atomic-instrumented.h:179:22: note: expected 'atomic_t *' but argument is of type 'refcount_t *' {aka 'struct refcount_struct *'}
>   179 | atomic_inc(atomic_t *v)
>       |            ~~~~~~~~~~^
>
> and lots more similar ...
>
> Caused by commit
>
>   ef242296e441 ("fs:cifs: convert from atomic_t to refcount_t on tlink->tl_count")
>
> Please write, review, test (repeat) and, only then, publish. :-(
>
> I have used the cifs tree from next-20211115 for today.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
