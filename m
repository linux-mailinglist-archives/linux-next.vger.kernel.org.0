Return-Path: <linux-next+bounces-2957-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3DA92F4C8
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 06:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22CCA1F21827
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 04:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39CF17579;
	Fri, 12 Jul 2024 04:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sE0X3RQt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9217C96;
	Fri, 12 Jul 2024 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720760294; cv=none; b=It8Psnp+7PNmJThCXV0uCGmAd6TEVm6rLiDE7g1wIYnEZi/tV2ysoHfRlgbRWwTwsYtZRpU6NkYb77WHdRtdg+hkpDbeRymX8IxWif+RyRQ0h/+vNEjI9siEKcBIXrwgceKtt/O2WHNq0YW/dfd+UUOZAkTTo7wax4JTfENLrg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720760294; c=relaxed/simple;
	bh=4Dh4BhQU/enHyhgZOhpsslzQX5NTr6GaYASU2sFsAZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZC7crVKXUmolhDjdjE3JBZSrrEF0ZVGiovsdij2qfzF2qHgKNDAYM4NeBip0122E4tAPOaWBOBmjGwUKZZeOisL69UMzeArgfH/GiPh2D4RiZlBP0DerIAvKWqxrkAXpinv+AlICyiwNAco7Dzg+Sga9Pxui9OVlegsXHEwmTfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sE0X3RQt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720759712;
	bh=9FwLU3TuUr3CTim33ErSUoBRj8iBha51//MEqJpMSaQ=;
	h=Date:From:To:Cc:Subject:From;
	b=sE0X3RQtTgS7a1gIPMkfoH/k+C10RwKe1Ruwgv5mtgGpY7QeAjIPGlX3FefJGHZ81
	 s/dxnFue97CPzwEMwcjvPT0wrMHlbeEafPCHh0iy6f3RjMlQJ9p1CsHtvqoGtsXbdL
	 USocc7ijb3tWW6zrJ7Gu6PQnMdIO9BeMZiTteusvSeWbhMaVTxoFi0pkuEWIqwFg4u
	 2p7lM0V2tYFrR53pIfPFYVSBdqlMTwzFjXh5CbqA8JviTlHQbPlPejja/++fOjrNpA
	 RE/0tKWdsRAIxH0kKDwNay2Nui6qwErKofx4WWfV/kWUAhId1TofP/zqeOlmzbqg2V
	 BvQe3KnY7Fj+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKzcw3vHZz4wZx;
	Fri, 12 Jul 2024 14:48:32 +1000 (AEST)
Date: Fri, 12 Jul 2024 14:48:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20240712144831.269b1bc6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//7Cb_No.v3_Dz+SvTz/xHuP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//7Cb_No.v3_Dz+SvTz/xHuP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/leds/leds-lp5569.c:11:
drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_rea=
d' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  204 |                           chip, LP5569_REG_STATUS, &val);
      |                                                    ^~~~
      |                                                    |
      |                                                    int *
include/linux/iopoll.h:46:28: note: in definition of macro 'read_poll_timeo=
ut'
   46 |                 (val) =3D op(args); \
      |                            ^~~~
In file included from drivers/leds/leds-lp5569.c:20:
drivers/leds/leds-lp55xx-common.h:229:62: note: expected 'u8 *' {aka 'unsig=
ned char *'} but argument is of type 'int *'
  229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
      |                                                          ~~~~^~~
drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_rea=
d' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
  204 |                           chip, LP5569_REG_STATUS, &val);
      |                                                    ^~~~
      |                                                    |
      |                                                    int *
include/linux/iopoll.h:51:36: note: in definition of macro 'read_poll_timeo=
ut'
   51 |                         (val) =3D op(args); \
      |                                    ^~~~
drivers/leds/leds-lp55xx-common.h:229:62: note: expected 'u8 *' {aka 'unsig=
ned char *'} but argument is of type 'int *'
  229 | extern int lp55xx_read(struct lp55xx_chip *chip, u8 reg, u8 *val);
      |                                                          ~~~~^~~
cc1: all warnings being treated as errors

Caused by commit

  d9cc80b1c9b4 ("leds: leds-lp5569: Enable chip after chip configuration")

I have applied the folloing patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Jul 2024 14:40:23 +1000
Subject: [PATCH] fixup for "leds: leds-lp5569: Enable chip after chip confi=
guration"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/leds/leds-lp5569.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 52fb83f35bb7..623030f2f5ac 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -173,6 +173,7 @@ static int lp5569_post_init_device(struct lp55xx_chip *=
chip)
 {
 	int ret;
 	int val;
+	u8 u8val;
=20
 	val =3D LP5569_DEFAULT_CONFIG;
 	val |=3D FIELD_PREP(LP5569_CP_MODE_MASK, chip->pdata->charge_pump_mode);
@@ -201,7 +202,7 @@ static int lp5569_post_init_device(struct lp55xx_chip *=
chip)
=20
 	read_poll_timeout(lp55xx_read, ret, !(val & LP5569_STARTUP_BUSY),
 			  LP5569_STARTUP_SLEEP, LP5569_STARTUP_SLEEP * 10, false,
-			  chip, LP5569_REG_STATUS, &val);
+			  chip, LP5569_REG_STATUS, &u8val);
=20
 	return lp5569_init_program_engine(chip);
 }
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_//7Cb_No.v3_Dz+SvTz/xHuP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQtZ8ACgkQAVBC80lX
0Gz+ZwgAnV2MJqxmT9iVUINH8mireQ1MCzb9jY05YbCA7vvCJXvNIGXn02bAqqae
WN1YkMtjEzLSQp6RVvM/vr4ASWHJPywYuSbUbZImO8H/gmtqdkHDbp5SAO5VJk20
Ga8Aqb/7AY1U0dCRhwYHbHQuMC+Cq8zLMeWeQVG3whWShv05wv+iwb+YCOD4nGUb
TLeugztkwB9Kf1na1Y623UY48Q+0xfRzPMZZGVzmSX9inOiSxD7jiTMFJwv8o9Oo
zmEDzRwv6LRT1m5TWFp6RJqOimkCOjERQvFZzsNYyeX3XOaV4FrJHG53YEBQ8ivA
tsnzzLuZH/F/K126A2f5B76ZYZoKTg==
=jaMN
-----END PGP SIGNATURE-----

--Sig_//7Cb_No.v3_Dz+SvTz/xHuP--

