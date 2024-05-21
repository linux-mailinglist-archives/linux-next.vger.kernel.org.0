Return-Path: <linux-next+bounces-2360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74AF8CA61B
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 04:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D99282790
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 02:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D40134AC;
	Tue, 21 May 2024 02:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nNITIWp5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E689134A9;
	Tue, 21 May 2024 02:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716257895; cv=none; b=tRq/vnz37hVkK4pcKd2zVSfeCrzVOFBIon9Ao9YkKDyvAFmJTTHvDEPo4EYm5lkhNyXXorzV/nFR7PrEHKwiMhUlysSsN7+sTBBkXG2zBX7GHSS8TE0CwoW2in4sbJgrZfTi+HCrJl1fjAH46/7/mo4WCAZXkeb8dNj+htjyFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716257895; c=relaxed/simple;
	bh=XVeDX9m85qalvmg8+Mmyu+BRXOqTbNHNlYXYMWenPE4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l57B0JBGH0uEMwEJCniMGh+9wxqQnonjBfPkngeFQvhi4tk8WKElZAisnnzxK9je+UbJX1uW6hR0Ybt1RAjDnQCMNb7uv7h9e3/gvZr2AUwpaqpmvgEyR/M2TvIx6EDmFp//pCmPGu8RAATTkuwNiyfjTFuJuHHwjlFEDtxLiGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nNITIWp5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716257888;
	bh=CI7tpLatYJYSJG0ByzTxQSwtZj8ImMPTeK7c612ORQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nNITIWp5g17Lc0hkcKmn4wzDM6yu6BQSaBIAW3dba0uMJ+zcMGOGz9Hwi9gkNRU0N
	 11rA9pIhXbo6KooR7fcXHH5vUfvmeus1KoOqZtYK4GhAuFSdj1QjnmtHSSRBQuOp5S
	 KNqEqKRD4cN2o8iyxivkCBVskO/7L4S301pyC9vp6J7doI04HAa5lGlQjHLGLh65Iu
	 8cPMVVz0qwknskc+u3YZL1rJT+O51GILjYBlJ3/BEd6WoMNYwBv0AUlr/ZhV3JpnE8
	 prE+OxAoqCNqvhVKwLSRD7WTlTgEWKZPeEPF0VtSMu63ASFaqvhu5AuzM3M1W98dlM
	 /l1MlCUwMupdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjylM0Wy2z4wc3;
	Tue, 21 May 2024 12:18:07 +1000 (AEST)
Date: Tue, 21 May 2024 12:18:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Mirvish <matthew@mm12.xyz>, Bagas
 Sanjaya <bagasdotme@gmail.com>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <20240521121803.399705b0@canb.auug.org.au>
In-Reply-To: <20240509152745.08af752f@canb.auug.org.au>
References: <20240509152745.08af752f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E64MYVQg+=E06o2PfjE4OCI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E64MYVQg+=E06o2PfjE4OCI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 May 2024 15:27:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the refactor-heap tree got conflicts in:
>=20
>   drivers/md/bcache/bset.c
>   drivers/md/bcache/bset.h
>   drivers/md/bcache/btree.c
>   drivers/md/bcache/writeback.c
>=20
> between commit:
>=20
>   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
>=20
> from the block tree and commit:
>=20
>   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic=
 min_heap")
>=20
> from the refactor-heap tree.
>=20
> Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> tree for today.  I suggest you all get together and sort something out.

I am still dropping the refactor-heap tree ...
--=20
Cheers,
Stephen Rothwell

--Sig_/E64MYVQg+=E06o2PfjE4OCI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZMBFwACgkQAVBC80lX
0GxE+wf5AVLlVQ+gex65stnPdygnx/uAhNLG2zsEPhtgtGk5fenlLVtq4NG/QSA9
jaVEUJlDAcVaQeg71nV36oiGVrbec1C2O+KKWSNGvtgPY+GK6aPUAT4JiM1TieZH
meRiGJTJslY6Mu4+IDqAcJ5JYIkohgQrBPxdkhpoZb6rBLia7b37JZorvF6LxsI2
hWMiHGOGnHtyAAOQfb2p/mROYgkvIfBvrM3nWp3pc9z5/CTzkb4H+vLJUalgrS8U
Pzlu/Ep9Loe86YNDYIX2O73DxhsVA5C+Q/vB9nwFJlxq9RXDA+hkU67uvQwp6VF/
UOsRREBvubaGwD3jn/Sc3DYaxAxI9g==
=W7ft
-----END PGP SIGNATURE-----

--Sig_/E64MYVQg+=E06o2PfjE4OCI--

