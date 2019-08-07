Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16A285528
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 23:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387815AbfHGVau (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 17:30:50 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53578 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730138AbfHGVau (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 17:30:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PbeeDf/GkbDllO5vIZWwH/vN3+gHBbe2/YYojgAimx0=; b=c1vU6F8rZNn+E3ApTlYjsvg1P
        Ug4PoVhpJ6YWH6IEnG7+O7qR1NIUhBCqAySSXTzxbt5hvW9DtMLOoyCUzUrY4WwIwVsh9H/Ueojp4
        6xGNrTEAoO2LcDdtWlRLRwgSWR2Eptx/O3w2c5wf9JC4HyCgeSJ/VVRUXP7hZlMpsZSdSD51+2bXg
        bvhUYBtIFDXPkAAWOT0ZUDCp2VSLsrKMertexpLx9gT8tIUBVeiFAzn9/tLZDCXwuClStkXHPajGO
        ck5MvJ8MnbVvObac5sJ6W6f1YbrobQWfaergG4OR+FEeBbcsRR7aKBXZwoXDZ291YZ2rweUV1labv
        U32+ixQuQ==;
Received: from [208.71.200.96] (helo=[172.16.195.104])
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hvTWD-0004Yw-VZ; Wed, 07 Aug 2019 21:30:50 +0000
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
To:     Andrew Morton <akpm@linux-foundation.org>,
        Song Liu <songliubraving@fb.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
References: <20190807183606.372ca1a4@canb.auug.org.au>
 <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
 <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
 <20190807131029.f7f191aaeeb88cc435c6306f@linux-foundation.org>
 <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
 <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <abb5daa5-322e-55e8-a08d-4e938375451f@infradead.org>
Date:   Wed, 7 Aug 2019 14:30:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/7/19 2:27 PM, Andrew Morton wrote:
> On Wed, 7 Aug 2019 21:00:04 +0000 Song Liu <songliubraving@fb.com> wrote:
> 
>>>>
>>>> Shall I resend the patch, or shall I send fix on top of current patch?
>>>
>>> Either is OK.  If the difference is small I will turn it into an
>>> incremental patch so that I (and others) can see what changed.
>>
>> Please find the patch to fix this at the end of this email. It applies 
>> right on top of "khugepaged: enable collapse pmd for pte-mapped THP". 
>> It may conflict a little with the "Enable THP for text section of 
>> non-shmem files" set, which renames function khugepaged_scan_shmem(). 
>>
>> Also, I found v3 of the set in linux-next. The latest is v4:
>>
>> https://lkml.org/lkml/2019/8/2/1587
>> https://lkml.org/lkml/2019/8/2/1588
>> https://lkml.org/lkml/2019/8/2/1589
> 
> It's all a bit confusing.  I'll drop 
> 
> mm-move-memcmp_pages-and-pages_identical.patch
> uprobe-use-original-page-when-all-uprobes-are-removed.patch
> uprobe-use-original-page-when-all-uprobes-are-removed-v2.patch
> mm-thp-introduce-foll_split_pmd.patch
> mm-thp-introduce-foll_split_pmd-v11.patch
> uprobe-use-foll_split_pmd-instead-of-foll_split.patch
> khugepaged-enable-collapse-pmd-for-pte-mapped-thp.patch
> uprobe-collapse-thp-pmd-after-removing-all-uprobes.patch
> 
> Please resolve Oleg's review comments and resend everything.
> 

OK, that will take care of the build error that I am still seeing
when SHMEM is not enabled:

../mm/khugepaged.c:1849:2: note: in expansion of macro ‘BUILD_BUG’
  BUILD_BUG();
  ^~~~~~~~~


-- 
~Randy
