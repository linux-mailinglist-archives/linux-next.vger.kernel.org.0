Return-Path: <linux-next+bounces-8252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271C6B52444
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 00:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3505466E34
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 22:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD4F2EDD71;
	Wed, 10 Sep 2025 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZQM+F0JU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE071A83F9;
	Wed, 10 Sep 2025 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757544070; cv=none; b=mbPqsGDTDWpPz9bjytL9jeS+mRyYmvgH6rA8yPnQ7/2DZpOcsil3vFKl9MAOODCCPNwxfZ1d6+ckDPPPJ0mBPOqo4W5vxAEm8r7Dg/RsRi1HO829c/yLYbNVG3RIEpmqQ2cMqyxX07kZxLv8ahCNhn8Crp2umUSivH6eofJG08k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757544070; c=relaxed/simple;
	bh=qrkfPM6zyyTWkcfqJUG1ixxLx3blSfSRoGzwe9MGLDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MENDY8vGq2D2uSDntzLWzVAHzaMEVS+3liadHy4zKS5zfOYZqLneJLKs9KLkJRG9r6AU00tJcCwZpX1L5AXDdWBZPUWhjmvmFeFtaf9zWIxL+3CtSj/r3ZEdv4rxgJAqhCxLZKzWqsnPoYE/7Glf4UEYZzvmnD5JhSFnHEF/J+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZQM+F0JU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757544056;
	bh=i+ksKIVqbT9K3pJqS2NrJXKJosOfwn2z7/ysqRbVGko=;
	h=Date:From:To:Cc:Subject:From;
	b=ZQM+F0JU93Xaj3aQr2UcpKTymp4HwqeE1ea499tq6sRs81fGmPo8Ix9K9ugBpkrBG
	 kzNevYE8A1nYywZGZeFO7G7bJgWaU3x22ss74+liJ6OiBJJmncy/nK1Pfqe293iDPe
	 Qgp+oQlELvu2GWIWZLxztfsskx9ZjqNVsiH+TKu5vpldWOq/xYQveHzfixBtZX0aZ9
	 2okRosOxT5oTeLJsd5NXK7MX9B2sky0h9qBOZiInYR3se37Hn1gWUnWQi1YZblWhCy
	 /vzM6kIY0fKN/nKCtM/HmtZp/msNVefWgRUnGZKBg/iOoU44yvxIEsirgLp5iGp4pQ
	 mai5fPTFXijJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMbJ84bRgz4w8x;
	Thu, 11 Sep 2025 08:40:56 +1000 (AEST)
Date: Thu, 11 Sep 2025 08:40:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rdma tree
Message-ID: <20250911084056.436a2c9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/33uupU5BdkIC5Dl0YEI+q=C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/33uupU5BdkIC5Dl0YEI+q=C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  71c082d70547 ("RDMA/bnxt_re: Remove unnecessary condition checks")
  d7fc2e1a321c ("RDMA/bnxt_re: Use firmware provided message timeout value")
  d1dde88622b9 ("RDMA/bnxt_re: Initialize fw with roce_mirror support")
  525b4368864c ("RDMA/bnxt_re: Add support for flow create/destroy")
  c23c893e3a02 ("RDMA/bnxt_re: Add support for mirror vnic")
  b8f4e7f1a275 ("RDMA/bnxt_re: Add support for unique GID")
  bebe1a1bb1cf ("RDMA/bnxt_re: Refactor stats context memory allocation")
  877d90abaa9e ("RDMA/bnxt_re: Refactor hw context memory allocation")
  a99b2425cc60 ("RDMA/bnxt_re: Add data structures for RoCE mirror support")
  47bd8cafcbf0 ("bnxt_en: Enhance stats context reservation logic")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/33uupU5BdkIC5Dl0YEI+q=C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjB/ngACgkQAVBC80lX
0GznIwf/X1TMNbBgmGhWkTPLmBLWPYKfrKEOcxoVHlBgoCQFHc3wwYQc7NItfCyQ
on+noS6UF4e+mu0CIrDRvPVn51tZUVhNGHesavyCnvEaOlEWQYlNFMcirWOBGV3Q
n+oqOjj1j64GhAH3mXUQZh02uEZ92eqVLHpyKkUi/5BXKE5g8JWFzbAimAmb+r+s
iOUYcCdi8sqDYKg7tvam1xuaMR71Nq3iRJvVxRc3EyuikS/wgdZ25B0ZwZD5m6ad
/gfqokcD0sF6aPeGnhqZXTyyCVfmh6DnqezPM4dI9Qib6HSe2ouagBDXKuU5vl2A
1JYnCRPOBYRLcBwsRWROisLa8kuuLw==
=fRG8
-----END PGP SIGNATURE-----

--Sig_/33uupU5BdkIC5Dl0YEI+q=C--

