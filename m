Return-Path: <linux-next+bounces-2920-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F171892CB27
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 08:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F10D1F214E4
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 06:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595164F602;
	Wed, 10 Jul 2024 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TnJtdDUm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC56FE16;
	Wed, 10 Jul 2024 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720593254; cv=none; b=TJGZEIuP5D6Zyf2jBTGLGkkZS6GWRpTCmDsuMI/HOfdYUdlXD9Ys2v7gIwXeA7b4NGgf9T+z2z329il3eQnzu8d9L3YWtKeU2q5fB5IYSU3snB1Uok4aJMn6u0a+uqIKBN9N9EXcb0AyznIEur5oDvff1LNZhsntPoaJBqzblKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720593254; c=relaxed/simple;
	bh=EW33cY2zlcay7IG+0/XdIXo4qlfcpWlCkZ2LSBAZsY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QnqZKEm/mh8WSHOMXnsVUJSMjqMgycsIjqUjA4dPzYVbmIdveOoc5bemlgyBiTvWTIzimTMoLUYiraPwqVeTlSkejM8H9BL2lM47PlujKu7CTmYb7m1wmLNZMmPF9Ymimqobh3Enlyfv/Wx2eUgCj/H85yBYMTCXLl+bLGcJp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TnJtdDUm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720593247;
	bh=xJ/lnR/dxJ7aCDZ1UXJhCvVcBEHDIexFfDSnarVEzAY=;
	h=Date:From:To:Cc:Subject:From;
	b=TnJtdDUmTAJ4HcZSTbvmxbDC0zLjQ10+kQrtmJUp83zalJPRal/Ic7DBRc9PzCm8z
	 OYqBa8uYsp+IwUgldR/TsXWspjfWEJEATavMj1XxkKqPZmJezQOQ9mR/U28HZ1+D0G
	 PBYRuGMw/TxONA55vUaxUno95VwtU6kE6oVNbFEJdlZcpKHjGhpMsKch+LvIdD8Uah
	 HKoeZIWaT6rx0QY8PutKqDHyJlHIsr5Gav6U/pG7X5kFaGl940QtycevP8gPCUCVrS
	 MQ5c4+Ez9rqdDzj9SGiRQa/gYfJ2mGcmU82DPkYkNk3UBjdOa33oGAQq94i/lGQmI9
	 adJ5+Kfhfh2Qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJp3g4d47z4w2K;
	Wed, 10 Jul 2024 16:34:07 +1000 (AEST)
Date: Wed, 10 Jul 2024 16:34:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20240710163407.6393021f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hNw_6dGlq3+C7iW9qNvyHNl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hNw_6dGlq3+C7iW9qNvyHNl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/leds/leds-lp5521.c: In function 'lp5521_selftest':
drivers/leds/leds-lp5521.c:189:33: error: macro "guard" passed 2 arguments,=
 but takes just 1
  189 |         guard(mutex, &chip->lock);
      |                                 ^
In file included from drivers/leds/leds-lp5521.c:12:
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp5521.c:189:9: error: 'guard' undeclared (first use in t=
his function)
  189 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp5521.c:189:9: note: each undeclared identifier is repor=
ted only once for each function it appears in
drivers/leds/leds-lp5523.c: In function 'lp5523_selftest':
drivers/leds/leds-lp5523.c:192:33: error: macro "guard" passed 2 arguments,=
 but takes just 1
  192 |         guard(mutex, &chip->lock);
      |                                 ^
In file included from drivers/leds/leds-lp5523.c:12:
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp5523.c:192:9: error: 'guard' undeclared (first use in t=
his function)
  192 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp5523.c:192:9: note: each undeclared identifier is repor=
ted only once for each function it appears in
drivers/leds/leds-lp5562.c: In function 'lp5562_led_brightness':
drivers/leds/leds-lp5562.c:175:33: error: macro "guard" passed 2 arguments,=
 but takes just 1
  175 |         guard(mutex, &chip->lock);
      |                                 ^
In file included from drivers/leds/leds-lp5562.c:10:
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp5562.c:175:9: error: 'guard' undeclared (first use in t=
his function)
  175 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp5562.c:175:9: note: each undeclared identifier is repor=
ted only once for each function it appears in
drivers/leds/leds-lp5562.c: In function 'lp5562_store_pattern':
drivers/leds/leds-lp5562.c:272:33: error: macro "guard" passed 2 arguments,=
 but takes just 1
  272 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp5562.c:272:9: error: 'guard' undeclared (first use in t=
his function)
  272 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp5562.c: In function 'lp5562_store_engine_mux':
drivers/leds/leds-lp5562.c:324:33: error: macro "guard" passed 2 arguments,=
 but takes just 1
  324 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp5562.c:324:9: error: 'guard' undeclared (first use in t=
his function)
  324 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_led_brightness':
drivers/leds/leds-lp55xx-common.c:276:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  276 |         guard(mutex, &chip->lock);
      |                                 ^
In file included from drivers/leds/leds-lp55xx-common.c:13:
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:276:9: error: 'guard' undeclared (first u=
se in this function)
  276 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c:276:9: note: each undeclared identifier i=
s reported only once for each function it appears in
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_multicolor_brightnes=
s':
drivers/leds/leds-lp55xx-common.c:291:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  291 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:291:9: error: 'guard' undeclared (first u=
se in this function)
  291 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'led_current_store':
drivers/leds/leds-lp55xx-common.c:409:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  409 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:409:9: error: 'guard' undeclared (first u=
se in this function)
  409 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'run_engine_store':
drivers/leds/leds-lp55xx-common.c:637:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  637 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:637:9: error: 'guard' undeclared (first u=
se in this function)
  637 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_engine_mode':
drivers/leds/leds-lp55xx-common.c:676:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  676 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:676:9: error: 'guard' undeclared (first u=
se in this function)
  676 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_engine_load':
drivers/leds/leds-lp55xx-common.c:704:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  704 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:704:9: error: 'guard' undeclared (first u=
se in this function)
  704 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_engine_leds':
drivers/leds/leds-lp55xx-common.c:803:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  803 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:803:9: error: 'guard' undeclared (first u=
se in this function)
  803 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c:798:17: error: unused variable 'ret' [-We=
rror=3Dunused-variable]
  798 |         ssize_t ret;
      |                 ^~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_show_master_fader':
drivers/leds/leds-lp55xx-common.c:827:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  827 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:827:9: error: 'guard' undeclared (first u=
se in this function)
  827 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_master_fader':
drivers/leds/leds-lp55xx-common.c:851:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  851 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:851:9: error: 'guard' undeclared (first u=
se in this function)
  851 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_show_master_fader_le=
ds':
drivers/leds/leds-lp55xx-common.c:870:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  870 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:870:9: error: 'guard' undeclared (first u=
se in this function)
  870 |         guard(mutex, &chip->lock);
      |         ^~~~~
drivers/leds/leds-lp55xx-common.c: In function 'lp55xx_store_master_fader_l=
eds':
drivers/leds/leds-lp55xx-common.c:901:33: error: macro "guard" passed 2 arg=
uments, but takes just 1
  901 |         guard(mutex, &chip->lock);
      |                                 ^
include/linux/cleanup.h:166: note: macro "guard" defined here
  166 | #define guard(_name) \
      |=20
drivers/leds/leds-lp55xx-common.c:901:9: error: 'guard' undeclared (first u=
se in this function)
  901 |         guard(mutex, &chip->lock);
      |         ^~~~~
cc1: all warnings being treated as errors

Caused by commit

  efd0d1cbb8c5 ("leds: leds-lp55xx: Convert mutex lock/unlock to guard API")

I have used the led-lj tree from next-20240709 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hNw_6dGlq3+C7iW9qNvyHNl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaOK18ACgkQAVBC80lX
0GxfiQf9GYNBzqxqSZlT5RHhXdBuiHs0YOzgwYieeXZenOQT4p9iG/bkyjkMw0uM
C2lWDCUVnteFx9+rBnKyXPrtMWI9rXE0/LBTbLadjLdu8T9shR5GvyZHWj6sm8V1
ZcBoRX1on6RrQbOZNBEQlYVkT2mAQSOBECsEHSo4AfJFJAYGmMdQRPStmsfTO6yS
fNITcu4cJ5p3V97nMlBve1dvkchfIbUxS6nmHF6AWs8xwIP0udfQLxdeurZ1ByEN
cXGFtLUw4w8YDEJns6hWPufMUGvsqB/hCoTUT/HJnZCgf3VNYEpGFQ/v23jiIwlt
vzKmsfNUK/tNFGbGIesMBhXiFCqXrw==
=FcjJ
-----END PGP SIGNATURE-----

--Sig_/hNw_6dGlq3+C7iW9qNvyHNl--

