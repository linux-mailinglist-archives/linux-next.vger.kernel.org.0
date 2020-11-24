Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93642C2E3C
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 18:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389846AbgKXRQd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 12:16:33 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:44554 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbgKXRQd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 12:16:33 -0500
Date:   Tue, 24 Nov 2020 18:16:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606238190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=21CneeHv4WjigQFLsDRnBPjDyqomDe8iqs+F8eXUq54=;
        b=YNuNJPCqi1woBBDIVq9RGDhGKE6iS0zVkDg/F+0aJMJ0GY5xTotuc0YTbaaoOBOj4GJ55+
        Gq+cffSqonZhuVk0cyn+hqZxeb1PQNAscVhFfR13mG0F6nBjyzWpwWcGWgM9+2bDYlgKGM
        8aYGROcTmFdhOjzOxKT9NhzhHZiPQkH6B6T04lOXv3sdkt0zcQ1SreZRl4z/KoxQw8DIXw
        4jJhy4udc8nLLigI1DXPlSR8/lNCeRoSYVRKXLqsfAqELDICFn6jaZvr9MnqvgiGIi6j1b
        6v0XS65uq0uQUjbeoaKovB4FmWzoCzg3CLVwOdWv9adlVMvh0zcyRqzP3NsM9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606238190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=21CneeHv4WjigQFLsDRnBPjDyqomDe8iqs+F8eXUq54=;
        b=5oMOmvZiz3+HJ0TFxE+1+ihsPdEcvXf76vE9EuoLCpFxRMC2ycJ9jAKLjiw2kZYcDmtSfZ
        4t6U78aUx76DFyCQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        LTP List <ltp@lists.linux.it>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        torvalds@linuxfoundation.org, Yang Shi <shy828301@gmail.com>,
        Jan Kara <jack@suse.cz>, Michal Hocko <mhocko@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mel Gorman <mgorman@suse.de>, Song Liu <songliubraving@fb.com>,
        Zi Yan <ziy@nvidia.com>, vtolkm@googlemail.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP:
 zero_user_segments
Message-ID: <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-11-24 18:52:44 [+0530], Naresh Kamboju wrote:
> While running LTP test case access01 the following kernel BUG
> noticed on linux next 20201124 tag kernel on i386.
> 
> git short log:
> ----------------
> git log --oneline next-20201120..next-20201124 -- mm/highmem.c
> d9927d46febf Merge branch 'akpm-current/current'
> 72d22a0d0e86 mm: support THPs in zero_user_segments
> 2a656cad337e mm/highmem: Take kmap_high_get() properly into account
> 
> Please find these easy steps to reproduce the kernel build and boot.

This BUG_ON() is in zero_user_segments() which ash been added in commit
   72d22a0d0e86 mm: support THPs in zero_user_segments

> [   50.852189] kernel BUG at mm/highmem.c:417!

I managed to capture one invocation with:
zero_user_segments(0xd4367a90,
		   0x1000, 0x1000,
		   0x0, 0x50)
page_compound() -> 1
page_size() -> 4096

And at the end it BUGs because end2 is still 0x50.

because:
|         for (i = 0; i < compound_nr(page); i++) {
|                 void *kaddr;
|                 unsigned this_end;
| 
|                 if (end1 == 0 && start2 >= PAGE_SIZE) {
|                         start2 -= PAGE_SIZE;
|                         end2 -= PAGE_SIZE;
|                         continue;
|                 }
| 
|                 if (start1 >= PAGE_SIZE) {
start1 0x1000 is >= PAGE_SIZE.
|                         start1 -= PAGE_SIZE;
|                         end1 -= PAGE_SIZE;
|                         if (start2) {
start2 is 0.
|                                 start2 -= PAGE_SIZE;
|                                 end2 -= PAGE_SIZE;
|                         }
|                         continue;
|                 }

I don't know why the logic for start1/end1 and start2/end2 is coupled
here.  Based on how __block_write_begin_int() invokes it seems to zero
two independent blocks (or it is a bug in caller).
The generic implementation would do nothing for start1/end1 and for
second part if would memset(page + 0, 0, 0x50 - 0).

Sebastian
