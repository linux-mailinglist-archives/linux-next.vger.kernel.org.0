Return-Path: <linux-next+bounces-7731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 542FEB14564
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 02:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C17E1AA00BF
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 00:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BD1158DA3;
	Tue, 29 Jul 2025 00:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tD3QmBFa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0953C26;
	Tue, 29 Jul 2025 00:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753749510; cv=none; b=W05OtCEHtzQiPyEEWNGESWQW7unNZw7+9SDQ390R/NrrSCMNXv9NZ58pIH1yVaDV8GyOmG7PsFyH+3NzenCGyIBaRyauE1IuQ0jtiEE8OaeFSGScaUn6rdM+pxwKt8ba/QARykKSvSlY1x1GWLCnRu0Trnjh6z9GOCGK7GCUmBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753749510; c=relaxed/simple;
	bh=6oNSPfp/4kvDOGBTu/a9PZ0k89hDcQSUKD9vhhAbp7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Txapn3DVtloYqa3+EJh12fHTWW46ufVeJvQIqkAzGw4OfZbM4bs03/LM3S5hG1ZjFXa+xKMJvo1k7dab/YWidHxiMQRVJWUWTGaSPAwzWnGz4w3AEyVl939i9rH4sg0L7eoXuGhuwzylXjUztWSmQFZAaU6uRzBuCwv5MwZ6Whk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tD3QmBFa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753749290;
	bh=P0yaBv2xnaHzHebK952kqddBMRVOdOL1ISpuV+CzFEU=;
	h=Date:From:To:Cc:Subject:From;
	b=tD3QmBFaLob90jb/dmR5KLSgokjSjd6yPheV17yfm8La9YM3d71SAIqmkapSbf97S
	 Vy9RRX1tkD2Blg2gAvID7gSdgV5eOfV27jr536WGTMLVKv+3FA0vm7nCG5QE5Rc7DZ
	 W4AfFVXqaxNxy3x8fRVUUpf4Rnn/N+VheUM4LEblsDTkgrf1N4qnCAVyeC9NxLsu9H
	 NdajxWxDFdz6jmETCzH0LyOTLNQDi4w3W1jl3ZeLFgQa3kW7XvsP6Vpvcx0oOJG1tD
	 7j0jRjH6L6A0Lrdh4M9tWqG5Ihxifz79Tdqo8uxJwFhvYbxOJXAb/k0TSiA5R1sk6P
	 cutIAsm+nmb9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brbvs5FZtz4wbW;
	Tue, 29 Jul 2025 10:34:49 +1000 (AEST)
Date: Tue, 29 Jul 2025 10:38:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the spi tree with the nand tree
Message-ID: <20250729103816.5354a528@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KpyG57fd4f6l7PPmxrGs631";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KpyG57fd4f6l7PPmxrGs631
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got a conflict in:

  include/linux/mtd/nand-qpic-common.h

between commit:

  8e37aaf97153 ("mtd: nand: qpic-common: remove a bunch of unused defines")

from the nand tree and commit:

  0dc7e656ddd5 ("mtd: nand: qpic-common: add defines for ECC_MODE values")

from the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mtd/nand-qpic-common.h
index ed692d87be50,4e694b1aabbd..000000000000
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@@ -92,8 -99,13 +92,10 @@@
  /* NAND_DEV0_ECC_CFG bits */
  #define	ECC_CFG_ECC_DISABLE		BIT(0)
  #define	ECC_SW_RESET			BIT(1)
 -#define	ECC_MODE			4
  #define	ECC_MODE_MASK			GENMASK(5, 4)
+ #define	ECC_MODE_4BIT			0
+ #define	ECC_MODE_8BIT			1
 -#define	ECC_PARITY_SIZE_BYTES_BCH	8
  #define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
 -#define	ECC_NUM_DATA_BYTES		16
  #define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
  #define	ECC_FORCE_CLK_OPEN		BIT(30)
 =20

--Sig_/KpyG57fd4f6l7PPmxrGs631
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIF/gACgkQAVBC80lX
0GzHsggAomZ8/Ep8S/AxeG4JPhVBqYvVid3zA1PLWoo79dGdJh/xnMyeRYk2b3aR
a0tdKQrVj07i87bTq4hGu9CuGcs/qS+IrVFQHYn4j/AnYpv4ybLBgDkW9P5UW2kT
Q2bEXSHrgmqYQTDltQRasNNviTI/XI6tm6addzU0LkeQlPIawi6m1lgpVujfkmEc
GmI9H8DoxpSVc7/Y7f/Qxfd+aeC7XnUloEYktU02ArkjEOqcBX66oA+vI257XQSF
F+w+Vstkr2OzdTuf388E+G09ZTwhzLniWVQQkS9ufZVXGWdBRqtYyPjulTLQkBVC
p+Q+GOZQsXKn4/gyf+23HgiulfN5KQ==
=paL3
-----END PGP SIGNATURE-----

--Sig_/KpyG57fd4f6l7PPmxrGs631--

