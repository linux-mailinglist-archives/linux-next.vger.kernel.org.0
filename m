Return-Path: <linux-next+bounces-9640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893DD1A04A
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 16:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 980B83012C4B
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 15:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D22F2E0914;
	Tue, 13 Jan 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Nnss7xi7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3BC2E6CCE;
	Tue, 13 Jan 2026 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319316; cv=none; b=GtUVTir01smRgGGqGmt3msPc4mbGBKL7VDBPgwCO+VkbhRiLoaHgvczrQMeUYrg4hy3N4rKM+Y/tPxuqeAvnYGCOXfdu4vPz6aGtbNUNFyTNyrD9Ty121OtZSk924oVUJ0cUL3LQEtiQUQ6FSdE+ElfDdJlgnIMF7a9vhV6xbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319316; c=relaxed/simple;
	bh=H23NoiDTcJWPhrvi0+rJI0Q7CNhuFfh+dseXr4Z1Hu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQPtyCIYqwcFpR53FQ3y5UzY2KTfmxr1PJmx67UO0CNfGTl2QCCLnMxTZGpr9Hu/CgKLwW7KAZUbsP1x/Ucn1svlcBBZvpLy7RFww559wnIaxGeXLYBj7/9GXLWUI2trRRm72pyz5kcaOcrQwL6RUavCbuvdYnah4uhBWgQ88+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Nnss7xi7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CDC2540E01A9;
	Tue, 13 Jan 2026 15:48:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xP0gvcZowi5X; Tue, 13 Jan 2026 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768319308; bh=qH/QwcqUveG8ATrXyKNUCy/ONqU9MpS5vB0I+Q+ncB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nnss7xi7SzKTj5HXhN+pgfX4wdJOSUOTxezIh3SH0EZghKEWp27cDovB2pCslxSyC
	 STODJS/4zNiFDEjuNJGhgIq/YLv4y5areYDZ8ddZvwe6+NP5b8oTPTUo4p0zXR+ND2
	 0wPdA9t2ehLrSn8iGYidCBRdca8l+M9Wyfvsin35F3WYmBUvy6Hs6/+CTDbFAaLVbM
	 JbgZUJ18+4VJvEflUBlQbbIglETgfMMM/RyGAhwSIwvEIli5y5VwtHCw1/IwWbAtnC
	 uFyIg+DXbkVztz9stz4Cgh6vjiEBe4p06s1VUxD8QlSbjjeNdvN6X23fuJBlmCn6WO
	 ZxaD/tR2V+6juSK0oVizjs9vag4EuLlbtX9HfYOZcArhHL4kGe2UnK/ce7yeiRD6rc
	 lodzbsZ1vxAJ+ZPbQ7sKewP3IR0cX91y64HSpM0hITe1C4Bm87UJaDEUXvQEmQViiQ
	 ZS4909OGaQJqUr5mpvCGrxGNxmJejY2ki02R8vTbUGXTWxuUKUz9/zWzYAbgegJcNL
	 gg8e86msKHeiNHmySC1JypNvsoLEkKa+gLz2v+pdwgsBijEgppMrlbKZdYA2xfZ16J
	 AY7YR/DI20xk5wSNXoKHv3JuDjzo+TrarK6n7iZjjmCPW1gg9YHzuwJwcx9wkY9hfQ
	 ONLPXiL1x/KVFl65vP91Wdtw=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 940E240E00DA;
	Tue, 13 Jan 2026 15:48:21 +0000 (UTC)
Date: Tue, 13 Jan 2026 16:48:14 +0100
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260113154814.GLaWZpPpzJcSRuLFjA@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
 <20260107144753.7071f5f2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107144753.7071f5f2@canb.auug.org.au>

On Wed, Jan 07, 2026 at 02:47:53PM +1100, Stephen Rothwell wrote:
> So this still failed with yesterday's tip tree, so clearly there is
> some other change in today's linux-next that has exposed this.  Instead
> of using the old version of the tip tree, I have just reverted this
> commit for today.

This issue should be resolved now in the next tip/master incarnation.

Holler if you still see issues.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

