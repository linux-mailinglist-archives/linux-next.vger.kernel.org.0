Return-Path: <linux-next+bounces-5631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD1BA4D1A2
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 03:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDF481891562
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 02:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC97917E8E2;
	Tue,  4 Mar 2025 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D/R9uZMY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E50BA53;
	Tue,  4 Mar 2025 02:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741055310; cv=none; b=KMZOewEpgY8E1YMekktF1K1SXdhH2RmwPSZLmo2PHABpck/p1mZ7eyl20CHD+crdW80GzNVkZxj7Sktdu8kx6J8KY8xfwlR/909hSRIf0w46ryp+VaWiIFwy8HK9hXwhMEOBfSNfjMtbyhjYwqXTaHPzL6D1b75NtB3y2UQrJJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741055310; c=relaxed/simple;
	bh=wEOPtRRxf6p1QmPNUT6vDxD0fpeu17iexEgGvp352lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qClDzTHyl/CuKr3VKcuRdJmNixZMNSwqfjMWTt+CMZ9k2uYi9w0eFOeJXF2rh/7JXtzaLwwERUMpyvAUhaTI17xF4qjuwjEYgqKhRmHVLXDPdklBXQRNtfuQoDdOZJtSTI/QS4MEbo6+h1vEayWfV7vOQrZqF93GjRsEU856Wa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D/R9uZMY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741055303;
	bh=UpDfHMCQWat93MmqHEH2Tupl0KeF0UdAgJVgxUJeq5I=;
	h=Date:From:To:Cc:Subject:From;
	b=D/R9uZMYDwuXq7irvLAHb2670XcSPAA9QG6hunfPHl9nfWy1BCXC6la7Sl3lhC/dn
	 cIIO25wwLpwbMx9Y4L/FfEwLeYqo8e78SoZj/r/VMRf9Su7fkpNiGWNnUv+MzwKXJp
	 C5OnxUYRNgzEK8STRUQl/yc5Kl3CT3Eks7MewfHjoJ6RsgwMoprJUV7AmOddph76QA
	 rxJV35ccyjYt/XIhAy5GfPHbFPJELa7YHZzkWIrSn2LK3zBSL+wY0m9wPFRUurQIP8
	 lxqNGJMaxUm5QZeilq/d+cec5D7fR+iI8z63pR9yjkgrTcn4sckvhgrWUPIzdLVl1q
	 v+mR+4OhEsWLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6KNk4YrKz4x3S;
	Tue,  4 Mar 2025 13:28:22 +1100 (AEDT)
Date: Tue, 4 Mar 2025 13:28:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20250304132821.57c8d996@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J2jPlfBFIARaMe9NeZuorPU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J2jPlfBFIARaMe9NeZuorPU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/mtd/nand/spi/macronix.c:11:
drivers/mtd/nand/spi/macronix.c:190:63: error: expected expression before '=
,' token
  190 |                      SPINAND_CONT_READ(macronix_set_cont_read),
      |                                                               ^
include/linux/mtd/spinand.h:541:17: note: in definition of macro 'SPINAND_I=
NFO'
  541 |                 __VA_ARGS__                                        =
     \
      |                 ^~~~~~~~~~~
drivers/mtd/nand/spi/macronix.c:203:63: error: expected expression before '=
,' token
  203 |                      SPINAND_CONT_READ(macronix_set_cont_read),
      |                                                               ^
include/linux/mtd/spinand.h:541:17: note: in definition of macro 'SPINAND_I=
NFO'
  541 |                 __VA_ARGS__                                        =
     \
      |                 ^~~~~~~~~~~
drivers/mtd/nand/spi/macronix.c:331:63: error: expected expression before '=
,' token
  331 |                      SPINAND_CONT_READ(macronix_set_cont_read),
      |                                                               ^
include/linux/mtd/spinand.h:541:17: note: in definition of macro 'SPINAND_I=
NFO'
  541 |                 __VA_ARGS__                                        =
     \
      |                 ^~~~~~~~~~~
drivers/mtd/nand/spi/macronix.c:381:63: error: expected expression before '=
,' token
  381 |                      SPINAND_CONT_READ(macronix_set_cont_read),
      |                                                               ^
include/linux/mtd/spinand.h:541:17: note: in definition of macro 'SPINAND_I=
NFO'
  541 |                 __VA_ARGS__                                        =
     \
      |                 ^~~~~~~~~~~
drivers/mtd/nand/spi/macronix.c:427:63: error: expected expression before '=
,' token
  427 |                      SPINAND_CONT_READ(macronix_set_cont_read),
      |                                                               ^
include/linux/mtd/spinand.h:541:17: note: in definition of macro 'SPINAND_I=
NFO'
  541 |                 __VA_ARGS__                                        =
     \
      |                 ^~~~~~~~~~~

Caused by commit

  da3558d940c6 ("mtd: spi-nand: macronix: Add support for read retry")

The SPINAND_CONT_READ() macro already ends with a ','.

I have used the nand tree from next-20250303 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J2jPlfBFIARaMe9NeZuorPU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfGZUUACgkQAVBC80lX
0GyMoQgAiYu8MKKTpvPQKKvIioskkrM+CEyxRTsT1TwwED5vU1eIFRGHIx2bYdKU
HVYP/oV+0TMDltNrRagTjhII+s9japQGG8yUv1bpjXiIBk9pee2RULvKgvRl7CSP
9nXIs1Eal43+ot1Z7NP3kV3Nilrw70z701IVK4za5H3YPuXVEJzABW5i2AOhOyRC
bWe86v3kU3rJopzkrLgLH/FOzqTzoRuk5IFacnZKiUH+rpk3Z4zn+2mrFNzSSKEu
Cb+kud8ctxKhgLafa7/+BSGFKLGa1oahpnXIld/UtmrA1scKKwCXHoCb9Mjeq0ZV
m/M4Ewf7OVr9GYk0hbgp+ZM2svuOaw==
=54EM
-----END PGP SIGNATURE-----

--Sig_/J2jPlfBFIARaMe9NeZuorPU--

