Return-Path: <linux-next+bounces-5797-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75322A6378A
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 22:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84F43188EA58
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 21:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056281A3A80;
	Sun, 16 Mar 2025 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sjsyx40a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B492C2E0;
	Sun, 16 Mar 2025 21:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742161418; cv=none; b=Szn24bfBX3e2b29Bt6UyiaSaaz/97T6sQzC1dFYJU6CpS55bWhgAlJlD1Jj73e/XxWevbNhGJUEnSGUx+Pu2/sTcshb24Q+B9yYTKMp9X1mclon0PczgUf5n+vnX29IF4ykUIaTq8r0rYoj4pTPwbnV5bDrwJiq6P8gQBmxuYks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742161418; c=relaxed/simple;
	bh=9S51nfoBPME8cDhpwIRT6eCL8T6cdRXmMyeURMjXtHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IrS4041qVPBVoiuU0M3nqfTp65xQjicSnC+JlhgNmRQp/V08tOocFiStOoXsoPxzifrvOVzBNyDJjEBxK5WWaAxx7vb88i0PewcablhNbUpcJBEN7wRU+w9HRiokNnwc5+7S6EBqP1ypXBRCH3RgFrCO6qjCynYGd9sOuCoF14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sjsyx40a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742161412;
	bh=3o02n+GAJ7QBEzN+urVOQtDCC9Z+Z+7Yz3ixoj9RcC8=;
	h=Date:From:To:Cc:Subject:From;
	b=Sjsyx40aZHsT+VDF1Y59w1jspqhi0r1QVASt2O7s/EcH4EsM6e6a5pJUgXYLT0VgE
	 gmZ1wP/vwxfxoieJYJHE1N3E4/vFb+xYmsL3CRBUZxXC/vVU9WSQVPRvTPs4+WI4nD
	 dDr8aRvQEGKwb9jcM7UHzx7fJSN4/rCPl7XUafZfyib6CB74jeHsPgKCagOmMkWsgK
	 0xQF4UDfvZy6jf0+G2s+Tv3QJR58IhbtiwYupCV+Emx76lmWiaF/1FsgKNIk4F6UUD
	 Wy8GdSHtyeRcaHLRtXYzL2s6cqq1K1e/t27ZWjmf0yGXNrcbwpyc1tbYBCA9hc5D4s
	 SkUPR//Ff1qrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGBS35wGXz4wcd;
	Mon, 17 Mar 2025 08:43:31 +1100 (AEDT)
Date: Mon, 17 Mar 2025 08:43:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Prathamesh Shete <pshete@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20250317084331.032c61d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0nj3nAS/+IUYLLW_SzoYap6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0nj3nAS/+IUYLLW_SzoYap6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a906b771499a ("pinctrl: tegra: Set SFIO mode to Mux Register")

Fixes tag

  Fixes: 59b67585e242 ("pinctrl: add a driver for NVIDIA Tegra")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 971dac7123c7 ("pinctrl: add a driver for NVIDIA Tegra")

--=20
Cheers,
Stephen Rothwell

--Sig_/0nj3nAS/+IUYLLW_SzoYap6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXRgMACgkQAVBC80lX
0GwsSAf6AozeWuk2Ry6i7vEdGz0Tj9wWfIME3/QMyddNP99JuyLDq2nGpq6kNpHU
0b+lkWdB5w+CwawHtkpd6HMfCU1rpLXPPGUP7scNukCLpH25ukcqHgIsE1DoV1SY
xGd6RNFtDbzXF9Rt1QyIaAPOFtFRUPQ3tdHIffhzol6iR9OOF9npm51sMWRGbmrB
VJR2yDWqQ45yGwEjoDfg7QKRdYsAejhkka+oWQLyn7EjiKmMhezfZeReRwqBGC7L
fOAKL2DpWsgBTJE3LKc4ugx+hUI6bfqDyn4pgxv+Byps1ZaY7QJHJIufjQRBIVIM
p5jCvcLjLpxZqoPLFT7/70UZ001PGA==
=H3z1
-----END PGP SIGNATURE-----

--Sig_/0nj3nAS/+IUYLLW_SzoYap6--

