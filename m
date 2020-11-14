Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0B32B2A5E
	for <lists+linux-next@lfdr.de>; Sat, 14 Nov 2020 02:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgKNBOz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 20:14:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:47702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgKNBOz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Nov 2020 20:14:55 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78C1B22254;
        Sat, 14 Nov 2020 01:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605316493;
        bh=V3npB1aPYP4lVCtMAU8V/YQcHbHCwd9pHDIoLT814I4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sbj/IcAsYQ3iqYg5JLpu5idNyVXqWNl7JXNts9qG4W4WwyjEt2bpA4diKJtdQOAz/
         iJWWY3xMyK8h6RF1WYthYyYTRlVy52WGCTpq6S5ji68yIKz/ROVcrg6lE90ZRNCJO7
         NNL4t/2EFutNIaSsayf6ADKuzL0uZtH3JxMoBdPc=
Date:   Fri, 13 Nov 2020 17:14:52 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-Id: <20201113171452.087c489c1ef58e472667577e@linux-foundation.org>
In-Reply-To: <20201113180239.0ee06fd2@canb.auug.org.au>
References: <20201113180239.0ee06fd2@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 13 Nov 2020 18:02:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the akpm tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> mm/secretmem.c: In function 'secretmem_memcg_charge':
> mm/secretmem.c:72:4: error: 'struct page' has no member named 'memcg_data'
>    72 |   p->memcg_data = page->memcg_data;
>       |    ^~
> mm/secretmem.c:72:23: error: 'struct page' has no member named 'memcg_data'
>    72 |   p->memcg_data = page->memcg_data;
>       |                       ^~
> mm/secretmem.c: In function 'secretmem_memcg_uncharge':
> mm/secretmem.c:86:4: error: 'struct page' has no member named 'memcg_data'
>    86 |   p->memcg_data = 0;
>       |    ^~
> 
> ...
>
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -69,7 +69,9 @@ static int secretmem_memcg_charge(struct page *page, gfp_t gfp, int order)
>  	for (i = 1; i < nr_pages; i++) {
>  		struct page *p = page + i;
>  
> +#ifdef CONFIG_MEMCG
>  		p->memcg_data = page->memcg_data;
> +#endif
>  	}
>  
>  	return 0;

Thanks, that'll work for now.

I guess we're looking at adding a set_page_memcg() (I'd prefer
page_memcg_set()).

But probably these functions shouldn't be compiled at all if
CONFIG_MEMCG=n.
