Return-Path: <linux-next+bounces-282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7909809A50
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 04:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A73C281E38
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 03:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2825B3FD4;
	Fri,  8 Dec 2023 03:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P0zvy+yy"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5499310E3;
	Thu,  7 Dec 2023 19:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702006076;
	bh=3uUxl8AjSfB8bvexoex29z4Sn6xbCPQjVqOSbPXD9OI=;
	h=Date:From:To:Cc:Subject:From;
	b=P0zvy+yyzvPgu5HJ5lPWY2Vq9Trg1MjG5jC+Y7GtWkCL9Tuu5qC45vzFX4gU24S2t
	 pg5773vWwEuqQbSmMLVGbJcacCw+LL3bDs/cITQ2bQYdYX7tdkzzLXIXbc90fXhd9y
	 FsnOkL1axQbh06dcLD0K6K33QOh2c5U9BOOvBGxqbeKeuzSGG6mwPyVj8mttDybi0e
	 o00EinfMVSn7P08r3ziVSqc5w2E2Ol9cIFJQjCQ/4Ma7ow5JAEE+fQT1W+97LrxvMa
	 qtL/CFB/q8MsPp2bbiLRlXkI2aAfsd6df5SAP7wCiuLPvP1Ke81naAA6ZkO8fxFrHF
	 321NP6NwUqCRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Smc6401bmz4wbn;
	Fri,  8 Dec 2023 14:27:55 +1100 (AEDT)
Date: Fri, 8 Dec 2023 14:27:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the spi tree
Message-ID: <20231208142754.6720183e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3qSm+5zJNQx3=QRiXxHHFiG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3qSm+5zJNQx3=QRiXxHHFiG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (htmldocs) produced
these warnings:

include/linux/spi/spi.h:246: warning: Function parameter or member 'cs_inde=
x_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
include/linux/spi/spi.h:778: warning: Function parameter or member 'last_cs=
_index_mask' not described in 'spi_controller'

Introduced by commit

  4d8ff6b0991d ("spi: Add multi-cs memories support in SPI core")

--=20
Cheers,
Stephen Rothwell

--Sig_/3qSm+5zJNQx3=QRiXxHHFiG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVyjToACgkQAVBC80lX
0GyDQwgAjgAyX1oREeAHMk+mcIDF8MHCJp52cgkX9CHKVAsThqN5WbHWueCafJBa
6tBjiZ8RKs5fn7dj0pCJatZRqWp6hq7bjN9ACnfw+LB3b69/gWKq/Xw0M4d7e0PN
RxDvhoTlqP7TUP1MAtHqbhv0SCMKEIlCFcchfibW1Ir8B2uGRqbZeLVG2JCGWZ9b
Y9mZTsVBXZAOtAY+XGQelZgbptIi4PCwW5EwmhtDFL9uZ572vdEsLS28SbnsrhdI
YGyXuegnWfQDhzxmrCYEulGOvwuKZjcb/cAHUE/bWZnegNJ990/QFGwR0AjdZyT+
+IwpTa4IdCIOVOrY/HC+itpHrPx5lg==
=E4+Z
-----END PGP SIGNATURE-----

--Sig_/3qSm+5zJNQx3=QRiXxHHFiG--

