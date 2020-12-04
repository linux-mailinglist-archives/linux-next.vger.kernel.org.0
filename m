Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9462CEEF0
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 14:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgLDNo2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 08:44:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49614 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725920AbgLDNo1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 08:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607089380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZfQGskU83155DSgsYSZ/2dOE4Ct0UDii1sEzk+YJuWo=;
        b=cbZL9sCtNJyuxktSm7UHDiwku0wYZLH2la/XDNMA5TI5waDOBq09CLntjiHK6Y2u/HGqoS
        NcbagYrGVw4zIDSWJytqlNUoFGfJOJjw+DhzPNZZaZRnyEGqo5H/C2bFO8XigxVEOFfPXC
        VAbryBdZTEmbahgCC4M6mf38UfAAlCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-tFlUOugLPRafIAXiV0Ybkg-1; Fri, 04 Dec 2020 08:42:57 -0500
X-MC-Unique: tFlUOugLPRafIAXiV0Ybkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615121005504;
        Fri,  4 Dec 2020 13:42:55 +0000 (UTC)
Received: from ovpn-66-66.rdu2.redhat.com (unknown [10.10.67.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B5AD17F6D;
        Fri,  4 Dec 2020 13:42:52 +0000 (UTC)
Message-ID: <a5bc444ec40a2248009d0894fda61b822d030235.camel@redhat.com>
Subject: Re: [PATCH] mm/memblock:use a more appropriate order calculation
 when free memblock pages
From:   Qian Cai <qcai@redhat.com>
To:     carver4lio@163.com, rppt@kernel.org
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Hailong Liu <liu.hailong6@zte.com.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Fri, 04 Dec 2020 08:42:52 -0500
In-Reply-To: <20201203152311.5272-1-carver4lio@163.com>
References: <20201203152311.5272-1-carver4lio@163.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2020-12-03 at 23:23 +0800, carver4lio@163.com wrote:
> From: Hailong Liu <liu.hailong6@zte.com.cn>
> 
> When system in the booting stage, pages span from [start, end] of a memblock
> are freed to buddy in a order as large as possible (less than MAX_ORDER) at
> first, then decrease gradually to a proper order(less than end) in a loop.
> 
> However, *min(MAX_ORDER - 1UL, __ffs(start))* can not get the largest order
> in some cases.
> Instead, *__ffs(end - start)* may be more appropriate and meaningful.
> 
> Signed-off-by: Hailong Liu <liu.hailong6@zte.com.cn>

Reverting this commit on the top of today's linux-next fixed boot crashes on
multiple NUMA systems.

[    5.050736][    T0] flags: 0x3fffc000000000()
[    5.055103][    T0] raw: 003fffc000000000 ffffea0000000448 ffffea0000000448 0000000000000000
[    5.063572][    T0] raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[    5.072045][    T0] page dumped because: VM_BUG_ON_PAGE(pfn & ((1 << order) - 1))
[    5.079580][    T0] ------------[ cut here ]------------
[    5.084883][    T0] kernel BUG at mm/page_alloc.c:1015!
[    5.090151][    T0] invalid opcode: 0000 [#1] SMP KASAN NOPTI
[    5.095894][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc6-next-20201204+ #11
[    5.104099][    T0] Hardware name: HPE ProLiant DL385 Gen10/ProLiant DL385 Gen10, BIOS A40 07/10/2019
[    5.113370][    T0] RIP: 0010:__free_one_page+0xa19/0x1140
[    5.118864][    T0] Code: d2 e9 69 f6 ff ff 0f 0b 48 c7 c6 e0 52 2d a5 4c 89 ff e8 7a 98 f8 ff 0f 0b 0f 0b 48 c7 c6 60 53 2d a5 4c 89 ff e8 67 98 f8 ff <0f> 0b 48 c7 c6 c0 53 2d a5 4c 89 ff e8 56 98 f8 ff 0f 0b 48 89 da
[    5.138427][    T0] RSP: 0000:ffffffffa5807c30 EFLAGS: 00010086
[    5.144367][    T0] RAX: 0000000000000000 RBX: 0000000000000008 RCX: ffffffffa3c4abf4
[    5.152228][    T0] RDX: 1ffffd400000008f RSI: 0000000000000000 RDI: ffffea0000000478
[    5.160091][    T0] RBP: 0000000000000007 R08: fffffbfff5918fc5 R09: fffffbfff5918fc5
[    5.167951][    T0] R10: ffffffffac8c7e23 R11: fffffbfff5918fc4 R12: 0000000000000000
[    5.175815][    T0] R13: 0000000000000003 R14: ffff88887fff6000 R15: ffffea0000000440
[    5.183677][    T0] FS:  0000000000000000(0000) GS:ffff88881e800000(0000) knlGS:0000000000000000
[    5.192499][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.198963][    T0] CR2: ffff88907efff000 CR3: 0000000ce3e14000 CR4: 00000000000406b0
[    5.206823][    T0] Call Trace:
[    5.209978][    T0]  ? rwlock_bug.part.1+0x90/0x90
[    5.214774][    T0]  free_one_page+0x7e/0x1e0
[    5.219142][    T0]  __free_pages_ok+0x646/0x13b0
[    5.223863][    T0]  memblock_free_all+0x21c/0x2c0
(inlined by) __free_memory_core at mm/memblock.c:2037
(inlined by) free_low_memory_core_early at mm/memblock.c:2060
(inlined by) memblock_free_all at mm/memblock.c:2100
[    5.228662][    T0]  ? reset_all_zones_managed_pages+0x9a/0x9a
[    5.234515][    T0]  ? memblock_alloc_try_nid+0xe6/0x127
[    5.239842][    T0]  ? memblock_alloc_try_nid_raw+0x12a/0x12a
[    5.245610][    T0]  ? early_amd_iommu_init+0x1e1f/0x1e1f
[    5.251024][    T0]  ? iommu_go_to_state+0x24/0x28
[    5.255831][    T0]  mem_init+0x1a/0x350
[    5.259762][    T0]  mm_init+0x5f/0x87
[    5.263515][    T0]  start_kernel+0x14c/0x3a7
[    5.267882][    T0]  ? copy_bootdata+0x19/0x47
[    5.272340][    T0]  secondary_startup_64_no_verify+0xc2/0xcb
[    5.278102][    T0] Modules linked in:
[    5.281869][    T0] random: get_random_bytes called from print_oops_end_marker+0x26/0x40 with crng_init=0
[    5.281878][    T0] ---[ end trace 32dd7228cc16af82 ]---
[    5.296795][    T0] RIP: 0010:__free_one_page+0xa19/0x1140
[    5.302299][    T0] Code: d2 e9 69 f6 ff ff 0f 0b 48 c7 c6 e0 52 2d a5 4c 89 ff e8 7a 98 f8 ff 0f 0b 0f 0b 48 c7 c6 60 53 2d a5 4c 89 ff e8 67 98 f8 ff <0f> 0b 48 c7 c6 c0 53 2d a5 4c 89 ff e8 56 98 f8 ff 0f 0b 48 89 da
[    5.321864][    T0] RSP: 0000:ffffffffa5807c30 EFLAGS: 00010086
[    5.327803][    T0] RAX: 0000000000000000 RBX: 0000000000000008 RCX: ffffffffa3c4abf4
[    5.335665][    T0] RDX: 1ffffd400000008f RSI: 0000000000000000 RDI: ffffea0000000478
[    5.343526][    T0] RBP: 0000000000000007 R08: fffffbfff5918fc5 R09: fffffbfff5918fc5
[    5.351389][    T0] R10: ffffffffac8c7e23 R11: fffffbfff5918fc4 R12: 0000000000000000
[    5.359249][    T0] R13: 0000000000000003 R14: ffff88887fff6000 R15: ffffea0000000440
[    5.367110][    T0] FS:  0000000000000000(0000) GS:ffff88881e800000(0000) knlGS:0000000000000000
[    5.375932][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.382397][    T0] CR2: ffff88907efff000 CR3: 0000000ce3e14000 CR4: 00000000000406b0
[    5.390261][    T0] Kernel panic - not syncing: Fatal exception
[    5.396320][    T0] ---[ end Kernel panic - not syncing: Fatal exception ]---

> ---
>  mm/memblock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index b68ee8678..7c6d0dde7 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1931,7 +1931,7 @@ static void __init __free_pages_memory(unsigned long
> start, unsigned long end)
>  	int order;
>  
>  	while (start < end) {
> -		order = min(MAX_ORDER - 1UL, __ffs(start));
> +		order = min(MAX_ORDER - 1UL, __ffs(end - start));
>  
>  		while (start + (1UL << order) > end)
>  			order--;

