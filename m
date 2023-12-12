Return-Path: <linux-next+bounces-364-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5C80F8CC
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 21:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04D4D1C20BD5
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 20:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD3B65A76;
	Tue, 12 Dec 2023 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JKJv1weX"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B7A95;
	Tue, 12 Dec 2023 12:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702414762;
	bh=Q+mUWsYRG0wHEwnZzLb20+KepKx6aqzjBSnA5aqwrwg=;
	h=Date:From:To:Cc:Subject:From;
	b=JKJv1weXACAHh85RlIJaAh1AZL3FkeZu65pY2JemdpGAoYF/qChTxXyybxowbCheM
	 jko4oltcpRWxnrjRt25tSs886VB+KMr/2u94F39CLW/M1Ijw8kxHAhtzJebpW/I0py
	 9VMDxk+CzvU3iIH2aI+WaI6EzJ9ivuQU50l+F8Piv4W8YXf9Ae85qWbP9bfn06fEWY
	 UfFW4in7qFWgCtGeNvyI7LqapQngNcDzTrYQjYMH29vk6OTJr0AJtHOB7PIsx958nI
	 I5TSotiYZx3c+L+3uhQWvbVKLvYi5mCVlXjffSWVqwvY0MzYppf5lmbdbj6cltxNBM
	 0aUb1qLcksc2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqWFP4zl3z4wb1;
	Wed, 13 Dec 2023 07:59:21 +1100 (AEDT)
Date: Wed, 13 Dec 2023 07:59:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm tree
Message-ID: <20231213075919.311c962b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r.gIuKxXWZHC9KkGXPtrK9O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r.gIuKxXWZHC9KkGXPtrK9O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fa28adea6a65 ("mm: thp: Fix build warning when CONFIG_SYSFS is disabled")

Fixes tag

  Fixes: fe2c9313a8c0 ("mm: thp: Introduce multi-size THP sysfs interface")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 17e9a3099850 ("mm: thp: introduce multi-size THP sysfs interface")

--=20
Cheers,
Stephen Rothwell

--Sig_/r.gIuKxXWZHC9KkGXPtrK9O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV4yacACgkQAVBC80lX
0GyIFgf8CUSvKjzWNpUOw/0Sb41a9mwa4cGelDp6DuBVh4Qgd2mOVNYpewY+6aAe
l62drguaTwJbdbcmFtIkNvTU0j/4toPzhl3hnH/wY0bvkN+FXsoHORmXmJp6WXzs
391yFQQmynIF6YvuWSVVp75Sv9lCRJSeswhNJrmvC3uhMFEDr86P0/0gjeecdfEU
Kxi0Gjz+0gSMjv7B1YcjF0Bx8AmiL37Ta27o3XIJdJ+otPP75aXKivmM0elE5SxW
Z7xpHXqcszyVQ/LpA1vdpBCMrl6FMuMXeBQkdklhXN611rEmdtEAuoaRFHuP0FyZ
g04ny3fUunOJ34CyZSJx4sFw7Wd/fg==
=kgUI
-----END PGP SIGNATURE-----

--Sig_/r.gIuKxXWZHC9KkGXPtrK9O--

