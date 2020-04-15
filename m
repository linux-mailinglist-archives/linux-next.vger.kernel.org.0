Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705021AABF8
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 17:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414715AbgDOPeb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 11:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731298AbgDOPe3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 11:34:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA20C061A0C;
        Wed, 15 Apr 2020 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=k93jWTHKWpFEN4F9SAvfEChcPWYMd81tShHsmAijNZM=; b=nDe1C43qgxEOthZ67P6sU4NyQv
        zE92U1Iyh0Rp3KjlFj5uRvTGHFP9dO/SsV4ELkffAtS7uHTfK4LXyyNBrdDAeSjPgUCPahiDm7wKn
        WjfthkaM/NbPOS04qn47WarfifXSDfKorWU4Ze1oE0qPrHn5Mm9dbgc/1PJgoxZTxHDNZRu7oKnED
        mthpJ086zvdIrp9FzDSJoQYOAfswJgQ9WEJXWPXXCxFlRB7NGRE/FdVevvVqMlf+WSoMu7hqmw2cN
        K84Vewnr1SqfXYr1kV28cHEqNCstQwQCjvpIOLfOGEyWotcBHuyCtbj/wSXtXox/qbZKzwUw88LQG
        rKvA8fGg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOk3X-0002Tz-VE; Wed, 15 Apr 2020 15:34:28 +0000
Subject: Re: linux-next: Tree for Apr 14 (mm/shmem.c)
To:     Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
References: <20200414123900.4f97a83f@canb.auug.org.au>
 <200c608a-8159-18ce-b44e-cad2022e23e2@infradead.org>
 <20200414182430.c5af29ddb1735f5fd0083983@linux-foundation.org>
 <alpine.LSU.2.11.2004142339170.10035@eggly.anvils>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c1ea321f-b0f3-5ec3-3af8-8bf545a6462c@infradead.org>
Date:   Wed, 15 Apr 2020 08:34:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.11.2004142339170.10035@eggly.anvils>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/14/20 11:54 PM, Hugh Dickins wrote:
> On Tue, 14 Apr 2020, Andrew Morton wrote:
>> On Tue, 14 Apr 2020 07:18:01 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 4/13/20 7:39 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20200413:
>>>>
>>>> New tree: mhi
>>>>
>>>> My fixes tree contains:
>>>>
>>>>   6b038bdcd3d1 sh: mm: Fix build error
>>>>
>>>> Non-merge commits (relative to Linus' tree): 1154
>>>>  1160 files changed, 31764 insertions(+), 13498 deletions(-)
>>>>
>>>> ----------------------------------------------------------------------------
>>>
>>> on x86_64:
>>> # CONFIG_TRANSPARENT_HUGEPAGE is not set
>>
>> Thanks.  hm, this took a long time to be discovered.
>>
>>> In file included from ../include/linux/export.h:43:0,
>>>                  from ../include/linux/linkage.h:7,
>>>                  from ../include/linux/fs.h:5,
>>>                  from ../mm/shmem.c:24:
>>> ../mm/shmem.c: In function ‘shmem_undo_range’:
> ...
>>> ../mm/shmem.c:961:26: note: in expansion of macro ‘HPAGE_PMD_NR’
>>>           round_up(start, HPAGE_PMD_NR))
>>>                           ^~~~~~~~~~~~
>>
>> That's
>> 					if (index <
>> 					    round_up(start, HPAGE_PMD_NR))
>> 						start = index + 1;
>>
>> from Hugh's 71725ed10c40696 ("mm: huge tmpfs: try to split_huge_page()
>> when punching hole").
> 
> Sorry about that.  Yes, odd that it should only hit now: the false
> PageTransCompound in shmem_punch_compound() has always been good
> enough to handle it for me, but maybe Randy is trying a less able
> compiler, or maybe unrelated changes in linux-next have just made
> it harder for the compiler to see the optimization.
> 
> I hope the patch below fixes it?
> 
> [PATCH] mm/shmem: fix build without THP
> 
> Some optimizers don't notice that shmem_punch_compound() is always true
> (PageTransCompound() being false) without CONFIG_TRANSPARENT_HUGEPAGE=y:
> use IS_ENABLED to help them to avoid the BUILD_BUG inside HPAGE_PMD_NR.
> 
> Fixes: 71725ed10c40 ("mm: huge tmpfs: try to split_huge_page() when punching hole")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hugh Dickins <hughd@google.com>

Works for me, using gcc 7.5.0.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
> 
>  mm/shmem.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- 5.7-rc1/mm/shmem.c	2020-04-11 12:58:26.415524805 -0700
> +++ linux/mm/shmem.c	2020-04-14 23:20:25.517656174 -0700
> @@ -952,7 +952,7 @@ static void shmem_undo_range(struct inod
>  				VM_BUG_ON_PAGE(PageWriteback(page), page);
>  				if (shmem_punch_compound(page, start, end))
>  					truncate_inode_page(mapping, page);
> -				else {
> +				else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>  					/* Wipe the page and don't get stuck */
>  					clear_highpage(page);
>  					flush_dcache_page(page);
> 


-- 
~Randy
