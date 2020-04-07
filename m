Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD3C1A0AA4
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 12:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgDGKBb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 06:01:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33996 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728074AbgDGKBb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2020 06:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586253689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=072pIwxp+i9xdZgez7LPJl0p0p/jipVd9TvhmmVdjNw=;
        b=L3O1VC7Glr07WDI6bOrQYrfOfv+JUOlyRbMC6P82NT6SexA5bNOg5gMCocLr96tzGfHZUi
        Yx0BNaHbzGgrzul6NCvSqddxGzYbsHf8aKR6cxytewpd6WrD7TzqnXKsR7Idtts9OaR0v8
        RnAUEy9RnyWKxdWRmPSHQ2opHFWBBLE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-OlOegV3_NxqP4H3JTHNZLA-1; Tue, 07 Apr 2020 06:01:28 -0400
X-MC-Unique: OlOegV3_NxqP4H3JTHNZLA-1
Received: by mail-wr1-f70.google.com with SMTP id e10so1498550wru.6
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2020 03:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=072pIwxp+i9xdZgez7LPJl0p0p/jipVd9TvhmmVdjNw=;
        b=YPo5gc/+ItIMYdWluA8XYw+haFCCnyOt94j1PkRILWx43I5aBDuIGx5j2ZIslhK2tS
         LLtoIdn05csgIs0DAmnIZdcovptIxnopdlRrolSv+z/XjNL0f7dAMTxSH26XVask0YEl
         A62I9kMAI9439Jyn/FHgHG7R+w2esCpv0OaHwAohzLngCcpNzOTqUozj1A0R2J+FoTHY
         MMs+X2ciXUxVxez7ejS/KDCtPdf7nCeFZm8EOB7ksr34JGqPWL83JcTNwpxgobt6eB7+
         XI9vTy3Gg8YtUL03J1TYBVIN7WU5p/CpD5uyy48PgUf+dAhYmlSiG2c99YomYZsF/Q8W
         ko8A==
X-Gm-Message-State: AGi0PuZYFVTZh3s9fAeEA3o6+lLP5mfhBk/aStAUxydZntSU5RFoTELE
        8soLmABhBQmvkC+i5c4a+KJv+jfADptxOyQdVerVLsG4gJ46kwlTSnV9+lwJYS/Z8MAch0vmFIe
        zt4Mwdq3W8eqqI3b1yzxCIg==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr1545340wrw.310.1586253687268;
        Tue, 07 Apr 2020 03:01:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypKkTeznfj9q9APqorxfRPW8aui7Fzp+uWDvURlf9QkARfLMmwPoVunNlyo6XHiM3RPmDuhNog==
X-Received: by 2002:a5d:5542:: with SMTP id g2mr1545322wrw.310.1586253687084;
        Tue, 07 Apr 2020 03:01:27 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id p22sm1622027wmc.42.2020.04.07.03.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 03:01:26 -0700 (PDT)
Date:   Tue, 7 Apr 2020 06:01:23 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20200407055832-mutt-send-email-mst@kernel.org>
References: <20200407130542.0e3b5d9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407130542.0e3b5d9d@canb.auug.org.au>
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

That's the right fix - anyone using VIRTIO_RING_F_INDIRECT_DESC
must include virtio_ring.h, not assume some other header
pulls it in.

Given Gerd's patch is in Linus' tree I'll put this one in mine to
make things easy.

Thanks!

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


