Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BBE1770A9
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 09:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbgCCICj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 03:02:39 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7943 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgCCICj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 03:02:39 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5e0ef50000>; Tue, 03 Mar 2020 00:01:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 03 Mar 2020 00:02:37 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 03 Mar 2020 00:02:37 -0800
Received: from [10.2.160.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Mar
 2020 08:02:37 +0000
Subject: Re: [PATCH v2 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <jack@suse.cz>, <kirill@shutemov.name>
CC:     <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Will Deacon <will@kernel.org>
References: <20200303002506.173957-1-imbrenda@linux.ibm.com>
 <20200303002506.173957-3-imbrenda@linux.ibm.com>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <99903e77-7720-678e-35c5-6eb9e35e7fcb@nvidia.com>
Date:   Mon, 2 Mar 2020 23:59:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303002506.173957-3-imbrenda@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583222517; bh=1iSbjST0XUCdE0peAn1uo5SihBMXldFyp2pYk6xzoPw=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=I+swJmrz555GiMwUtMsejt//bN6PjQVEusk2hVU5+0QN6bb0Wk1vudXwxLP/Ml7fi
         v5mVXZ0iDl36dU94E95yZA6CFrjauEgYjZttCFtAZa5vHBgFm4NvYR3QOnzI7vsnw7
         nnXockUGygUl6fqTmLWbghOWgQSHuYn0dR1rwhO/J6uIVeS5UlKjhbygj28KhIMTTA
         fN9rLOepuaFAkyxhK+OmLufBPdALeLuSgB6rfYEO9DmxH0XPFEnVrYNTPegFCMi/vM
         bvzcQytHqKkmlAlGAISTcptf5WoNzNlL2HLzcJnwB4SdXyfhcUetyoQdmLQaO7+VXM
         86kTOh2b+eAjQ==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/2/20 4:25 PM, Claudio Imbrenda wrote:
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
>   include/linux/gfp.h |  6 ++++++
>   mm/gup.c            | 27 ++++++++++++++++++++++++---
>   mm/page-writeback.c |  5 +++++
>   3 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index e5b817cb86e7..be2754841369 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -485,6 +485,12 @@ static inline void arch_free_page(struct page *page, int order) { }
>   #ifndef HAVE_ARCH_ALLOC_PAGE
>   static inline void arch_alloc_page(struct page *page, int order) { }
>   #endif
> +#ifndef HAVE_ARCH_MAKE_PAGE_ACCESSIBLE
> +static inline int arch_make_page_accessible(struct page *page)
> +{
> +	return 0;
> +}
> +#endif
>   
>   struct page *
>   __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int preferred_nid,
> diff --git a/mm/gup.c b/mm/gup.c
> index 81a95fbe9901..15c47e0e86f8 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -413,6 +413,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>   	struct page *page;
>   	spinlock_t *ptl;
>   	pte_t *ptep, pte;
> +	int ret;
>   
>   	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
>   	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> @@ -471,8 +472,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>   		if (is_zero_pfn(pte_pfn(pte))) {
>   			page = pte_page(pte);
>   		} else {
> -			int ret;
> -
>   			ret = follow_pfn_pte(vma, address, ptep, flags);
>   			page = ERR_PTR(ret);
>   			goto out;
> @@ -480,7 +479,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>   	}
>   
>   	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
> -		int ret;
>   		get_page(page);
>   		pte_unmap_unlock(ptep, ptl);
>   		lock_page(page);
> @@ -497,6 +495,19 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>   		page = ERR_PTR(-ENOMEM);
>   		goto out;
>   	}
> +	/*
> +	 * We need to make the page accessible if we are actually going to
> +	 * poke at its content (pin), otherwise we can leave it inaccessible.
> +	 * If we cannot make the page accessible, fail.
> +	 */
> +	if (flags & FOLL_PIN) {
> +		ret = arch_make_page_accessible(page);
> +		if (ret) {
> +			unpin_user_page(page);
> +			page = ERR_PTR(ret);
> +			goto out;
> +		}
> +	}


That looks good.


>   	if (flags & FOLL_TOUCH) {
>   		if ((flags & FOLL_WRITE) &&
>   		    !pte_dirty(pte) && !PageDirty(page))
> @@ -2162,6 +2173,16 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>   
>   		VM_BUG_ON_PAGE(compound_head(page) != head, page);
>   
> +		/*
> +		 * We need to make the page accessible if we are actually
> +		 * going to poke at its content (pin), otherwise we can
> +		 * leave it inaccessible. If the page cannot be made
> +		 * accessible, fail.
> +		 */


This part looks good, so these two points are just nits:

That's a little bit of repeating what the code does, in the comments. How about:

		/*
		 * We need to make the page accessible if and only if we are
		 * going to access its content (the FOLL_PIN case). Please see
		 * Documentation/core-api/pin_user_pages.rst for details.
		 */


> +		if ((flags & FOLL_PIN) && arch_make_page_accessible(page)) {
> +			unpin_user_page(page);
> +			goto pte_unmap;
> +		}


Your style earlier in the patch was easier on the reader, why not stay consistent
with that (and with this file, which tends also to do this), so:

		if (flags & FOLL_PIN) {
			ret = arch_make_page_accessible(page);
			if (ret) {
				unpin_user_page(page);
				goto pte_unmap;
			}
		}




>   		SetPageReferenced(page);
>   		pages[*nr] = page;
>   		(*nr)++;
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index ab5a3cee8ad3..8384be5a2758 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2807,6 +2807,11 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
>   		inc_zone_page_state(page, NR_ZONE_WRITE_PENDING);
>   	}
>   	unlock_page_memcg(page);
> +	/*
> +	 * If writeback has been triggered on a page that cannot be made
> +	 * accessible, it is too late.
> +	 */
> +	WARN_ON(arch_make_page_accessible(page));


I'm not deep enough into this area to know if a) this is correct, and b) if there are any
other places that need arch_make_page_accessible() calls. So I'll rely on other
reviewers to help check on that.


>   	return ret;
>   
>   }
> 

Anyway, I don't see any problems, and as I said, those documentation and style points are
just nitpicks, not bugs.


thanks,
-- 
John Hubbard
NVIDIA
