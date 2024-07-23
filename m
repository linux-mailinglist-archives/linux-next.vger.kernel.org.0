Return-Path: <linux-next+bounces-3110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976293A9B2
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8325B2115D
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF0D13D52B;
	Tue, 23 Jul 2024 23:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MIIqwRWZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1497E28E8;
	Tue, 23 Jul 2024 23:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776624; cv=none; b=lSHyIlKyo8uyc9wDVqCac2SLwDW+7HzPoroWxotX44F16WF6dk7Op2xKbkebzAfoEPO/oY0gXVe4txbKQTtDXRPmHnrm+R1OHadgcyCGcs/qJQ/0aiWS3TDHKTBXWDhUg8YkSMDDi/Hy+VjLu1yz+7Qi1JaQChIfo1tFpRvxXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776624; c=relaxed/simple;
	bh=3fX37FGxQ3coAlHAEA/tcF8R3lAD0f5uCE8UjqlETu0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrOxpURjC3TlUJdXlkpwnAwsH2LrDuXJ20SmKSOByn2aBFkKjrSMPcZsGlSpzSJyjZT15EqnXDKsL3Ieyfyns2BivSfVHci7AXNW6bJIpOiXuygjjdqFtldlEG8NA+TyrZfBrsHLcaZY+bRs9TFANn1A9UwqKHPCBuxcR/rVAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MIIqwRWZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721776620;
	bh=g3bAJbUBVnVLua32mHpwPJkIvWHFht1pn3JE87CWW0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MIIqwRWZpnvQtcPmJyb3v2btpiI+52NYb6ScuxIcTlyyDYcWEGC/mT77WeuQHODCf
	 Bz2KytPr0xPdHtPlr9Gf0kqBSZ1PctdfcJ7Onj7TqAG3oQdS5YAZ9PE84eG5iC4/go
	 uognaS1b8qbtu1dnEVnigRqXiMT/LIDERcpauCzlKHtG3HMJWcqAoZ1eJC8O1xoS14
	 UwQrQQIwn7s5SGn/H8bY+fUcOdhbE/tkqUEsRA3LGJdr6vMWszJ1BYrlc3kp0VZWZM
	 hRsyq0MbOXzb1xKI7IjbrO2SANNAmVjDVtJaPhrPe46khni1GsGJ072hNOQE+iVTcw
	 iT/ayq2rwskqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTChr1SCFz4w2K;
	Wed, 24 Jul 2024 09:17:00 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:16:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Donet Tom
 <donettom@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
Subject: Re: linux-next: manual merge of the random tree with the mm-stable
 tree
Message-ID: <20240724091659.27326953@canb.auug.org.au>
In-Reply-To: <20240709174340.5c03c2b9@canb.auug.org.au>
References: <20240709174340.5c03c2b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vndBiEVGcgd+I/HDrNp5_Cz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vndBiEVGcgd+I/HDrNp5_Cz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 17:43:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the random tree got a conflict in:
>=20
>   tools/testing/selftests/mm/Makefile
>=20
> between commit:
>=20
>   3a103b5315b7 ("selftest: mm: Test if hugepage does not get leaked durin=
g __bio_release_pages()")
>=20
> from the mm-stable tree and commit:
>=20
>   94beef29e110 ("mm: add MAP_DROPPABLE for designating always lazily free=
able mappings")
>=20
> from the random tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc tools/testing/selftests/mm/Makefile
> index e1aa09ddaa3d,e3e5740e13e1..000000000000
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@@ -75,7 -73,7 +75,8 @@@ TEST_GEN_FILES +=3D ksm_functional_test
>   TEST_GEN_FILES +=3D mdwe_test
>   TEST_GEN_FILES +=3D hugetlb_fault_after_madv
>   TEST_GEN_FILES +=3D hugetlb_madv_vs_map
>  +TEST_GEN_FILES +=3D hugetlb_dio
> + TEST_GEN_FILES +=3D droppable
>  =20
>   ifneq ($(ARCH),arm64)
>   TEST_GEN_FILES +=3D soft-dirty

This is now a conflict between the random tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vndBiEVGcgd+I/HDrNp5_Cz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagOesACgkQAVBC80lX
0Gxx4gf/b2r1MSSdJ5o3R8E9n4MH3aA3kYGNSV4cVy+oDym2DhKCEvQrwtkkEa+R
D3asaD0oXF2KtYjaiFUBqh9ih0Uryx6rbqOM2OHeTeOThSAxH3Sx9TIM38d/QDWJ
p/A3ThGOo4EOuPS+YoSZPVh8nHsTix+uTxFmyaA5OLwqKB9yDVG3A4VjrTuN5nSU
AHcBz5SVvuaJTgkHP5kwKYvDG0PGSLq9yAB2TTyFVs1T/6HU/SSqGdNd6P16onzz
Hp4k4Miy4bTMpjOcsb+uDqxcXD2DNhTOEVljMONG7P0gl1EeH4Qdecy3sgxfMc7C
Y431hQ3yZXJuIGxt6GIdrEtQzEo/nw==
=viik
-----END PGP SIGNATURE-----

--Sig_/vndBiEVGcgd+I/HDrNp5_Cz--

