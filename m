Return-Path: <linux-next+bounces-9675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C09D2437E
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 12:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C864630181A7
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 11:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395A336D513;
	Thu, 15 Jan 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNAob5GI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DEE36C5B6;
	Thu, 15 Jan 2026 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477182; cv=none; b=E1lvfIFrxJ6y7RHJLEtTqeYfPDI8uQEdDLYdtEQmiI7k5j55/WAxyB92DhCE1c4qd/wCXVe4qe34YjzZjpkepFwHS2iGzGnWKUAKWbEXmP4gS0+OTH0gfPgKPbkq5NQHB8VhoaLCqe0vmvtAJ8mecuZaE4jGFhiJwa30IAushEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477182; c=relaxed/simple;
	bh=plMpwrIeZl5UexJVC5dGdPL8XgofzyQvBw01tzhD7jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psgmeMRQIbEnNUqLFHL1RlDAOuXPn2mZdA6H/lY/UqPvDnhYA2nT5+whMdjRFy4QVnciwZHkhdowmBVIjH/S85AZAbuc0gS0IY6M0hCa8Gv7UZJHPTtHr5jnITYF+uQoaHtL+Zbf50SEms1C0709G7t0Hn8ktYMRf0xMB96Uq9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNAob5GI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B7EC116D0;
	Thu, 15 Jan 2026 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768477181;
	bh=plMpwrIeZl5UexJVC5dGdPL8XgofzyQvBw01tzhD7jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNAob5GIqdWtZwirXxYyNFMz0UM4dr38K7+e0yWm2PM7TX+HSIaORb3KHr79sjcNP
	 Z56xkCu3aN2qwZUqrRPyoZHw4rcxjPLxItrZn9F3CYXr2ukayv73BHBjlsQd2+jhrQ
	 0D4CKtlWZZh/K92YE3weTYQ5TZ4ymFLofpEHQPIlP47lYuq2k0mUGqSUj2WQfso7Ks
	 PSU826/AIc8wJLhc+7cAE++OK6y34QQONftKs8BiTdNSoOfv3l2RTIluVfYK3OtFhn
	 VLuM16awU6MeKHaS+gWblnsrm7dtLk3Ckn70N5jbZrpKo+5skkTuQ+GGH0J9Dked6/
	 3BNa164GeWf2w==
Date: Thu, 15 Jan 2026 11:39:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jan 15
Message-ID: <7f7ab42f-cdd2-4714-9368-6dbae8f59a7e@sirena.org.uk>
References: <20260115161417.5a82a41c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y3iAXg9i4pOkTe2l"
Content-Disposition: inline
In-Reply-To: <20260115161417.5a82a41c@canb.auug.org.au>
X-Cookie: Are you sure the back door is locked?


--Y3iAXg9i4pOkTe2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 15, 2026 at 04:14:17PM +1100, Stephen Rothwell wrote:

> News: this is my last linux-next release.  Mark should start doing
> these soon.

Thanks for all your hard work over the years Stephen, you've certainly
set a tough standard to live up to.  I'll pick things up from tomorrow
but it's possible I'll not manage to finish things the first day so we
might miss a release.

--Y3iAXg9i4pOkTe2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlo0fcACgkQJNaLcl1U
h9DHbgf9GKJbdfKYn5mbLIuMl3GWGpEuiaERE2OrBZihOUD7rWijYAqSm3srr96h
QLuwlmT5zTfvhKymasC4kz5znsvNsG5mWiKnN9eUwz4bgtIJ+UqwI3uzs6FAYxQ6
iTRkIVFfCuZi4MpnjcmOHfDjWDQUxYPbVFI8HGG5FHT2ZArEuK6JL09d0sUO9xPp
AoQJoknAVmHZLo90S4jSQcvQtGkICM7rZQqMQzRaTlrRyYYK/OOXapICQJ+P7Wmc
k3oBMJfGgzhlYLBq+x8519sAIovCiy9jApqeiEZZvyv7KSxDMRGHhbkwl0T9jJEa
VuJhRMg5ir6aoI3qTE3O9rNqzrXJ/Q==
=D8wP
-----END PGP SIGNATURE-----

--Y3iAXg9i4pOkTe2l--

