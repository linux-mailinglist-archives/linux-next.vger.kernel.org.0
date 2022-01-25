Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7F149AB82
	for <lists+linux-next@lfdr.de>; Tue, 25 Jan 2022 06:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiAYFQI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jan 2022 00:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3416784AbiAYEmD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jan 2022 23:42:03 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEC3C061760
        for <linux-next@vger.kernel.org>; Mon, 24 Jan 2022 19:22:44 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id c3so17854415pls.5
        for <linux-next@vger.kernel.org>; Mon, 24 Jan 2022 19:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Oqh/QrylE3qwclVle0OxUKedqq6NnQXFDpCsoYWtHv0=;
        b=QUB65Uqx37uyu0GYgnR9XW/AwBHHIv4vcjG8rlbOI8stWM2l4x3WKE+peh/69VAT48
         l9dXCc3DFcMAjl8scbF8q4LPrNb+3zfQdaahKpxPkykVUlMLLHFXjDmwIYpPxKlILxaQ
         DKIYWaOCQeaxYrTUhOfYnTc+jyg3baVViUqXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oqh/QrylE3qwclVle0OxUKedqq6NnQXFDpCsoYWtHv0=;
        b=U63pJ/j9Wa+IM05e9M0aBcy5GJ27fpLwyrZkQuOFca+76jufhRJURctWLND8JUPVkG
         GKMT8hdKuB2fbnke0eoSPrhj/rzOWbGpd33jcLuCEaw8mGwYdGNUMeFAlJH3yOEnVLxF
         E7oafea0T7NYbnvYzEMjlAfP8jouXP2F2h0yDbm6eAKwSkkDo9eIBkBaiCtknyehvmjX
         T78WL7NAr+AST09Ou6Yecy8klBubv6yFna211yUETCO/2+Gq/doJLzBeWhmgCOkPgBfh
         YeKHELXrMCjMgaesPwouoQ5k5XaaCRSisQ9L0hRvO2wElORMJg6vcKNdADi5qPKrJgYL
         Lt8g==
X-Gm-Message-State: AOAM532WBym+OWKss9S+GM/wLLSDHU+4GR0ucaEnIidjDkW24ieYsqIC
        /mbfdh6U7Et05srzhWz0S/XJxNUFlyMNRQ==
X-Google-Smtp-Source: ABdhPJx6e05OQGJ+QZT0qastZmt3AkKAO2UcDJDt2uvjX/kPJTwsy5i1vlifmWG83l1eX6EOt4md1A==
X-Received: by 2002:a17:90a:2b85:: with SMTP id u5mr1429319pjd.77.1643080963342;
        Mon, 24 Jan 2022 19:22:43 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id kk17sm717517pjb.21.2022.01.24.19.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 19:22:42 -0800 (PST)
Date:   Mon, 24 Jan 2022 19:22:42 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202201241918.D63B75BCF1@keescook>
References: <20220125135546.1a2e1d6b@canb.auug.org.au>
 <20220125140221.5c1f4640@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125140221.5c1f4640@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 25, 2022 at 02:02:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 25 Jan 2022 13:55:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the kspp tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > drivers/gpu/drm/kmb/kmb_plane.c: In function 'kmb_plane_atomic_disable':
> > drivers/gpu/drm/kmb/kmb_plane.c:165:34: error: array subscript 3 is above array bounds of 'struct layer_status[2]' [-Werror=array-bounds]
> >   165 |                 kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
> >       |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> > In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> > drivers/gpu/drm/kmb/kmb_drv.h:61:41: note: while referencing 'plane_status'
> >    61 |         struct layer_status             plane_status[KMB_MAX_PLANES];
> >       |                                         ^~~~~~~~~~~~
> > drivers/gpu/drm/kmb/kmb_plane.c:162:34: error: array subscript 2 is above array bounds of 'struct layer_status[2]' [-Werror=array-bounds]
> >   162 |                 kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
> >       |                 ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> > In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> > drivers/gpu/drm/kmb/kmb_drv.h:61:41: note: while referencing 'plane_status'
> >    61 |         struct layer_status             plane_status[KMB_MAX_PLANES];
> >       |                                         ^~~~~~~~~~~~
> > 
> > Exposed by commit
> > 
> >   4ba545781e20 ("Makefile: Enable -Warray-bounds")
> > 
> > Originally introduced by commmit
> > 
> >   7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> > 
> > Maybe should have been fixed by
> > 
> >   c026565fe9be ("drm/kmb: Enable alpha blended second plane")

Yeah, that had fixed it at some point. :(

> > 
> > I have applied the following hack for now.
> 
> Actually, this one:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 25 Jan 2022 13:45:26 +1100
> Subject: [PATCH] hack for building with -Warray-bounds
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/kmb/kmb_plane.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
> index 00404ba4126d..b54197920712 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -158,12 +158,14 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
>  	case LAYER_1:
>  		kmb->plane_status[plane_id].ctrl = LCD_CTRL_VL2_ENABLE;
>  		break;
> +#if 0
>  	case LAYER_2:
>  		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL1_ENABLE;
>  		break;
>  	case LAYER_3:
>  		kmb->plane_status[plane_id].ctrl = LCD_CTRL_GL2_ENABLE;
>  		break;
> +#endif
>  	}
>  
>  	kmb->plane_status[plane_id].disable = true;

Thanks!

The prior thread about this was here:
https://lore.kernel.org/lkml/20210825181807.1138053-1-keescook@chromium.org/

-Kees

-- 
Kees Cook
