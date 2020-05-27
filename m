Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213DE1E36FC
	for <lists+linux-next@lfdr.de>; Wed, 27 May 2020 06:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgE0EQY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 00:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgE0EQW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 00:16:22 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B13CC061A0F;
        Tue, 26 May 2020 21:16:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 185so2969231pgb.10;
        Tue, 26 May 2020 21:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YfVWxH/7ZrDB7heiLk3dCwVODao1Wqqpt1cV8H+cg68=;
        b=FaUijIara42lM4nDTnWX3sphBCaHCAuoZdlC+HaJ1cKbufQCs6Gk/cd1fQDgYKpT5D
         cWVglCWpr3Ot5OGBbSLeuZWSK8EAbMAp7cY+tiVaMO922pqVlzA/WJJnCWq25WaqhWle
         1AK753xcvP3UL+Y1yYZNzo1pg2BbWOlEOoTJK8DCWmjIKUgjciPiNB4VPYaWsT8mVE+x
         gengREQJ6aSKmX5yZFDm7T3isDqJIpxDtJqMPYAWHYBhgyc92G2PxOJ37uKZiNv+HO5s
         3JTK88JwjB5zw4OENueKFBZx+VpFot+hxlp2NGZKH9nVGFd3xg81WyV8RZIlUCws8xGa
         /uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YfVWxH/7ZrDB7heiLk3dCwVODao1Wqqpt1cV8H+cg68=;
        b=ApytGhboVFpt3qCh1HAn6azf/ESmInn5HEsgGmQXlXAnXP4UzbrPji7cju+8R2LO+B
         Xb0XPZVlwAQBpdiEqwYQYnV9nLSZhZScUqirfscLfxPHIVv6E2JxPfS28j9G97VqcayW
         9TpxOAMvy6RrwhuKEpGOZzXm2fapMrUShZ34zRajCuDoNs6VPL7iFx/9sXPBrdJHPUOR
         cU1J3qrzn+h4TYnMaIpZY0QIjuOdfe2xOXYbjMIgrfnfaU8C1QSYUwppPmNbRkIFetoa
         8+OIjoyLdvhavQeQ2rEb3oEyVUrjM3TFq/CJ2oqgCEFER9UbsiMV0hgb+c91JHF/gK0E
         pxCA==
X-Gm-Message-State: AOAM531VKGUiZHP92p8lHwoeovUBM2IrWAPwHyGC6OIM/KLqbnvR3RrN
        bviw61F3dZUJoe+GVSyTrgA=
X-Google-Smtp-Source: ABdhPJyR1l7RF+R12srzMpwvTN2eJyeK+/iJkmuz7eNbPO1J8aWbJygIKQjN5rOgaS3Tycz/J9wn3Q==
X-Received: by 2002:a62:1b8f:: with SMTP id b137mr1997121pfb.119.1590552981392;
        Tue, 26 May 2020 21:16:21 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id l9sm877902pfd.5.2020.05.26.21.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 21:16:20 -0700 (PDT)
Date:   Tue, 26 May 2020 21:16:18 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: inux-next: build failure after merge of the drm-msm tree
Message-ID: <20200527041618.GA3137030@ubuntu-s3-xlarge-x86>
References: <20200519150955.1667566a@canb.auug.org.au>
 <20200526140841.0a1d5c7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526140841.0a1d5c7b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 26, 2020 at 02:08:41PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 19 May 2020 15:09:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the drm-msm tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> > 
> > Caused by commit
> > 
> >   04d9044f6c57 ("drm/msm/dpu: add support for clk and bw scaling for display")
> > 
> > I applied the following patch for today (this is mechanical, there may
> > be a better way):
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 19 May 2020 14:12:39 +1000
> > Subject: [PATCH] drm/msm/dpu: fix up u64/u32 division for 32 bit architectures
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 23 ++++++++++++++-----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 15 ++++++++----
> >  2 files changed, 28 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 9697abcbec3f..85c2a4190840 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/sort.h>
> >  #include <linux/clk.h>
> >  #include <linux/bitmap.h>
> > +#include <asm/div64.h>
> >  
> >  #include "dpu_kms.h"
> >  #include "dpu_trace.h"
> > @@ -53,8 +54,11 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
> >  	}
> >  
> >  	bw_factor = kms->catalog->perf.bw_inefficiency_factor;
> > -	if (bw_factor)
> > -		crtc_plane_bw = mult_frac(crtc_plane_bw, bw_factor, 100);
> > +	if (bw_factor) {
> > +		u64 quot = crtc_plane_bw;
> > +		u32 rem = do_div(quot, 100);
> > +		crtc_plane_bw = (quot * bw_factor) + ((rem * bw_factor) / 100);
> > +	}
> >  
> >  	return crtc_plane_bw;
> >  }
> > @@ -89,8 +93,11 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
> >  	}
> >  
> >  	clk_factor = kms->catalog->perf.clk_inefficiency_factor;
> > -	if (clk_factor)
> > -		crtc_clk = mult_frac(crtc_clk, clk_factor, 100);
> > +	if (clk_factor) {
> > +		u64 quot = crtc_clk;
> > +		u32 rem = do_div(quot, 100);
> > +		crtc_clk = (quot * clk_factor) + ((rem * clk_factor) / 100);
> > +	}
> >  
> >  	return crtc_clk;
> >  }
> > @@ -234,8 +241,12 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >  		}
> >  	}
> >  
> > -	avg_bw = kms->num_paths ?
> > -			perf.bw_ctl / kms->num_paths : 0;
> > +	if (kms->num_paths) {
> > +		avg_bw = perf.bw_ctl;
> > +		do_div(avg_bw, kms->num_paths);
> > +	} else {
> > +		avg_bw = 0;
> > +	}
> >  
> >  	for (i = 0; i < kms->num_paths; i++)
> >  		icc_set_bw(kms->path[i],
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index c2a6e3dacd68..ad95f32eac13 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/debugfs.h>
> >  #include <linux/dma-buf.h>
> > +#include <asm/div64.h>
> >  
> >  #include <drm/drm_atomic_uapi.h>
> >  #include <drm/drm_damage_helper.h>
> > @@ -174,7 +175,11 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
> >  	plane_prefill_bw =
> >  		src_width * hw_latency_lines * fps * fmt->bpp * scale_factor;
> >  
> > -	plane_prefill_bw = mult_frac(plane_prefill_bw, mode->vtotal, (vbp+vpw));
> > +	{
> > +		u64 quot = plane_prefill_bw;
> > +		u32 rem = do_div(plane_prefill_bw, vbp + vpw);
> > +		plane_prefill_bw = quot * mode->vtotal + rem * mode->vtotal / (vbp + vpw);
> > +	}
> >  
> >  	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
> >  }
> > @@ -204,9 +209,11 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
> >  	pstate->plane_clk =
> >  		dst_width * mode->vtotal * fps;
> >  
> > -	if (src_height > dst_height)
> > -		pstate->plane_clk = mult_frac(pstate->plane_clk,
> > -					src_height, dst_height);
> > +	if (src_height > dst_height) {
> > +		u64 quot = pstate->plane_clk;
> > +		u32 rem = do_div(quot, dst_height);
> > +		pstate->plane_clk = quot * src_height + rem * src_height / dst_height;
> > +	}
> >  }
> >  
> >  /**
> > -- 
> > 2.26.2
> 
> I am still applying the above ...
> 
> -- 
> Cheers,
> Stephen Rothwell

Additionally, I see a failure with clang due to the use of Bps_to_icc,
which does a straight division by 1000, which is treated as an integer
literal, with avg_bw as the dividend, which is a u64.

Below is the "hack" in my tree.

Cheers,
Nathan

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 85c2a4190840..5ea725d8da6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -250,7 +250,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 	for (i = 0; i < kms->num_paths; i++)
 		icc_set_bw(kms->path[i],
-			Bps_to_icc(avg_bw), (perf.max_per_pipe_ib));
+			div_u64(avg_bw, 1000), (perf.max_per_pipe_ib));
 
 	return ret;
 }
