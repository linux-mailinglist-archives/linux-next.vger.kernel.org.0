Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEA83CD000
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 11:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhGSIYZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 04:24:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:53499 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235105AbhGSIYY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Jul 2021 04:24:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="232785962"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; 
   d="scan'208,223";a="232785962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2021 01:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; 
   d="scan'208,223";a="468350636"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.146.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2021 01:47:53 -0700
Date:   Mon, 19 Jul 2021 16:47:52 +0800
From:   Feng Tang <feng.tang@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Ben Widawsky <ben.widawsky@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210719084752.GA51285@shbuild999.sh.intel.com>
References: <20210719175203.2152c54b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20210719175203.2152c54b@canb.auug.org.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

On Mon, Jul 19, 2021 at 05:52:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (i386
> defconfig) produced this warning:
> 
> mm/hugetlb.c: In function 'dequeue_huge_page_vma':
> mm/hugetlb.c:1180:1: warning: label 'check_reserve' defined but not used [-Wunused-label]
>  1180 | check_reserve:
>       | ^~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   df178183cf05 ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")

Thanks for the report!

The below patch should fix it (Also attached).

Andrew,

Could you help to fold it to the 4/6 of patchset of "introducing
multi-preference memplicy":
  [PATCH v6 4/6] mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY 

Thanks!

- Feng

--------------------------------8<-----------------------------------

From 4d3b4b0037bf4e1eacae4886387ffe4af90f5a1f Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Mon, 19 Jul 2021 16:24:23 +0800
Subject: [PATCH] mm/hugetlb: fix compile warning for !CONFIG_NUMA build

Stephen Rothwell reported the i386 build with CONFIG_NUMA=n
will have a warning:

mm/hugetlb.c: In function 'dequeue_huge_page_vma':
mm/hugetlb.c:1180:1: warning: label 'check_reserve' defined but not used [-Wunused-label]
 1180 | check_reserve:
       | ^~~~~~~~~~~~~

introduced by commit
    df178183cf05 ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")

Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ae1a39e11bcf..528947da65c8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1177,7 +1177,9 @@ static struct page *dequeue_huge_page_vma(struct hstate *h,
 #endif
 	page = dequeue_huge_page_nodemask(h, gfp_mask, nid, nodemask);
 
+#ifdef CONFIG_NUMA
 check_reserve:
+#endif
 	if (page && !avoid_reserve && vma_has_reserves(vma, chg)) {
 		SetHPageRestoreReserve(page);
 		h->resv_huge_pages--;
-- 
2.7.4


> -- 
> Cheers,
> Stephen Rothwell



--rwEMma7ioTxnRzrJ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-mm-hugetlb-fix-compile-warning-for-CONFIG_NUMA-build.patch"

From 4d3b4b0037bf4e1eacae4886387ffe4af90f5a1f Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Mon, 19 Jul 2021 16:24:23 +0800
Subject: [PATCH] mm/hugetlb: fix compile warning for !CONFIG_NUMA build

Stephen Rothwell reported the i386 build with CONFIG_NUMA=n
will have a warning:

mm/hugetlb.c: In function 'dequeue_huge_page_vma':
mm/hugetlb.c:1180:1: warning: label 'check_reserve' defined but not used [-Wunused-label]
 1180 | check_reserve:
       | ^~~~~~~~~~~~~

introduced by commit
    df178183cf05 ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")

Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ae1a39e11bcf..528947da65c8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1177,7 +1177,9 @@ static struct page *dequeue_huge_page_vma(struct hstate *h,
 #endif
 	page = dequeue_huge_page_nodemask(h, gfp_mask, nid, nodemask);
 
+#ifdef CONFIG_NUMA
 check_reserve:
+#endif
 	if (page && !avoid_reserve && vma_has_reserves(vma, chg)) {
 		SetHPageRestoreReserve(page);
 		h->resv_huge_pages--;
-- 
2.7.4


--rwEMma7ioTxnRzrJ--
