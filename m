Return-Path: <linux-next+bounces-2397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616A8D1156
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 03:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24BE11F21BC7
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 01:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334978F7D;
	Tue, 28 May 2024 01:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="adzrfQvg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3347B4683;
	Tue, 28 May 2024 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858465; cv=none; b=ly+CDfH7H6+m/AQ48sT8WQUOESzGP/Ip1xw8ElJb5Vzz20k+8i4rujvp4OTUApGJls/Fnck60B1la5QS631ltnLhjRCg6U419GTD9vcnOiik0qObr+zqBGpaP6qP1qfjxpL3brKDQ9B7L31e0vyO3mceZocEYYIOQzCU7t/Bm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858465; c=relaxed/simple;
	bh=u+tFoPxaVdY26Z6BSHRAKdbh15TlsMAxUUPWh11Nqmo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6/dTEymoH1I2zntIEjreDcnbmOGX0pZPR3RFNMOROIFXBKKnTs84dmP4pyb/9tFbjirR+8SfSmCwu2313UDHriXvA0ChNqT/cSZXy9s2mIFOrKIx+019fbz5gN0g8WMCtX/aUOqXOQt6bFX5fMCC5gCzKraoHLnfzIHaXsX59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=adzrfQvg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716858460;
	bh=3ZFa+LwBk82BBfT1xKk4cXtURBSQY1TnJISU04EjuHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=adzrfQvgemEXYbbSOVVh0Z8pED74TUFYB881DgvPs1LQG29ZFeLsdCMRJYJUjGNyV
	 MN4OMXwq0z7H3kQ3ER2p7Cx1Heh0X+i+MystiyvzYpoNAD5CfpE4txPaa/FIZMX8fy
	 RZYciBUvlkS1/VibgF1pBci78eKiMV/s3cb289I0XpaJIxm4dYyAxxWfwnVlBzQlvb
	 Ejbb92KkFIWLfAd5zTNrr1+2X/Uvd/EWCp/dCgMfzcj6wbbcIhSXEHBvvSkzgY+aXa
	 YQ4ZfETMh2HL2AxqNmvwYh9BQnhvAkPgKb/xfqUZ/Kjlw2bG/D1uS3tj0SsNI3dGUY
	 SJ9Bm3GbEKM1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpDrp2Z4nz4x0K;
	Tue, 28 May 2024 11:07:38 +1000 (AEST)
Date: Tue, 28 May 2024 11:07:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Mirvish <matthew@mm12.xyz>, Andrew
 Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <20240528110737.730a8f40@canb.auug.org.au>
In-Reply-To: <20240509152745.08af752f@canb.auug.org.au>
References: <20240509152745.08af752f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ErfPTUrGblVMXdZjl71eSr8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ErfPTUrGblVMXdZjl71eSr8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 May 2024 15:27:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
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

It looks as though the patches from the refactor-heap tree are now being
carried in the mm-nonmm-unstable branch of the mm tree.  Should I
rmeove the refactor-heap tree from linux-next?  It *will* be dropped for
today at least.
--=20
Cheers,
Stephen Rothwell

--Sig_/ErfPTUrGblVMXdZjl71eSr8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVLlkACgkQAVBC80lX
0Gw63wf+JfCFmVU5p6PZ2eYkfAjYMAnhA+Refe+0aosAcYUoND0OIJweEwr8ZChe
mnWPAGCD/XEFOCZLgXi/wlFLDgcpZkPfK//QpaXbR2q7TYGjd4Cmj07Di+S69FfT
hErS9HoxX2m/ef+FMIWSg9GfBVe7EGqA+3bmwkSNn83InFgB7lakxGodrp3usGSa
wi0WnuhBMkYqETdeKLeILUKhmfL9b7mIt+bck68MLgrxq8HU4bEzPV/WJ/Mr2Foz
UGvyXjTn8StdgCUXk5WwwE5gXAapYnLy4hcEcD4+vCC52N2W5ulDJfUc1YUoMCIB
c7YOjbenx52Z3hnmfEyGceOp2+Zpdw==
=GRr2
-----END PGP SIGNATURE-----

--Sig_/ErfPTUrGblVMXdZjl71eSr8--

