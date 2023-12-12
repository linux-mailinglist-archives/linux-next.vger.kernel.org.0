Return-Path: <linux-next+bounces-365-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2780F8E8
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 22:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F79281DE5
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 21:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE3265A81;
	Tue, 12 Dec 2023 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pws3wyoJ"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F86EA7;
	Tue, 12 Dec 2023 13:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702415200;
	bh=SCYpsVHECbqWMK7qIEzOqriJITSBjtfkJuUFh4r3KtI=;
	h=Date:From:To:Cc:Subject:From;
	b=pws3wyoJuMq/rqpApgVqnwSRnp7regpwAo46TRcF48KtXuIwVq93SIpVgXUcw5zL/
	 coL68yA1MdmAR4Es9mW1z4LjbGv34QpF4WilXszIr8arXWKRlKkyR4ko6cIJN58Yv+
	 TPjanuABKQghwWsrURErpLOsu6WocVtp3N40N2H2zTu9e4XnkjEAIaNMffh4XWS8wP
	 sVna92qCt90zLFgFXY3o4FkoFOHUI2MtgkT6mndXFo8bRV9wZB9uTW1AzGKnh1rl2m
	 4Cs2hRpcVZu0dlY2AXf7PfbXxqGAjxmE0FmLebxdv+T0KTylarL2OuGyF8sMOHbQP2
	 ETs1kpXEcmbnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqWPr505Xz4wb1;
	Wed, 13 Dec 2023 08:06:40 +1100 (AEDT)
Date: Wed, 13 Dec 2023 08:06:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tee tree
Message-ID: <20231213080638.59f5d189@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PCW.T_p=XZ3XlavBnL5LkUw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PCW.T_p=XZ3XlavBnL5LkUw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  225e518c12a1 ("tee: Use iov_iter to better support shared buffer registra=
tion")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/PCW.T_p=XZ3XlavBnL5LkUw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV4y14ACgkQAVBC80lX
0Gx+VwgAk/Wexx3ojyhgsorDt/WvwLQXmStHHeMPhb204d9TwOus3EGyzbzTBTjD
MgsM+KAdpcnAvwSXdMQlpH88w81FqvSPeCwPlrvEOsm42RxLXDhvyhcMBSrkBLa2
pTg87Wh65rwCPBawAgdKhk8MnCdBMK6a8M1gmZTSUfB3qTwm0N86cnASW7ex8W61
w3+GGLxFsUZpiBZug67oaB22rz4vGsoEP1voNPxC+zkVPg2B3utwmWsMx/ZMaWFQ
oF489pNtPUSAxZO5VaphBoBowQFnE+r+Jhsl0TDuVSU6NM9XWNncMGLIR5j8VxeQ
PgzNkgHvzO5hjkLDp4wSy/jYz5GDFw==
=9JXo
-----END PGP SIGNATURE-----

--Sig_/PCW.T_p=XZ3XlavBnL5LkUw--

