Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B8C1742A9
	for <lists+linux-next@lfdr.de>; Sat, 29 Feb 2020 00:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgB1XIh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Feb 2020 18:08:37 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11367 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB1XIh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Feb 2020 18:08:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e599d230000>; Fri, 28 Feb 2020 15:07:15 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 28 Feb 2020 15:08:35 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 28 Feb 2020 15:08:35 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Feb
 2020 23:08:35 +0000
Subject: Re: [RFC v1 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track
 FOLL_PIN pages"
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>
CC:     <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Jan Kara <jack@suse.cz>,
        "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
 <20200228154322.329228-3-imbrenda@linux.ibm.com>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <c98038da-cf52-27f5-1aed-b69287a5dec0@nvidia.com>
Date:   Fri, 28 Feb 2020 15:08:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228154322.329228-3-imbrenda@linux.ibm.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582931235; bh=xcptddGGOzZ75nvLWP6gD2gojRvwMOSomkPx4Uxwnp8=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=L80xB8UCmWKM+d/AUbUv0fM3LJ1zGwddosILzHsBVsQVivwddBN0KJ0ltimxFs1FJ
         KVKKudVabSVBujRfnmWZE+aldbr4IhErAKbUS5rqvUmjd4ItI9K2TVWJdOjm0DEb2g
         KmXsmVFrDcH9ttErOJPsCxf+sICKL/f3g6vvef0uTg1f2x3ocaHRy7MXL2WiNgcOEZ
         D1mB/H29puGQVN4bk4GLEpLVC7vDcyIH17QwnIWBeKg3wjHHpAflKbN5aed/U0mvD8
         IkwQuoxv4Iy/4PtTmxxkwetmG9VSCgCvWcB5GCI0PSL9WhA9sAq62VnnkaqpWTbHLz
         0hQ2pCTT05rlw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/28/20 7:43 AM, Claudio Imbrenda wrote:
> In case pin fails, we need to unpin, a simple put_page will not be enough
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  mm/gup.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index f589299b0d4a..0b9a806898f3 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2134,7 +2134,10 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>  			goto pte_unmap;
>  
>  		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> -			put_page(head);
> +			if (flags & FOLL_GET)
> +				put_page(head);
> +			else if (flags & FOLL_PIN)
> +				unpin_user_page(head);

Hi Claudio,

Instead, I think that should actually be:

		put_compound_head(page, 1, flags);

which does a bit more (bug checks and /proc/vmstat instrumentation) than your diff,
but has the same basic idea: call the right "put" function.  

...oh, actually, I see you have the commit hash in the subject line. Instead, it should 
be in the commit description. Let's maybe change the subject line to approx:

    mm/gup: Fix a missing put_compound_head() call in gup_pte_range()

And the write up...how about something like this, if you like it:


try_grab_compound_head() must be undone via put_compound_head(), not put_page().
This was missed in the original implementation of the gup/dma tracking patch, so
fix it now.

Fixes: 0ea2781c3de4 ("mm/gup: track FOLL_PIN pages")


    
(Aside: I'm using the linux-next commit hash. How does one get the correct hash before
it goes to mainline? I guess maintainer scripts fix all those up?)

It's also good to Cc some reviewers in case I'm overlooking something, so I'm adding
Jan and Kirill.

thanks,
-- 
John Hubbard
NVIDIA
>  			goto pte_unmap;
>  		}
>  
> 


