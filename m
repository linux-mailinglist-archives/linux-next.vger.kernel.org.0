Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8A117746D
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 11:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgCCKmC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 3 Mar 2020 05:42:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36752 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728454AbgCCKmC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 05:42:02 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 023AZbt5003756
        for <linux-next@vger.kernel.org>; Tue, 3 Mar 2020 05:42:01 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yfk5my521-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 03 Mar 2020 05:42:00 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Tue, 3 Mar 2020 10:41:58 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 3 Mar 2020 10:41:54 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 023Afq5f48431228
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Mar 2020 10:41:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DB91111C05B;
        Tue,  3 Mar 2020 10:41:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3BE0511C052;
        Tue,  3 Mar 2020 10:41:52 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.1])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue,  3 Mar 2020 10:41:52 +0000 (GMT)
Date:   Tue, 3 Mar 2020 11:41:49 +0100
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <jack@suse.cz>, <kirill@shutemov.name>, <borntraeger@de.ibm.com>,
        <david@redhat.com>, <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
In-Reply-To: <99903e77-7720-678e-35c5-6eb9e35e7fcb@nvidia.com>
References: <20200303002506.173957-1-imbrenda@linux.ibm.com>
        <20200303002506.173957-3-imbrenda@linux.ibm.com>
        <99903e77-7720-678e-35c5-6eb9e35e7fcb@nvidia.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-TM-AS-GCONF: 00
x-cbid: 20030310-4275-0000-0000-000003A7E48E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030310-4276-0000-0000-000038BCEC41
Message-Id: <20200303114149.54c072d1@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-03_02:2020-03-03,2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030081
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2 Mar 2020 23:59:32 -0800
John Hubbard <jhubbard@nvidia.com> wrote:

> On 3/2/20 4:25 PM, Claudio Imbrenda wrote:
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
> >   include/linux/gfp.h |  6 ++++++
> >   mm/gup.c            | 27 ++++++++++++++++++++++++---
> >   mm/page-writeback.c |  5 +++++
> >   3 files changed, 35 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> > index e5b817cb86e7..be2754841369 100644
> > --- a/include/linux/gfp.h
> > +++ b/include/linux/gfp.h
> > @@ -485,6 +485,12 @@ static inline void arch_free_page(struct page
> > *page, int order) { } #ifndef HAVE_ARCH_ALLOC_PAGE
> >   static inline void arch_alloc_page(struct page *page, int order)
> > { } #endif
> > +#ifndef HAVE_ARCH_MAKE_PAGE_ACCESSIBLE
> > +static inline int arch_make_page_accessible(struct page *page)
> > +{
> > +	return 0;
> > +}
> > +#endif
> >   
> >   struct page *
> >   __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order, int
> > preferred_nid, diff --git a/mm/gup.c b/mm/gup.c
> > index 81a95fbe9901..15c47e0e86f8 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -413,6 +413,7 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, struct page *page;
> >   	spinlock_t *ptl;
> >   	pte_t *ptep, pte;
> > +	int ret;
> >   
> >   	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> >   	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> > @@ -471,8 +472,6 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, if (is_zero_pfn(pte_pfn(pte))) {
> >   			page = pte_page(pte);
> >   		} else {
> > -			int ret;
> > -
> >   			ret = follow_pfn_pte(vma, address, ptep,
> > flags); page = ERR_PTR(ret);
> >   			goto out;
> > @@ -480,7 +479,6 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, }
> >   
> >   	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
> > -		int ret;
> >   		get_page(page);
> >   		pte_unmap_unlock(ptep, ptl);
> >   		lock_page(page);
> > @@ -497,6 +495,19 @@ static struct page *follow_page_pte(struct
> > vm_area_struct *vma, page = ERR_PTR(-ENOMEM);
> >   		goto out;
> >   	}
> > +	/*
> > +	 * We need to make the page accessible if we are actually
> > going to
> > +	 * poke at its content (pin), otherwise we can leave it
> > inaccessible.
> > +	 * If we cannot make the page accessible, fail.
> > +	 */
> > +	if (flags & FOLL_PIN) {
> > +		ret = arch_make_page_accessible(page);
> > +		if (ret) {
> > +			unpin_user_page(page);
> > +			page = ERR_PTR(ret);
> > +			goto out;
> > +		}
> > +	}  
> 
> 
> That looks good.
> 
> 
> >   	if (flags & FOLL_TOUCH) {
> >   		if ((flags & FOLL_WRITE) &&
> >   		    !pte_dirty(pte) && !PageDirty(page))
> > @@ -2162,6 +2173,16 @@ static int gup_pte_range(pmd_t pmd, unsigned
> > long addr, unsigned long end, 
> >   		VM_BUG_ON_PAGE(compound_head(page) != head, page);
> >   
> > +		/*
> > +		 * We need to make the page accessible if we are
> > actually
> > +		 * going to poke at its content (pin), otherwise
> > we can
> > +		 * leave it inaccessible. If the page cannot be
> > made
> > +		 * accessible, fail.
> > +		 */  
> 
> 
> This part looks good, so these two points are just nits:
> 
> That's a little bit of repeating what the code does, in the comments.
> How about:
> 
> 		/*
> 		 * We need to make the page accessible if and only if
> we are
> 		 * going to access its content (the FOLL_PIN case).
> Please see
> 		 * Documentation/core-api/pin_user_pages.rst for
> details. */
> 
> 
> > +		if ((flags & FOLL_PIN) &&
> > arch_make_page_accessible(page)) {
> > +			unpin_user_page(page);
> > +			goto pte_unmap;
> > +		}  
> 
> 
> Your style earlier in the patch was easier on the reader, why not
> stay consistent with that (and with this file, which tends also to do
> this), so:
> 
> 		if (flags & FOLL_PIN) {
> 			ret = arch_make_page_accessible(page);
> 			if (ret) {
> 				unpin_user_page(page);
> 				goto pte_unmap;
> 			}
> 		}
> 
> 
> 
> 
> >   		SetPageReferenced(page);
> >   		pages[*nr] = page;
> >   		(*nr)++;
> > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > index ab5a3cee8ad3..8384be5a2758 100644
> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -2807,6 +2807,11 @@ int __test_set_page_writeback(struct page
> > *page, bool keep_write) inc_zone_page_state(page,
> > NR_ZONE_WRITE_PENDING); }
> >   	unlock_page_memcg(page);
> > +	/*
> > +	 * If writeback has been triggered on a page that cannot
> > be made
> > +	 * accessible, it is too late.
> > +	 */
> > +	WARN_ON(arch_make_page_accessible(page));  
> 
> 
> I'm not deep enough into this area to know if a) this is correct, and
> b) if there are any other places that need
> arch_make_page_accessible() calls. So I'll rely on other reviewers to
> help check on that.
> 
> 
> >   	return ret;
> >   
> >   }
> >   
> 
> Anyway, I don't see any problems, and as I said, those documentation
> and style points are just nitpicks, not bugs.


these are minor fixes, and I mostly agree with you. I'll fix them and
send a v3 soon™

thanks for the comments!

