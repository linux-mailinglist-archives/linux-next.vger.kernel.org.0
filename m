Return-Path: <linux-next+bounces-4591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7219B9FD6
	for <lists+linux-next@lfdr.de>; Sat,  2 Nov 2024 12:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3201F2320F
	for <lists+linux-next@lfdr.de>; Sat,  2 Nov 2024 11:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B8A18593A;
	Sat,  2 Nov 2024 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qLR8Z67T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB12156C5E;
	Sat,  2 Nov 2024 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730548735; cv=none; b=g43jykcFTFaLbyVorU0noIH3eBmH36rTj9YIkl+rs+PzS/1YktT7dlhB9ZUQzgK7zQ7NNiphppcai5eh9e8dWqPgQ+LlO+kjdHy1Vy0PFGU3ihIhFWDFvGnWITkWj0Gk7AZ73hKtatbQgkT9kZ2kTR/I25cOOS+StO02n+iwtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730548735; c=relaxed/simple;
	bh=D6bf6gLA62pRkD0pj8flG3S6quk9YQrNdAopeW5bBKI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lCXenEqaO0qbY/rxJWcQ0diAtLEaZk09nBhJe+ecaL7PaaGZC2V8hEGV0xfTfXuYN+6eCSp3odpgWZKONc2hquXRHmqUjt+cXjC1HCW3Uh5zvliMAfE+nir7kz9+GkdWl2P4MeQbtWZk6Ok8I/89AExT1XrHjcpVSrMHPo97FJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qLR8Z67T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730548722;
	bh=6TF7qHWXKnX4ueyZiWxg6f0gvRh8CdiV1FQ7mPoKW/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qLR8Z67TFqah17XudQ08GqBw3lJgNhFTH7j0vCpd/2RBfGUBxUTPnmsy+p4zh8sl/
	 UZJy6MFfqdV+UTnl9GwUY8pbLjPlN7W6oh212LTggvbhL+OyVx0puf1F6aLxBJ5g/k
	 As0j1s7LUr7gytCgipCTVRRXaP0g0JNIDI0xp5nKuVmgkpVoNPM2BnSencrYBYCYhR
	 4myftQmz2MA/FcBsVC04Mp7Xjs1PYhioBiAQTCHm3lMAwK98bGFroNEh2enpTLDYAE
	 VRmKi7ujllk9GRX4EH1tTNwtsqk//ooAHOlQL4U45dJXv1+cs5Fbs6+TlTuydhO4qS
	 sxfPrRj+04WiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xgbq56pJwz4w2K;
	Sat,  2 Nov 2024 22:58:41 +1100 (AEDT)
Date: Sat, 2 Nov 2024 22:58:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH v2] docs: bug-bisect: add a note about bisecting -next
Message-ID: <20241102225841.4efa2969@canb.auug.org.au>
In-Reply-To: <c9547d48-9efa-4e4e-b7fb-d82f3621bd30@leemhuis.info>
References: <0b8245f429a3cb162f8f6c0686081700a9c09cc4.1730441728.git.linux@leemhuis.info>
	<20241101225916.075af3aa@canb.auug.org.au>
	<c9547d48-9efa-4e4e-b7fb-d82f3621bd30@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2v1/SZ96.poebqvD8yaCdWD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2v1/SZ96.poebqvD8yaCdWD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Sat, 2 Nov 2024 12:28:21 +0100 Thorsten Leemhuis <linux@leemhuis.info> w=
rote:
>
> On 01.11.24 12:59, Stephen Rothwell wrote:
> >
 > On Fri,  1 Nov 2024 07:17:06 +0100 Thorsten Leemhuis <linux@leemhuis.inf=
o> wrote:
> > [...] =20
> >> +The 'stable' branch refers to the state of linux-mainline the current=
 =20
> >                                                              ^
> >                                                              that the c=
urrent =20
>=20
> Ohh, I thought such a "that" would be optional here, but I'm not a
> native speaker, so I guess I was wrong.

Yeah, I guess it is optional, but I prefer it written like that - it
sounds better to my ear.

> >> +linux-next release (found in the 'master' branch) is based on -- the =
former
> >> +thus should be free of any problems that show up in -next, but not in=
 Linus'
> >> +tree. =20
> >=20
> > As you say, 'stable' only works for the current linux-next release.  If
> > you are trying to bisect a previous release, you can always find the
> > SHA1 associated with the base of any linux-next release using "grep
> > origin Next/SHA1s".  Not sure how useful that is. =20
>=20
> Hmmm. Not sure. Open for opinions here. But right now I tend to think:
> nice to know, but not relevant enough for this text, as most people want
> to check if latest -next is still affected -- so why then bisect with a
> older -next release?

That is fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/2v1/SZ96.poebqvD8yaCdWD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcmE/EACgkQAVBC80lX
0GxrWQf/VT/2+CqyZMkFwzQv4WRD92JfhQ6Pm89raTs6ujYWDg2yZtG10+6nH2dG
D25OEVQNbkwQ4dlbtojDh8hvLMDQgIbhCID/QtiRDubFXInA1PC6jLRt1VISvCTM
xi6VCJJiA/FiQwh4jdymwbOWASZMCPJcSi615iYikiBVjFcYY5TojGE2XtZ7+2Am
8Bw+fi4bwdBdd++GhVkovpF1Us0VHGivsSITM9A5B9cwvVo2R+MhBlKzaqVzlsFo
KJM22OsrqU24s5Ga5brfNON6K0jXbQk5F7k6h47l6l1klMXeZ3It010ENvRiZo6R
KHHIaIdNTtit3IzhTTCTixbqXALnIw==
=nvsW
-----END PGP SIGNATURE-----

--Sig_/2v1/SZ96.poebqvD8yaCdWD--

