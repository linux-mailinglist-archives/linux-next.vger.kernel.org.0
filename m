Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A0C28BA78
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 16:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389158AbgJLOKs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 10:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389209AbgJLOKr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 10:10:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F5CC0613D1
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 07:10:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a72so6701267wme.5
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=q4EC5hEm8KrtPAdtrlfLWYj7biKnJdAbCRH4TVorbTc=;
        b=Xfpm0AW6tFAd+5MArS1u7SlBI7k8C9OsfABYl6ok371G0BU5yexElnGPL1lR4UuQyo
         VyfItlZKYvS8hZIghbXJ6scX085q3jXsTPS/IcCkGwvr5PT+O1JMqxPiAxOkZGcvv9md
         GF0dVeH1iNqvXVyKYlTzouPTnQgtbGqYdKe98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=q4EC5hEm8KrtPAdtrlfLWYj7biKnJdAbCRH4TVorbTc=;
        b=anzoVSg5vfuvUx0rIwvTf29ruQnh8CU35gyuJcyZXQ/MSrijkwiOUm7BvcCHD5WFPw
         X1SU8+DZoUctBvfvxnGjkS7U+DcVCR49V4sNGxmRMvQ05SGxb/7AOoZyEmh5xLlY7YBz
         CkcEBlnTEsaro06/TdOKFUDN/xhNdwliZYRcYQEoD9epxfLJ28zQUZH0KwqPkZjqeQ2c
         +lelptr/PKKrWE4m5qyJ0O1x2HVyg7CQN1JGcoxO+nGaA8UoT/d73OLp/BsSGXvwQFbo
         rUEuJOd5z2ONevtBJ+TmPA+yQRx847cpzQPcGF5z2jGgjl4w7EMbMSaV3CF4eklaN6Gs
         cgoQ==
X-Gm-Message-State: AOAM5317qwAvIpRIWyzzQBHYDNsfLylHxSNTfrJww1g2JvEjiD+bO9WQ
        x9lKq/G8EhEso4zzfsadzkLxOA==
X-Google-Smtp-Source: ABdhPJz0EEzJMOfm+/fWHF2RgRn0n9XPU46VbSxuwjXE9wF0lrHRND6yaOKUIT8xJPh/UcQf3iBJXQ==
X-Received: by 2002:a1c:4e05:: with SMTP id g5mr11154183wmh.162.1602511843895;
        Mon, 12 Oct 2020 07:10:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u15sm24674205wrm.77.2020.10.12.07.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 07:10:43 -0700 (PDT)
Date:   Mon, 12 Oct 2020 16:10:41 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] drm/ingenic: Fix bad revert
Message-ID: <20201012141041.GU438822@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Sam Ravnborg <sam@ravnborg.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-next@vger.kernel.org
References: <20201012152452.432c4867@canb.auug.org.au>
 <20201012102509.10690-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012102509.10690-1-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 12, 2020 at 12:25:09PM +0200, Paul Cercueil wrote:
> Fix a badly reverted commit. The revert commit was cherry-picked from
> drm-misc-next to drm-misc-next-fixes, and in the process some unrelated
> code was added.
> 
> Fixes: a3fb64c00d44 "Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached""
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

And yes if you use git cherry-pick it'll do a 3 way merge, and
occasionally it's very tricky to resolve that properly. Especially when
you're not used to it.

What I tend to do to double check cerry-picks is git show both commits,
and compare the entire diff line-by-line to make sure I didn't misplace
anything.

Another trick is to use the raw patch instead of cherry-pick, since that
won't do a 3 way merge where you might get confused with other context and
fun stuff like that.

Cheers, Daniel
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 1be1235bd546..a3d1617d7c67 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -440,20 +440,6 @@ void ingenic_drm_plane_config(struct device *dev,
>  	}
>  }
>  
> -static void ingenic_drm_update_palette(struct ingenic_drm *priv,
> -				       const struct drm_color_lut *lut)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
> -		u16 color = drm_color_lut_extract(lut[i].red, 5) << 11
> -			| drm_color_lut_extract(lut[i].green, 6) << 5
> -			| drm_color_lut_extract(lut[i].blue, 5);
> -
> -		priv->dma_hwdescs->palette[i] = color;
> -	}
> -}
> -
>  static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  					    struct drm_plane_state *oldstate)
>  {
> @@ -464,8 +450,6 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  	dma_addr_t addr;
>  
>  	if (state && state->fb) {
> -		crtc_state = state->crtc->state;
> -
>  		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
>  		width = state->src_w >> 16;
>  		height = state->src_h >> 16;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
