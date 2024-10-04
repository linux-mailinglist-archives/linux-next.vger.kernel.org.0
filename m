Return-Path: <linux-next+bounces-4100-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F57998FCC8
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 06:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30FDBB22723
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 04:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090721B963;
	Fri,  4 Oct 2024 04:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XriV8O/Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD76E614
	for <linux-next@vger.kernel.org>; Fri,  4 Oct 2024 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017144; cv=none; b=A2ZrJWulCcTz6UVtAbZrC8YWDOX4xbB8BitLAvH3iJMycLy01m8qyM+CeNS371P/fwuHqwkX+Ndg9fQt6iaHKumReopOjxokMzgUHB1ikE2ha+2g38GBg1BR7fjSHI0wTJuj8x4rykW6N+/y0fF65eidzNcsPiJC5ETZtg74CYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017144; c=relaxed/simple;
	bh=ZjB7j5wlUq38wx46c9alNEtbDM8/Z7sPWgo1R24NRZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PCtGfmQpandrfhXJwVs3ELVm+UMU8SnYiERKz/42eoNju6ZIdUOgLA41i/Ry0bUHeBND7jyvlzBQgZPSQpo8woChPVsuUe6KG33+tIy6mxoib3Huv0Swf40CS8Xn5gw2n8/m/JnFCL+pqw8KaCVlWvvZhyYyfysdFF/kSTGIXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XriV8O/Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728017140;
	bh=iwkokd0XQS93MeL7o+GWBY/h7sMWEdozEN95cIIjVAA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XriV8O/ZgVIJVsD5pSUO0EGNmeTRyGWj19+nK5zRQ+WyURs2MRHPgLwzsqIXas54S
	 EJ482kyWLAFznYLEs0b/NW57Cv2XZDCmewSIdhCEa5QTPfNjWzd2/JUnBr8BEKP/IZ
	 Rofpj3INui+TUMac3NXlPvfH68rrOkrtLCVEdfJYqoYgaIBhqzQ4hrN6XkbyyfZM5J
	 1WHH9xZ4dFV3SmPPSEYJDnd/UJAdzjwesBu0085IlwelrNVFlBG3yCWweqNK1R3giG
	 OVWwhThqA8da61YlXfhw16cocQssCApZ/zBFPHjRw9fhDbaKoDRgTrOHmr9c3PuZI7
	 9uAzn3FHH85qQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKbZr0K9Nz4xCV;
	Fri,  4 Oct 2024 14:45:39 +1000 (AEST)
Date: Fri, 4 Oct 2024 14:45:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: linux-next@vger.kernel.org
Subject: Re: Please add ipe tree for testing
Message-ID: <20241004144539.1adeae43@canb.auug.org.au>
In-Reply-To: <991f7b99-25fa-426a-99b1-a161fef3b728@linux.microsoft.com>
References: <991f7b99-25fa-426a-99b1-a161fef3b728@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fDc9CVD9VE8StMteTEi7cgA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fDc9CVD9VE8StMteTEi7cgA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fan,

On Thu, 3 Oct 2024 20:36:04 -0700 Fan Wu <wufan@linux.microsoft.com> wrote:
>
> Please add the ipe tree
>=20
> https://github.com/microsoft/ipe #next
>=20
> to linux-next.
>=20
> ipe is a new lsm we introduced in 6.12. I'm still in the process of
> setting up a tree in kernel.org, so I have to temporarily use our
> github repo for hosting patches for the next merge window. I will
> give you an update once I have the proper tree setup in kernel.org.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/fDc9CVD9VE8StMteTEi7cgA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/cvMACgkQAVBC80lX
0GyB/gf/U0ssZcS3joXSCxJYy6lCatT1HK1OvABiPRBGNYMbsOOVdwc9UxIsisi3
He+6w3Z889txwS7XM8HJbZ5U3Zu9kCchFAXHWDF+4dp2rcZ5tPgLggded8xhhGTc
C5pgjS0zqg8oJkc4EhMDize++CWBD4wGtzBBrb7oxnxqtBkftXnW3+KLilJRod8R
tYDhdZmUZiK84ClAc06wPkN1/jkAMg8pWIJRiL6Mt6JUlwQmQbSaUMndMXJGj4js
80LchdCHipHnjz9Z++4C/LBT06g2ZRsZPyNucD2V0L6iFBkR9YiTx1WsHSLm2xZI
fXLI0hg3F8irOQxVE4vYi/FWf5s6Tw==
=WGBU
-----END PGP SIGNATURE-----

--Sig_/fDc9CVD9VE8StMteTEi7cgA--

