Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E0E1A3BC6
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 23:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgDIVQB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Apr 2020 17:16:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25294 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726964AbgDIVQA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2020 17:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586466959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=glMQfLhnuqFKO//ayYwgmFp6X1dfi5Ixs/b/okGsMo4=;
        b=N2gko4W1QK7yODQ/g70wTuUgUa2G2yn55rV99HBck7FxkmqtMxt+pj/H3O9JYaTfL3DiD+
        fo4Oz8HWeL739iqQcS4D42jxy+FMHk66ACR8jI/lXLltdcO8ZKeTgIstt65rxufmJaXR0N
        PIK+SwUYe2tox/qGOlsRolOsBlWpJAw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-CQZvkEUIP7eHHGLkr2P5gQ-1; Thu, 09 Apr 2020 17:15:56 -0400
X-MC-Unique: CQZvkEUIP7eHHGLkr2P5gQ-1
Received: by mail-wm1-f72.google.com with SMTP id 14so44362wmo.9
        for <linux-next@vger.kernel.org>; Thu, 09 Apr 2020 14:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=glMQfLhnuqFKO//ayYwgmFp6X1dfi5Ixs/b/okGsMo4=;
        b=rkz0vp+JmjMrEfHZisbe+cvIbtrjlsGdSlrm6e8vSJzLl0AwG7qMBfT+B8Ofv4N3Tu
         AEGbFLdYS0uZDXN5l55OQ9tPGOt4yUzC1KnDJkaWPiMioyDqZpyxB1knjYHZ/iV64d/2
         sDbOCazUjeySEHsUAHRzMQ8QgBmGHRatmKOspuA5fqPNFwEVu+YnZ0bT2dAc5oa0MhsF
         Ps1unkuRjrbsw9C83yzcqlFrD9PQdPSS083HlYpa4CQy64G72HNj+/niOkAPM8ew3D/1
         mFgInbAcZz+Lfh/AfXZF3VZOJSaoR1DV4n3ucYy0ZLxNRmf28s0bNxHNt1MNmW56KyBd
         Nrfg==
X-Gm-Message-State: AGi0PuatkaRb3IhPM6h6+EwlHMDmifQlHiSvXYuiNxRKlfmpU1cAGkGP
        4S+7ojZM4fka8TMFn5LILQRJvsqX7M5RfPQUXpoq7aKSiR8DTSKFTKDU6Eeh3K6UYE9gX6AQ/Xp
        Bk1EWe3pJ9CsUsAmH2OJ2tA==
X-Received: by 2002:adf:b78b:: with SMTP id s11mr1032854wre.235.1586466954866;
        Thu, 09 Apr 2020 14:15:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypLMAdaElmZsKiQALKptGrWU76Bno3HFcVUNiHk4skksmmErtPHf/B/2kmn10GMEjDCryFguIg==
X-Received: by 2002:adf:b78b:: with SMTP id s11mr1032831wre.235.1586466954660;
        Thu, 09 Apr 2020 14:15:54 -0700 (PDT)
Received: from redhat.com (bzq-109-67-97-76.red.bezeqint.net. [109.67.97.76])
        by smtp.gmail.com with ESMTPSA id k184sm5096224wmf.9.2020.04.09.14.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 14:15:54 -0700 (PDT)
Date:   Thu, 9 Apr 2020 17:15:51 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        clang-built-linux@googlegroups.com
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20200409170923-mutt-send-email-mst@kernel.org>
References: <20200407130542.0e3b5d9d@canb.auug.org.au>
 <20200407185815.GA1805@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407185815.GA1805@ubuntu-s3-xlarge-x86>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 07, 2020 at 11:58:15AM -0700, Nathan Chancellor wrote:
> On Tue, Apr 07, 2020 at 01:05:42PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the vhost tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/gpu/drm/virtio/virtgpu_kms.c: In function 'virtio_gpu_init':
> > drivers/gpu/drm/virtio/virtgpu_kms.c:153:38: error: 'VIRTIO_RING_F_INDIRECT_DESC' undeclared (first use in this function)
> >   153 |  if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
> >       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/virtio/virtgpu_kms.c:153:38: note: each undeclared identifier is reported only once for each function it appears in
> > 
> > Caused by commit
> > 
> >   898952f9597e ("virtio: stop using legacy struct vring in kernel")
> > 
> > interacting with commit
> > 
> >   5edbb5608256 ("drm/virtio: fix ring free check")
> > 
> > from Linus' tree (post v5.6).
> > 
> > I have added the following merge fix patch for today.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 7 Apr 2020 12:58:26 +1000
> > Subject: [PATCH] drm/virtio: fix up for include file changes
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > index 023a030ca7b9..f4ea4cef5e23 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > @@ -25,6 +25,7 @@
> >  
> >  #include <linux/virtio.h>
> >  #include <linux/virtio_config.h>
> > +#include <linux/virtio_ring.h>
> >  
> >  #include <drm/drm_file.h>
> >  
> > -- 
> > 2.25.0
> > 
> > I do have to wonder why all this code has been added to the vhost tree
> > during the second week of the merge window (especially when I see it
> > rebased 4 times in one day :-().  Is it really intended for v5.7?

I pushed to next branch by mistake as I was publishing a tree for others to test, sorry.
But yes the final version (which should be ok now hopefully) is intended
for 5.7.

> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> Linaro's CI also reports an issue with this patch with the remoteproc
> drivers that were freshly merged in Linus' tree for 5.7-rc1 (seen with a
> simple arm allyesconfig build):
> 
> drivers/rpmsg/mtk_rpmsg.c:68:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:93:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:170:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:204:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:223:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:259:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:376:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:387:15: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
> drivers/rpmsg/mtk_rpmsg.c:409:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
> drivers/remoteproc/stm32_rproc.c:152:14: error: implicit declaration of function 'kcalloc' [-Werror,-Wimplicit-function-declaration]
> drivers/remoteproc/stm32_rproc.c:179:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]

Yes, this a virtio header change in -next exposes a bug: these are using slab.h
but not including it. I posted fixes and also pushed them on my branch now.

> It seems like this series shouldn't be in -next until after 5.7-rc1 (or
> rebased on Linus' tree if it is intended for the merge window).
> 
> Cheers,
> Nathan

Exposing this kind of issue is what next is for, right?

-- 
MST

