Return-Path: <linux-next+bounces-8546-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977ABB515E
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 22:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6A5919E551B
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 20:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6A62874F7;
	Thu,  2 Oct 2025 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXym1NhV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA613287249
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759435524; cv=none; b=MZZ8WJSfTLDtpLvFpNTFTbPL6Dj/nFb+Eu/8rJ4ZH/GGI+vp6zXUX/3QT2yKSScE+ObY/AFVRfAV+SMM5UKuHe9hLWpqhjZgNTIWc7DExh2w9se0IyEvEwJH+42F00Fcv51I7sH5cZOQ3b7vYpr7808v9WhmWQVsMLYhoq+Ap8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759435524; c=relaxed/simple;
	bh=ObauuXNqFHyLQ5FeshTkWyZhrWP5LHYPP/SarpyhbVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/DoM4vpTSjzhVet0uPs21cdUqZiRyKAEe5UtdBE3tv10xQYa8cKgmCT7yats5es31hfer8QpC4VzmfVDeJAIv0neZmZxvSApkBxAnV327lO5JQ/0YZLkqbhazw/Hin03h9gC7cF+LG8E/6FoZqglOkpWWxsLL+qcBIAifOSDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXym1NhV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A5AC4CEF5;
	Thu,  2 Oct 2025 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759435524;
	bh=ObauuXNqFHyLQ5FeshTkWyZhrWP5LHYPP/SarpyhbVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXym1NhV0cb9hWsa2C1xzO0G+Hp/iqw3cdVZJxYn9lIPbDhIl7htLTrVbwATVVQQH
	 U4ddRYdbB8/AgM4Kv667sBvA7IFVtJGbuNpxVh/FCQ9EN9q8hsoeY9KcD1ifBoY1Nq
	 mCWM8s2I9NwmKM0qsAxczAWphEEpeVwsRAE/QxagD0nKKlXzen8sJj66kJ8IeyOvg7
	 JLJ7z0cRmTjCjc9qIcEq5ocWy+fHWghAVsNAfT57VZd9nl7ApTh2nB0vpv0xYTOqoC
	 oi4umdQ1ygY/LVmP2ep9gCNI1D/CGocnzn+A9LcGF9gvZ3D0Zywk3L3kH2Fr4voJKe
	 D/AqxObc/4mxw==
Date: Thu, 2 Oct 2025 20:05:23 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Mark Brown <broonie@kernel.org>, Wei Liu <wei.liu@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the fbdev tree
Message-ID: <20251002200523.GA925245@liuwe-devbox-debian-v2.local>
References: <aN6k79cY8mKSrKQq@sirena.org.uk>
 <a8e320dd-37de-4738-bd6b-74a6884dec74@gmx.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e320dd-37de-4738-bd6b-74a6884dec74@gmx.de>

On Thu, Oct 02, 2025 at 09:41:58PM +0200, Helge Deller wrote:
> On 10/2/25 18:14, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the hyperv tree got a conflict in:
> > 
> >    drivers/video/fbdev/Kconfig
> > 
> > between commit:
> > 
> >    9e84636785c5e ("fbdev: hyperv_fb: Deprecate this in favor of Hyper-V DRM driver")
> > 
> > from the fbdev tree and commit:
> > 
> >    94b04355e6397 ("Drivers: hv: Add CONFIG_HYPERV_VMBUS option")
> > 
> > from the hyperv tree.
> 
> 
> Wei, I have those two patches in my tree:
>     MAINTAINERS: Mark hyperv_fb driver obsolete
>     fbdev: hyperv_fb: Deprecate this in favor of Hyper-V DRM driver
> 
> Please let me know if I should drop those.
> I'm fine if you carry both (or any) in your tree.

I can carry both. That simplifies things.

Thanks,
Wei

> 
> Helge
> 
> 
> 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc drivers/video/fbdev/Kconfig
> > index a7500251f41ac,72c63eaeb983a..0000000000000
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@@ -1771,8 -1773,8 +1771,8 @@@ config FB_BROADSHEE
> >    	  a bridge adapter.
> >    config FB_HYPERV
> >   -	tristate "Microsoft Hyper-V Synthetic Video support"
> >   +	tristate "Microsoft Hyper-V Synthetic Video support (DEPRECATED)"
> > - 	depends on FB && HYPERV
> > + 	depends on FB && HYPERV_VMBUS
> >    	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
> >    	select FB_IOMEM_HELPERS_DEFERRED
> >    	help
> 

