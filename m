Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5145F176EE1
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 06:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgCCFlN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 00:41:13 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8901 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgCCFlN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 00:41:13 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5dedeb0000>; Mon, 02 Mar 2020 21:40:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 02 Mar 2020 21:41:12 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 02 Mar 2020 21:41:12 -0800
Received: from [10.2.160.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Mar
 2020 05:41:12 +0000
Subject: Re: [PATCH v2 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track
 FOLL_PIN pages"
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <jack@suse.cz>, <kirill@shutemov.name>
CC:     <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>
References: <20200303002506.173957-1-imbrenda@linux.ibm.com>
 <20200303002506.173957-2-imbrenda@linux.ibm.com>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <dbda1638-4de6-a90f-6000-30651a8d56f0@nvidia.com>
Date:   Mon, 2 Mar 2020 21:38:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303002506.173957-2-imbrenda@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1583214059; bh=r/3wnhnvfxYDCvTiXpHphGDa2aKt2Zft4Tm9S+V9Tgc=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=NDk1S2EX/bLINrjs0wQkG2RHN73q1GcgISfIazE6XASrpm+XqtN4J39dfoIdEzuN+
         gshDK3EcHBHgUzBWx77iRXGO/Lc8sXcQvwMw9qAdFdMaBb6Kw7KRY/doIevsI00IAw
         efEnazjaotIFNOwzK1QbCCt3n3vF2HMJ1qxKBma0vuFakbCswUUlr/CjiWnKfNFvJ/
         MOs1Qjn7OOqlstgczLXBB3YR/gslVWoheI4k9DuOhdpfpCeWpfMLnFLQRIgr0McGlf
         SeLUIeHnMkUSjceIYOCFQo68vDwZrX4ImC2k8Xyahmad9t5fm0HAe9ZK7xtZ8aHTPo
         f8dGR2cjEljVA==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/2/20 4:25 PM, Claudio Imbrenda wrote:
> In case pin fails, we need to unpin, a simple put_page will not be enough
> 
> fixup for commit 9947ea2c1e608e32 ("mm/gup: track FOLL_PIN pages")
> 
> it can be simply squashed in
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   mm/gup.c | 46 +++++++++++++++++++++++-----------------------
>   1 file changed, 23 insertions(+), 23 deletions(-)
> 


Looks good, thanks for fixing this.


thanks,
-- 
John Hubbard
NVIDIA


> diff --git a/mm/gup.c b/mm/gup.c
> index f589299b0d4a..81a95fbe9901 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -116,6 +116,28 @@ static __maybe_unused struct page *try_grab_compound_head(struct page *page,
>   	return NULL;
>   }
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
>   /**
>    * try_grab_page() - elevate a page's refcount by a flag-dependent amount
>    *
> @@ -2134,7 +2156,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>   			goto pte_unmap;
>   
>   		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> -			put_page(head);
> +			put_compound_head(head, 1, flags);
>   			goto pte_unmap;
>   		}
>   
> @@ -2267,28 +2289,6 @@ static int record_subpages(struct page *page, unsigned long addr,
>   	return nr;
>   }
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
>   #ifdef CONFIG_ARCH_HAS_HUGEPD
>   static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
>   				      unsigned long sz)
> 
