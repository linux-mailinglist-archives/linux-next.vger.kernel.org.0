Return-Path: <linux-next+bounces-5899-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A19A69D6B
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 02:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7685A173EB2
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 01:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B7E189F43;
	Thu, 20 Mar 2025 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a5jOGAGI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50917364BA;
	Thu, 20 Mar 2025 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742432924; cv=none; b=Ih7aRiAyvR+4/REC5fAzBM98llOuEezN3BnrlPKbDcWPpKp+pigoIL1/OsknBkyNj8I7rSd1IaQwNlDjkP6e3B/tBL13cGjcDpPbbEwvQiAB6hffp0PigwO0rKETfN9mbqlj2iRgmY/YU2zcmL4pVa2QF6S38IxlXgT1W11WMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742432924; c=relaxed/simple;
	bh=2P0oUNGgoxvTERPv4EJPPNLwaGpMZYUdb4zhumuj/iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PLud7/1qKb0cpwUk0E+eiIT+G9+4gUCktMUwpBlF+rhJ+Z35mMOw6l2a1OPJgyGoS7j94K3pbTuuE0Blo1D1KOwOfPkkIXR42i3oMUAriRF812hggdqwYOPnaqpXKARL0ApRjBEbv6oYTYyMQ/c9pGCVglx+nzXvwcMsGl4Bwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a5jOGAGI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742432917;
	bh=efrnytF367kiPZRgINjQu550CYOZ2gdDHrFIduCyoTU=;
	h=Date:From:To:Cc:Subject:From;
	b=a5jOGAGIfOx3HFHB60tk6/vIPBwrpZ/k/Ja+HYWdsr9hAnmcHQoGzM8XF5IcQox6Q
	 TB2kfnUrQ7Y04HN3PMJCC1pXPbjmClV9Os9/iuBRMLIqZxNgJIuFJ8mp87tSI3yXJ4
	 Vv0wLuTxNQXdIV/Y1TBs7IICODvFX9tqeqvUMuiHLCEoY0ye9Sst3R6e8QXsqqOPaj
	 fxu6S64MFPvzQmh7ws3IXLrCbkkZJo30AeuEaMDLkujWcAc4kustXFrUvwz//M+j4J
	 QbBfnRVN08kv8sEtBFcuTdB9QGQhMcs4uL/e845pACMnWtNYmYPpOcuTh0n4bgTLYG
	 l7KGXdRrwyusw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJ6sK0Jpwz4wyl;
	Thu, 20 Mar 2025 12:08:36 +1100 (AEDT)
Date: Thu, 20 Mar 2025 12:08:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Guralnik <michaelgur@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250320120823.588aa58e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R6r_SbyeC.rl5kkz1bgf4oE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R6r_SbyeC.rl5kkz1bgf4oE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mlx5/mr.c

between commit:

  cc668a11e6ac ("RDMA/mlx5: Fix a race for DMABUF MR which can lead to CQE =
with error")

from Linus' tree and commit:

  24d693cf6c89 ("RDMA/mlx5: Fix cache entry update on dereg error")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/mlx5/mr.c
index 753faa9ad06a,2080458cabd1..000000000000
--- a/drivers/infiniband/hw/mlx5/mr.c
+++ b/drivers/infiniband/hw/mlx5/mr.c
@@@ -2023,8 -2031,7 +2032,9 @@@ static int mlx5_revoke_mr(struct mlx5_i
  	struct mlx5_ib_dev *dev =3D to_mdev(mr->ibmr.device);
  	struct mlx5_cache_ent *ent =3D mr->mmkey.cache_ent;
  	bool is_odp =3D is_odp_mr(mr);
 +	bool is_odp_dma_buf =3D is_dmabuf_mr(mr) &&
 +			!to_ib_umem_dmabuf(mr->umem)->pinned;
+ 	bool from_cache =3D !!ent;
  	int ret =3D 0;
 =20
  	if (is_odp)

--Sig_/R6r_SbyeC.rl5kkz1bgf4oE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfbaocACgkQAVBC80lX
0GzxWAf/bPOCtIoK+tKlvPx2MpXfu2uKyS5LJFIAMf3JiUH4/IHxN4Fr4sFh9unQ
azxkk6TeaNHERIJS43HyReMdve8FikQyQOITJZPa1zNyQmFqwnKQyOjySssbSXl+
a9PYDoLA3FCTlWRJ9A6YqNw0trvYRK/CuzhLnBvBYgPgb3yEb9oXUcajpo/hgx3k
3hIKxn0gq7NwysIi7vIexS1Y8D0nZE4YBT0KU/PF3USTgla60V7c4eWPrj1nJMQM
NLg/nhVnObyOMfPAA0tENQ8sLTfWs4LAh6kujG7JtioqhNVs6VVP7Q5VE8G5XkFx
PX6suAKDhkGsSnEWFalZ2gf8d7G2XA==
=BmZ0
-----END PGP SIGNATURE-----

--Sig_/R6r_SbyeC.rl5kkz1bgf4oE--

