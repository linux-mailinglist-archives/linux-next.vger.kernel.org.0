Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4357333474
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 05:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhCJEkU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Mar 2021 23:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhCJEjy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Mar 2021 23:39:54 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B570EC061760
        for <linux-next@vger.kernel.org>; Tue,  9 Mar 2021 20:39:53 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id e7so14318281ile.7
        for <linux-next@vger.kernel.org>; Tue, 09 Mar 2021 20:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMxMSisdcB4iYz8wEr7jHpP6C1gdaDzmlJgzQ9auShs=;
        b=eGLdAQTEQTANhdedq17FapcRChntTlpJItXkzH9Jrjguv0hdtaFJ6sCepMOtMihcK1
         NB6QsuTyjKmlTEYKVzV2SW+3FGXCWpZwBUZhfmE3e8oM8j1yfKrQ/OACN9ne22aAUASH
         hcFphgZ0XY+BDjdQvlK2frqT8/TS8bMD6wj4x/T5DaiBwlMRVqNERubtwk8230lNjZVS
         7iBv3+wHMZ3LTjrGX6cWmX2sLYzlNU+KkgBJyOygTBGtT7SE36v6N6wFfrqYq6YyGFZ4
         xlyJLcRYxyq8yy6LWlOtf6TbE3JHdHUOGV2nyk9FHNr3jwFHC4Yoie30x3z/Mfb+B1rF
         Y7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMxMSisdcB4iYz8wEr7jHpP6C1gdaDzmlJgzQ9auShs=;
        b=syGPNWf6/lzzR6hgmPyvTGkRshpVgfawiWXcO/IAAG+kYqU2E9rtIuL5dq3psX+X01
         cLmHrBNbqphaSMeMIgbA1jP5D+bqO2wqpPZ3L4TikXu/bKIYXKpW4ICS1EAmhQDcNJ+z
         kC5RPWzJOV8gwIumRywkO57gm7MCFuQNoL65weK5lRRNguXLLsx42I27HFtmZ2WZxxP/
         Yb/7BS7L2LFExsfsNK+7vcgi+UxB7P4TN7qKFJdFGpsBceTDFjyeruRT512QQe9a+uKQ
         KaRODGjJYYkf8WEDJiX+pKkQxLHnXtU2PxDxE9PouSS1C5PmdSt6OkSHkwtOkdslgimA
         FGjw==
X-Gm-Message-State: AOAM531OeoT2DStgJ3SJTqzieEtFLgd9+A80smBrQSNrDWjHeLlE6DTx
        bHbHLkcVPuceH13emKdd84xGD0+X20epZAL/jCupfcfqR1w=
X-Google-Smtp-Source: ABdhPJzkpjybl/vKBkOtlpw4P7Zz3pv9jti8Pynm2Bp5lzLC85cdEwxz9nWWMDj+P6oiWidL/vwGwLGqn1rvRtQbPLE=
X-Received: by 2002:a92:ce4c:: with SMTP id a12mr1333640ilr.258.1615351193004;
 Tue, 09 Mar 2021 20:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20210310141606.75e990d2@canb.auug.org.au>
In-Reply-To: <20210310141606.75e990d2@canb.auug.org.au>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Tue, 9 Mar 2021 20:39:16 -0800
Message-ID: <CAJHvVchPVyw7wiyMnR6cBS+Gz+8aYWr_bxfjDJ57ZB=iKu=g2A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 9, 2021 at 7:16 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

Hi Stephen,

Sorry about the failure! Indeed, I had guarded this in the header, but
not in the .c file. I sent a v2.5 of the patch earlier today which
fixes the issue, but it hasn't made its way to Andrew's tree just yet.
I'll CC you on that thread as well, as an FYI. Reverting the patches
is also a fine workaround.

Next time, I'll test with more config permutations. :)

>
> mm/shmem.c:2365:12: warning: 'enum mcopy_atomic_mode' declared inside parameter list will not be visible outside of this definition or declaration
>  2365 |       enum mcopy_atomic_mode mode, struct page **pagep)
>       |            ^~~~~~~~~~~~~~~~~
> mm/shmem.c:2365:30: error: parameter 6 ('mode') has incomplete type
>  2365 |       enum mcopy_atomic_mode mode, struct page **pagep)
>       |       ~~~~~~~~~~~~~~~~~~~~~~~^~~~
> mm/shmem.c:2362:5: error: function declaration isn't a prototype [-Werror=strict-prototypes]
>  2362 | int shmem_mcopy_atomic_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> mm/shmem.c: In function 'shmem_mcopy_atomic_pte':
> mm/shmem.c:2367:30: error: 'MCOPY_ATOMIC_CONTINUE' undeclared (first use in this function)
>  2367 |  bool is_continue = (mode == MCOPY_ATOMIC_CONTINUE);
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> mm/shmem.c:2367:30: note: each undeclared identifier is reported only once for each function it appears in
> mm/shmem.c:2394:15: error: 'MCOPY_ATOMIC_NORMAL' undeclared (first use in this function)
>  2394 |   if (mode == MCOPY_ATOMIC_NORMAL) { /* mcopy_atomic */
>       |               ^~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   3407bec05d6d ("userfaultfd: support minor fault handling for shmem")
>
> # CONFIG_USERFAULTFD is not set
>
> I have reverted that commit (and the following 4 as well).
> --
> Cheers,
> Stephen Rothwell
