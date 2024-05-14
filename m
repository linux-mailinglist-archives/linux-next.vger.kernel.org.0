Return-Path: <linux-next+bounces-2285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1868C4A64
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 02:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EEFF1C22D87
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 00:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D237B;
	Tue, 14 May 2024 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qug/szfp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0A4365
	for <linux-next@vger.kernel.org>; Tue, 14 May 2024 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715646008; cv=none; b=iQfuYkeBNURKyDHTAbrhWuNW1kDQHyOF5qaOYuTpr7qE/6NgRScIZ15MnUYrmME/py8tgiEaQce7L71d0ZO5bKjXIza2IK4sZUhjfgwwqk/8Wmfa+qGKrBRpaDIL2Ys5o4yx978q25kpDe1qX68+uBwnuiy85oQ1VZy8x9CKnVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715646008; c=relaxed/simple;
	bh=w5PZJiIYUaJ87pzJR/MZZP34j0c81/hhkemcoalmGxg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tcv47qaLuyHmNUv55OAv3aAhHv4Bg/NqHgTGoBZy1ZjHpbo1CB71C6sGWXkfM3vz56SMZ4M2hVwOXK3uGNUqvlryS/f8ng3AxvWa1Jyi8zHKS/RRc6Ey3SCT1uhi0Hu9xkI8gzw7N0g4CCXlXaBf8wC+uQI1Zebthn6u3aBsb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qug/szfp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715646002;
	bh=SYz2Ag4XtAzBe1SSfKpRO7XMSp7PjNok9Nntudb7+ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qug/szfpZBsLcYT1bJJuuhhPHGZ4Rh30vE1G9xSNChvSA3CCCrmQ7bqrO0ngocJ9U
	 29psi37cWR6k8KBidmhxlSyANjZm68sGJu7fNHh7GieAtBfk8LbLyudOexP8LNZNZY
	 0s5OKolai1Fk/eR+0UqAxwmQpvINjdiPxswVJhOFhpPmwHIgH7ieo/G++vKeSch1Qc
	 7zsVk6ki6L2FOojEza5dZyADNeHMsLOfcBtWIs9SZFEoQxy/AVE6lRaPj5QAIK6lHo
	 FmMo0ak5gRhVptea4v3cUy+TMHF3nKt5viVV106mQX/iHrMAW7XjOWHZQPGmqIfiVe
	 KhcTqpcnMtaGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdcSL4q73z4wc3;
	Tue, 14 May 2024 10:20:02 +1000 (AEST)
Date: Tue, 14 May 2024 10:20:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20240514102002.7ec27c5d@canb.auug.org.au>
In-Reply-To: <20240506153333.7b36a0e6@canb.auug.org.au>
References: <20240506153333.7b36a0e6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D_nZ/d3c6vLzgyB27zOFa.5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/D_nZ/d3c6vLzgyB27zOFa.5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 May 2024 15:33:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/Makefile
>=20
> between commit:
>=20
>   7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for sour=
ce directory")
>=20
> from the kbuild tree and commit:
>=20
>   11795ae4cc43 ("kbuild: use the upstream `alloc` crate")
>=20
> from the rust tree.
>=20
> I fixed it up (the latter commit removed a line updated by the former,
> so I did that) and can carry the fix as necessary. This is now fixed as
> far as linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/D_nZ/d3c6vLzgyB27zOFa.5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCrjIACgkQAVBC80lX
0GxKIQgAm08tW4+pWM8tbgWhAGIraY+r+13qnItJAmMNAhcj+37VWG/JMyjYbaNC
8kbI6L2595f+pRAAoki2q3/aRdyVVRSA200M37bpaYiBpHgo3SqepKfZC0wY032a
TM/kc5xO29MWPvQohrAlPhEe+QolCRKYZCvv9LSplMq3l5YAMIx6mqZhZHuDiv9x
5AQPSL6Vp3kVeiDDLSvgXkxTIwIjxHCNLjHA9FZHEPtPLeyMwtfj4lVb7cIvYY0B
dVhgFxsAM+SQHNnq3Z6V/Ya4Y8W4AvitQVVLMD3ot1kMgCjz4AphhlufPxfSfs/V
jL63sG8zZWxN5/I48JpSlK2DFzaLNg==
=XzSX
-----END PGP SIGNATURE-----

--Sig_/D_nZ/d3c6vLzgyB27zOFa.5--

