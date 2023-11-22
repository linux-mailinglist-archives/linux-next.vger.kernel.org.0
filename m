Return-Path: <linux-next+bounces-34-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32CD7F52DC
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 22:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCF7281414
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 21:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AE31D69C;
	Wed, 22 Nov 2023 21:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YyRv+MYE"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFF91A4;
	Wed, 22 Nov 2023 13:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700689872;
	bh=4ReUaGBQokRdl+3hX5bqXZbeBCqk6J5ZXAeBUNsLuCk=;
	h=Date:From:To:Cc:Subject:From;
	b=YyRv+MYEPVNd62Oe3K2nethBVB4YPPQTvI2x8y8UxlBQRwsJ3liMvJw4Mb9xtSJ52
	 ogNhMSTkX9m4ZfM9X9Ht59mvy2acp1LC9ee5pAgrpq6/Qz8Px9sSFYhYee4U2jVwjz
	 Ml6imnps/BWeOYQ/1QtIBJZGPch6uJX79vEJyriZ7xmNEoy8RXNVt2L4gPixLEcUZ/
	 mGIkO68ydL6fJYLwNy2KArqID209K8d3WYpJXbWxpQEVyy4pOnfhoBod2jnJtX93gN
	 UJFMj1mk7AakGgreC6ju3Ad2Bg+6zUC7bhhOgelpg2ugCloS1l6AFwl8FFnY0rimu7
	 HRORTrQ1Mi1bQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbFLR5QqZz4wdD;
	Thu, 23 Nov 2023 08:51:10 +1100 (AEDT)
Date: Thu, 23 Nov 2023 08:51:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20231123085110.7bc4760f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1XGdUj.FJhNPJL/1O7RhrCo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1XGdUj.FJhNPJL/1O7RhrCo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1c22e0295a5e ("nvmet: nul-terminate the NQNs passed in the connect comman=
d")

Fixes tag

  Fixes: a07b4970f464 "nvmet: add a generic NVMe target")

has these problem(s):

  - Subject has trailing but no leading parentheses.
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/1XGdUj.FJhNPJL/1O7RhrCo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVed84ACgkQAVBC80lX
0GwqOggAomyGeYqsr6FhwiVvb1mEPOk8ONFkB7g6GuBULy99si6ZrAUztRqohhjI
9ztD1t5p0YTmMFqh7ZijsJUbVBAjBj8AS41U3nQeRtOwtCeVaVasT4K7uHy1UroX
TekRW0GTfcqFmcCOO2+iGmOqyXngGWa52b15d54TLCgGzCEYDPaGgjBxrkfAyKFI
RcJyKonguEgrUlNhwa2dPh+JYVGUDfzE6qzzmKJzWpTvg+RpGkKzk7adLvVqzMyO
X8Uha0bGHFiEizbd+LOhjZvl096vOfiQCGJxrYU929VfFYXzi08JSEE/bZVK3dnn
fFuHnIzqOyZizqlEaNWTaFgBj9nMEQ==
=Wjuy
-----END PGP SIGNATURE-----

--Sig_/1XGdUj.FJhNPJL/1O7RhrCo--

