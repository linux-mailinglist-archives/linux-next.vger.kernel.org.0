Return-Path: <linux-next+bounces-47-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8F7F68EF
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 23:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDFED1C20A14
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 22:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270468F59;
	Thu, 23 Nov 2023 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sbNkXV5L"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE645D64;
	Thu, 23 Nov 2023 14:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700777702;
	bh=bOkhfoKHkgNWqqzNRBhl73kXJ9ERF6zFyPPJydBWYV8=;
	h=Date:From:To:Cc:Subject:From;
	b=sbNkXV5L4EvvUqyDJSbuRZVhz9L0PlR4oCgXAdo5auMCWF2oLDeB/zhrQGKQOtX4v
	 ZM0nsLi/pVbnfnIUZ+m98/wYUmFHH6hpHgspDKO0Q3MudQmjXO8NY3C8PrvPrM4s+6
	 HFyMupA+UBE/F65D75JX67l2LYTN9p3ZSAhg6rkQgXhDkT4/LXOfUdYF0twXZzoMOh
	 tJeNUdzxeT8or618WME59/HwU0SqyxQdx4sUFD8TqyIBKKZKyTJ8Wz/V8GGj39AmmK
	 YJSimhyK5JFJF4TYUW1b72K/5bNthGtThVcGsxN0eAwdybOGbXLbTKHaKSBS1VI/U7
	 7XAD4Yk4St6wA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbsqV2xxhz4x5q;
	Fri, 24 Nov 2023 09:15:02 +1100 (AEDT)
Date: Fri, 24 Nov 2023 09:14:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the perf tree
Message-ID: <20231124091458.535a0437@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/./K.Zn9wH=OR4+EP9hEDu=c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/./K.Zn9wH=OR4+EP9hEDu=c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the perf-current tree as a different
commit (but the same patch):

  a399ee6773d6 ("tools: Disable __packed attribute compiler warning due to =
-Werror=3Dattributes")

This is commit

  57686a72da08 ("tools: Disable __packed attribute compiler warning due to =
-Werror=3Dattributes")

in the perf-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/./K.Zn9wH=OR4+EP9hEDu=c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVfzuIACgkQAVBC80lX
0Gzulgf/Ygk2K/dMhCU/6RbY2UcXnO82SmqxvrEuklTGtR57hEs1oNB6i8pgqe5p
CYdT+0dejGmOjixrRDyhPSrLl37zwhqc5uEZdsnj8Cxj0MyX+2NhmdImAWns3As5
z8FfGXAJWljnqq/ECZCh6OeVOwB2FERNhjuPgNV7KfZNN7uQS2d1brabAGW8hi0t
ewjGRFkGlGAG+OxPJvXnadiCb2AmnYfSmQoVF8SgLYFkVyoj84clOPNxl0iB4DqA
HorMVVwBKPZgQJuP6BxN6ahRP5Ms+x6HG9F6J9FKcNleaDIQ0zMJwSB3ywXFoQ5x
oSJPqYMMQiu1rNfHgPkSX+19O9Q+Gg==
=Wr9Y
-----END PGP SIGNATURE-----

--Sig_/./K.Zn9wH=OR4+EP9hEDu=c--

