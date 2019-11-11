Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD0F5F71CC
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 11:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfKKKYm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 05:24:42 -0500
Received: from ozlabs.org ([203.11.71.1]:40197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbfKKKYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 05:24:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47BRnf3TZDz9sPV;
        Mon, 11 Nov 2019 21:24:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573467878;
        bh=k/xW7ZDPcv3/7SjHYmJJY6IalclKd1sGAGRnLtXIecw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bhNAzQJrclPVlWTt6hTGJJf0ngOZ5aAKiJ4pS0Ks1QYOCKkp3bCijwsKkYq+MnG3u
         JPogPyIGXRX91Ao/L1wY6GRqUKfsTxT6iHNNTyFbauE3q2Wqf+qEs9t6ouXCthXwIG
         56FuglLyylXLliWe9PlWQ+f1SOew5mFOGSR5KE8JrUxHBKBHVlzhcViIYy61f2aqeB
         g4oqZYgD4Fm6Sp0qnHXV5MZv+yuiWbsdSPIhx3ICAPQSXvN5GiG4mwPVPeo5D3zsoc
         pnYnVdZaZcsXIeHDVc74mMAAq4nIQvZxBzEpkoDmib005ZVmYkaigwBi4sbOMnq0Ft
         nYo0aCM/0r7Sw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mm\@kvack.org" <linux-mm@kvack.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
In-Reply-To: <0892a018-152f-629d-3dd0-60ce79f2887b@oracle.com>
References: <20191105211920.787df2ab@canb.auug.org.au> <0892a018-152f-629d-3dd0-60ce79f2887b@oracle.com>
Date:   Mon, 11 Nov 2019 21:24:31 +1100
Message-ID: <871rue4so0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mike,

Mike Kravetz <mike.kravetz@oracle.com> writes:
> On 11/5/19 2:19 AM, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the akpm-current tree, today's linux-next build (powerpc64
>> allnoconfig) failed like this:
>> 
>> In file included from arch/powerpc/mm/mem.c:30:
>> include/linux/hugetlb.h:233:19: error: redefinition of 'pmd_huge'
>>   233 | static inline int pmd_huge(pmd_t pmd)
>>       |                   ^~~~~~~~
>> In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:301,
>>                  from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
>>                  from arch/powerpc/include/asm/book3s/64/mmu.h:46,
>>                  from arch/powerpc/include/asm/mmu.h:356,
>>                  from arch/powerpc/include/asm/lppaca.h:47,
>>                  from arch/powerpc/include/asm/paca.h:17,
>>                  from arch/powerpc/include/asm/current.h:13,
>>                  from include/linux/sched.h:12,
>>                  from arch/powerpc/mm/mem.c:16:
>> arch/powerpc/include/asm/book3s/64/pgtable-4k.h:74:19: note: previous definition of 'pmd_huge' was here
>>    74 | static inline int pmd_huge(pmd_t pmd) { return 0; }
>>       |                   ^~~~~~~~
...
>
> Hello Michael,
>
> When I started to look into this I noticed that you added commit aad71e3928be
> ("powerpc/mm: Fix build break with RADIX=y & HUGETLBFS=n") some time back.
> It appears that all other architectures get the definition of pmd_huge and
> pud_huge from <linux/hugetlb.h> in the !CONFIG_HUGETLB_PAGE case.  Previously,
> this was not an issue as the #define pmd_huge/pud_huge did not conflict with
> the static inline in the powerpc header files.  The conflicts above happened
> when I converted the macros to also be static inlines.  Could you live with
> a patch like the following to remove the stubs from powerpc header files and
> fix your original build break by including  <linux/hugetlb.h>?  After the
> below patch is applied, the above commit will not cause the build errors seen
> in linux-next.

As long as the end result is the same, ie. we get an empty definition
that always returns false then yeah that's fine by me.

> From 4b3ab017e639e4e583fff801e6d8e6727b7877e8 Mon Sep 17 00:00:00 2001
> From: Mike Kravetz <mike.kravetz@oracle.com>
> Date: Tue, 5 Nov 2019 15:12:15 -0800
> Subject: [PATCH] powerpc/mm: remove pmd_huge/pud_huge stubs and include
>  hugetlb.h
>
> This removes the power specific stubs created by commit aad71e3928be
> ("powerpc/mm: Fix build break with RADIX=y & HUGETLBFS=n") used when
> !CONFIG_HUGETLB_PAGE.  Instead, it addresses the build break by
> getting the definitions from <linux/hugetlb.h>.
>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable-4k.h  | 3 ---
>  arch/powerpc/include/asm/book3s/64/pgtable-64k.h | 3 ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c         | 1 +
>  3 files changed, 1 insertion(+), 6 deletions(-)

The two pgtable headers are included eventually by our top-level
pgtable.h, and that is included by over 100 files. So I worry this is
going to break the build somewhere in some obscure configuration.

I'll push it through some test builds and see what happens.

cheers
