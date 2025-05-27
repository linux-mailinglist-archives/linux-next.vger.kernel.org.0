Return-Path: <linux-next+bounces-6944-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 193AAAC5DC0
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 01:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6E59E14B2
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 23:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789A8215F48;
	Tue, 27 May 2025 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pb50IpjT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D3B18DB35;
	Tue, 27 May 2025 23:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748388224; cv=none; b=fsZqmIEfXl4txr4CuFTSx3sjKlVKJTw1J+bmFxJPMAEN7h5R6ngH5uDgFSlOF2uj6vMGxrPi1hVxpBy9ynbdliyTAFUNf8cgX2/GlcdT/mFb+aglIuts3yQclifo4JbNKWCT2QHz6NgZxREyYNJeTH039Y1rDYLzkCE0POYRt3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748388224; c=relaxed/simple;
	bh=hV8ZhJ0z5fjSmbfqZL4LCeBt1spON4Y5Y+uEf08AhRk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCtLLSOBJWhTXh3qQX006F5ZwNqBQGSMFrj6YDDM4c/R7iOZG1nnfYiIqpF6UiL7Suaw6MxKq8j8TcdHuyHv0wU8siYcFJc0VrtirYsrjEYfGIvti0HVnJacgL7wJ6YCsgBql4p3eMQ5hxgSpVYdcHSRxBmagiiNqp34iXmVbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pb50IpjT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748388215;
	bh=u1wTzxtVgecuSVP+iUSOPaULQ3zG9ey1MjZEn3KHkDk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pb50IpjTPAZld6OVS5+RvtU0teyadmgef/g9caKX7aoIGQc4s9zEjHMNi12IYt5EL
	 oH4dVWwv4Lf5C05baBu6Ab6wLrfk9a+nyQ0B6oCLXJDe1oGrEYiV7xz5WDiIQPZ41I
	 Cp455DblEyixb+22jvzyghM1TeC8fwIwMMumBF7192ikMNCGmvR53JdVe4DoyIH2eH
	 sHPi/mqamZHEwWDjb0iVYjqmCvNqZu70C8sqEGArjslhTaI59crmER9l1LlZ8LNrGP
	 JhKSbFMJQ7apGw8bNNfIrqs5bUmFxWdRB5x31ppDArG5UtCXo9tHf5BbECmjqgLhNd
	 kzlgazZx2yIVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6TGG2x2lz4wc3;
	Wed, 28 May 2025 09:23:34 +1000 (AEST)
Date: Wed, 28 May 2025 09:23:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the bcachefs tree
Message-ID: <20250528092333.10969c39@canb.auug.org.au>
In-Reply-To: <20250526144204.658ddfc7@canb.auug.org.au>
References: <20250526144204.658ddfc7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3YYf=Ds5=7o8ir2t1z3jIH4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3YYf=Ds5=7o8ir2t1z3jIH4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 May 2025 14:42:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   fs/bcachefs/clock.c
>=20
> between commit:
>=20
>   881e64bc3a17 ("bcachefs: bch2_kthread_io_clock_wait_once()")
>=20
> from the bcachefs tree and commit:
>=20
>   aad823aa3a7d ("treewide, timers: Rename destroy_timer_on_stack() as tim=
er_destroy_on_stack()")
>=20
> from the tip tree.
>=20
> I fixed it up (the former removed a line updated by the latter, so I
> just used that) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the bcachefs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3YYf=Ds5=7o8ir2t1z3jIH4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2SXUACgkQAVBC80lX
0Gxckgf9F4MLqnzTcLnUrO2Kdj9J4d3mn8oDi4Tb5mHPNFI87yFGasEes5FmTpwf
p7xrrvTexqBrkXWNSiYg1y87YehN6SmEF+144u4V7PW1xARmhV5tHcZtV3g4U1bN
4+IgOzRNpcRunVeV6/c2H93yNms01kZVw/boElojddeXm7B6d4bGAvBiHMINkPZj
WYWuLVDLEOpOSviBXLa3Y5tpC23qrAK3ouWkq8/c723Reu5mBBKDLjxKzYiqo+BW
8iQ8I/syWyhPmIlfBOMk6vI1BAg/N2IbP8mHv/gmC7Ke7vAvOQ1REEm0X6ZS5FnB
+dMC3EGRhwokso48mNWPajpwfVhtJw==
=nexv
-----END PGP SIGNATURE-----

--Sig_/3YYf=Ds5=7o8ir2t1z3jIH4--

