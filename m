Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FA2428CEF
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 14:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbhJKMYJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 08:24:09 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:14325 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbhJKMYJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 08:24:09 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HSd8Z4KrBz8yVD;
        Mon, 11 Oct 2021 20:17:18 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 20:22:07 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 20:22:06 +0800
Message-ID: <5077aa7e-0167-33b6-35f0-0ea7df8f2375@huawei.com>
Date:   Mon, 11 Oct 2021 20:22:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] mm: kasan: Fix redefinition of
 'kasan_populate_early_vm_area_shadow'
Content-Language: en-US
To:     <naresh.kamboju@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     <andreyknvl@gmail.com>, <dvyukov@google.com>, <glider@google.com>,
        <kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-next@vger.kernel.org>,
        <ryabinin.a.a@gmail.com>, <sfr@canb.auug.org.au>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>
References: <CA+G9fYv1Vbc-Y_czipb-z1bG=9axE4R1BztKGqWz-yy=+Wcsqw@mail.gmail.com>
 <20211011123211.3936196-1-wangkefeng.wang@huawei.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211011123211.3936196-1-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2021/10/11 20:32, Kefeng Wang wrote:
> Move kasan_populate_early_vm_area_shadow() from mm/kasan/init.c to
> mm/kasan/shadow.c, make it under CONFIG_KASAN_VMALLOC to fix the
> redefinition issue.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> Hi Andrew,
> Could you help to merge this into previos patch
>   "kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC",
> sorry for the build error.

Correct Andrew's mail.

> 
>   mm/kasan/init.c   | 5 -----
>   mm/kasan/shadow.c | 5 +++++
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index d39577d088a1..cc64ed6858c6 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -279,11 +279,6 @@ int __ref kasan_populate_early_shadow(const void *shadow_start,
>   	return 0;
>   }
>   
> -void __init __weak kasan_populate_early_vm_area_shadow(void *start,
> -						       unsigned long size)
> -{
> -}
> -
>   static void kasan_free_pte(pte_t *pte_start, pmd_t *pmd)
>   {
>   	pte_t *pte;
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 8d95ee52d019..4a4929b29a23 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -254,6 +254,11 @@ core_initcall(kasan_memhotplug_init);
>   
>   #ifdef CONFIG_KASAN_VMALLOC
>   
> +void __init __weak kasan_populate_early_vm_area_shadow(void *start,
> +						       unsigned long size)
> +{
> +}
> +
>   static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>   				      void *unused)
>   {
> 
