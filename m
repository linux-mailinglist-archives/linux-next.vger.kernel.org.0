Return-Path: <linux-next+bounces-2897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123092BDFB
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 17:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB542B24688
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 15:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7296E15EFC9;
	Tue,  9 Jul 2024 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M++NMgxf"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675119CD03;
	Tue,  9 Jul 2024 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537780; cv=none; b=GJGZSI5v0E/pVvkaZMLdj63HpF1nqqCjb0XILdDUdI4BvW2hdIm+CbKAOwalqBBv2kFLjQHpzarccxQz4ZBacHLxJFxMgjRgpj9NI4WWU+kIA5Cl41BgQgh2Oc0jEnXGS+I+CzfHkGjWU8H7ATG/vh5TU+xDybWbfjpv5ZthMBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537780; c=relaxed/simple;
	bh=5DrqVOSH/ft+huHFvRwNe4A0c6YO5hZHNoZYWRR3cKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opJbxFEekNo+LD3bgF6QG8AL9ZTrPlHXEPb61S6JL0uC/d/EOuYMNe7Lxr4erortn1CVa3eUO69OKbmNWez5nO82lkz6qe0TSHNKFKvJqm2u73Z0yxkoe+9URqsYPo55xV8ZKRdnt/ruMlnFmjEKJfKWRUEaPK288dvwx46vT6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M++NMgxf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720537779; x=1752073779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5DrqVOSH/ft+huHFvRwNe4A0c6YO5hZHNoZYWRR3cKQ=;
  b=M++NMgxfwz10AnlLkR9G8nzSxDD6wFYfkNp7dClh0qx4yxnjA5Jw/cZG
   OCiq6s9elXI5h8k9cSER8VB3dRSWvJcyufJZAGc87Ag4vgqM8Pj6SIS+3
   0KLc67jHe5gNcX7ZRUOYzwyLU+29ljKFDwJ6afJg48YVYVo7HjbYTrzea
   KMO99RgKkc/XmsY2Wq1rJl/LKz84CscmUl6JoQWW0KUicEUVjFdMNn3FP
   lwRoZ5zwwpYBaYTvxnxfFbRe5giSfnFhOg+1qRoiAp2G6/SKQeMVPGogI
   3Dw4gZx+O/APnHDXLR1KbCGLGbeJet1SFB5BNyo5wBRcfSe3hLjLoREaO
   g==;
X-CSE-ConnectionGUID: TyRx199LRVmtJrS/zNwK4Q==
X-CSE-MsgGUID: hn4B5aGNSOCf2AqPBWZjug==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17620699"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17620699"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:09:38 -0700
X-CSE-ConnectionGUID: c15VrcBoT5eu4VoWgg5m4w==
X-CSE-MsgGUID: pEWjBfDCRMGhpr7iL1bKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47869198"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 08:09:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1939811F811;
	Tue,  9 Jul 2024 18:09:32 +0300 (EEST)
Date: Tue, 9 Jul 2024 15:09:32 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <Zo1SrABWB-axGibI@kekkonen.localdomain>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709163715.3bcd6ab3@canb.auug.org.au>

Hi Stephen,

Thanks for the patch.

On Tue, Jul 09, 2024 at 04:37:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>  1786 |         .remove         = pispbe_remove,
>       |                           ^~~~~~~~~~~~~
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near initialization for 'pispbe_pdrv.<anonymous>.remove')
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
> 
> interacting withc commit
> 
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> 
> from the vl4-dvb-next tree.
> 
> I have applied the following fix up patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 9 Jul 2024 16:03:05 +1000
> Subject: [PATCH] fix up for "platform: Make platform_driver::remove() return void"
> 
> interacting with commit
> 
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> 
> from the v4l-dvb-next tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index e74df5b116dc..7596ae1f7de6 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int pispbe_remove(struct platform_device *pdev)
> +static void pispbe_remove(struct platform_device *pdev)

While this approach works when the patch is squashed to commit
0edb555a65d1, it's better to also use the remove_new op as its return type
won't be changed. That can be merged independently of commit 0edb555a65d1.

Feel free to submit v2, I can post a modified patch as well.

Thanks.

>  {
>  	struct pispbe_dev *pispbe = platform_get_drvdata(pdev);
>  
> @@ -1765,8 +1765,6 @@ static int pispbe_remove(struct platform_device *pdev)
>  	pispbe_runtime_suspend(pispbe->dev);
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
> -
> -	return 0;
>  }
>  
>  static const struct dev_pm_ops pispbe_pm_ops = {

-- 
Kind regards,

Sakari Ailus

