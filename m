Return-Path: <linux-next+bounces-2719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AC91D047
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 09:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78563B2120A
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 07:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78090383AE;
	Sun, 30 Jun 2024 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QAWx80a2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48B2F877;
	Sun, 30 Jun 2024 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719732393; cv=none; b=QYqxA3P6sKZ/5+2ZZY3Tjm7ksBEMtHVyZv3/icBACivfxdvLyp4NMgNA0H0Y2CVq+pqhnHUegR5mFjunr6Yd4FjT77LNsY3bT+4tGRw2hA3KwJtgs5eE1a9vEms2QTOXEohuRidtXWFaLonCGlOXmwMNoDmgww7JJZYJYMneen8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719732393; c=relaxed/simple;
	bh=oH3KMkvOQyLEWAyqWw97sia+9VhJ8GGOr2REalK1SRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDqGqEViBCfMcKxJy8zk6w4MK+EB4tFUyoc/1bGgesJnWTmV5kV5hbKnwphoHYj2jtP7xANhKeK4Q60jIIEToetLBEHxJgWRuSbRcRc1Vq5yIfciKhZjcod/5a1isSrXvp3gp7/vK0XupaLz9OV39Bk1qW9qYy4/J+Tjf9ATTw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QAWx80a2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BFCC2BD10;
	Sun, 30 Jun 2024 07:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719732392;
	bh=oH3KMkvOQyLEWAyqWw97sia+9VhJ8GGOr2REalK1SRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAWx80a2nzWidFK4UZ+L7D2n8sAS+3H7x/pLDkgFov6xxuBguGk3Fk/7XH292HtZu
	 PXgGp0uWcLE/PgVF2dI9L20KroluQA/nl5glJZ1IIe/iwa4nUzQegY3dCsxNc7XYEm
	 R5C+10lgV+QWI90mMtk/KNPL7OamTKeq+I4e8VO8=
Date: Sun, 30 Jun 2024 09:26:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <2024063022-trapping-affidavit-56fd@gregkh>
References: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn8TKYDCOCtbbNH8@sirena.org.uk>

On Fri, Jun 28, 2024 at 08:46:49PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the drm tree and then some other trees which seem to have
> allowed the driver to be built much later in the merge process today's
> linux-next build (x86_64 allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>  1212 |         .remove = lvds_remove,
>       |                   ^~~~~~~~~~~
> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: note: (near initialization for 'lvds_platform_driver.<anonymous>.remove')
> 
> Caused by commit
> 
>   6597efcfc53585d5 ("drm/stm: Allow build with COMPILE_TEST=y")
> 
> interacting with
> 
>   aca1cbc1c9860e39 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
>   0edb555a65d1ef04 ("platform: Make platform_driver::remove() return void")
> 
> I have applied the below fixup patch.
> 
> From 59a5e11f41e93512ca1a5aed36c1c396d175797d Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Fri, 28 Jun 2024 20:45:16 +0100
> Subject: [PATCH] drm: Fix up STM LVDS driver for void remove() conversion
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/gpu/drm/stm/lvds.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index bfc8cb13fbc5c..2fa2c81784e97 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -1186,15 +1186,13 @@ static int lvds_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int lvds_remove(struct platform_device *pdev)
> +static void lvds_remove(struct platform_device *pdev)
>  {
>  	struct stm_lvds *lvds = platform_get_drvdata(pdev);
>  
>  	lvds_pixel_clk_unregister(lvds);
>  
>  	drm_bridge_remove(&lvds->lvds_bridge);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id lvds_dt_ids[] = {
> -- 
> 2.39.2
> 

Looks good, thanks!

greg k-h

