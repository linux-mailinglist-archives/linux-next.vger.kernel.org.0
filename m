Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089CD17B171
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 23:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCEWaF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 17:30:05 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3237 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgCEWaF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 17:30:05 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e617d420001>; Thu, 05 Mar 2020 14:29:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 05 Mar 2020 14:30:04 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 05 Mar 2020 14:30:04 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Mar
 2020 22:30:03 +0000
Subject: Re: [PATCH v3 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <jack@suse.cz>, <kirill@shutemov.name>
CC:     <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Will Deacon <will@kernel.org>
References: <20200304130655.462517-1-imbrenda@linux.ibm.com>
 <20200304130655.462517-3-imbrenda@linux.ibm.com>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <f58b6839-5233-5ccf-1f1d-60b3b8aaf417@nvidia.com>
Date:   Thu, 5 Mar 2020 14:30:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304130655.462517-3-imbrenda@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583447362; bh=AIy2F0cXJ6vERrZGXDyU4ocJ5/9VuGMIm2jFeH0zjLU=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=AAq6QJXIsjboZ/XB07RxXDRGm5iG+3TzRkSS7LAYrsQMUZXHbrR8PgbK0uhKdMVQq
         c/BjYVCVwNfY0gGGWH7GclhFlaw0CPg+WeFFXWgFB2fYoG8If0fH3eL8uiC9tBfV7E
         +uTz9fGnxPZVG/49xXQ8aPaO0n6kFuPYry23/BrY9KT2E0CvNFvsK1qr/kbLmIu99z
         bfskLayB2MtSXEDL3LGAi+M9h50IJs1z+0wWqkmHN0yCrxTE9kgsPFJgceOjg/9pII
         fPw5iHdg+VlGfC/KBkmyFmjxfHGEwhQ+QH+wHWRcaYqP3nn+6YoUDjK8jO47/7kgGM
         lLtLDZKfB4JJw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/4/20 5:06 AM, Claudio Imbrenda wrote:
> With the introduction of protected KVM guests on s390 there is now a
> concept of inaccessible pages. These pages need to be made accessible
> before the host can access them.
> 
> While cpu accesses will trigger a fault that can be resolved, I/O
> accesses will just fail.  We need to add a callback into architecture
> code for places that will do I/O, namely when writeback is started or
> when a page reference is taken.
> 
> This is not only to enable paging, file backing etc, it is also
> necessary to protect the host against a malicious user space.  For
> example a bad QEMU could simply start direct I/O on such protected
> memory.  We do not want userspace to be able to trigger I/O errors and
> thus the logic is "whenever somebody accesses that page (gup) or does
> I/O, make sure that this page can be accessed".  When the guest tries
> to access that page we will wait in the page fault handler for
> writeback to have finished and for the page_ref to be the expected
> value.
> 
> On s390x the function is not supposed to fail, so it is ok to use a
> WARN_ON on failure. If we ever need some more finegrained handling
> we can tackle this when we know the details.
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> Acked-by: Will Deacon <will@kernel.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  include/linux/gfp.h |  6 ++++++
>  mm/gup.c            | 30 +++++++++++++++++++++++++++---
>  mm/page-writeback.c |  5 +++++
>  3 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index e5b817cb86e7..be2754841369 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -485,6 +485,12 @@ static inline void arch_free_page(struct page *page, int order) { }
>  #ifndef HAVE_ARCH_ALLOC_PAGE
>  static inline void arch_alloc_page(struct page *page, int order) { }
>  #endif
> +#ifndef HAVE_ARCH_MAKE_PAGE_ACCESSIBLE
> +static inline int arch_make_page_accessible(struct page *page)
> +{
> +	return 0;
> +}
> +#endif
>  
>  struct page *
>  __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
> diff --git a/mm/gup.c b/mm/gup.c
> index 81a95fbe9901..d0c4c6f336bb 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -413,6 +413,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	struct page *page;
>  	spinlock_t *ptl;
>  	pte_t *ptep, pte;
> +	int ret;
>  
>  	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
>  	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> @@ -471,8 +472,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		if (is_zero_pfn(pte_pfn(pte))) {
>  			page = pte_page(pte);
>  		} else {
> -			int ret;
> -
>  			ret = follow_pfn_pte(vma, address, ptep, flags);
>  			page = ERR_PTR(ret);
>  			goto out;
> @@ -480,7 +479,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	}
>  
>  	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
> -		int ret;
>  		get_page(page);
>  		pte_unmap_unlock(ptep, ptl);
>  		lock_page(page);
> @@ -497,6 +495,19 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		page = ERR_PTR(-ENOMEM);
>  		goto out;
>  	}
> +	/*
> +	 * We need to make the page accessible if and only if we are going
> +	 * to access its content (the FOLL_PIN case).  Please see
> +	 * Documentation/core-api/pin_user_pages.rst for details.
> +	 */
> +	if (flags & FOLL_PIN) {
> +		ret = arch_make_page_accessible(page);
> +		if (ret) {
> +			unpin_user_page(page);
> +			page = ERR_PTR(ret);
> +			goto out;
> +		}
> +	}
>  	if (flags & FOLL_TOUCH) {
>  		if ((flags & FOLL_WRITE) &&
>  		    !pte_dirty(pte) && !PageDirty(page))
> @@ -2162,6 +2173,19 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>  
>  		VM_BUG_ON_PAGE(compound_head(page) != head, page);
>  
> +		/*
> +		 * We need to make the page accessible if and only if we are
> +		 * going to access its content (the FOLL_PIN case).  Please
> +		 * see Documentation/core-api/pin_user_pages.rst for
> +		 * details.
> +		 */
> +		if (flags & FOLL_PIN) {
> +			ret = arch_make_page_accessible(page);
> +			if (ret) {
> +				unpin_user_page(page);
> +				goto pte_unmap;
> +			}
> +		}
>  		SetPageReferenced(page);
>  		pages[*nr] = page;
>  		(*nr)++;
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index ab5a3cee8ad3..8384be5a2758 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2807,6 +2807,11 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
>  		inc_zone_page_state(page, NR_ZONE_WRITE_PENDING);
>  	}
>  	unlock_page_memcg(page);
> +	/*
> +	 * If writeback has been triggered on a page that cannot be made
> +	 * accessible, it is too late.
> +	 */
> +	WARN_ON(arch_make_page_accessible(page));

Hi,

Sorry for not commenting on this earlier. After looking at this a bit, I think a tiny 
tweak would be helpful, because:

a) WARN_ON() is a big problem for per-page issues, because, like ants, pages are prone to
   show up in large groups. And a warning and backtrace for each such page can easily
   bring a system to a crawl.

b) Based on your explanation of how this works, what your situation really seems to call
   for is the standard "crash hard in DEBUG builds, in order to keep developers out of
   trouble, but continue on in non-DEBUG builds".

So maybe you'd be better protected with this instead:

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index ab5a3cee8ad3..b7f3d0766a5f 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2764,7 +2764,7 @@ int test_clear_page_writeback(struct page *page)
 int __test_set_page_writeback(struct page *page, bool keep_write)
 {
        struct address_space *mapping = page_mapping(page);
-       int ret;
+       int ret, access_ret;
 
        lock_page_memcg(page);
        if (mapping && mapping_use_writeback_tags(mapping)) {
@@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
                inc_zone_page_state(page, NR_ZONE_WRITE_PENDING);
        }
        unlock_page_memcg(page);
+       access_ret = arch_make_page_accessible(page);
+       /*
+        * If writeback has been triggered on a page that cannot be made
+        * accessible, it is too late to recover here.
+        */
+       VM_BUG_ON_PAGE(access_ret != 0, page);
+
        return ret;
 
 }

Assuming that's acceptable, you can add:

      Reviewed-by: John Hubbard <jhubbard@nvidia.com>

to the updated patch.  

thanks,
-- 
John Hubbard
NVIDIA

>  	return ret;
>  
>  }
> 
