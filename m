Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5954173C90
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 17:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgB1QI2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Feb 2020 11:08:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64544 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725827AbgB1QI2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 28 Feb 2020 11:08:28 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01SG6L40052953
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2020 11:08:27 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yepxpkq6f-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 28 Feb 2020 11:08:26 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Fri, 28 Feb 2020 16:08:25 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 28 Feb 2020 16:08:22 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01SG8Koj58458276
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 28 Feb 2020 16:08:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 77B5CA405D;
        Fri, 28 Feb 2020 16:08:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0EB3EA4040;
        Fri, 28 Feb 2020 16:08:20 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.219])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 28 Feb 2020 16:08:19 +0000 (GMT)
Subject: Re: [RFC v1 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        linux-next@vger.kernel.org, akpm@linux-foundation.org
Cc:     david@redhat.com, aarcange@redhat.com, linux-mm@kvack.org,
        frankja@linux.ibm.com, sfr@canb.auug.org.au, jhubbard@nvidia.com,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Will Deacon <will@kernel.org>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
 <20200228154322.329228-4-imbrenda@linux.ibm.com>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 xsFNBE6cPPgBEAC2VpALY0UJjGmgAmavkL/iAdqul2/F9ONz42K6NrwmT+SI9CylKHIX+fdf
 J34pLNJDmDVEdeb+brtpwC9JEZOLVE0nb+SR83CsAINJYKG3V1b3Kfs0hydseYKsBYqJTN2j
 CmUXDYq9J7uOyQQ7TNVoQejmpp5ifR4EzwIFfmYDekxRVZDJygD0wL/EzUr8Je3/j548NLyL
 4Uhv6CIPf3TY3/aLVKXdxz/ntbLgMcfZsDoHgDk3lY3r1iwbWwEM2+eYRdSZaR4VD+JRD7p8
 0FBadNwWnBce1fmQp3EklodGi5y7TNZ/CKdJ+jRPAAnw7SINhSd7PhJMruDAJaUlbYaIm23A
 +82g+IGe4z9tRGQ9TAflezVMhT5J3ccu6cpIjjvwDlbxucSmtVi5VtPAMTLmfjYp7VY2Tgr+
 T92v7+V96jAfE3Zy2nq52e8RDdUo/F6faxcumdl+aLhhKLXgrozpoe2nL0Nyc2uqFjkjwXXI
 OBQiaqGeWtxeKJP+O8MIpjyGuHUGzvjNx5S/592TQO3phpT5IFWfMgbu4OreZ9yekDhf7Cvn
 /fkYsiLDz9W6Clihd/xlpm79+jlhm4E3xBPiQOPCZowmHjx57mXVAypOP2Eu+i2nyQrkapaY
 IdisDQfWPdNeHNOiPnPS3+GhVlPcqSJAIWnuO7Ofw1ZVOyg/jwARAQABzUNDaHJpc3RpYW4g
 Qm9ybnRyYWVnZXIgKDJuZCBJQk0gYWRkcmVzcykgPGJvcm50cmFlZ2VyQGxpbnV4LmlibS5j
 b20+wsF5BBMBAgAjBQJdP/hMAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQEXu8
 gLWmHHy/pA/+JHjpEnd01A0CCyfVnb5fmcOlQ0LdmoKWLWPvU840q65HycCBFTt6V62cDljB
 kXFFxMNA4y/2wqU0H5/CiL963y3gWIiJsZa4ent+KrHl5GK1nIgbbesfJyA7JqlB0w/E/SuY
 NRQwIWOo/uEvOgXnk/7+rtvBzNaPGoGiiV1LZzeaxBVWrqLtmdi1iulW/0X/AlQPuF9dD1Px
 hx+0mPjZ8ClLpdSp5d0yfpwgHtM1B7KMuQPQZGFKMXXTUd3ceBUGGczsgIMipZWJukqMJiJj
 QIMH0IN7XYErEnhf0GCxJ3xAn/J7iFpPFv8sFZTvukntJXSUssONnwiKuld6ttUaFhSuSoQg
 OFYR5v7pOfinM0FcScPKTkrRsB5iUvpdthLq5qgwdQjmyINt3cb+5aSvBX2nNN135oGOtlb5
 tf4dh00kUR8XFHRrFxXx4Dbaw4PKgV3QLIHKEENlqnthH5t0tahDygQPnSucuXbVQEcDZaL9
 WgJqlRAAj0pG8M6JNU5+2ftTFXoTcoIUbb0KTOibaO9zHVeGegwAvPLLNlKHiHXcgLX1tkjC
 DrvE2Z0e2/4q7wgZgn1kbvz7ZHQZB76OM2mjkFu7QNHlRJ2VXJA8tMXyTgBX6kq1cYMmd/Hl
 OhFrAU3QO1SjCsXA2CDk9MM1471mYB3CTXQuKzXckJnxHkHOwU0ETpw8+AEQAJjyNXvMQdJN
 t07BIPDtbAQk15FfB0hKuyZVs+0lsjPKBZCamAAexNRk11eVGXK/YrqwjChkk60rt3q5i42u
 PpNMO9aS8cLPOfVft89Y654Qd3Rs1WRFIQq9xLjdLfHh0i0jMq5Ty+aiddSXpZ7oU6E+ud+X
 Czs3k5RAnOdW6eV3+v10sUjEGiFNZwzN9Udd6PfKET0J70qjnpY3NuWn5Sp1ZEn6lkq2Zm+G
 9G3FlBRVClT30OWeiRHCYB6e6j1x1u/rSU4JiNYjPwSJA8EPKnt1s/Eeq37qXXvk+9DYiHdT
 PcOa3aNCSbIygD3jyjkg6EV9ZLHibE2R/PMMid9FrqhKh/cwcYn9FrT0FE48/2IBW5mfDpAd
 YvpawQlRz3XJr2rYZJwMUm1y+49+1ZmDclaF3s9dcz2JvuywNq78z/VsUfGz4Sbxy4ShpNpG
 REojRcz/xOK+FqNuBk+HoWKw6OxgRzfNleDvScVmbY6cQQZfGx/T7xlgZjl5Mu/2z+ofeoxb
 vWWM1YCJAT91GFvj29Wvm8OAPN/+SJj8LQazd9uGzVMTz6lFjVtH7YkeW/NZrP6znAwv5P1a
 DdQfiB5F63AX++NlTiyA+GD/ggfRl68LheSskOcxDwgI5TqmaKtX1/8RkrLpnzO3evzkfJb1
 D5qh3wM1t7PZ+JWTluSX8W25ABEBAAHCwV8EGAECAAkFAk6cPPgCGwwACgkQEXu8gLWmHHz8
 2w//VjRlX+tKF3szc0lQi4X0t+pf88uIsvR/a1GRZpppQbn1jgE44hgF559K6/yYemcvTR7r
 6Xt7cjWGS4wfaR0+pkWV+2dbw8Xi4DI07/fN00NoVEpYUUnOnupBgychtVpxkGqsplJZQpng
 v6fauZtyEcUK3dLJH3TdVQDLbUcL4qZpzHbsuUnTWsmNmG4Vi0NsEt1xyd/Wuw+0kM/oFEH1
 4BN6X9xZcG8GYUbVUd8+bmio8ao8m0tzo4pseDZFo4ncDmlFWU6hHnAVfkAs4tqA6/fl7RLN
 JuWBiOL/mP5B6HDQT9JsnaRdzqF73FnU2+WrZPjinHPLeE74istVgjbowvsgUqtzjPIG5pOj
 cAsKoR0M1womzJVRfYauWhYiW/KeECklci4TPBDNx7YhahSUlexfoftltJA8swRshNA/M90/
 i9zDo9ySSZHwsGxG06ZOH5/MzG6HpLja7g8NTgA0TD5YaFm/oOnsQVsf2DeAGPS2xNirmknD
 jaqYefx7yQ7FJXXETd2uVURiDeNEFhVZWb5CiBJM5c6qQMhmkS4VyT7/+raaEGgkEKEgHOWf
 ZDP8BHfXtszHqI3Fo1F4IKFo/AP8GOFFxMRgbvlAs8z/+rEEaQYjxYJqj08raw6P4LFBqozr
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date:   Fri, 28 Feb 2020 17:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228154322.329228-4-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022816-0028-0000-0000-000003DEEC1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022816-0029-0000-0000-000024A40F8E
Message-Id: <2e3bf1a2-b672-68e0-97b6-42f08133e077@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-28_05:2020-02-28,2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=2 clxscore=1015
 bulkscore=0 mlxlogscore=878 priorityscore=1501 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280128
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Andrew,

while patch 1 is a fixup for the FOLL_PIN work in your patch queue,
I would really love to see this patch in 5.7. The exploitation code
of kvm/s390 is in Linux next also scheduled for 5.7.

Christian

On 28.02.20 16:43, Claudio Imbrenda wrote:
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
> necessary to protect the host against a malicious user space. For
> example a bad QEMU could simply start direct I/O on such protected
> memory.  We do not want userspace to be able to trigger I/O errors and
> thus we the logic is "whenever somebody accesses that page (gup) or
> does I/O, make sure that this page can be accessed". When the guest
> tries to access that page we will wait in the page fault handler for
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
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  include/linux/gfp.h |  6 ++++++
>  mm/gup.c            | 19 ++++++++++++++++---
>  mm/page-writeback.c |  5 +++++
>  3 files changed, 27 insertions(+), 3 deletions(-)
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
> index 0b9a806898f3..86fff6e4e4f3 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -391,6 +391,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	struct page *page;
>  	spinlock_t *ptl;
>  	pte_t *ptep, pte;
> +	int ret;
>  
>  	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
>  	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> @@ -449,8 +450,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		if (is_zero_pfn(pte_pfn(pte))) {
>  			page = pte_page(pte);
>  		} else {
> -			int ret;
> -
>  			ret = follow_pfn_pte(vma, address, ptep, flags);
>  			page = ERR_PTR(ret);
>  			goto out;
> @@ -458,7 +457,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  	}
>  
>  	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
> -		int ret;
>  		get_page(page);
>  		pte_unmap_unlock(ptep, ptl);
>  		lock_page(page);
> @@ -475,6 +473,14 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		page = ERR_PTR(-ENOMEM);
>  		goto out;
>  	}
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
> @@ -2143,6 +2149,13 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>  
>  		VM_BUG_ON_PAGE(compound_head(page) != head, page);
>  
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
>  	return ret;
>  
>  }
> 

