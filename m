Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE2527F90E
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 07:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgJAFcp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 01:32:45 -0400
Received: from verein.lst.de ([213.95.11.211]:47469 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAFcp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 01:32:45 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7EEE668B02; Thu,  1 Oct 2020 07:32:42 +0200 (CEST)
Date:   Thu, 1 Oct 2020 07:32:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm/ingenic: Update code to mmap GEM buffers cached
Message-ID: <20201001053242.GA19914@lst.de>
References: <20200930165212.GA8833@lst.de> <20200930171644.299363-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930171644.299363-2-paul@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 07:16:43PM +0200, Paul Cercueil wrote:
> The DMA API changed at the same time commit 37054fc81443 ("gpu/drm:
> ingenic: Add option to mmap GEM buffers cached") was added. Rework the
> code to work with the new DMA API.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 24 +++++++----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 0225dc1f5eb8..07a1da7266e4 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -526,12 +526,10 @@ void ingenic_drm_sync_data(struct device *dev,
>  			   struct drm_plane_state *state)
>  {
>  	const struct drm_format_info *finfo = state->fb->format;
> -	struct ingenic_drm *priv = dev_get_drvdata(dev);
>  	struct drm_atomic_helper_damage_iter iter;
>  	unsigned int offset, i;
>  	struct drm_rect clip;
>  	dma_addr_t paddr;
> -	void *addr;
>  
>  	if (!ingenic_drm_cached_gem_buf)
>  		return;
> @@ -541,12 +539,11 @@ void ingenic_drm_sync_data(struct device *dev,
>  	drm_atomic_for_each_plane_damage(&iter, &clip) {
>  		for (i = 0; i < finfo->num_planes; i++) {
>  			paddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
> -			addr = phys_to_virt(paddr);

No on the old code: drm_fb_cma_get_gem_addr returns a dma_addr_t, so
this was already pretty broken..

> @@ -766,14 +763,6 @@ static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
>  				struct vm_area_struct *vma)
>  {
>  	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
>  
>  	/*
>  	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
> @@ -784,12 +773,13 @@ static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
>  	vma->vm_pgoff = 0;
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  
> +	if (!ingenic_drm_cached_gem_buf)
> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>  
> +	return remap_pfn_range(vma, vma->vm_start,
> +			       cma_obj->paddr >> PAGE_SHIFT,
> +			       vma->vm_end - vma->vm_start,
> +			       vma->vm_page_prot);

both ->vaddr and ->paddr come from dma_alloc_wc as far as I can tell,
and despite the confusing name ->paddr is a dma_addr_t.  So this can't
work at all.  If you allocate memory using dma_alloc_wc you need to
map it using dma_alloc_wc.
