Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CB043F7F9
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 09:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhJ2HsO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 03:48:14 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47901 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232260AbhJ2HsM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 Oct 2021 03:48:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id A540158040D;
        Fri, 29 Oct 2021 03:45:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 29 Oct 2021 03:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=2Qr7yp3VVFxWnNP0fkutA51R9FY
        qy6LYwE1X+yQ1EW0=; b=tKwuYb/Wq0dgJ2YXW12P/sqAtQl/PBCZkonpsrUxp7H
        Wm2yBGvFgMPEOO0AT+QjNvcylVqGy1hoFDE8uUX+lqdJit4FBWpWtVXSNF5n7y51
        jAekYKlXIAYkuc+BAy+YZoAwpsrD2KfF2i1Ykb1+en3CJkudi6kNXxAN3Q3CqJan
        5uPI6UU/OY9YwNw6yuigw5KQC2aEjlDqFzWGh8gWql1SCdbN6ij5zSZcI2PpD5kq
        78IQfpMsEjzwCgmCUSHbKIxwrw0mtknZZrT9OZ8Vq1mYqyEfiIFGA3dtvF8e06ia
        iA8DH/DUP16G3rWU5JiK+iTzvWAJoMSPoHyEAYsYdGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2Qr7yp
        3VVFxWnNP0fkutA51R9FYqy6LYwE1X+yQ1EW0=; b=Lj6hdvJOKSLvMmQnSku3FE
        t22vZTkube23+oegCpP03OcB+QevKkrrsBNT/rqk6xlMqhrt2khuOIcCNdAvQaj5
        dcMWP0vK5sg9ATJ+XRaRlDIRAXzsaxa7PASj5MhfM8PMhN4+VxKYkq0fKtQwfpZo
        0MhLd/Ll3Gd8k98+3bH5KsCYFxDYZSv85KpwS2RGinyUL/lpUdOxprYCqIDyIZ2I
        wh2OR1DdrSlylMJllP01oG54xRpOTiqwayZRnEUKCI6T02ZCA0c7oLVhUCxUi6b6
        ZdWEXxs+IwI/NubGA7IXxBPYo2IXP64pPljh8nq3NgAHXjZDDy7wf+QNeBdphLtw
        ==
X-ME-Sender: <xms:pqZ7YQXi92jW380JZJh63OKDNrFAWXl7ZAcDlYO2_asZL5yy0u5Zxw>
    <xme:pqZ7YUnWLWF86o-SWtc15aWM4Iolev2tg-Cp5EAu44b3twZ3-5ncqOHHd-HtMnXE2
    GxdluszqNPOEA>
X-ME-Received: <xmr:pqZ7YUYrtl9v1zrxsLcrpIARTYqQ1u943mMezwzv4O-Tb_kVgsHd4CqOFWrDe7hdECnhJB3UEYSki4Fx758BWlV5NTVkudGW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeggedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:pqZ7YfW83EidWM-94C0OPFMqWKu9Dcdx9KyqddFR7Ezt4iFrOOEqcg>
    <xmx:pqZ7YalW4Ds4QeO0Cl41yG4gd5AOa0Ar81mIXB3nz7dLavyOhgj5_A>
    <xmx:pqZ7YUdYE_89SKS_M6R1sovAQXh7P5snpzkZHXCmXupgxjD9n141XQ>
    <xmx:p6Z7YSEEpUeSCm1kmoQzZT6ywDBp9pqUBR0bGNMQt3FQxiFyxyXXRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 03:45:41 -0400 (EDT)
Date:   Fri, 29 Oct 2021 09:45:40 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Auld <matthew.auld@intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 drm-intel tree
Message-ID: <YXumpITANOVt3oaJ@kroah.com>
References: <20211028182753.56b6a174@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028182753.56b6a174@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 28, 2021 at 06:27:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> 
> between commit:
> 
>   5740211ea442 ("drm/i915/dmabuf: fix broken build")
> 
> from the drm-intel tree and commit:
> 
>   16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module namespace")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index a45d0ec2c5b6,abb854281347..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@@ -12,13 -13,8 +13,15 @@@
>   #include "i915_gem_object.h"
>   #include "i915_scatterlist.h"
>   
>  +#if defined(CONFIG_X86)
>  +#include <asm/smp.h>
>  +#else
>  +#define wbinvd_on_all_cpus() \
>  +	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>  +#endif
>  +
> + MODULE_IMPORT_NS(DMA_BUF);
> + 
>   I915_SELFTEST_DECLARE(static bool force_different_devices;)
>   
>   static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)



Fix looks good, thanks!
