Return-Path: <linux-next+bounces-7232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FBBAE64AD
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DEF6406CBA
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF252D12E9;
	Tue, 24 Jun 2025 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Y5VKzzUD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8342BD5A4;
	Tue, 24 Jun 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767345; cv=none; b=k7CPWNAzF8R+3ahuoq2ICWTvtxW+hZwkwrZRETQWje0mjaewRb3CUstnUyQe54FzUIX1zgvi9k9x6hsBPePaGnsH+Oe4ad6TbmLm9dq3fn9E5fRDsvl4Nm9GgKNzVS469bXD75Z7MaqlptC33mgVAI3rgLjayOJv0512IK4yJ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767345; c=relaxed/simple;
	bh=Xx62FWVT1U6s5vNt/ztdV8jPN66m7tkPjCC9BQ+v0B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI5DXt1lY2aKAcTP2BETNkb6lDGaYkyKmWNdLFQF/rPxj2LBByHyIrYiZqYeqf9cmEqwCzuWxgMvNT3RjARhyTuIsN75giaR4tDt6YLTfqQ2upJidHJnSY1/DhHn9+xX0+J7qU0FkLFYM2qClC87XmeLQOsbGnIfRVLpKTmmkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Y5VKzzUD; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5475C40E019C;
	Tue, 24 Jun 2025 12:15:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JlIa62tjnAGT; Tue, 24 Jun 2025 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750767329; bh=lMTkyq6kQanOXEnWGlmpybqV/LnRpRG/rDZlliMXUVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5VKzzUD3eW3pQQmM5/IYqgLXZ/S6U8M8dpzDCwYbE0lrlijqCpiqSYAR1ULWGo9q
	 QU+vtBUKvzEHbpBQ80h2ouaOxV/evUAGk8mdBrRecn++yzRS5Ct4Fm4BzfpfnK6nMD
	 OnFu/t2ZZuJotRLcvJJ+MtGqWkC86jQRNrExkzhLYeWqjjnM3VrJkVP3oVcvxiUiAp
	 3ekTnZWZ6RxCGHzeEPeydj3Z32EOjF5Qjd4d/olywXiXSh5D3Ir4FotOpIlP/xKTj1
	 j+ZZQdQk80waFpMPye50v895rYyU0eKsCN2BU3r/Mu0B5DWNflZ3jnDBfXYM+d5jzx
	 x9aQos+UtFKO8Ir3bBxzVhbLuw+p8YqtUoB/UecPphCO+JxxrUtuD3km3wupNW6bBq
	 TpAlZjgnLniDeu9OqTR1DPhV2rVnsD8+YkZBPfLP2R/9IbF+CA1IoVCUK3mcam7iPo
	 jvK6LheO+XHj+sXAHQgweROU7FAI9wK2KHKt3lok63/BAAucDveK3+wIhcKBwZYqUH
	 nmbzn1uLebTYNfm0a4L07j1yuLkTkeJCgz+Tp6UbrrIKg94OHKzaHHEXAT3xlIbUIf
	 y1crTIQsNXPnBKPjknqDathP0R2QI60N11k5+LPT0wm0MhUf7kFRlVx365He+mR9hT
	 M4eeUG9phqUVhz9cHNfxYFeg=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6754240E01D5;
	Tue, 24 Jun 2025 12:15:21 +0000 (UTC)
Date: Tue, 24 Jun 2025 14:15:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20250624121514.GBaFqW0pfVsvEgrRiW@fat_crate.local>
References: <20250624211528.3b0b3bcb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624211528.3b0b3bcb@canb.auug.org.au>

On Tue, Jun 24, 2025 at 09:15:28PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   e88b1627b86e ("x86/bugs: Allow ITS stuffing in eIBRS+retpoline mode also")
> 
> Fixes tag
> 
>   Fixes: 8c57ca583ebf ("x86/bugs: Restructure ITS mitigation")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 61ab72c2c6bf ("x86/bugs: Restructure ITS mitigation")

Fixed.

Thanks Stephen!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

