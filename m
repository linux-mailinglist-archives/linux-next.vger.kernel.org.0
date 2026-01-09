Return-Path: <linux-next+bounces-9603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDCD0C116
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 20:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7B9D307A544
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 19:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5EC2DF134;
	Fri,  9 Jan 2026 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ku0j7g1d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C08D265CDD;
	Fri,  9 Jan 2026 19:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767986666; cv=none; b=i5IlICr+/b5OTJCPw00eVr8A+bnGhYVjOBxFp7DV1+/D46Qh5WO9HPRNswQq7UbuPSb39zhCX2EG4pbM7rquvaXcFYhgsrOnPPZj2ujJImMa+NcuUckyQaeNRb82GqJqrMG/nkwWYjJ38M2zX/dIsh/HXEy8PKDfs1RyZav38q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767986666; c=relaxed/simple;
	bh=FS6OJbcL3DI1FwzqnMCvNJ08zxRJEC3dzXsFGkGO/ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQu8mw1yJQYNw85IkwVjNukjxYHqUmu6o2IWi9f1GtJ53IpYL6iLsEiM3Frqphv9nCg8V4Yg1kErBXG0IiZmQ80RuyexWWThWU3opl9QPThK36y+oBZ5t1/9f2XR1G5EZuy7jK4DzKfaGZRPk5k+TboK0/AMdbALSkOVhUPzMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ku0j7g1d; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8012140E0200;
	Fri,  9 Jan 2026 19:24:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tY1rYLZ3fSMo; Fri,  9 Jan 2026 19:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767986659; bh=+ytPEo1xOzohX0R4Odi+1kxDm9HJKt7PxsJERcRdKQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ku0j7g1dnG4FAjMgonGQGiscR4Z4BHCd8YVXuGj+vxe7w0PB6gLeyfkmAWQp/Yt9F
	 NRXMBMz432qu21dsbJ388X0YJexiNKjzRxdSIc2TWdI5qTpRErzv3ya57xZEHwRe7I
	 driOhVKzWjHXdsx1rSNRXofcMR6sblr0HoTIS6L7gN40OjWLHzp8VIbYQ5KSggG9yx
	 ULAdgAglUG7Iy9WG+OUq7/Xquvfi7DBWqU9PVZkwCq+OMddfW30D0mbOXArl+0yHnI
	 mkNRgEgjLTKZM4maK+EvhUMLku5XKmpbaAeHz2xT1k4EypOfRHW8aamPK8Ey9TwaON
	 eCsp0LIOl/ajlXxLOX3a30OCblzVasbNr86w1+vJNpMtNwQ5r48B+97xDK7Mhfoo00
	 CgdcwHnbpHZVlJaj31zl4IzYvTx4Va+rW73/FVP4McIu+CA4GD756Mx+tkKpfxU0Y7
	 W9fA6qzLYyJg6Q6pU5f8XQ7eyLpUTj/ZL7Y8gOIKiDWYBYrN8Gkq8p63+NpE1YaTTM
	 u0rSRgSBtfp1U2TZ3R4i2NLp9Mtc3Ng06232xffDx/3qR65dt8fKDMX96ZGyGhVp+m
	 Jrjp31+Kv7i8C0L77mX24FkcLbPBIDF2+qKhYuL4EH9DYyP7kYajz9n3Cz1uWLeC1i
	 Tq1azIie3lNUpPtK5CMjt8HY=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id E586740E01BB;
	Fri,  9 Jan 2026 19:24:10 +0000 (UTC)
Date: Fri, 9 Jan 2026 20:24:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
 <20260107144753.7071f5f2@canb.auug.org.au>
 <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
 <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
 <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>

On Fri, Jan 09, 2026 at 11:17:44AM -0800, Andrew Morton wrote:
> This is utterly impractical without support from the x86 maintainers.
> 
> I upstream a *lot* of patchsets which alter x86.
> 
> I looked once.  5% of those patches had an Acked-by or Reviewed-by from
> an x86 maintainer.
> 
> I cc you guys until I'm blue in the face and it's always crickets.  I
> simply cannot permit MM or kexec progress to be blocked by the
> unresponsiveness of the x86 team.  It's very regrettable but it's
> almost always the case that I just have to proceed without your
> assistance.

Well, cross-tree issues like that aren't fun either. And you know very well
that we're all overworked and drowning in patches. So it's not like we're
ignoring stuff or whatnot, on purpose.

So it sounds like we need to decide upon a scheme where we work together
better and don't step on each-other's toes like that. Lemme talk to tglx.
 
> This particular patchset is a kexec thing so I added it for testing
> because I look after kexec.  I'll drop it and shall trust you to handle
> Coiby's contribution in an appropriate fashion.

Yap, I'm on it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

