Return-Path: <linux-next+bounces-2198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF2C8BDB6B
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 08:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01AF2B21097
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 06:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDC26BFC0;
	Tue,  7 May 2024 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Xi2NaIzO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9576F08B;
	Tue,  7 May 2024 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063191; cv=none; b=epQvLNPIn0vpqxD/d1qFTLjK6UolCQ0GI/dtq0XVQk+Xxv+tWgw4HleRV4KyXhN8GeSOG7Zel5iaolUA+kKMoWW8urD2fvVi26FvaObbIKECZZu2Pwz29PMv77j17xSVyGRvDjB7wcKyOAH7eKHZ+IU/Q2NSd11rxEr79H+l2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063191; c=relaxed/simple;
	bh=+fE/W+Ef2b72t6qc7ynSEofl4rRYDITSbAJ+pHYSwDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DDoy70Z1gCNb4zFupGC0gZ7lTZrqPySOLVzSfjIedvBFoK0rF8GGywgp0+m33tyer0mZ9d3L2l7eLKWcqpvDBY+hgnAf6o85N/vagzyopcB0aIrC6NkjJhxYOa+OvOWpSqBfSjjv4hNEnkaH+ehipEtOF/cwk9a6U2Y3L4a82UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Xi2NaIzO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715063186;
	bh=EcutFKNIZ1/CVm8NDXaDBXw1sgllUPbSN8CzTkQAeXY=;
	h=Date:From:To:Cc:Subject:From;
	b=Xi2NaIzOM1tDOW1K9WqXHb6Yz+P1WnOhFPX0xDT7ecjGlfxy6B8s9atM2Nsq9AXPm
	 S1qxvLoz1M+HjX+NxrcP0untTHcCgaBXDpi3Mx2+FcVYn22nfySXPRns7sM3ATiPQN
	 JqAHLmU4T45PaK9j1zivU2Toa6Ek4liJsu2c4K9XuyQqMDXeOrhVDRnE4ThV1RoEXK
	 DBDkPQVJ6r7q+fWnmfmDgpmi/wxINeAsu1HkGbOATCrlKXn0QP7njlNqZI1lp0PbfX
	 zk+k6P0TYpmGCUaZlDCVEFyoNoo84pIXXP8RiOJ0AEeyDiyroCl2yMSBvRP205AVV5
	 jXEgs1ulG79HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYSwL5NXjz4wcF;
	Tue,  7 May 2024 16:26:26 +1000 (AEST)
Date: Tue, 7 May 2024 16:26:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240507162623.4d94d455@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+bD8Cm=Pn8RzzfDWoyIMpUX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+bD8Cm=Pn8RzzfDWoyIMpUX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/mm/damon/design.rst:482: ERROR: Unexpected indentation.
Documentation/mm/damon/design.rst:483: WARNING: Block quote ends without a =
blank line; unexpected unindent.

Introduced by commit

  b7138c7d40b0 ("Docs/mm/damon/design: use a list for supported filters")

--=20
Cheers,
Stephen Rothwell

--Sig_/+bD8Cm=Pn8RzzfDWoyIMpUX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY5yY8ACgkQAVBC80lX
0Gy3NQgAiI1px7I31AcaBQNw1XvxK9y8rQ+KAtXRqJMAx3KNLvzbCAkHGgalcagV
1FQd/PshFXFh7d1XQgAYloH1rDTm4QfGuYcJX8s7Un7j/6F4gw1QwicZnTrPXf9A
NvdckCkYofVC9hxILcPO+WIandm+MeNAgY+Yo8Yy/2SJ6TCUd/yXaO27kBBilOr2
2wei9UUv/o530LfbvzxpNFdyrQjdlS9muE3uNmHcPnGfKWRozl+MdyqX59h1qyyL
Ye7kP5StEk0EFDVOPazEOKPR/MdkmeCDulVIUMu//8y9Kbi3ODRIvgElIPxhKE14
caLVrmmCT37uGd0BP7un6dHl+Y+x4Q==
=yJAi
-----END PGP SIGNATURE-----

--Sig_/+bD8Cm=Pn8RzzfDWoyIMpUX--

