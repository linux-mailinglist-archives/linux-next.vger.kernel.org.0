Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC3C228CD5
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 01:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731576AbgGUXqW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 19:46:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:63096 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgGUXqV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 19:46:21 -0400
IronPort-SDR: 9iLPS2wLjZf/hw4nMZR1HRRL1JOE0iccozZDAmbjdCCDkXeWvapJs+f/gqXp46lB7ra63wF7Tm
 o4mV57Lhd7tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="130329721"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; 
   d="scan'208";a="130329721"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2020 16:46:20 -0700
IronPort-SDR: EdUSW0Kroy9pLQvPhnmhLmYYOgpMioJiapWH6En2np7t2X2KTiWSzCwIAxA87FRz5khEkSDYCa
 3ohxscb2IZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; 
   d="scan'208";a="284036759"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga003.jf.intel.com with ESMTP; 21 Jul 2020 16:46:20 -0700
Date:   Tue, 21 Jul 2020 16:46:20 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     linux-mm@kvack.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Subject: Re: [PATCH -next] mm/gup.c: Fix the comment of return value for
 populate_vma_page_range()
Message-ID: <20200721234619.GC643353@iweiny-DESK2.sc.intel.com>
References: <20200720034303.29920-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720034303.29920-1-tangyizhou@huawei.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 20, 2020 at 11:43:03AM +0800, Tang Yizhou wrote:
> The return value of populate_vma_page_range() is consistent with
> __get_user_pages(), and so is the function comment of return value.
> 
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  mm/gup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 2cc5eba44362..a55f1ec712e9 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1386,7 +1386,8 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>   *
>   * This takes care of mlocking the pages too if VM_LOCKED is set.
>   *
> - * return 0 on success, negative error code on error.
> + * Return either number of pages pinned in the vma, or a negative error
> + * code on error.
>   *
>   * vma->vm_mm->mmap_lock must be held.
>   *
> -- 
> 2.17.1
> 
