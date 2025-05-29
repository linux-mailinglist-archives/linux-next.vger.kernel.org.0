Return-Path: <linux-next+bounces-6975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B5AC7594
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 03:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186774E755C
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 01:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9244221D86;
	Thu, 29 May 2025 01:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="esruFbqz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3B17C211;
	Thu, 29 May 2025 01:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748483829; cv=none; b=W7XKgYBJaDFWqDiKoiFs5Mj/T2h+YoI2HJDZIWS8aNr9id0PcgNCFVo0Hg2MMX2CvZnexH/TT4KixFVZm3kHzbgRLu9iTyTdqgmEk9UmS+gu760kPsugq7R6jopB2XQ+WDQHs4mxLmp9KvHJEN0KAHVoBCQ6x3838/uLED+Mlw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748483829; c=relaxed/simple;
	bh=Ncn5jaXNwVyeZv0/ygMpI/OacZ4KlmisSrfcblDO6XA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvIfkh8LRWag7XUtdy6H8SWQ8W/bxH3iTt62ck3byikI/1nsOU7Z53VAW2mt9dgcpVDToFku13TRPg2KNNoDFuEbyUO3Q+1okPLT/2t9rGMZIo06bTeZHr02XfZ7vXo8gMyjlfxMNPZYc3yZAmQNvEClafBo2/0DLVctIyqmVuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=esruFbqz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748483822;
	bh=Y+PV0DSjZXwMOXO5tYQO7PIZvYK9a4FuJLs+o3frNc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=esruFbqzqCEhOk0/79TMVxYzkg8jd7IIGd10lykwLPT4+MNh6vUC+ipF9CPZS1+Bo
	 EZZzlqnrlvwh108kdppNNZ0PUwf06Yr9CmBth4V5/OexiSPFTjvI24N4YZnd2h/Wow
	 HHNCR2eZrnyja8fGpz6a/twPCIDazWCtshWcSgcf85yih/w/JEIGcw0Eu2Z49jUKs1
	 Atv3+P3dsjyovjlMgSY4D3NeFnxQ3apgyrlZoqhZhTJIkzJNe58iCrd/EQvAH/DyI4
	 pHMyIpztg71QM2IYDrX1pFKt3tkCzzY0Nn37ePQN3gXA6c33TY/PLEN+m33Mho/7bw
	 wKjEySGJKCaNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b78ct61rhz4wy6;
	Thu, 29 May 2025 11:57:02 +1000 (AEST)
Date: Thu, 29 May 2025 11:57:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20250529115702.3e4f8874@canb.auug.org.au>
In-Reply-To: <20250528170256.8638353ab1b5b434a9ad7c11@linux-foundation.org>
References: <20250529095938.43087534@canb.auug.org.au>
	<20250528170256.8638353ab1b5b434a9ad7c11@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jo7r+TaW1FDNmJCd6.ok2z1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jo7r+TaW1FDNmJCd6.ok2z1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 28 May 2025 17:02:56 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Thu, 29 May 2025 09:59:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>=20
> > Hi all,
> >=20
> > After merging the mm-hotfixes tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > mm/khugepaged.c: In function 'hpage_collapse_scan_file':
> > mm/khugepaged.c:2337:21: error: implicit declaration of function 'folio=
_expected_ref_count' [-Wimplicit-function-declaration]
> >  2337 |                 if (folio_expected_ref_count(folio) + 1 !=3D fo=
lio_ref_count(folio)) {
> >       |                     ^~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   3bdddbba5f02 ("mm/khugepaged: fix race with folio split/free using te=
mporary reference")
> >=20
> > I have reverted that commit for today. =20
>=20
> yup, thanks, that was dependent on an mm-stable patch!  I have
> reordered things to plug the bisection hole.

Snap!

--=20
Cheers,
Stephen Rothwell

--Sig_/Jo7r+TaW1FDNmJCd6.ok2z1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3vu4ACgkQAVBC80lX
0GxraAf/R3yZ2KSC7QzC4FSVRm9FdnyXjQYAGsChoFS79qqmVClqS7wATfgOAjPB
OyCyNaH/Cfza8JwN5juY93j2/cSEWNl6NJbuGUvbdzrtJQMCyqRwO51AC4ktPTKb
OTflZInEeHlwy/tLks4Yh1opNym47UQtWJrfU1kQ9qVzijEFkUR0x/fk3CljYSCl
/fabp1qpwPjkzUMqaRDe9v6IBxYJTY6i4D3Hi8kyGcaXg/CTf0DC5lkGYmsRL9/J
qrBJ9OcBEKllT6GFsHb3m8XPlto7t6Pq8rJsHGbzHmhIzRPJPbz2aE0kY1qSK2r1
1nT/PthkGrLL7w2LNyd+dHgyqNfcsg==
=BAkX
-----END PGP SIGNATURE-----

--Sig_/Jo7r+TaW1FDNmJCd6.ok2z1--

