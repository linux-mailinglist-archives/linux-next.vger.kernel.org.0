Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326AC27FBEE
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 10:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731724AbgJAIvw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 04:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731697AbgJAIvt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 04:51:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B27C0613E4
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 01:51:48 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o5so4679306wrn.13
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q0ZqQW+4vFf+iD9A70s75Xj0tDXrtRGQDZhTqMv0HQA=;
        b=GwbofYx9CoC9S0ddpDsHPuhwueqzRHZJ5M3qYwTGpY3ghcpSvLbKilOykFTg4hujbF
         4cDGPHsCdmFztg066nYKNVFnoOQPPtCulSXtYZ/9JB+hmtVuoIXZauMaSu79yZoJVC6T
         syAYqU+eBGvvW9GhE2Es/xGggziKKjMhpL4Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Q0ZqQW+4vFf+iD9A70s75Xj0tDXrtRGQDZhTqMv0HQA=;
        b=lp5PdxykpkWBs3NZ6LYh8zGGkyATlRnlhOfjIEP8NJA9lcjfZme1OzXf6hfjbs80U0
         eOKnIr4SUVHf0EgbZlRhPSVVhjlF8CwqryWqokYDt4Ssa06vXDnpyZiAv98V4Aqu4av8
         G86oSCjZftBoY/Z1JU6VU/sNP2HhhLb1Xz+vs6lliV1LecbYHKHRVXu8WFp+ohZIs70z
         SVKxmayt3583qOu1qY7eV64quGfyP3l8ynLi49MSKQeosWgDKMBSXk9/TpmJ2pykoxPk
         xnZXvW61WOHDTZqmFBTEBkkOl6iZV//xK2WFui4HgRpfrq02c4p1DYD4UBUgnKoXx9Or
         GQOg==
X-Gm-Message-State: AOAM531wZJnwdm9CfK2wCqWAbhaRCX6W+HrcWo6aTj0bJ59HuDg9q2+s
        yIyOT0gAYXD/eh7yYGDos2SjXg==
X-Google-Smtp-Source: ABdhPJzKXFLbzshpy+p+8230Vw8GdYl9ooKUmCa2O/O8jqzK2KVTh/nWZ/iQ0i7cPspGYyUBl9SBvg==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr8110204wrn.175.1601542307324;
        Thu, 01 Oct 2020 01:51:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n3sm7712106wmn.28.2020.10.01.01.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 01:51:46 -0700 (PDT)
Date:   Thu, 1 Oct 2020 10:51:44 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm: Add and export function
 drm_gem_cma_create_noalloc
Message-ID: <20201001085144.GD438822@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200930165212.GA8833@lst.de>
 <20200930171644.299363-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930171644.299363-1-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 07:16:42PM +0200, Paul Cercueil wrote:
> Add and export the function drm_gem_cma_create_noalloc(), which is just
> __drm_gem_cma_create() renamed.
> 
> This function can be used by drivers that need to create a GEM object
> without allocating the backing memory.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 11 ++++++-----
>  include/drm/drm_gem_cma_helper.h     |  3 +++
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 59b9ca207b42..6abc4b306832 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -34,7 +34,7 @@
>   */
>  
>  /**
> - * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
> + * drm_gem_cma_create_noalloc - Create a GEM CMA object without allocating memory
>   * @drm: DRM device
>   * @size: size of the object to allocate
>   *
> @@ -45,8 +45,8 @@
>   * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
>   * error code on failure.
>   */
> -static struct drm_gem_cma_object *
> -__drm_gem_cma_create(struct drm_device *drm, size_t size)
> +struct drm_gem_cma_object *
> +drm_gem_cma_create_noalloc(struct drm_device *drm, size_t size)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	struct drm_gem_object *gem_obj;
> @@ -76,6 +76,7 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
>  	kfree(cma_obj);
>  	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_cma_create_noalloc);

This feels a bit awkward, since for drivers who want to roll their own we
can do that already.

I think the better approach is to export a cma function which allocates
non-coherent dma memory.
-Daniel

>  
>  /**
>   * drm_gem_cma_create - allocate an object with the given size
> @@ -98,7 +99,7 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  
>  	size = round_up(size, PAGE_SIZE);
>  
> -	cma_obj = __drm_gem_cma_create(drm, size);
> +	cma_obj = drm_gem_cma_create_noalloc(drm, size);
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  
> @@ -476,7 +477,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>  		return ERR_PTR(-EINVAL);
>  
>  	/* Create a CMA GEM buffer. */
> -	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
> +	cma_obj = drm_gem_cma_create_noalloc(dev, attach->dmabuf->size);
>  	if (IS_ERR(cma_obj))
>  		return ERR_CAST(cma_obj);
>  
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index 2bfa2502607a..be2b8e3a8ab2 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -83,6 +83,9 @@ int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
>  struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  					      size_t size);
>  
> +struct drm_gem_cma_object *
> +drm_gem_cma_create_noalloc(struct drm_device *drm, size_t size);
> +
>  extern const struct vm_operations_struct drm_gem_cma_vm_ops;
>  
>  #ifndef CONFIG_MMU
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
