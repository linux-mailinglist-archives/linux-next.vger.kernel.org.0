Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53AD817B16E
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 23:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgCEWaC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 17:30:02 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5458 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgCEWaC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 17:30:02 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e617d120001>; Thu, 05 Mar 2020 14:28:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 05 Mar 2020 14:30:00 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 05 Mar 2020 14:30:00 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Mar
 2020 22:30:00 +0000
Subject: Re: [PATCH v3 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track
 FOLL_PIN pages"
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <jack@suse.cz>, <kirill@shutemov.name>
CC:     <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>
References: <20200304130655.462517-1-imbrenda@linux.ibm.com>
 <20200304130655.462517-2-imbrenda@linux.ibm.com>
From:   John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <09e0d5ec-c799-be0b-b85e-39c1c5d2c3cd@nvidia.com>
Date:   Thu, 5 Mar 2020 14:29:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304130655.462517-2-imbrenda@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583447315; bh=G0GpTxxXqdbtdW7cvxOSO9IvDVSA9OIAX1/SJBkdy8s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RSHxAgBTLKqlsZQt0fTf/84P0PyKMR6VEDO7qYpR5iLwVoHGHmSOrhs3OZP1atZ25
         lMA2bwFQiucKM67o/Rz2ZB/KPh26k7wlfcEaFGyhqpsph8Cnq2PMqiiJprHKlfkZYU
         DpNRPLh6+a3VpKTd8ZEeUNmZcC/DC1/OWB+8T+dRtWftUOJ7NkQFEgJ8rfL25QTQq6
         qp0jpqcukDDh+9aNcOrQEE5Lhn5aKcLYyRIUS0jyuBJu4Scn98swF+zLKEIpESexuJ
         GdUWFCloHvAKcsZ63yopSJbeZNM2N+t4Psmg2H6Wt6a/+E6oePSZ8nHrQDG0Arv82i
         q6qgwq1M/unkA==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/4/20 5:06 AM, Claudio Imbrenda wrote:
> In case pin fails, we need to unpin, a simple put_page will not be enough
> 
> fixup for commit 9947ea2c1e608e32 ("mm/gup: track FOLL_PIN pages")
> 
> it can be simply squashed in
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---

Although it won't show up anywhere, in case this helps Andrew sort out what
has been looked at, you can add: 

    Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

>  mm/gup.c | 46 +++++++++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index f589299b0d4a..81a95fbe9901 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -116,6 +116,28 @@ static __maybe_unused struct page *try_grab_compound_head(struct page *page,
>  	return NULL;
>  }
>  
> +static void put_compound_head(struct page *page, int refs, unsigned int flags)
> +{
> +	if (flags & FOLL_PIN) {
> +		mod_node_page_state(page_pgdat(page), NR_FOLL_PIN_RELEASED,
> +				    refs);
> +
> +		if (hpage_pincount_available(page))
> +			hpage_pincount_sub(page, refs);
> +		else
> +			refs *= GUP_PIN_COUNTING_BIAS;
> +	}
> +
> +	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
> +	/*
> +	 * Calling put_page() for each ref is unnecessarily slow. Only the last
> +	 * ref needs a put_page().
> +	 */
> +	if (refs > 1)
> +		page_ref_sub(page, refs - 1);
> +	put_page(page);
> +}
> +
>  /**
>   * try_grab_page() - elevate a page's refcount by a flag-dependent amount
>   *
> @@ -2134,7 +2156,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>  			goto pte_unmap;
>  
>  		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> -			put_page(head);
> +			put_compound_head(head, 1, flags);
>  			goto pte_unmap;
>  		}
>  
> @@ -2267,28 +2289,6 @@ static int record_subpages(struct page *page, unsigned long addr,
>  	return nr;
>  }
>  
> -static void put_compound_head(struct page *page, int refs, unsigned int flags)
> -{
> -	if (flags & FOLL_PIN) {
> -		mod_node_page_state(page_pgdat(page), NR_FOLL_PIN_RELEASED,
> -				    refs);
> -
> -		if (hpage_pincount_available(page))
> -			hpage_pincount_sub(page, refs);
> -		else
> -			refs *= GUP_PIN_COUNTING_BIAS;
> -	}
> -
> -	VM_BUG_ON_PAGE(page_ref_count(page) < refs, page);
> -	/*
> -	 * Calling put_page() for each ref is unnecessarily slow. Only the last
> -	 * ref needs a put_page().
> -	 */
> -	if (refs > 1)
> -		page_ref_sub(page, refs - 1);
> -	put_page(page);
> -}
> -
>  #ifdef CONFIG_ARCH_HAS_HUGEPD
>  static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
>  				      unsigned long sz)
> 
