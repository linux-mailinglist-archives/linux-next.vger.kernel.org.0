Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235DA1A1562
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 20:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgDGS6T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 14:58:19 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40772 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgDGS6T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2020 14:58:19 -0400
Received: by mail-ot1-f68.google.com with SMTP id q2so1503045otk.7;
        Tue, 07 Apr 2020 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QGY37FNAkjMLaN4OPkvvGVRfJPoF2m0cC0lGKtXcqAo=;
        b=gr+rckUKI58G49Z44BoYW2p6LI6XQ7dJRWJrQ8Sd55kDDpeLB7+lboJBSJdfZGyJdC
         wuK5DBxn3IGPtxEzcb8ydKbdLdhed+RrAscug86FQyWxSI97EUlig0rnLh5VqDANRDcN
         arQxqN+pdjx7imdHu+s+JBYprOyvO0yAc5yu1pm3lixaXVZfAG3lqHuk8AbXtnKh/f8w
         oxWugx2clNoJn7hvWIfqWRdn73eFz7blMNigUe5FHJYvtghxPJtIN1YAB9HYwSYFo6D8
         B8O6b3GGlQHMX8omJh8mVtZDY7XoyBKNae4DcMaxcSd2cptIM5/jV/4+lsluvhn2LmcA
         XAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QGY37FNAkjMLaN4OPkvvGVRfJPoF2m0cC0lGKtXcqAo=;
        b=CbhVjXc5dgH8Yq4qgVHNsiJ04dORbxi2Pemkvcv6LuDza5QSEs6Il1aW4Fa9qyYabC
         ekcOMQjeRYO8W3N73mP3OuQCxIY6ybv38lW6N2vrUOZk/5CZmvZ2VBDPAIRZ/067W5h8
         vPohMI3dTiB2IMeuOGhIny5AIvkeMInfO5Nhc8Nh26+SWaaq6L5zJ8gDZbLyAa/siN3+
         YmRhyQSlGfZkSw2R5eX5z+v60dDIkAJKR0Fkbw1luXGwlaUli8ymN6nk5toHt6XhdDLb
         Kh3o6yusU/8Yu7H2WL9cWwzu47n0Tr8nVSL9QjigY7M5MZ4dv4oRstmhdAE3jpwIdK12
         I2sw==
X-Gm-Message-State: AGi0PuabdDl4bM/umtfAqoF0L90qAX4cq2yWcLHdUDjlGAbuYb1wEwg3
        horn532sP04zOSqwUlffItk=
X-Google-Smtp-Source: APiQypKv050/wlgr0SPQh2dayH2Ig9WLi5w4zCIC06+rIw0jxXUib3/jR4GEycJh4cac4u8oLrmGgQ==
X-Received: by 2002:a9d:75d0:: with SMTP id c16mr2826857otl.8.1586285897659;
        Tue, 07 Apr 2020 11:58:17 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id 90sm5534875otc.29.2020.04.07.11.58.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 11:58:17 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:58:15 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        clang-built-linux@googlegroups.com
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20200407185815.GA1805@ubuntu-s3-xlarge-x86>
References: <20200407130542.0e3b5d9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407130542.0e3b5d9d@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 07, 2020 at 01:05:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vhost tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/virtio/virtgpu_kms.c: In function 'virtio_gpu_init':
> drivers/gpu/drm/virtio/virtgpu_kms.c:153:38: error: 'VIRTIO_RING_F_INDIRECT_DESC' undeclared (first use in this function)
>   153 |  if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
>       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/virtio/virtgpu_kms.c:153:38: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit
> 
>   898952f9597e ("virtio: stop using legacy struct vring in kernel")
> 
> interacting with commit
> 
>   5edbb5608256 ("drm/virtio: fix ring free check")
> 
> from Linus' tree (post v5.6).
> 
> I have added the following merge fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 7 Apr 2020 12:58:26 +1000
> Subject: [PATCH] drm/virtio: fix up for include file changes
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 023a030ca7b9..f4ea4cef5e23 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -25,6 +25,7 @@
>  
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
> +#include <linux/virtio_ring.h>
>  
>  #include <drm/drm_file.h>
>  
> -- 
> 2.25.0
> 
> I do have to wonder why all this code has been added to the vhost tree
> during the second week of the merge window (especially when I see it
> rebased 4 times in one day :-().  Is it really intended for v5.7?
> -- 
> Cheers,
> Stephen Rothwell

Linaro's CI also reports an issue with this patch with the remoteproc
drivers that were freshly merged in Linus' tree for 5.7-rc1 (seen with a
simple arm allyesconfig build):

drivers/rpmsg/mtk_rpmsg.c:68:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:93:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:170:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:204:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:223:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:259:9: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:376:3: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:387:15: error: implicit declaration of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
drivers/rpmsg/mtk_rpmsg.c:409:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]
drivers/remoteproc/stm32_rproc.c:152:14: error: implicit declaration of function 'kcalloc' [-Werror,-Wimplicit-function-declaration]
drivers/remoteproc/stm32_rproc.c:179:2: error: implicit declaration of function 'kfree' [-Werror,-Wimplicit-function-declaration]

It seems like this series shouldn't be in -next until after 5.7-rc1 (or
rebased on Linus' tree if it is intended for the merge window).

Cheers,
Nathan
