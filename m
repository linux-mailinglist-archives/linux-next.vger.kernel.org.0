Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8C916097C
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 05:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgBQENH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 23:13:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38515 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgBQENH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Feb 2020 23:13:07 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so17901024wrh.5
        for <linux-next@vger.kernel.org>; Sun, 16 Feb 2020 20:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+t2lAkJHHWrFw6xWV3SgprQvUaUl1BY+kJcD9vJxAFw=;
        b=DqBHCUg2BEqvLrW9aug6Iu5M9vdgPJjktizhhWsUeAu9Myk3h+5eSsIIJphj0G7roz
         dgn4pQJbXjvsyltRE9cC6TJlZ+F2H/zKmtqph8PZ5Wlyuc0lUStJJcCPwJtPs9RRvd+M
         fvw+HeUSFawyfABLMJfZeaXjKf6APAuj4KIntzf3+LbMYc3pVNw8HfE0VQZSXrLfCRG+
         NNz/Rw9ExeK8O2kWRK80ffyKPdQ4GKcmaG99DCSO8ys6GjrVW/m0Ejcmv5hg5Jp+Q/AR
         f3kw0avsgwosAwxT3pOISPkuAytimngtFCEPqmalzrl+dX4d+FbjHyEPnW8MDb6jlgXC
         rtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+t2lAkJHHWrFw6xWV3SgprQvUaUl1BY+kJcD9vJxAFw=;
        b=bJmv0DEUQgA+BbxtiiCvQGCjqejhE1hkp4fXSUsFckxUHNAwZSy/QYRw3a8L2N0e1M
         5mCSSlfqgYayIckMsG7UyBFPvTJg/5Vo8qSB5Lq1dgj0ppNIpu2369ldbefzpXFNTvfO
         e6l25XDGkpVIjCDmQMRCIu4oEioynpbwHXV/4frV/fcGOk/hKJUfNjJdmfIkqdB09hiB
         uIpesHRrp3Wl7M9h42uENR0FHpkes+VvuSsRODpi7GCvUZx9afsP5Wi7Oc9yiXb43PgJ
         N77xHtukqhAAPxKuKBaPsBTgT5dIEyfRz0UniE50myA5lSkNCxgf70To6kFdrXpqPeur
         qHaw==
X-Gm-Message-State: APjAAAWhSSGnPI+CCQfsS/oAshsXzk0DDJ/Ap5MRuZKqSgLK6OfVQ5rr
        wqC7bj7zWGep3Py8RljyFph5nnDNjAOkCXqemJzqMw==
X-Google-Smtp-Source: APXvYqy8DstK6bOQQIriUK8rvFbqZFNIo81H4tlz+QiKRzdpPok+ra2ukbmMzZMLo/NfxDuNVumQ/EXyHtEI2PS90oE=
X-Received: by 2002:a5d:6545:: with SMTP id z5mr18921279wrv.3.1581912784734;
 Sun, 16 Feb 2020 20:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20200217145711.4af495a3@canb.auug.org.au>
In-Reply-To: <20200217145711.4af495a3@canb.auug.org.au>
From:   Arjun Roy <arjunroy@google.com>
Date:   Sun, 16 Feb 2020 20:12:53 -0800
Message-ID: <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Feb 16, 2020 at 7:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm tree, today's linux-next build (sparc64 defconfig)
> failed like this:
>
> mm/memory.c: In function 'insert_pages':
> mm/memory.c:1523:56: error: macro "pte_index" requires 2 arguments, but only 1 given
>    remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
>                                                         ^
>
> Caused by commit
>
>   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
>
> This is the first use of pte_index() outside arch specific code and the
> sparc64 version of pte_index() nas an extra argument.
>

Looks like this happens for sparc, and also metag. Other platforms
just take the addr parameter based on a quick search.

> I have reverted these commits for today:
>
>   219ae14a9686 ("net-zerocopy-use-vm_insert_pages-for-tcp-rcv-zerocopy-fix")
>   cb912fdf96bf ("net-zerocopy: use vm_insert_pages() for tcp rcv zerocopy")
>   72c684430b94 ("add missing page_count() check to vm_insert_pages().")
>   dbd9553775f3 ("mm-add-vm_insert_pages-fix")
>   366142f0b000 ("mm/memory.c: add vm_insert_pages()")
>

In terms of fixing this; passing in an appropriate dir parameter is
not really a problem, but what is concerning that it seems messy to
have a per-platform ifdef to pass it either two arguments or one in
this case. But it seems like either that would be one way to fix it,
or having some arch method across all arches that takes two arguments
(and ignores one of them for most arches).

Is there a general preference for the right way forward, in this case?

Thanks,
-Arjun

> --
> Cheers,
> Stephen Rothwell
