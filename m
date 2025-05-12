Return-Path: <linux-next+bounces-6673-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A2AB2D58
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 04:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBCA43B4015
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 02:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0132248F56;
	Mon, 12 May 2025 02:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OYm5pLFo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20429D0E;
	Mon, 12 May 2025 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747015785; cv=none; b=ZMV68T5YEtTVnqlCQXMrCZH/HuFrmvo45KM3DHi7HoFs1N08wxk5K7kWDpA09x1H+mCM9ZoLeIUX/FgX4seUIFdIwJpiCBOj81KYnB987wrKW6zfi8jCFQnZbXhSBXhk/TNulXNOJy571uvh1c8bE6R65XBtTK/r/+IZYpdvzxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747015785; c=relaxed/simple;
	bh=2Xfhay6PXeLQx51Fz+ZrnIXN+yBtJqbDWapa7tyZ3k4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tD7GKMvuFbwRbMAamT1JzkUf273olwyiPO5RGaq/R5vz+nKBpCzuJrmx7dCQOMx94WmUc8+RKCsBmVrNJ+Gym5CrLvvXAORuMTnl9OGfLfTLcPqaTny/IBo2Novq80mHVOJ270VXPDOAhlIj9XAoKTC2L6U02Yjyq8DsYGT7fDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OYm5pLFo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747015775;
	bh=FOai7rpi8GoFtymWYRNCNk8QmFLo2v+m1H9h1/Q7bq0=;
	h=Date:From:To:Cc:Subject:From;
	b=OYm5pLFol7AW4Uww9Jw9SYfeukSpAvx49HMKCJfrGgg9hZ4UJfkEnD2fGRk106CXd
	 jER0rY/ayY+1uPl7mVRqMzFaDMiVLqIsIv0N7WToU6Jgc40l+97pNZgnUY89LXDisD
	 aV0ItLsrVp+u1qYB6cVtNsrFmVhNAM7vEAF97dr2GMRh6pWtzWJevhVZ/GMFEXjwCc
	 2B1kiRJjQDH0m5Kf4xiYpFelupItpOSImXyNkMj2nrhGKlruWD4IR1mWe15yLuSjaz
	 oXTv3Dw2ITXhpmtKlbpuuoq/9xJBS20MJ4eadKItlWtEnOZsZJJakY2LWtVBR7+atu
	 Xdo2Xu48wz0Aw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwjjB4VKKz4x1t;
	Mon, 12 May 2025 12:09:34 +1000 (AEST)
Date: Mon, 12 May 2025 12:09:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the devfreq tree
Message-ID: <20250512120903.0c7aa9b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a2Bz2MlhDO9rGs8HHO8zQus";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a2Bz2MlhDO9rGs8HHO8zQus
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devfreq tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/devfreq/sun8i-a33-mbus.c: In function 'sun8i_a33_mbus_probe':
drivers/devfreq/sun8i-a33-mbus.c:384:47: error: passing argument 1 of 'devm=
_clk_rate_exclusive_get' from incompatible pointer type [-Wincompatible-poi=
nter-types]
  384 |         ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
      |                                           ~~~~^~~~~~~~~~
      |                                               |
      |                                               struct clk *
In file included from drivers/devfreq/sun8i-a33-mbus.c:6:
include/linux/clk.h:214:48: note: expected 'struct device *' but argument i=
s of type 'struct clk *'
  214 | int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk=
);
      |                                 ~~~~~~~~~~~~~~~^~~
drivers/devfreq/sun8i-a33-mbus.c:384:15: error: too few arguments to functi=
on 'devm_clk_rate_exclusive_get'
  384 |         ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/clk.h:214:5: note: declared here
  214 | int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk=
);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  bc253b28a365 ("PM / devfreq: sun8i-a33-mbus: Simplify by using more devm =
functions")

I have used the devfreq tree from next-20250509 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/a2Bz2MlhDO9rGs8HHO8zQus
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghWD8ACgkQAVBC80lX
0GwuBQgAgb1Zw2X4lyMawxyloFq1QmzlBJOxMxFywugrtPnSG0CZaLmY0T9Mi0zh
kW++H5Pobc21bJP/br+0PId6NzwC7V7Rl4vPk9HPbRtjr/thbTEZGuhalaLgRsnn
pxxVOqn3cJXYUZlsR4WIFmsoisJhIT/G1GfTYEi0avtQBkb6VGY47wu5SObdPwIR
WjYJi9U5bhupKIiZLTmcaT/TJYLej5HfiLQLQDbfoy+5Ny7RggyKiET4wAB3j+zm
ginvGulxVSulYpJ+C4r0XRyxn7z8IMUYuVbToTY4WazuipkbtZ1GBCg18mVPZMN6
brUgkap1aa1U5AqU259fzN07dplZfQ==
=zPtB
-----END PGP SIGNATURE-----

--Sig_/a2Bz2MlhDO9rGs8HHO8zQus--

