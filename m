Return-Path: <linux-next+bounces-7129-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C9AD4672
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 01:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4E6B7AD260
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 23:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81963242D99;
	Tue, 10 Jun 2025 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PKYFzKxF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A3678F34;
	Tue, 10 Jun 2025 23:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596596; cv=none; b=AfEdU2uIzJh955VBUwpuMEY0yhLKUTSl217sZFTylvk6Z90ePHJlIU7wz6IxExigphc1ekFZUMM/1gAwDsALik0VwdWWxGH9BrtqYyfoYvd+s+8zRp5U1w38mA3w3z+Aw4y59bBGw4pARBimzzHwIwhI03vzIvYLaCJc1Cw0c+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596596; c=relaxed/simple;
	bh=RLovTVRd2tOcXcWiWkBIEoJRN0YDL8iKeDZGU2J9J0E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZBXblIpTKVo3AVApDnVVIDQRj/gn/DA5HCyUv3Mjtw98my5P9wyLdC4ulerrtRiEw98rinhQr4JIB8YeLNCZReQ6iZpZiqaNh7+t6IZYUZ5D/ARGPIthoWU0s6fp3oW1unroYtLudbyDFmmezKSEa+iJBgmEdCgqZB0TUDsnFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PKYFzKxF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749596589;
	bh=DdFi1+tyFX2nRKrzkRwtzI8WaU+eYXuY1nj4wp9rHv0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PKYFzKxFxXsphOn4H12H8BT2fj6mtDI0LvaxlIAXBzW9xP68WwmolbiFzc/H9T/+n
	 bnUpG1K5Cs3MtPdKlUG2GBaarAch2dQh4Y8Vn8cpssbvZd86FfjZ5o/BEfWGLOepCr
	 Cihue3mE9Doo2KDTJnfzJ+TZQ1kQGujPFDl9IKpLemQMC7K1aXmhPf5p1vh51vfzcM
	 Y0U1iZ9s4HXlukwgdZfDQM31ANNkTnb7wP0ByJEZmyQFjAxw3TtQY/WIf7gexOte3j
	 xtar4wSbE0qxlIi3slGa/ap7jpsck8Rh4EEZDG8HKo0V7ZJv1KekbQq3d+RFSk8kLr
	 NDtEQi6pYGOKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH48F0kzZz4wbW;
	Wed, 11 Jun 2025 09:03:09 +1000 (AEST)
Date: Wed, 11 Jun 2025 09:03:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20250611090308.1e40982e@canb.auug.org.au>
In-Reply-To: <20250526114315.733b0728@canb.auug.org.au>
References: <20250526114315.733b0728@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PjNzomps/JDIisuTbZNYl_z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PjNzomps/JDIisuTbZNYl_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 May 2025 11:43:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the i2c tree as different commits
> (but the same patches):
>=20
>   a088ce22c118 ("i2c: mlxbf: avoid 64-bit division")
>   50f317545149 ("i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() =
in probe function")
>   608e2d633096 ("i2c: designware: Don't warn about missing get_clk_rate_k=
hz")
>   481391b537bb ("i2c: designware: Invoke runtime suspend on quick slave r=
e-registration")
>   736f258f0a9b ("i2c-mlxbf: Improve I2C bus timing configuration")
>   a1a8ccd53458 ("i2c-mlxbf: Add repeated start condition support")
>   c43383e2ffa4 ("i2c: xgene-slimpro: Replace dev_err() with dev_err_probe=
() in probe function")
>   3887d3f64260 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")
>   66234d6c7157 ("i2c: microchip-corei2c: add smbus support")
>   55d144eaea36 ("i2c: mlxbf: Allow build with COMPILE_TEST")
>   52360f31e6ba ("i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP")
>=20
> These are commits
>=20
>   2b2805404c92 ("i2c: mlxbf: avoid 64-bit division")
>   3b7d8d151a7e ("i2c: viai2c-wmt: Replace dev_err() with dev_err_probe() =
in probe function")
>   bdf4442f4c7e ("i2c: designware: Don't warn about missing get_clk_rate_k=
hz")
>   2fe2b969d911 ("i2c: designware: Invoke runtime suspend on quick slave r=
e-registration")
>   e981364d89bf ("i2c-mlxbf: Improve I2C bus timing configuration")
>   6bdc662c05c5 ("i2c-mlxbf: Add repeated start condition support")
>   24d9f6050520 ("i2c: xgene-slimpro: Replace dev_err() with dev_err_probe=
() in probe function")
>   29b0b4ce6417 ("dt-bindings: i2c: i2c-wmt: Convert to YAML")
>   d6ceb4053826 ("i2c: microchip-corei2c: add smbus support")
>   053859002c20 ("i2c: mlxbf: Allow build with COMPILE_TEST")
>   66e64b457c23 ("i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP")
>=20
> in the i2c tree.

Given that the above commits are the only ones in the i2c-host tree,
can I please have that tree cleaned up.

--=20
Cheers,
Stephen Rothwell

--Sig_/PjNzomps/JDIisuTbZNYl_z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhIuawACgkQAVBC80lX
0Gx7yQf/aQf82a4ubLjFQGwoLZ6BClK44okmzIIXvMdi3wLhQRprc8K2beDnXsZr
ohYQYBIFJGCnEKjDU9PEuMuUaRPS6jhqTa/Dy3bUf95u03NP+bq4LdtaY2PXHVTw
0wuv/IQC8yoFiRrTA1csStmfgQTpJndJq3+/wlX633qOLgUmO0DcdX7ullO/QEv8
1d96mqCI3fiCy5CnUnsZBiJrGyAezysTt8/+ZLRALCC/9FijYOlYRvCos81TdSVg
gPzWjfJJRk3XpzTt3/L5/hPhGOl4fjhOe9O3vlzOvTd2umHd72hnGYO+kdGhqPYp
qRohXYyTU5CI/rH2532PNiJ0QvxNqQ==
=sGrT
-----END PGP SIGNATURE-----

--Sig_/PjNzomps/JDIisuTbZNYl_z--

