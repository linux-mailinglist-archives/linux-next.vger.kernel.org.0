Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443FC43C34E
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 08:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238381AbhJ0GyF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 02:54:05 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41725 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234461AbhJ0GyE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 02:54:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 872485C026B;
        Wed, 27 Oct 2021 02:51:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 27 Oct 2021 02:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=IPCFl3yEZuGZpQcCn3exhaT8Dsu
        WBc1KTkDi29Sb9r0=; b=H8QVR6d8oq4CzeHBKccfNPsDooh7KlbYSDdm3lA01+n
        OPg7ilek1lnm87zdCRIMjoFmsr8muH9cCtTGhmzzehGfMJsBUIVej5FsvFf3Vlt7
        /Zh4cXsXiHOs16gyREFtVRJhh94qicvRfo/188vSAGxqBMqYtef1JmXrnxxjHORj
        V5HzHnAH0P3Hnrud1XOlhPotfL1ucXGjzltZJUYmN1hvL2+hRj5v98A++/Umb5TZ
        Dhcw+t6d/tk4MeDqja0AFMkDT5N6Dl8XHyzN0RwFS5RQDuIbdECA4fackvzwflCR
        ccseypUqWWlA9DJCYgIaOImvz44/MM+BLHMdNlj/QxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IPCFl3
        yEZuGZpQcCn3exhaT8DsuWBc1KTkDi29Sb9r0=; b=TJ5DP+1LWUGTX5dBkAN8kQ
        l8XkaMiYAxasjg9VgqY9dDOVCHCFpLM16X3OTDAnouuGUhtSLdI9akiFLucBlIz5
        UDP5gqekju+016KOdChp5BQRDOUmUdr1cV2qLqMZZR9Ri905yDtD3YvI7mwZucW+
        jRXqdZCAOfcoi+XXxecca36RSfqR/PiRekHk//GQ4mpBH7hSEstm9GaQgRPbz57o
        bOVCjjd+RR/40slaElMH3AYOLwua5k1w+TMFyx3C9oTtWNQzXc3eGJjq2ma4FdLp
        0CMSqdevGj6t5rldcVMVxgPmLlyeHdqkRtOkJO4Ke/Q8GddsSvno//gqA3YWPqBw
        ==
X-ME-Sender: <xms:-vZ4YXpOKbRvbfyNmCV7cse7wXExMgmUhQn4Wbj2UIKSdrvGNsquVg>
    <xme:-vZ4YRoihj5j7iOxgVwbfhA2rjindh5Nzr78GrseKPqJEgaVlkN9sZhVB9yiUZaKe
    OfeV74rsXFngQ>
X-ME-Received: <xmr:-vZ4YUM5GBV_nwRa8EeGSFsNjdHH6cC_fu0sLX4FEXr6wU5E-1nDCpHcrRAtf-JIeJcUejVAOP4P8zXgAPc3DTzYhV-rJ9Jr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefledguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:-_Z4Ya7_aecu4-3zPaIS8mH1ocn2fhEJxwQ3OKy5b1nN0NWXLGaUow>
    <xmx:-_Z4YW71g5gPfXo3DTKg5GZlmeh-kO2_rem35Qkdu4EPzrRx_GRcpA>
    <xmx:-_Z4YSjw_qRC66RCQbjf3071uiJMsvidETt0Wk6vIJVe9xA7fAQepA>
    <xmx:-_Z4YTtGzwv0ktq9KkmIlwdsXW-flYHReXMtW5pYImwiXGqWyyKaNQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 02:51:38 -0400 (EDT)
Date:   Wed, 27 Oct 2021 08:51:36 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <YXj2+IdEKXmbfKi3@kroah.com>
References: <20211027154843.622961fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027154843.622961fd@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 03:48:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR: modpost: module drm_shmem_helper uses symbol dma_buf_vunmap from namespace DMA_BUF, but does not import it.
> ERROR: modpost: module drm_shmem_helper uses symbol dma_buf_mmap from namespace DMA_BUF, but does not import it.
> ERROR: modpost: module drm_shmem_helper uses symbol dma_buf_vmap from namespace DMA_BUF, but does not import it.
> 
> Caused by commit
> 
>   16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF module namespace")
> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 27 Oct 2021 15:44:18 +1100
> Subject: [PATCH] fix for "dma-buf: move dma-buf symbols into the DMA_BUF
>  module namespace"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 57ceecb3f4d8..f7324582afe7 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -22,6 +22,8 @@
>  #include <drm/drm_prime.h>
>  #include <drm/drm_print.h>
>  
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  /**
>   * DOC: overview
>   *
> -- 
> 2.33.0
> 
> -- 
> Cheers,
> Stephen Rothwell



Looks good, I'll go apply this to my tree to keep things building
properly.

greg k-h
