Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53D5FE895
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2019 00:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfKOXXy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 18:23:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:42844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbfKOXXx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 18:23:53 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE42F20723;
        Fri, 15 Nov 2019 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573860233;
        bh=qEh58BqZVlm+rp435shTS4kKffBi1wM1NZ2V9oKQszM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mm6SxCtPgz7h9gZIvZBsR//MAajPs0XFFhciPdnLsjUI+HGVploHuFYjA+C9OskS4
         HLuTxPJIoHEJ+qmtxJxT9SUpgK7nA1IRnw6w+AI8873/m21TLGIvxNbyIUuT58BdxW
         nLKC6OfiiKAKfpovb6oeE7tYKRMFO1vKbi5itFZU=
Date:   Fri, 15 Nov 2019 15:23:52 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>, Qian Cai <cai@lca.pw>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-Id: <20191115152352.ddc9539e80b0840d82c7e2db@linux-foundation.org>
In-Reply-To: <20191115181957.4e72c0a2@canb.auug.org.au>
References: <20191115181957.4e72c0a2@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 15 Nov 2019 18:19:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> [Also reported by Randy Dunlap]
> 
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> mm/vmalloc.c: In function '__purge_vmap_area_lazy':
> mm/vmalloc.c:1286:8: error: 'SHARED_KERNEL_PMD' undeclared (first use in this function)
>  1286 |   if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
>       |        ^~~~~~~~~~~~~~~~~
> mm/vmalloc.c:1286:8: note: each undeclared identifier is reported only once for each function it appears in
> mm/vmalloc.c:1286:29: error: implicit declaration of function 'boot_cpu_has' [-Werror=implicit-function-declaration]
>  1286 |   if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
>       |                             ^~~~~~~~~~~~
> mm/vmalloc.c:1286:42: error: 'X86_FEATURE_PTI' undeclared (first use in this function)
>  1286 |   if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
>       |                                          ^~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   07ef40e149bf ("mm-vmalloc-fix-regression-caused-by-needless-vmalloc_sync_all-fix")
> 
> SHARED_KERNEL_PMD, boot_cpu_has() and X86_FEATURE_PTI are only defined
> for X86.
> 
> I have reverted that commit for today.

Thanks.  So it has to be an ifdef.

--- a/mm/vmalloc.c~mm-vmalloc-fix-regression-caused-by-needless-vmalloc_sync_all-fix-fix
+++ a/mm/vmalloc.c
@@ -1255,17 +1255,17 @@ static bool __purge_vmap_area_lazy(unsig
 	if (unlikely(valist == NULL))
 		return false;
 
-	if (IS_ENABLED(CONFIG_X86_PAE)) {
-		/*
-		 * First make sure the mappings are removed from all page-tables
-		 * before they are freed.
-		 *
-		 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which
-		 * is the case on a PAE kernel with PTI enabled.
-		 */
-		if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
-			vmalloc_sync_all();
-	}
+#ifdef CONFIG_X86_PAE
+	/*
+	 * First make sure the mappings are removed from all pagetables before
+	 * they are freed.
+	 *
+	 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which is the
+	 * case on a PAE kernel with PTI enabled.
+	 */
+	if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
+		vmalloc_sync_all();
+#endif
 
 	/*
 	 * TODO: to calculate a flush range without looping.
_

