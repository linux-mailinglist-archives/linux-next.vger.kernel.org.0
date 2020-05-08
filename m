Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E66A1CB248
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 16:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEHOvZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 10:51:25 -0400
Received: from mga03.intel.com ([134.134.136.65]:61971 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbgEHOvZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 May 2020 10:51:25 -0400
IronPort-SDR: OX82RHtLRCcpCE7TwGpS5s1kq7/KVrI4kgCkK/EnqozKY5fTiuR1O0lj9AqmDxMG5buwz9ixf4
 blLk+OWrhn6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 07:51:24 -0700
IronPort-SDR: 6p3MXQuE46g0ihXJKk1UkuZXjFwnAlA5YIP0CwEs/6bjTZLgeNr9j4e5nzzkkrwkX2rHzB51qh
 KKw9hb8PVqRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; 
   d="scan'208";a="249739127"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga007.jf.intel.com with ESMTP; 08 May 2020 07:51:23 -0700
Date:   Fri, 8 May 2020 07:51:23 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200508145123.GA1431382@iweiny-DESK2.sc.intel.com>
References: <20200507221721.0330271c@canb.auug.org.au>
 <20200508114338.02d2b843@canb.auug.org.au>
 <20200507190808.c6cdd5ffd68d0a154ef8ff18@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507190808.c6cdd5ffd68d0a154ef8ff18@linux-foundation.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 07, 2020 at 07:08:08PM -0700, Andrew Morton wrote:
> On Fri, 8 May 2020 11:43:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > On Thu, 7 May 2020 22:17:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the akpm-current tree, today's linux-next build (arm
> > > collie_defconfig and many others) failed like this:
> > > 
> > > arch/arm/mm/dma-mapping.c: In function 'dma_cache_maint_page':
> > > arch/arm/mm/dma-mapping.c:892:6: error: implicit declaration of function 'kunmap_high' [-Werror=implicit-function-declaration]
> > >       kunmap_high(page);
> > >       ^
> > > arch/arm/mm/flush.c: In function '__flush_dcache_page':
> > > arch/arm/mm/flush.c:221:6: error: implicit declaration of function 'kunmap_high' [-Werror=implicit-function-declaration]
> > >       kunmap_high(page + i);
> > >       ^
> > > 
> > > Caused by commit
> > > 
> > >   6b66ab470b4d ("arch/kunmap: remove duplicate kunmap implementations")
> > > 
> > > kunmap_high() is now only declared when CONFIG_HIGHMEM is defined.
> > 
> > Is there anything that can be done quickly about this as it broke a
> > large number of builds ...
> 
> This?  It's based on Ira's v3 series but should work.

Looks like arm is using kmap_high_get() internally which needs a
kunmap_high()...

> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: arch-kunmap-remove-duplicate-kunmap-implementations-fix
> 
> fix CONFIG_HIGHMEM=n build on various architectures
> 

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

This should probably be squashed into that patch though...

Andrew do you want a V3.1?

Ira

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  include/linux/highmem.h |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> --- a/include/linux/highmem.h~arch-kunmap-remove-duplicate-kunmap-implementations-fix
> +++ a/include/linux/highmem.h
> @@ -53,6 +53,7 @@ static inline void *kmap(struct page *pa
>  }
>  
>  void kunmap_high(struct page *page);
> +
>  static inline void kunmap(struct page *page)
>  {
>  	might_sleep();
> @@ -111,6 +112,10 @@ static inline void *kmap(struct page *pa
>  	return page_address(page);
>  }
>  
> +static inline void kunmap_high(struct page *page)
> +{
> +}
> +
>  static inline void kunmap(struct page *page)
>  {
>  }
> _
> 
