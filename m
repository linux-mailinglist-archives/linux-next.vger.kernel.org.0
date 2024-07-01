Return-Path: <linux-next+bounces-2774-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A280591E66B
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 19:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F08F2848C9
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 17:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081316E865;
	Mon,  1 Jul 2024 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2lklDO2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3116DED9;
	Mon,  1 Jul 2024 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854343; cv=none; b=KQp7joUm/Rwx5G+NyqfwnZHJ6r8wU4hRGJvGPDbqLyXJxHEJIglChTdE5LCNSHMHXrCosN7IzLfXWgFTuc7Ogdr+mG2/WAgwGCqHy3No4poLnQQXavg6OQymwoieZXGuTt9WDsWkd6qyI05o2W0M6hjRmB1qd2bnblWdNWAu7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854343; c=relaxed/simple;
	bh=jfPimOmSjEMqU8jUtPaSvvnKNg03jPMcCI32o609gz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcoDDEVejDSRzMj6iAthrVl3Nf+p+qMjfCQtkntLrwth+skSwqb9dW3eNzM81AHWHS1f8WO5QoyvDZlc7X/YGDHye1KI/VN1jkzcRQk+BZPGbfUAbMtumcjom5bWkTaJ6S5VD+Sosre4y3d/J0YDK1SFYYwzKRBSQBJK8k4yot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2lklDO2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C7DC116B1;
	Mon,  1 Jul 2024 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719854343;
	bh=jfPimOmSjEMqU8jUtPaSvvnKNg03jPMcCI32o609gz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2lklDO2di+BTzo5RvvBTWW2HzjtEO2JXbKTQZ6flHJIZMzGoX9izGaF4Kg+faIPI
	 BUrU8rpEzrOucWUAS6IhS9d8jEHUQOsza+XVOiQVqROY8981IkJNkPOp/w9kyWRyMw
	 x7E/OVKPsBHYLV81PRfHkDlqqvu9FxhzGabowjWbXLeMj+IzyhMS5ycoyiGWkbZ+T1
	 s0igyDVSlwcbvC0LNYplySjHPI90O/T993pFkNr+w/b9ppIZtZOEfQ1se578+shlGV
	 VQo1g2UPi0SR5+nHuhir+2AwRJKeekKmwx+pYEJQc1G/AbJnQikpj3aFYyLhaArcNv
	 J62xyT9qlmwPQ==
Date: Mon, 1 Jul 2024 10:19:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20240701171901.GA882812@thelio-3990X>
References: <20240701191319.087b227e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701191319.087b227e@canb.auug.org.au>

On Mon, Jul 01, 2024 at 07:13:19PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/mmu.h:144,
>                  from arch/powerpc/include/asm/paca.h:18,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/dma-mapping.h:8,
>                  from drivers/gpu/drm/omapdrm/omap_gem.c:7:
> drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_pin_tiler':
> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
>    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/omapdrm/omap_gem.c:758:42: note: in expansion of macro 'PAGE_SIZE'
>   758 |                                          PAGE_SIZE);
>       |                                          ^~~~~~~~~
> drivers/gpu/drm/omapdrm/omap_gem.c: In function 'omap_gem_init':
> arch/powerpc/include/asm/page.h:25:33: error: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '65536' to '0' [-Werror=overflow]
>    25 | #define PAGE_SIZE               (ASM_CONST(1) << PAGE_SHIFT)
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/omapdrm/omap_gem.c:1504:65: note: in expansion of macro 'PAGE_SIZE'
>  1504 |                         block = tiler_reserve_2d(fmts[i], w, h, PAGE_SIZE);
>       |                                                                 ^~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Exposed by commit
> 
>   dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=y")
> 
> PowerPC 64 bit uses 64k pages.
> 
> I have reverted that commit for today.

FWIW, I sent a patch to address this in a bit of a more targeted manner
over a week ago:

https://lore.kernel.org/20240620-omapdrm-restrict-compile-test-to-sub-64kb-page-size-v1-1-5e56de71ffca@kernel.org/

Although somehow, I left off Ville from that patch :/

Cheers,
Nathan

