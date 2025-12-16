Return-Path: <linux-next+bounces-9428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E71CC1002
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 06:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E0E73051E9B
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 05:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5AF335077;
	Tue, 16 Dec 2025 05:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LGxtmYtO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B8F31354C;
	Tue, 16 Dec 2025 05:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765862390; cv=none; b=uXDApvp5DIpdpyU3ORiTvs5mfksR1QvBaCasw3VR+QPC+pLhaBdUBGhvyiW74pU5DUdxAF/PP0ziHoqHgSgtNGiVrR21RT9dvJiOG6gaBd+2m8o5TDbpa9SLbvgGRCdBiY55SNCkzBmnZ+SVKNmPu7rOWAwVX3M6vwmmEmZs7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765862390; c=relaxed/simple;
	bh=l5jujbsNODU3/nS/Ylc57tonRSZcmkWNLOR/lZam3BE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJRNZYMy3eEQIofErFki6Ftx/ulQ6HrQk1OkOvmVsZpPein4adhM/PeUJBc9PUx4UYQbCjsQ70JztK1VaZWzH2fWfEzbSCtnzMW8VfHXLWVFTZ3id+XoYLmpzDmqbPyfDv/IvWB6VtVexTY8xyQS/G7L3CQaJReTDTBg4ykbCNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LGxtmYtO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765862378;
	bh=H+25eRL+2MGABEPS9Stvixa/mm/qzZBMP5ICG3tKHG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LGxtmYtOozGzVa4bxSgC69k+1/zSc7n5muJQ1juOR8BzXc7Q1zdhLGxqrrx0eP4Q9
	 yvQ1uB2NhPPQTTASFnI2hfBbtZxgOQ/ExC1VtfOTz/NjvnXPprCbUTsD/4DbHBUhU7
	 xCC1r/AaQItKFfpPlHTIBGwN14XEk/Pvvc2AQJWaOKsblJYG6X+KwPjCqe0fAKX0D+
	 CD6rGBpb1CjDLr/pTWOd8HVd99zzlovo043W7uXD5LKXn1ouzQyr96PPq+QG+be1Qx
	 bwJXwQrnxjLOHXza8Xe4UsLwnsEnnRLFEgnmJP6T/Bb5p53sNe3jKuEBQnWk4Axnpc
	 5lfJN8Y2RAV+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVlbs3Cbjz4wHW;
	Tue, 16 Dec 2025 16:19:37 +1100 (AEDT)
Date: Tue, 16 Dec 2025 16:19:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Thorsten Scherer
 <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: linux-next: trees being removed
Message-ID: <20251216161936.44095a9e@canb.auug.org.au>
In-Reply-To: <cl2urhxfwrfi4fhkntz33bpwdecjnxf3c53ngybllcqws4zydb@vrj57ee3itct>
References: <20251215184126.39dae2c7@canb.auug.org.au>
	<cl2urhxfwrfi4fhkntz33bpwdecjnxf3c53ngybllcqws4zydb@vrj57ee3itct>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bwCHN4Y1cJuTxNzEGPGkIIc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bwCHN4Y1cJuTxNzEGPGkIIc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Mon, 15 Dec 2025 19:09:53 +0100 Uwe Kleine-K=C3=B6nig <ukleinek@kernel.o=
rg> wrote:
>
> [trimmed Cc and added Thorsten and the Pengutronix Kernel Team]
>=20
> On Mon, Dec 15, 2025 at 06:41:26PM +1100, Stephen Rothwell wrote:
> > The following trees are going to be removed from linux-next because they
> > have not been updated in more than a year.
> > [...]
> > siox			2024-03-08 22:01:10 +0100
> >   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#si=
ox/for-next =20
>=20
> this is fine. The last patches to drivers/siox went in through Greg and
> I'm not involved in siox development any more. (Otherwise I would have
> opposed 53d2bf583c6b6326d751d0f0dceba76109dfb0f9 :-)

Thanks. Removed from tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/bwCHN4Y1cJuTxNzEGPGkIIc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlA6+gACgkQAVBC80lX
0GxsCgf/aDIuGyoGIhtSQ0Mbw7MFFNuBzDipqiCV6k+yjDLVD3XTTvXJBZjmxm1V
FGLnUYLNOQRDFZkm7et8cH4bAOQ5xVJltRFgGnOfsBPEr2fbIy4clFunuipMXu+R
zaUQrDBJFAZbEWXZSU/KVqczQ+RXTiqxLUNFshGEsYwW9OlYNIPxPzQFw/oO1plq
0KrI1SeVxaHjHHUHCYhgLWS39VxCRK/WXzH8ep96pk9XGsSpXFQ0HcICyKhZx8rw
E0zeOHS9shoQ/4VBJgIW6fzLZmbbi376wlxH2HcEmCjWud0BIBw59fePFG96KewB
42Eag6iE9HSZmygIaealuNm8uub49w==
=ZSmz
-----END PGP SIGNATURE-----

--Sig_/bwCHN4Y1cJuTxNzEGPGkIIc--

