Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89542A2815
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 11:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgKBKTO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 05:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49955 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728005AbgKBKTO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 05:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604312353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ai/gGgjTQcmU+eCPscVzw0UhOXfAfCGYsrcIbvjwE7U=;
        b=WCXotckBgKcv8UAC6AYfCXqblMMCupxHfF7IXlgbPDzCOgc3c7B6iaTU6MCxphgHGm101p
        7gFcqHusQscJkAr3QJDFx812fejc2Eu5m3l9EmLaVCRhbw17X7rixsFdbvMe398by1bTSj
        je67oxg0VYi3CehFaIRcJbqq0NyRx94=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-LdQ1BbMXOQ-Nruz8E92ygw-1; Mon, 02 Nov 2020 05:19:11 -0500
X-MC-Unique: LdQ1BbMXOQ-Nruz8E92ygw-1
Received: by mail-wm1-f71.google.com with SMTP id l16so1719628wmh.1
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 02:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ai/gGgjTQcmU+eCPscVzw0UhOXfAfCGYsrcIbvjwE7U=;
        b=rGfKU/s4v2EFJsFlP2Zj+GJSOwNhu+h90Bd5il1X0rufnM1nXJcGkDpDah8ceD8H+C
         CJAzAPldFPClA1MrJYV+nHDwfWabpY9/4oS1sa0DDQw6810NqSE6TT73vBkU6ePtaPeH
         rGZYQBpT1VGqjFwv8g8QFAMweS4zFA3pRI34P+dDVQZoY+UhSAbeEpMKqo41yZyQ3aHr
         rIAsohRlx4Bx3r2oQeQHnEiEOZt8aG3arVBzapnl26wN+DoT1WlTpIskeXLEm9EzqU5X
         aq0rRlx3KD7awnkJpi6xpFAM/bnRIzMeY1qxmVKoVOyBLvcFwPwK5FNQrlNKWg+0m+oy
         V5mw==
X-Gm-Message-State: AOAM533u/sxwIAqV6elRHavy7f+f4xe8WymcaVuBMA8c3WF0pSFgYBCx
        4q9gffDPsNuq+HW6Xmfu4Bq7Qer/mKcKQOl/zQWmU8eVrx/n+bqW+eRsq2bxMR2cLWkvKAAgw0X
        RM9+CmuZFpZ0KvgLhNIAABQ==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr17543689wme.66.1604312350473;
        Mon, 02 Nov 2020 02:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMZrcZUQ6qnAtGtdhm7af/rwNXetvdJKh2zEGv4XNpm4y+mMw4DGIIvdD/ljXcKDwgaNDKtw==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr17543670wme.66.1604312350279;
        Mon, 02 Nov 2020 02:19:10 -0800 (PST)
Received: from redhat.com (bzq-79-181-134-187.red.bezeqint.net. [79.181.134.187])
        by smtp.gmail.com with ESMTPSA id z5sm21822717wrw.87.2020.11.02.02.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 02:19:09 -0800 (PST)
Date:   Mon, 2 Nov 2020 05:19:06 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102051822-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102124327.2f82b2a7@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 12:43:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
>    99 |  return SIZE_MAX;
>       |         ^~~~~~~~
> include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
>     6 | #include <linux/init.h>
>   +++ |+#include <stdint.h>
>     7 | #include <linux/types.h>
> include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
>    99 |  return SIZE_MAX;
>       |         ^~~~~~~~
> 
> Caused by commit
> 
>   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> 
> but only exposed by commit
> 
>   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> 
> I applied the following fix for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Nov 2020 12:34:57 +1100
> Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> 
> Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I guess it makes sense to pick this up for this release directly.
I'll merge this unless there are any objections.

> ---
>  include/linux/swiotlb.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 513913ff7486..ed9de7855d3b 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -5,6 +5,9 @@
>  #include <linux/dma-direction.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
> +#ifndef CONFIG_SWIOTLB
> +#include <linux/limits.h>
> +#endif
>  
>  struct device;
>  struct page;
> -- 
> 2.28.0
> 
> -- 
> Cheers,
> Stephen Rothwell


