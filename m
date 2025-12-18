Return-Path: <linux-next+bounces-9463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACBCCB05B
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 09:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AACFA300B29A
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 08:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61871279355;
	Thu, 18 Dec 2025 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQIvwNyV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B7C1DE3AD;
	Thu, 18 Dec 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766047931; cv=none; b=OS7Zc56I4EOiUG/r5ydr6gjcgB2uSCDYY732Br3COPcOC0FWdikbkfcc80Ct6a15HUf/2DG2E3g5GP5sIGqPlt0cpmX/uhkVy2MUSg2Fu76fzKJGlzOr4e8n1zhkq5JyzWg0z4kHSSIRy50JaI/krKz8U6Bx41r3hVCjKjqMcrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766047931; c=relaxed/simple;
	bh=wPVeWbaV/mwCI6wvoQy5rlvkZpQ6uzq6IJ6NyaKuRWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNHA+8qppw15w7Pef33lrPAr6EuXoEJ5jkzoNkjIVct/xidSm8crai3KcaniXKyWePRoi6da0l3s4fR14zqzKCwrNQtYQRzfic1eYXkUoJAM8LYUuHMccABoTVG+GHo0JG2l4PlbwO90pFJmvvdf0mQS/zJNxcVfHmUDmZwClcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQIvwNyV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7142DC116D0;
	Thu, 18 Dec 2025 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047928;
	bh=wPVeWbaV/mwCI6wvoQy5rlvkZpQ6uzq6IJ6NyaKuRWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQIvwNyV6dkZz4shrsoRnVzhIMlDarKLWFIJw9nVeFIoAGMcDyPWNaFq1uGuI/WmV
	 Gp77xfFIEHHi0N3Z/WKGx86ST3b11q7dRmWfvYEYeiBinsgrgUbneSebT+/79T1lN4
	 o9EvEPSyV39YehEVeKMt8Hv/xoONd6Cs24E4Xps5aXAd0aoEx4rSgMbasCKwcYMqvD
	 N9yTEsqBPGpEz4sEnKcNOgigfXabuGi2/4KQaB9VaIdBntThR/Ha3HK3/67PJRAJJz
	 VAGHudViQeNVouHTuhz9W8cS0Qt7mNEksHK7zk3y1M8UezeR+4rF6uItDD/tFv0Hc1
	 0KNqLPiga/9bg==
Date: Thu, 18 Dec 2025 08:52:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Linux-kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: changing maintainership
Message-ID: <df68e9a1-2b98-423d-915d-58f224db6374@sirena.org.uk>
References: <20251218180721.20eb878e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czttHzHEHpyrHXOp"
Content-Disposition: inline
In-Reply-To: <20251218180721.20eb878e@canb.auug.org.au>
X-Cookie: Close cover before striking.


--czttHzHEHpyrHXOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 18, 2025 at 06:07:21PM +1100, Stephen Rothwell wrote:

> Some of you already know this, but this is a general announcement.

> I will be stepping down as Linux-Next maintainer on Jan 16, 2026.  Mark
> Brown has generously volunteered to take up the challenge.  He has
> helped in the past filling in when I have been unavailable, so
> hopefully knows what he is getting in to.  I hope you will all treat
> him with the same (or better) level of respect that I have received.

> It has been a long but mostly interesting task and I hope it has been
> helpful to others.  It seems a long time since I read Andrew Morton's
> "I have a dream" email and decided that I could help out there - little
> did I know what I was heading for.

> I hope to still be around the kernel community, but just not so active.

Thanks Stephen for all your work over the many years you've been doing
-next, these are certainly going to be big shoes to try to fill.

Thanks also to Arm for agreeing to support me doing this.

--czttHzHEHpyrHXOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlDwLMACgkQJNaLcl1U
h9Bwpwf8D11kcKCCSDfb6+PrIKrl+frw/nmri34Tb/xtZ3ARU5VhXbpFfTa7cP/v
3AvT6fGMD8/WaWxmOvgcAi7g9ZAgeRSOcJKr67p5LOEdSXL6QTuyc5pfY+AQ/vkb
qMlfJ9/mg3G6olxU484NOaVbgw/D7pXMkeX8T7QzWffhywXsgfu/r4JaID6DdgSq
imYVGdUJ+aVBixOJQc7jX4AjlaDa/gl7dOH4ZI5K5Mz5mXl4ZNYRYGNBRl4r6aEP
LwaW9zkbQkQGXTAA+qngvRbSOQxBwihw3O/apu44ocYUF4D73Zv3B9ZvghpVrG4C
omr8DER9mwdynyWBXuhffLtotfub7Q==
=dS48
-----END PGP SIGNATURE-----

--czttHzHEHpyrHXOp--

