Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5632A2700
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 10:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgKBJ2u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 04:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgKBJ2s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 04:28:48 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0848C061A04
        for <linux-next@vger.kernel.org>; Mon,  2 Nov 2020 01:28:46 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id i18so7288275ots.0
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbNuq3s1vVpD8H3QOsjV0sGqJ/Z7oSAbbkfkZvy1XHk=;
        b=ZwDmKsJx7x9H4A6oxnKV/0mfK5ZFxB3a1aM7tsS3KQVWBTroULG54b+/X/QAb8xkd8
         w60J0bsQvWMfAe1GP1j5aHGhevycwGs1eXOS5XmS9e1DzJwaERv34oRwd/zUc5NH25It
         evwbcfSzmlipcIbMmq2HHokuvcx7O5RLmy0O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbNuq3s1vVpD8H3QOsjV0sGqJ/Z7oSAbbkfkZvy1XHk=;
        b=TnEAtSiRd5cBe5ND8rZvkxq6+Zd4wZp2QekSX3y5cpj+7uiGEIRYg8+gcSasHyCJOR
         YNq3H/vFi/fHja+Nmonvz5qjAfsCa7Fk9ATrejfFMwvrDPP1h8e2DymTBxpQD4NAflTc
         p4y9tatTXj/fy206R8iHbkesWrpaTYWzbJZsuX23CFp9zu93FOREdFWBexUlVpI6WrfA
         LMYUJfonXPy2KTZ/F47CTgP4PiBHj32alAJBveqOCe2RJK/9pS/NNqhaqqFX7szj/+2j
         7EV1xk2UtDBtWauMJBR/PJYXS1aDuyvfN7UfAJtQGiwiEAol9aBRIqdVz76DLxWQO226
         Eb7Q==
X-Gm-Message-State: AOAM531gThkMXXPE6bgCqVhU36KjF3/lT5mNe9zfCY05FYBGP93Kta1R
        4fXDQVsnHHVJ6xq1s2L2w3ZV4MgdXAa1bmtqdOF64Q==
X-Google-Smtp-Source: ABdhPJw4HWb5RIkueETRBm8Fwwh31WuQZ8e/6YOS+9xABgykOarqawuOiAF2wFN7DrH/qvVU5QujD60r3ppsBeugVQ4=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr10863311otr.303.1604309326237;
 Mon, 02 Nov 2020 01:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20201102124327.2f82b2a7@canb.auug.org.au>
In-Reply-To: <20201102124327.2f82b2a7@canb.auug.org.au>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 2 Nov 2020 10:28:34 +0100
Message-ID: <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@infradead.org>
Cc:     Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 2, 2020 at 2:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
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

I think simplest if this lands through dma-api tree into current -rc
kernels. Or should we just put this into drm-misc-next since that's
where the problem shows up? Christoph, any preference from dma-api
side?
-Daniel

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



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
