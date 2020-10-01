Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5D827F917
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 07:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbgJAFfN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 01:35:13 -0400
Received: from verein.lst.de ([213.95.11.211]:47487 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgJAFfM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 01:35:12 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id BC8D868B02; Thu,  1 Oct 2020 07:35:09 +0200 (CEST)
Date:   Thu, 1 Oct 2020 07:35:09 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] drm/ingenic: Alloc cached GEM buffers with
 dma_alloc_noncoherent
Message-ID: <20201001053509.GB19914@lst.de>
References: <20200930165212.GA8833@lst.de> <20200930171644.299363-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930171644.299363-3-paul@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 07:16:44PM +0200, Paul Cercueil wrote:
> It turns out that if you want to mmap GEM buffers fully cached, then
> they should be allocated as such as well. Who would have known?
> 
> Introduce a custom .dumb_create callback, that will behave just like
> drm_gem_cma_dumb_create(), except that it will allocate the GEM buffer
> using dma_alloc_noncoherent() if non-coherent memory is what we want.

I think you want to merge this with patch 2, then change patch 2 to
still use dma_alloc_wc for the !ingenic_drm_cached_gem_buf and to
get the phys address using virt_to_phys for the
ingenic_drm_cached_gem_buf instead of abusing the dma address in
->paddr.  The free side also needs to use
dma_free_noncoherent.

> +static int ingenic_drm_gem_cma_dumb_create(struct drm_file *file_priv,
> +					   struct drm_device *drm,
> +					   struct drm_mode_create_dumb *args)
> +{
> +	/*
> +	 * This is basically a copy of drm_gem_cma_dumb_create, which supports
> +	 * creating fully cached GEM buffers.
> +	 */

What about adding this to the core GEM code instead?  We'll probaby
run into other potential users as well.
