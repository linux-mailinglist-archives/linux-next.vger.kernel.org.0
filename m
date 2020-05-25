Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D985E1E13FA
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 20:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbgEYSSs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 14:18:48 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15068 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387644AbgEYSSr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 14:18:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ecc0bfb0000>; Mon, 25 May 2020 11:18:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 25 May 2020 11:18:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 25 May 2020 11:18:47 -0700
Received: from [10.2.58.199] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 May
 2020 18:18:47 +0000
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michel Lespinasse <walken@google.com>
References: <20200525221700.0aa347f7@canb.auug.org.au>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <4e1d8a9d-e308-df6a-6921-dbbe8d5f8389@nvidia.com>
Date:   Mon, 25 May 2020 11:18:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200525221700.0aa347f7@canb.auug.org.au>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590430715; bh=B44ZR8YbjlxZaVO8MV90cF+K5/pLr/M0ZkZHcJrr5JU=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Chwl/QQxWSGf/T6mUMGZUo+dcs0yENwHSyinp5sOP7wXPjA+WAQ5/C+7JSw8a3qW6
         fy1IZHRHRsTO6uHbr8wm1w6PW0cp4tEZ4Fn6MCK7JnqIMZgsvfjfh+46e8tuoh5U9Y
         WuSVqIOkW3A7EN5pWAW9ZPZanPCzeMRcJKz5Oc8daChIpVKFzadnBcuON+SsDDAKFe
         Hv6Rn1ScfdEMhf+syHvLggwSZhtX3IsSQcrp9+TEnRSTiQDarjiHst07JMYpB3rEKX
         iN4hnK2uFX3tyqt1c05Q4XoljYiyi7HLEtaFSe+TO/v/fQOxVcZ1sVmBUxD60l2YQU
         kLtOD1lUxtE+Q==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-05-25 05:17, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/kernel.h:14,
>                   from mm/gup.c:2:
> mm/gup.c: In function 'internal_get_user_pages_fast':
> mm/gup.c:2732:33: error: 'struct mm_struct' has no member named 'mmap_sem'; did you mean 'mmap_base'?
>   2732 |   might_lock_read(&current->mm->mmap_sem);
>        |                                 ^~~~~~~~
> 
> Caused by commit
> 
>    64fe66e8a95e ("mmap locking API: rename mmap_sem to mmap_lock")
> 
> fron the akpm tree interacting with commit
> 
>    b1fc8b5ddb4e ("mm/gup: might_lock_read(mmap_sem) in get_user_pages_fast()")
> 
> from the akpm-current tree.
> 
> I added the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 25 May 2020 22:11:51 +1000
> Subject: [PATCH] mm/gup: update for mmap_sem rename
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   mm/gup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 8977e5fe9843..f4bca3de0b4b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2729,7 +2729,7 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
>   		return -EINVAL;
>   
>   	if (!(gup_flags & FOLL_FAST_ONLY))
> -		might_lock_read(&current->mm->mmap_sem);
> +		might_lock_read(&current->mm->mmap_lock);
>   
>   	start = untagged_addr(start) & PAGE_MASK;
>   	addr = start;
> 

Yes, looks good. And in fact, Andrew has the same fix-up in the mmotm branch of
linux-next.git, as

     commit a76c281a8ddd ("mmap-locking-api-rename-mmap_sem-to-mmap_lock-fix").


thanks,
-- 
John Hubbard
NVIDIA
