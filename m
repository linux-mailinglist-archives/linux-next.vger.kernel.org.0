Return-Path: <linux-next+bounces-4862-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE59E2B60
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A2D216385D
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 18:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001191FCFEF;
	Tue,  3 Dec 2024 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANWIj3Q4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01B1FCF41
	for <linux-next@vger.kernel.org>; Tue,  3 Dec 2024 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733251876; cv=none; b=pKMuk7X1W1l9tSDcp10kWXkES61jH4qrRGEQcPlCAXuw0zaFoHH1PQDvh+1691MuxiI5I47KkksACn5fAzQAAL+qVOYrd28vOT1RR9WANDnkLhvDwGLv+H80F1IIRHHfrySFkKLGJQHLAK3PSHhBJwHE2IUrXQR5qiWWqKQS2DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733251876; c=relaxed/simple;
	bh=SeUo9loXhjq6glQUnPz4ojy3Jlqv0fU1IJAZ75sXEGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmjqIOZCgzENHQrxuNpoNquybgDdabIBur34B4kRh0v1fPZX6J0cP+HuQUbW7InGsPjEeio6048SFZGxHrreBymuafbL7A7qIXnbPg0eDaqcOIedrYPawXDWYjKjfPZ85d0hJ5Nap4Qvd77xx9JOO63Zm1ODKX/XtbkMKxbo9YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANWIj3Q4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46DEC4CECF;
	Tue,  3 Dec 2024 18:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733251876;
	bh=SeUo9loXhjq6glQUnPz4ojy3Jlqv0fU1IJAZ75sXEGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANWIj3Q4qG3ksBdym0EhzGoVU3ScuiuUwbvvRYKoGDj/9ANqMZAL2kObymuTO0NaX
	 znErqoL6SKKvXdJW9+alQCHYilIhyx4Q9AAnsCZWkJJO/p2d4MOwe/H85GGxpY6rkB
	 QRe0zhVQWD7Q5CpaE8HIcM4cxFcI0ihs0dQTnQ59Zh0bbLXSgvqd2fCcPd4lHfGtVs
	 OpIj160SwmcQlgDvII4FnJ3n7OqWg9ru0HpwGQAZiXa62yhLbYKplllbirQbaiL7J0
	 jOymCN250aJwKC2TiNJtAlOt3A71HTnsUQ2U4Le/qAW1BWzGvk3PPFvvsn7OR8pHbi
	 JIZKXgHfWNcFQ==
Date: Tue, 3 Dec 2024 18:51:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: Add crc-next tree to linux-next
Message-ID: <d74d90ea-8ab7-484e-beef-cc226f2ebd8a@sirena.org.uk>
References: <20241202013154.GA25618@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VW7ldVsiI69ZinsZ"
Content-Disposition: inline
In-Reply-To: <20241202013154.GA25618@sol.localdomain>
X-Cookie: Alimony is the high cost of leaving.


--VW7ldVsiI69ZinsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2024 at 05:31:54PM -0800, Eric Biggers wrote:
> Hi Stephen,
>=20
> When you have a chance, can you please add the following to linux-next:
>=20
>     Repo: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.=
git
>     Branch: crc-next
>     Contacts: Eric Biggers <ebiggers@kernel.org>

I'll pull this in to the builds I'm doing this week, you should check
that Stephen also adds it.  It's likely that he'll put it in at a
different point in the merge too, though hopefully that won't cause any
issues.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--VW7ldVsiI69ZinsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPUx8ACgkQJNaLcl1U
h9B+hgf+O85u1mbHezuEagXiz2lhjceKJ6OWnbGsU9skJDSbYrqeFqswoBfY7rsC
XN9bBHm4XvadFakqMfSZ2A12kvateWGPXF+bUnT6nVYevP+GO/gBmRoEquURtzf3
XUR0KuGDdDNzwyZbLmDBAcp9VbWkLIOJOOc8gUummVcYcRHcvBxMKQZ6fviKTRyL
hZcu/Sckdz+50YA/09+q1FTj+K9OJLcdGj0OhLSB8agzty0ahejADSqb99pMi/P0
M9vy+UH8dsh5Y1atzDVlkX2qFSnzkVtnT8/3znGhBE+neh4/4H++sYZmUYDP3W83
OkWT39B37s23cnEmh/hPvwxCWM3KxQ==
=QMl5
-----END PGP SIGNATURE-----

--VW7ldVsiI69ZinsZ--

