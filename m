Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1E2117BB77
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 12:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgCFLSk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 06:18:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22810 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbgCFLSj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 06:18:39 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 026BEv8J059832
        for <linux-next@vger.kernel.org>; Fri, 6 Mar 2020 06:18:38 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ykdu5pnh1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2020 06:18:38 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Fri, 6 Mar 2020 11:18:36 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 6 Mar 2020 11:18:32 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 026BIUs553805080
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Mar 2020 11:18:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8BCFB42045;
        Fri,  6 Mar 2020 11:18:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D44C342041;
        Fri,  6 Mar 2020 11:18:29 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.1])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  6 Mar 2020 11:18:29 +0000 (GMT)
Date:   Fri, 6 Mar 2020 12:18:23 +0100
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <jack@suse.cz>, <kirill@shutemov.name>, <borntraeger@de.ibm.com>,
        <david@redhat.com>, <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
In-Reply-To: <f58b6839-5233-5ccf-1f1d-60b3b8aaf417@nvidia.com>
References: <20200304130655.462517-1-imbrenda@linux.ibm.com>
        <20200304130655.462517-3-imbrenda@linux.ibm.com>
        <f58b6839-5233-5ccf-1f1d-60b3b8aaf417@nvidia.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030611-0028-0000-0000-000003E1731E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030611-0029-0000-0000-000024A6AB23
Message-Id: <20200306121823.50d253ac@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-06_03:2020-03-06,2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=2 adultscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=936
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060081
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 5 Mar 2020 14:30:03 -0800
John Hubbard <jhubbard@nvidia.com> wrote:

> On 3/4/20 5:06 AM, Claudio Imbrenda wrote:
> > With the introduction of protected KVM guests on s390 there is now a
> > concept of inaccessible pages. These pages need to be made
> > accessible before the host can access them.
> > 
> > While cpu accesses will trigger a fault that can be resolved, I/O
> > accesses will just fail.  We need to add a callback into
> > architecture code for places that will do I/O, namely when
> > writeback is started or when a page reference is taken.
> > 
> > This is not only to enable paging, file backing etc, it is also
> > necessary to protect the host against a malicious user space.  For
> > example a bad QEMU could simply start direct I/O on such protected
> > memory.  We do not want userspace to be able to trigger I/O errors
> > and thus the logic is "whenever somebody accesses that page (gup)
> > or does I/O, make sure that this page can be accessed".  When the
> > guest tries to access that page we will wait in the page fault
> > handler for writeback to have finished and for the page_ref to be
> > the expected value.
> > 
> > On s390x the function is not supposed to fail, so it is ok to use a
> > WARN_ON on failure. If we ever need some more finegrained handling
> > we can tackle this when we know the details.
> > 
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > Acked-by: Will Deacon <will@kernel.org>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > ---
> >  include/linux/gfp.h |  6 ++++++
> >  mm/gup.c            | 30 +++++++++++++++++++++++++++---
> >  mm/page-writeback.c |  5 +++++
> >  3 files changed, 38 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> > index e5b817cb86e7..be2754841369 100644
> > --- a/include/linux/gfp.h
> > +++ b/include/linux/gfp.h
> > @@ -485,6 +485,12 @@ static inline void arch_free_page(struct page
> > *page, int order) { } #ifndef HAVE_ARCH_ALLOC_PAGE
> >  static inline void arch_alloc_page(struct page *page, int order) {
> > } #endif
> > +#ifndef HAVE_ARCH_MAKE_PAGE_ACCESSIBLE
> > +static inline int arch_make_page_accessible(struct page *page)
> > +{
> > +	return 0;
> > +}
> > +#endif
> >  
> >  struct page *
> >  __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int
> > preferred_nid, diff --git a/mm/gup.c b/mm/gup.c
> > index 81a95fbe9901..d0c4c6f336bb 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -413,6 +413,7 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, struct page *page;
> >  	spinlock_t *ptl;
> >  	pte_t *ptep, pte;
> > +	int ret;
> >  
> >  	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> >  	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> > @@ -471,8 +472,6 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, if (is_zero_pfn(pte_pfn(pte))) {
> >  			page = pte_page(pte);
> >  		} else {
> > -			int ret;
> > -
> >  			ret = follow_pfn_pte(vma, address, ptep,
> > flags); page = ERR_PTR(ret);
> >  			goto out;
> > @@ -480,7 +479,6 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, }
> >  
> >  	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
> > -		int ret;
> >  		get_page(page);
> >  		pte_unmap_unlock(ptep, ptl);
> >  		lock_page(page);
> > @@ -497,6 +495,19 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, page = ERR_PTR(-ENOMEM);
> >  		goto out;
> >  	}
> > +	/*
> > +	 * We need to make the page accessible if and only if we
> > are going
> > +	 * to access its content (the FOLL_PIN case).  Please see
> > +	 * Documentation/core-api/pin_user_pages.rst for details.
> > +	 */
> > +	if (flags & FOLL_PIN) {
> > +		ret = arch_make_page_accessible(page);
> > +		if (ret) {
> > +			unpin_user_page(page);
> > +			page = ERR_PTR(ret);
> > +			goto out;
> > +		}
> > +	}
> >  	if (flags & FOLL_TOUCH) {
> >  		if ((flags & FOLL_WRITE) &&
> >  		    !pte_dirty(pte) && !PageDirty(page))
> > @@ -2162,6 +2173,19 @@ static int gup_pte_range(pmd_t pmd, unsigned
> > long addr, unsigned long end, 
> >  		VM_BUG_ON_PAGE(compound_head(page) != head, page);
> >  
> > +		/*
> > +		 * We need to make the page accessible if and only
> > if we are
> > +		 * going to access its content (the FOLL_PIN
> > case).  Please
> > +		 * see Documentation/core-api/pin_user_pages.rst
> > for
> > +		 * details.
> > +		 */
> > +		if (flags & FOLL_PIN) {
> > +			ret = arch_make_page_accessible(page);
> > +			if (ret) {
> > +				unpin_user_page(page);
> > +				goto pte_unmap;
> > +			}
> > +		}
> >  		SetPageReferenced(page);
> >  		pages[*nr] = page;
> >  		(*nr)++;
> > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > index ab5a3cee8ad3..8384be5a2758 100644
> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -2807,6 +2807,11 @@ int __test_set_page_writeback(struct page
> > *page, bool keep_write) inc_zone_page_state(page,
> > NR_ZONE_WRITE_PENDING); }
> >  	unlock_page_memcg(page);
> > +	/*
> > +	 * If writeback has been triggered on a page that cannot
> > be made
> > +	 * accessible, it is too late.
> > +	 */
> > +	WARN_ON(arch_make_page_accessible(page));  
> 
> Hi,
> 
> Sorry for not commenting on this earlier. After looking at this a
> bit, I think a tiny tweak would be helpful, because:
> 
> a) WARN_ON() is a big problem for per-page issues, because, like
> ants, pages are prone to show up in large groups. And a warning and
> backtrace for each such page can easily bring a system to a crawl.
> 
> b) Based on your explanation of how this works, what your situation
> really seems to call for is the standard "crash hard in DEBUG builds,
> in order to keep developers out of trouble, but continue on in
> non-DEBUG builds".
> 
> So maybe you'd be better protected with this instead:
> 
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index ab5a3cee8ad3..b7f3d0766a5f 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2764,7 +2764,7 @@ int test_clear_page_writeback(struct page *page)
>  int __test_set_page_writeback(struct page *page, bool keep_write)
>  {
>         struct address_space *mapping = page_mapping(page);
> -       int ret;
> +       int ret, access_ret;
>  
>         lock_page_memcg(page);
>         if (mapping && mapping_use_writeback_tags(mapping)) {
> @@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page
> *page, bool keep_write) inc_zone_page_state(page,
> NR_ZONE_WRITE_PENDING); }
>         unlock_page_memcg(page);
> +       access_ret = arch_make_page_accessible(page);
> +       /*
> +        * If writeback has been triggered on a page that cannot be
> made
> +        * accessible, it is too late to recover here.
> +        */
> +       VM_BUG_ON_PAGE(access_ret != 0, page);
> +
>         return ret;
>  
>  }
> 
> Assuming that's acceptable, you can add:
> 
>       Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> 
> to the updated patch.  

I will send an updated patch, thanks a lot for the feedback!

