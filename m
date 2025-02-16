Return-Path: <linux-next+bounces-5462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA56A37803
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 23:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 356257A3ACF
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 22:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73A518A6AB;
	Sun, 16 Feb 2025 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DhK3zPVh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D321422AB;
	Sun, 16 Feb 2025 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739744217; cv=none; b=Tf9urdCAQhl4qXweCBsG5xO8xjUlHQ7ofNY72WSCbGhf31Ye2UDwDto1UqX4LrUVjIzLpF0AP0IrdvEO1gktkvCOl5gaaeDOMsFiEGnQusaJurXwoD9C3AAiNBfY4+jTYSPt2XdJwMCbE7hKNPKdeB8fb6Urx1/zixOXPGAN2BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739744217; c=relaxed/simple;
	bh=KfU64UaIpT6OuT3/ZmFyligyAsUqVg4A/iWFeAHmTgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YwOBAFmRYbF+w6DMnfEUxIL5yfNQXd2xgD3Cma4uSPKcnc2Fx/N0OTRCfc81cnf/Eg/5mwDgay4cpq1gmNOYPgE8tVJyiZTwSG3WysZp8N8TXkpvd2cDuNHsT0lcqWa7N23TINZXBgIVfruyPWgnIweBCiWSbXLOqZ8EDJefL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DhK3zPVh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739744210;
	bh=MnKmwzzxZXfx4NldWFEDNvM1Aws2wVI9u4K0gOZxiaQ=;
	h=Date:From:To:Cc:Subject:From;
	b=DhK3zPVhcG6UzAAQaZ7QuLc3yXQYti06tnb1nMi5wanqunR5mbc07gJIeL2c/qnyU
	 Ks9eCuG1Y4R76uUlFIfydINJ6htCzylyWqN0DvH1oIUGz3UeHBB46E/CDIugdUomTy
	 CvM0WMm8WSjxWTyAeOY4ni7aBYBskO01TQsJmwNYLbsDRH52XyM+DVQJSIf83oPT4G
	 Vl+S2WERu7F7fUr5oy8s05rglxdqxKF/c/BLD/Jd1Pzvf7R8zD386HtGFV6pfFMo5z
	 9zluwEMfPNwpFW+yTUE1xcEQQq3+cN3WFHVf3zWgTTirRMOnB5j/+n9nZfYWj1esHN
	 5vrHM5oVd/v0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yx0WQ1KRfz4wc4;
	Mon, 17 Feb 2025 09:16:50 +1100 (AEDT)
Date: Mon, 17 Feb 2025 09:16:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mohan Kumar D
 <mkumard@nvidia.com>
Subject: linux-next: manual merge of the dmaengine-fixes tree with Linus'
 tree
Message-ID: <20250217091616.1e123860@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cj8wmFFHQUQnD.Rbz2utEIg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cj8wmFFHQUQnD.Rbz2utEIg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine-fixes tree got a conflict in:

  drivers/dma/tegra210-adma.c

between commit:

  d440148418f4 ("tegra210-adma: fix 32-bit x86 build")

from Linus' tree and commits:

  17987453a9d9 ("dmaengine: tegra210-adma: Use div_u64 for 64 bit division")
  76ed9b7d177e ("dmaengine: tegra210-adma: check for adma max page")

from the dmaengine-fixes tree.

I fixed it up (see belowi - this is basically d440148418f4 with
76ed9b7d177e) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/tegra210-adma.c
index 5c6a5b358987,801740ad8e0d..000000000000
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@@ -914,21 -920,16 +919,21 @@@ static int tegra_adma_probe(struct plat
 =20
  		res_base =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "global=
");
  		if (res_base) {
 -			if (WARN_ON(res_page->start <=3D res_base->start))
 -				return -EINVAL;
 +			resource_size_t page_offset, page_no;
 +			unsigned int ch_base_offset;
 =20
 +			if (res_page->start < res_base->start)
 +				return -EINVAL;
  			page_offset =3D res_page->start - res_base->start;
 -			page_no =3D div_u64(page_offset, cdata->ch_base_offset);
 +			ch_base_offset =3D cdata->ch_base_offset;
 +			if (!ch_base_offset)
 +				return -EINVAL;
 =20
 -			if (WARN_ON(page_no =3D=3D 0 || page_no > cdata->max_page))
 +			page_no =3D div_u64(page_offset, ch_base_offset);
- 			if (!page_no || page_no > INT_MAX)
++			if (!page_no || page_no > cdata->max_page)
  				return -EINVAL;
 =20
 -			tdma->ch_page_no =3D lower_32_bits(page_no) - 1;
 +			tdma->ch_page_no =3D page_no - 1;
  			tdma->base_addr =3D devm_ioremap_resource(&pdev->dev, res_base);
  			if (IS_ERR(tdma->base_addr))
  				return PTR_ERR(tdma->base_addr);

--Sig_/Cj8wmFFHQUQnD.Rbz2utEIg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeyY7AACgkQAVBC80lX
0GwUxQf9H4J9PuHr6kg0Hz6T+RWnUgls7KGyYNPhRVtvXr31EuhYhXems0NLWRX8
OrXjE5HJ107FG3Z2vYydVT3GIXuE9Ry8JJzTVz7dvWmoWNTf40jwMO+8seczlHz1
VBTPCyALjimtb4eRiZXYwdS6o2D6AcUXhYrzaRQy2kfd4jqdhYz/SBlx4eyc+EJX
NLZUThSeUq5t6prPXw8LxcgY7Ww99pL9lPfy1/xXe+91g87t95tNPbMR4QgcgOaw
KPLoBpxV2YoopvM01gMuqXKSQbjF1NBqMo3xgdN0uey1qlPk7TirKZvWklXVvgKy
sCpq97Z4K51o1dmyMgD4Kn6YW62wcA==
=CfbY
-----END PGP SIGNATURE-----

--Sig_/Cj8wmFFHQUQnD.Rbz2utEIg--

