Return-Path: <linux-next+bounces-8817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9FC30733
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 11:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C6141884339
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 10:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9479B2D249A;
	Tue,  4 Nov 2025 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0rXDAzY"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E43634D3B2;
	Tue,  4 Nov 2025 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251442; cv=none; b=sj7osWQb17skJe+0rW0rLyhwjFpVQOT5LGG2nY921gOM3pJS1QiBtUQpcPCNl9E8qKwbDz5ZCF7cNBPPc6U8sr+2YyPVQZnEx6Oq7oChnFz13icnvulLVuhIu0YxAtes8saOyfh0RhU0PtOMazWHNnBPPsI5bVT2NGZXVtVgBRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251442; c=relaxed/simple;
	bh=K9IsUGi2wKpFhfnL6iptoWIjbutL+DAGLt1r4zaWAlQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o+9bmTYA94OLmZ8aONkGi2utZYWMMtuqlqgd8ivJpg1gy/MOS+i2oKzT6UYK3Tf1ktvOw8gkPJwaaRr9pXUMWaIYYrW7Dz7N6jJ3nrJbOVoCDWMaqNaUyPQCVOefBh7LtOr/EPSXcywArOd2VeqjI89N6JGPwygyOKfyhcnJTSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0rXDAzY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762251440; x=1793787440;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=K9IsUGi2wKpFhfnL6iptoWIjbutL+DAGLt1r4zaWAlQ=;
  b=c0rXDAzYtP2L3ORj7+/S+Hx1slnJUhNGSIUf7AQZpTKxo9VQpFjglJ6o
   3HusEBQl82KlKWbE5ApfbDsi/8kRXOYYWXl1DzWe2oCXYLbXfCe6ShpAN
   dVoyHkl7xeIujk6+2rFDgTTPwvq4XDYqr14SuTsuWjSM5l1yryvhIm1Gw
   /ydMJJQFEdt66yzxElkvIG4sSjWu0BWNbfucVAdRhLdHi8ueZKZvJO1c1
   FaPUl3sgoxnIS1rbD8LMcQ4GJhZnvsNmfoLXrmpzUEKBoVASdad/8aHby
   gF7eYuUak8lRWQ8XTu+sJOmqTM542czgfX7LGGLLtGvoEEi4kzExc7cxZ
   w==;
X-CSE-ConnectionGUID: 5Ndbn5o4T7eVPEeZzjuUmA==
X-CSE-MsgGUID: DUESihMYTAKfkrXO6KqL2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81970891"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="81970891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:17:19 -0800
X-CSE-ConnectionGUID: kvc8uvYsS7yF+E03YkuOZA==
X-CSE-MsgGUID: kQv+ZSHeSwqzS3z9bIuzhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186363416"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.182])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:17:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20251104101158.1cc9abcd@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103112418.031b3f8c@canb.auug.org.au>
 <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
 <20251104101158.1cc9abcd@canb.auug.org.au>
Date: Tue, 04 Nov 2025 12:17:14 +0200
Message-ID: <adda2398c0a29e0c5b0dcaa93a5be6ed0b67a1ce@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 04 Nov 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 03 Nov 2025 11:26:01 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
>>
> And now this:
>
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_setup_vram':
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
>    80 |                 drm_err(dev, "Failed to allocate mmio\n");
>       |                 ^~~~~~~
>       |                 pr_err
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_vmbus_probe':
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:140:17: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
>   140 |                 drm_warn(dev, "Failed to update vram location.\n");
>       |                 ^~~~~~~~
>       |                 dev_warn
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_plane_atomic_check':
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:161:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
>   161 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
>       |                 ^~~~~~~
>       |                 pr_err
>
> I have used the drm-misc tree from next-20251031 again.

And now this fix [1]...

Thanks for the report, and sorry for the trouble.

BR,
Jani.


[1] https://lore.kernel.org/r/20251104100253.646577-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel

