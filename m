Return-Path: <linux-next+bounces-6784-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D090CAB7E95
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 09:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2A23BB154
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 07:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED24328368D;
	Thu, 15 May 2025 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gg5Se6Ih"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A83274668;
	Thu, 15 May 2025 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293265; cv=none; b=CMAI8SYmvKOztingDWqX5UzYbrkDqjWeSarWwx0cuwPlFhFMMryvvKuAacALEZCRGZzqNmULWtELz7qNnBTf1PNtgdK4xqWgH0yghVqHSrqsq0rYF+IOzUnLwHtuwwzZ5C38W1gMH/ZqcAFhl4Tr9PeS6IG36ZvhBIw5UoLqfx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293265; c=relaxed/simple;
	bh=UYOjcr8r37pftyOuVur3meTGMqxlH5LARh5f88/RjUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rwFnhGO39/Egwkf5E4BghiZzp7TXuQ3eW866LwdFKaIKF/hK7MzVVdz72iR4crcvlXfC6JzPnrOR4dQzd7BhV/1m3yzrEcw7XWCzF4p67eMiP93tIAALEV8zl3H81TR9hDR0y8pPGqnPM3BfiHPYIG2lL7XJLL/kSJ69OSiCyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gg5Se6Ih; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747293261;
	bh=lPh82ppR+L7qk2kCMnma62qVGERquGF+hvbmo4WkzAA=;
	h=Date:From:To:Cc:Subject:From;
	b=Gg5Se6IhpSFrbOLA1zhZK4M7Nj4JRL+bmeYlA2UueXZLQn1tuk5AfyHf7S+BZQq2q
	 QdyCXTXzYY4FUB4IBsO0mGbWTdS7TnEX/suC5AthP3CubGyx4w9vFh+3yuyESMf7HZ
	 SGlmerqkW9CHAeP7P7rIcDzehAPlTf0i6cyrqMNByUVt2/1lDr2HfaNyqQJ29EmHu2
	 uCkROlbB4GaXiXmxBlmTZyGExDknU1iTyHf5O2JL802YZes9tK5QsWlNAiamXODPhx
	 nlzgrF2Sc9yafC51WSGAP8svjDTWwrcJXb8aHwdN7K7SgQgxBC3gfK3/5ywD843CXe
	 3CtKW3L3O9qFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZyhKS509tz4x8R;
	Thu, 15 May 2025 17:14:20 +1000 (AEST)
Date: Thu, 15 May 2025 17:14:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>
Cc: Algea Cao <algea.cao@rock-chips.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the phy-next tree with the phy tree
Message-ID: <20250515171420.7c6a4e4b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9iZqveLJCK1SITMZmgrwzRO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9iZqveLJCK1SITMZmgrwzRO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c

between commit:

  f9475055b11c ("phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25M=
Hz error")

from the phy tree and commit:

  0edf9d2bb9b4 ("phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversi=
on overhead")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 77236f012a1f,bb49d69a6f17..000000000000
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@@ -444,47 -412,45 +412,47 @@@ struct rk_hdptx_phy=20
  };
 =20
  static const struct ropll_config ropll_tmds_cfg[] =3D {
- 	{ 5940000, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+ 	{ 594000000ULL, 124, 124, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 3712500, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+ 	{ 371250000ULL, 155, 155, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 2970000, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+ 	{ 297000000ULL, 124, 124, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1620000, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0x10,
+ 	{ 162000000ULL, 135, 135, 1, 1, 3, 1, 1, 0, 1, 1, 1, 1, 4, 0, 3, 5, 5, 0=
x10,
  	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1856250, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+ 	{ 185625000ULL, 155, 155, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1540000, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
+ 	{ 154000000ULL, 193, 193, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 193, 1, 32, 2, 1,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1485000, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
+ 	{ 148500000ULL, 0x7b, 0x7b, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 4, 0, 3, 5, 5,
  	  0x10, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1462500, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1, 1,
+ 	{ 146250000ULL, 122, 122, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 244, 1, 16, 2, 1=
, 1,
  	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1190000, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1, 1,
+ 	{ 119000000ULL, 149, 149, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 149, 1, 16, 2, 1=
, 1,
  	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1065000, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
+ 	{ 106500000ULL, 89, 89, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 89, 1, 16, 1, 0, 1,
  	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 1080000, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
+ 	{ 108000000ULL, 135, 135, 1, 1, 5, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
  	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 855000, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
+ 	{ 85500000ULL, 214, 214, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 214, 1, 16, 2, 1,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 835000, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
+ 	{ 83500000ULL, 105, 105, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 42, 1, 16, 1, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 928125, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+ 	{ 92812500ULL, 155, 155, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 742500, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
+ 	{ 74250000ULL, 124, 124, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 62, 1, 16, 5, 0,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
+ 	{ 65000000ULL, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
++	{ 50250000Ull, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
 +	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
+ 	{ 33750000ULL, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01,=
 5,
  	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
+ 	{ 40000000ULL, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
  	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 270000, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
+ 	{ 27000000ULL, 0x5a, 0x5a, 1, 1, 0xf, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05,=
 0,
  	  0x14, 0x18, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
- 	{ 251750, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1, 1,
+ 	{ 25175000ULL, 84, 84, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 168, 1, 16, 4, 1,=
 1,
  	  1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
  };
 =20

--Sig_/9iZqveLJCK1SITMZmgrwzRO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgllEwACgkQAVBC80lX
0GzXegf/X3dXD9aq81mQWo/ix/uGm5qYS0GK6VnIXtUYjediajVK7F83dBCAZSSo
7DDpoBRfjgc2AIvqfEk8AGO7XzMTNY3gbEaZVwuKgJKefVqW9diC5mlBOro7OcWc
QUQ7wjqmdx66VDkYFgmyLUiryM5CZAJ6Ja9T9kOpU2TF1Q93QRGLUEwRj2I1diM3
pAn7QvQAhKQBGTlGzB19voS8K3kg/qSTiz09If54fMkDaBF4DpAj85o4wo2/YRJ2
PD9nSgxnLjKyQeKcHEs6Z9Pk7PIgSTyhWHFQQ5sIB1NxaC/dPMwMm9SwefR0dtpT
+tMnMRAE78cWnpRvt6LyY+rEWku+Pg==
=cFeX
-----END PGP SIGNATURE-----

--Sig_/9iZqveLJCK1SITMZmgrwzRO--

