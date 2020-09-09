Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1083C262A00
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 10:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgIIISM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 04:18:12 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:48503 "EHLO
        esa2.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgIIISL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 04:18:11 -0400
X-Greylist: delayed 463 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Sep 2020 04:18:11 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1599639491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yXL30i3WyuUF7A2QXRkz5zJReRjKthYKlquFiCBqi7E=;
  b=AX/LvlzLnmIY+wegucJQCXwiUAUIzAoXVM41/xKMIQ9rqMR31yUr77XX
   DuFG99GRkhP7cPOL1I9lVQf8qpkx/JfaUV1tmpIWMe8718JlJnll8Irxq
   Whm8FbnG0b5DsJZjCTqvsh0pkt9azFfylQiyjsFiHsVFAVvRSjgC4MiDK
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Be6vo8VWXTZiCSjiTPzLxo6WwimGVNp2BNAvOJEjGmarx2ErHKqvjvSEtqthJVLWXte45s1pyr
 IhQyUa10GDng2hzD97ox7GKenx0nRVAQslBDsMPhzzcLQDxqfDvCSkUcfytgTXIn1s6As7GPp5
 1gvHqYTrf/1kCsvxGMYVXdVCfatDwJGrRt9K8bX0dp+W3ODfFVuRxYijNLxPIScl2c39BhXs0G
 fFcuLycfn9Oijb5fmV9R2eX4XDI/yvk3etbe/Zt5qfarkafT0eikBdGPY/cX6f8VmO/DjaErN7
 Bgw=
X-SBRS: 2.7
X-MesageID: 26274962
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; 
   d="scan'208";a="26274962"
Date:   Wed, 9 Sep 2020 10:10:14 +0200
From:   Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Dan Williams <dan.j.williams@intel.com>,
        Juergen Gross <jgross@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Sebastien Boeuf" <sebastien.boeuf@intel.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200909081014.GX734@Air-de-Roger>
References: <20200908200950.1368e71b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200908200950.1368e71b@canb.auug.org.au>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 08, 2020 at 08:09:50PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/xen/unpopulated-alloc.c: In function 'fill_list':
> drivers/xen/unpopulated-alloc.c:30:9: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>    30 |  pgmap->res.name = "Xen scratch";
>       |         ^~~
>       |         ref
> drivers/xen/unpopulated-alloc.c:31:9: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>    31 |  pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>       |         ^~~
>       |         ref
> drivers/xen/unpopulated-alloc.c:33:51: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>    33 |  ret = allocate_resource(&iomem_resource, &pgmap->res,
>       |                                                   ^~~
>       |                                                   ref
> In file included from include/asm-generic/memory_model.h:5,
>                  from arch/x86/include/asm/page.h:76,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:38,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:51,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from drivers/xen/unpopulated-alloc.c:3:
> drivers/xen/unpopulated-alloc.c:53:35: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>    53 |   xen_pfn_t pfn = PFN_DOWN(pgmap->res.start);
>       |                                   ^~~
> include/linux/pfn.h:20:23: note: in definition of macro 'PFN_DOWN'
>    20 | #define PFN_DOWN(x) ((x) >> PAGE_SHIFT)
>       |                       ^
> drivers/xen/unpopulated-alloc.c:58:30: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>    58 |     release_resource(&pgmap->res);
>       |                              ^~~
>       |                              ref
> drivers/xen/unpopulated-alloc.c:69:28: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>    69 |   release_resource(&pgmap->res);
>       |                            ^~~
>       |                            ref
> fs/fuse/virtio_fs.c: In function 'virtio_fs_setup_dax':
> fs/fuse/virtio_fs.c:838:9: error: 'struct dev_pagemap' has no member named 'res'; did you mean 'ref'?
>   838 |  pgmap->res = (struct resource){
>       |         ^~~
>       |         ref
> 
> Caused by commit
> 
>   b3e022c5a68c ("mm/memremap_pages: convert to 'struct range'")
> 
> interacting with commit
> 
>   9e2369c06c8a ("xen: add helpers to allocate unpopulated memory")
> 
> from Linus' tree (in v5.9-rc4) and commit
> 
>   7e833303db20 ("virtiofs: set up virtio_fs dax_device")
> 
> from the fuse tree.
> 
> I have added the following patch which may require more work but at
> least makes it all build.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Sep 2020 20:00:20 +1000
> Subject: [PATCH] merge fix up for "mm/memremap_pages: convert to 'struct
>  range'"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks, LGTM.

> ---
>  drivers/xen/unpopulated-alloc.c | 15 +++++++++------
>  fs/fuse/virtio_fs.c             |  3 +--
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
> index 3b98dc921426..9fa7ce330628 100644
> --- a/drivers/xen/unpopulated-alloc.c
> +++ b/drivers/xen/unpopulated-alloc.c
> @@ -18,6 +18,7 @@ static unsigned int list_count;
>  static int fill_list(unsigned int nr_pages)
>  {
>  	struct dev_pagemap *pgmap;
> +	struct resource res;
>  	void *vaddr;
>  	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
>  	int ret;
> @@ -27,10 +28,10 @@ static int fill_list(unsigned int nr_pages)
>  		return -ENOMEM;
>  
>  	pgmap->type = MEMORY_DEVICE_GENERIC;
> -	pgmap->res.name = "Xen scratch";
> -	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +	res.name = "Xen scratch";
> +	res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;

You could init the fields at res definition time now, since it's no
longer dynamically allocated.

Roger.
