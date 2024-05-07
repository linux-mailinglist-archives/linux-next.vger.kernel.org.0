Return-Path: <linux-next+bounces-2202-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8C8BE175
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 13:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B1CDB249C5
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 11:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F94F156F20;
	Tue,  7 May 2024 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNeAwBs+"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDA4156C71;
	Tue,  7 May 2024 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715082979; cv=none; b=DA6rSMJOd1Y8Sh7OR52iAoTuvrrDf8RZ0XLAqEsATLpJUYrVvI20v7Edwxc301KCZCMaBKjRrA2+pAV3+Ucef5fEwLnObscSsvpnKYnQUAsQfr20HhPTOjTrfEP9VO/UE6pb+f06nuLvihU1C7zkx5zQORGLsVkZbJDNuneSzC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715082979; c=relaxed/simple;
	bh=YCfx2MWH/+mRiD1OngUSe3hKvYcb55JDZ18+jEfPe+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDDGUw3Ht2IsEIirEu3wLfw7l5zMDiPnKUW/ErTds4LaZ2YdWj2R6thwZIH4q6wSWRjaWoPzFSucxZpVw8qB4f0f7gDln82oqeqvqMfYtqT7nBC9g36fOakqCQhTbieSnowGtHEtvmEWy3pfJvGKfqIA6yTBWZbZ8XP90nirvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNeAwBs+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715082978; x=1746618978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCfx2MWH/+mRiD1OngUSe3hKvYcb55JDZ18+jEfPe+A=;
  b=YNeAwBs+0TJ7RMtvquCe4Aw8jFFiSxLzV8mcorn4k31Q5m+dd6J73Ez0
   Qn3jY7mknOgGsbU3hTvAnZFGl61vMtRaBeGPNreWANo80b9MH0zk/CFW7
   /aI2UDmsuoVhxnVQDlUgnODBmSW4H3MyNVBTvcEMUFRHUauUyMLxO8z7I
   KV8gu5B6Ga2602eKJiErwJcf2JI6TSetWztRJn6mt02k0GDXk4R+C1mUF
   bZ09H35puhrTvQ/RH+fW3uxrpxyPEt4X3oxJLkf0krlaCzdPh81Raakk9
   iNUCO3CKFnbASp6q8zMP1uBxu2fRUBXZ6Gbx+Et0UNAHlUYF0Ct45xEFd
   g==;
X-CSE-ConnectionGUID: qVKw7APYTfmxDaA2nSmYRA==
X-CSE-MsgGUID: A0o916AvRce0ZvIokM0NmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10711753"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="10711753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 04:56:17 -0700
X-CSE-ConnectionGUID: 9sr40ah6TwKWwqNqmSoApw==
X-CSE-MsgGUID: 9dr9h6mLT/mvNx3mCwqMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="32966453"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 04:56:15 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54E10120574;
	Tue,  7 May 2024 14:56:12 +0300 (EEST)
Date: Tue, 7 May 2024 11:56:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <ZjoW3KIouSo4NvMN@kekkonen.localdomain>
References: <20240506104953.49666125@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506104953.49666125@canb.auug.org.au>

Hi Stephen,

On Mon, May 06, 2024 at 10:49:53AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/media/pci/intel/ipu6/ipu6-mmu.c: In function 'ipu6_mmu_alloc':
> drivers/media/pci/intel/ipu6/ipu6-mmu.c:541:28: error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=implicit-function-declaration]
>   541 |         mmu_info->l2_pts = vzalloc(ISP_L2PT_PTES * sizeof(*mmu_info->l2_pts));
>       |                            ^~~~~~~
>       |                            kzalloc
> drivers/media/pci/intel/ipu6/ipu6-mmu.c:541:26: error: assignment to 'u32 **' {aka 'unsigned int **'} from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
>   541 |         mmu_info->l2_pts = vzalloc(ISP_L2PT_PTES * sizeof(*mmu_info->l2_pts));
>       |                          ^
> drivers/media/pci/intel/ipu6/ipu6-mmu.c:560:9: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
>   560 |         vfree(mmu_info->l2_pts);
>       |         ^~~~~
>       |         kvfree
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
> 
> not including <linux/vmalloc.h>.  It may have been exposed by commit
> 
>   690da22dbfa8 ("asm-generic/io.h: kill vmalloc.h dependency")
> 
> from the mm-unstable branch of the mm tree, so I have applied the
> following patch for today (and this or somthing like it should be applied
> to the v4l-dvb-next tree).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 May 2024 10:39:47 +1000
> Subject: [PATCH] media: intel/ipu6: explicitly include vmalloc.h
> 
> since this file uses vzalloc etc ...
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index 98a4bf9ca267..c3a20507d6db 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> +#include <linux/vmalloc.h>
>  
>  #include "ipu6.h"
>  #include "ipu6-dma.h"

I agree this is the right fix, we'll merge it via the media tree (I'll just
polish the commit message a little).

-- 
Kind regards,

Sakari Ailus

