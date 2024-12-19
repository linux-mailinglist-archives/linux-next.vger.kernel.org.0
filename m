Return-Path: <linux-next+bounces-5003-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D27E79F7A53
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 12:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C01D188B660
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 11:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CEE223C6A;
	Thu, 19 Dec 2024 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mPsky21y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9D22371B;
	Thu, 19 Dec 2024 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734607444; cv=none; b=B/FgBZdltQmJgspA7S3k2Pb54lXFlg9WjFWPmxqe55H0Cb+6m9/A1XM2G5Z0L7T9ZZCnETZmpUAug6un1FBYX2yqqZ+BscxOPYmLoAsQFICIRtxN3hKtT5tAo9xKl0zpbYfgXzIvznzUzYqk/E3+HIUfW+enoayxoaSQdVM59PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734607444; c=relaxed/simple;
	bh=1ZvMf0bBMTz0o8DXvB4/aslK99SqGqSwm4clkIPNB1o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d0/+qkITM6BLAy3UVchwpI1yU751h5XLqTLsQHmueSHlQ9T+eyk0K/SIlIcNJP9qH7zL4QjljVk0emI4Y1HjlM8hwF47bM6H20cc5WscKFDa54jXSH+v8NrR3D/ukHo15nPjGTQTnuuzK4C4hxcXUprC8cMXF8nD56IuURkofxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mPsky21y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734607432;
	bh=Dc0XtXKCUKpFr/+PqZ8ok0WKJ42QCOW0iqy2EFbk5fE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mPsky21yZlmYs3oav5ycVix8CnEm03mn878jQtCyl27HtITenuNOXsV8m24pKgDhA
	 totntzh/wPDLEBrQGQnK03PbYSroqNv1ijN2BSuytPMyfZO82FqwliIUbX/Rii6Er4
	 RGrcXYeBoSvq1dfuVp3XAfXqJRztdohBrUWOW41WrQoQukaWw094Fp6VMdnTIRQX/A
	 SGbRA75zZSs0AmuKAGrRGI/DewDus3VWd5k9Fuv4MuTltCVY3Eaiy8rPmhCsrxBzRR
	 Hpink4maxU7w7GXYF4M+x1UPJ/rWrtSq+3lPoIgSUzASq3Wm0fMpFQrLA6JNIsQ88L
	 assF5PLMuCyKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDSqC6NZPz4wcj;
	Thu, 19 Dec 2024 22:23:51 +1100 (AEDT)
Date: Thu, 19 Dec 2024 22:23:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20241219222355.0c8f2235@canb.auug.org.au>
In-Reply-To: <dcabf2f3-f764-41ae-9dfe-2a6261e542f3@sirena.org.uk>
References: <20241216130934.0d1ef471@canb.auug.org.au>
	<20241219173334.25970764@canb.auug.org.au>
	<AM0PR04MB7044110ACEF4D67F3C37AD4CE3062@AM0PR04MB7044.eurprd04.prod.outlook.com>
	<dcabf2f3-f764-41ae-9dfe-2a6261e542f3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4iFgdQoYmyP.Bjn3KRnFUt8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4iFgdQoYmyP.Bjn3KRnFUt8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Dec 2024 11:13:38 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Dec 19, 2024 at 06:42:57AM +0000, S.J. Wang wrote:
>=20
> > The fix has been sent.  Not sure if maintainer is taking vacation and i=
f need some time to
> > be applied. =20
>=20
> Yes, Takashi is on holiday.

OK, thanks.  Good to know that it is in hand.

--=20
Cheers,
Stephen Rothwell

--Sig_/4iFgdQoYmyP.Bjn3KRnFUt8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdkAksACgkQAVBC80lX
0GyMCQgAkvs8wm9YyOslPnEbz+VQTLd/gRIniUb0x44RMqtyMOAhbXi0IY7OhMMc
gsSqNDPIGBWbNBayuK0KvEwgKbJI8FnTKjl/UDmv9C+bIX7+pAsAymmzUeYqxS6Z
3qi4ZG1L5IeL3S2XAF6Ye7BCETf5TuQLMA4Rr2kcacRyJuHbCIXzwXeIMA3d4Ym1
kHtjlmuDMOUTJ+70I91nVPNmgJyswd2Ng3XDEriLbbtxGZ0xbkBpPD2xQJ8oGFDW
nefac70gjK1AnFtPzo7mxIuwgF0/OPyCHGlHQ1OonuTShS3aOt3FQ/NjuJtgRupy
T2ZXbG252u4JHHwTdGO55lmxHy6dVg==
=l0BY
-----END PGP SIGNATURE-----

--Sig_/4iFgdQoYmyP.Bjn3KRnFUt8--

