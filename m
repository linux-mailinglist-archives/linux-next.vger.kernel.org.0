Return-Path: <linux-next+bounces-8799-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D580C2AB88
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 10:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98353B4F37
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 09:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D562E9ED4;
	Mon,  3 Nov 2025 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF0BUpRD"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E222E9730;
	Mon,  3 Nov 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161971; cv=none; b=hOPA9SvKDeNRSQVZ3QQn5DH73cBITopqtke3Y0qzVeZq0GdsnmR1sc+5sS9cue4FLsT6xn4cZ8iPeoJUDXB0Bar7GmmBqje79TDWrUXL2IGhh/U8wCDBeXYX4vap4XS2BbtvMZMv0UGUI0y+E97ZQJoHMS830J4O7RUmJFFCwQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161971; c=relaxed/simple;
	bh=0+8O8IQ8U0kV20x53Wn5EU5fTLeflJ75PULxjkLclzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cM5oALXiQLIjEqR8eN93/V30uaB/MC+nVStd7Kg9ODP4X7B7lLnLjYwJGETH5MZQ4SgficXVJ+uYxhhzNaG4oJ6qBYpLvXaTcfJSZqqpcjMjm0MR5uDqfWLlxeE14PKNsSW+WoIgAZGjqsOwggu+yYCTT2yvZXEaYRylhcZ6wSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF0BUpRD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762161969; x=1793697969;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=0+8O8IQ8U0kV20x53Wn5EU5fTLeflJ75PULxjkLclzI=;
  b=MF0BUpRDO4BFvJTHihTDeVU7KKTix9WcYAKeZyZmgBEznTx4umPkxbPw
   IKaSLI7/SPG0NNbS52NqAAfd5ZDyKhrud27zoDl1xZ03i0JcI+ZlXNBKL
   NofwKEn/+ehK/QVCXPcv+8IxZ7Wb6KqFgXLcBOBDEqabZcmZ9DdUNNgEl
   wlNfNZQnWdJKjiZCb7Jvj8cnaHOL6RfhQ1DTMaiQvc+z+SOyO7b1/grHp
   U8MJLPLOPr1cvI+eZ0mQ1+PqHaQ3KLnU1bXc2kTu0TnR/PnukmcMcZRDw
   E71G2bCPvamEIYwJ9uTeSkvypjEi7nkUksJurwWp+67UOBMxd9DR5t/IM
   Q==;
X-CSE-ConnectionGUID: cRO+KDQcSiKA14kIVypIgw==
X-CSE-MsgGUID: KwuOrzpxQV+GdZVaqg4ymQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="67886792"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="67886792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 01:26:06 -0800
X-CSE-ConnectionGUID: Zithr4brRoGAkRPrr4mi5g==
X-CSE-MsgGUID: DFXSxedURhS+pgCRxTJGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187272974"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.127])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 01:26:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simona Vetter
 <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20251103112418.031b3f8c@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103112418.031b3f8c@canb.auug.org.au>
Date: Mon, 03 Nov 2025 11:26:01 +0200
Message-ID: <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 03 Nov 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c: In function 'rzg2l_du_probe':
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c:173:9: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
>   173 |         drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>       |         ^~~~~~~~
>       |         pr_info
>
> Presumably caused by commit
>
>   9695c143b72a ("drm/buddy: replace drm_print.h include with a forward declaration")
> or
>   ea722522d505 ("drm/mm: replace drm_print.h include with a forward declaration")
> or
>   d7a849d126d0 ("drm/ttm: replace drm_print.h include with a forward declaration")
>
> I have applied the following fix patch for today:

Thanks for the report, the fix (same as yours) is at [1].

BR,
Jani.


[1] https://lore.kernel.org/r/04f617d5fe37f92d750efbb73065df3997f5c6b5.1762161597.git.jani.nikula@intel.com


>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 3 Nov 2025 11:12:27 +1100
> Subject: [PATCH] fix up for dropping drm_print.h includes
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index e1aa6a719529..c34b1a13e685 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
>  
>  #include "rzg2l_du_drv.h"
>  #include "rzg2l_du_kms.h"
> -- 
> 2.51.1
>
> Which lead to this:
>
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_convert_format':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:215:17: error: implicit declaration of function 'DRM_ERROR'; did you mean 'SO_ERROR'? [-Wimplicit-function-declaration]
>   215 |                 DRM_ERROR("unsupported format[%08x]\n", format);
>       |                 ^~~~~~~~~
>       |                 SO_ERROR
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'rockchip_vop2_mod_supported':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:395:33: error: implicit declaration of function 'drm_dbg_kms' [-Wimplicit-function-declaration]
>   395 |                                 drm_dbg_kms(vop2->drm,
>       |                                 ^~~~~~~~~~~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_setup_scale':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:602:25: error: implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? [-Wimplicit-function-declaration]
>   602 |                         drm_dbg(vop2->drm, "%s dst_w[%d] should align as 2 pixel\n",
>       |                         ^~~~~~~
>       |                         dev_dbg
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_core_clks_prepare_enable':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:763:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
>   763 |                 drm_err(vop2->drm, "failed to enable hclk - %d\n", ret);
>       |                 ^~~~~~~
>       |                 pr_err
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_crtc_atomic_disable':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:967:17: error: implicit declaration of function 'drm_info'; did you mean 'pr_info'? [-Wimplicit-function-declaration]
>   967 |                 drm_info(vop2->drm, "wait for vp%d dsp_hold timeout\n", vp->id);
>       |                 ^~~~~~~~
>       |                 pr_info
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'vop2_crtc_atomic_enable':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1758:41: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
>  1758 |                                         drm_warn(vop2->drm,
>       |                                         ^~~~~~~~
>       |                                         dev_warn
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 'rk3576_vp_isr':
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2198:17: error: implicit declaration of function 'drm_err_ratelimited'; did you mean 'pr_err_ratelimited'? [-Wimplicit-function-declaration]
>  2198 |                 drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY irq err at vp%d\n", vp->id);
>       |                 ^~~~~~~~~~~~~~~~~~~
>       |                 pr_err_ratelimited
>
> So, I have instead used the drm-misc tree from next-20251031 for today.

-- 
Jani Nikula, Intel

