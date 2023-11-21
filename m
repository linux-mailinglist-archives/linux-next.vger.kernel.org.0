Return-Path: <linux-next+bounces-9-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE497F3979
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 23:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D102B21087
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 22:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E0E584FA;
	Tue, 21 Nov 2023 22:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dpqNdzh9"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB634191;
	Tue, 21 Nov 2023 14:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700607010;
	bh=MubOdL2HUlQGrI1QY9+z38eJ9fBZyklRTl+T26B4Q0k=;
	h=Date:From:To:Cc:Subject:From;
	b=dpqNdzh9N92/VkTPSlrpn/SocRJgY7wyidsfuXK9qAE926tAu4ozxabjoNb1DP21M
	 iHXxNZ8Zy0s1nOjtFbckf2cNlbsoPIMQQ39MmFDFa9QYPhdTexBRiXAxir7ENoAT4D
	 5Vx5BTAHOLDY7nrHLZTqGWhRggR91hQkUnLnTWN5kR8mXnDcfaPqrVK7pX+neATshe
	 s1sIJo7fQu7AH5UPPNk+ydRpUL1M5R8FXFgK0ehr1SUdYH2kbAa0VW4EZZ8M6feKZy
	 sXar0PbFVaQjT8Q5HxXZ5oE4ELGvxn9xm9mGGvlqW3pe55A9YPaTcLA5LC2L2EI7pO
	 pEHhZ5W/eKuYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZfhy3kfQz4x1R;
	Wed, 22 Nov 2023 09:50:10 +1100 (AEDT)
Date: Wed, 22 Nov 2023 09:50:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20231122095009.294994e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yh9fV2OEDn/rwAnEEWcFo0r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yh9fV2OEDn/rwAnEEWcFo0r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In function 'aspeed_create_fan_tach_channel',
    inlined from 'aspeed_create_fan' at drivers/hwmon/aspeed-pwm-tacho.c:87=
7:2,
    inlined from 'aspeed_pwm_tacho_probe' at drivers/hwmon/aspeed-pwm-tacho=
.c:936:9:
drivers/hwmon/aspeed-pwm-tacho.c:751:49: warning: writing 1 byte into a reg=
ion of size 0 [-Wstringop-overflow=3D]
  751 |                 priv->fan_tach_ch_source[index] =3D pwm_source;
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
drivers/hwmon/aspeed-pwm-tacho.c: In function 'aspeed_pwm_tacho_probe':
drivers/hwmon/aspeed-pwm-tacho.c:193:12: note: at offset [48, 255] into des=
tination object 'fan_tach_ch_source' of size 16
  193 |         u8 fan_tach_ch_source[16];
      |            ^~~~~~~~~~~~~~~~~~

Exposed by commit

  1b56c90018f0 ("Makefile: Enable -Wstringop-overflow globally")

This is with your tree on top of Linus' tree (and some fix patches but
nothing that obviously touches anything relevent) and CONFIG_WERROR
not set.

--=20
Cheers,
Stephen Rothwell

--Sig_/yh9fV2OEDn/rwAnEEWcFo0r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdNCEACgkQAVBC80lX
0GwsMwf9GHVB8VilIHYTnAmUU+k0SQL8w/2fBEYrnOfy54o2hROjz4qRivKJh4x9
opf7i9q/pZ9k57e/qvfk1nWJxxb5IEIOf6uq3xOMRgLM3Un8zblpTkzi6SHvjabT
nL9eVAwOvDMvhOqvOpI1d3I83Z7U6XBI5MtHuQNfoQAx4AquJnq6VhGHOCnTM3HS
laDsd4zL5xP12lbTWbZwmmg1gffojdssGwjeTGLvqayWy8ZCg89s685gSoPgGcMV
oqq17q2nyFaKGONzJx8k5bEed224RnPOMC7/F+Iq+/KIfgWD+/P7dwsKgv7fbyoC
rXibaTzBjp0sRJ80JVMJrE3wTrTIOw==
=Qyz+
-----END PGP SIGNATURE-----

--Sig_/yh9fV2OEDn/rwAnEEWcFo0r--

