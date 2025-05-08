Return-Path: <linux-next+bounces-6590-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F2AAF531
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 10:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4201C06C36
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 08:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0F8221F08;
	Thu,  8 May 2025 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I4R3H9vY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5F11D63F5;
	Thu,  8 May 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691841; cv=none; b=hsqHRTLvDpH7o2n+AUK8A3NQ51I+XoIn99/XAKjOGbABHDPiUzXkfq2iGZshYA0V+BZ80j1HwuXbyhrF+drqTEiraAU6oJZ4Q9NnBe+u8QRCA/9EiDs+WqIxIQQ4Lqr7lmiNoyTynbwxG7vxHBUPGQHuSukcKhUFGLprT7kzCYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691841; c=relaxed/simple;
	bh=pf6dnDwC/vYnqt4q43GT1y8TcDWhxMTgUC3m4m/Bm9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cxvmnna+/7cdEm4Ric+KrTd8ISyHT3S4u77r25DtxncDzU/qNWFvlQBT1tk5ui9MM4If48/U0rGT+KQReLrYHxX9k0kCmxfC5z9uGX/WmUOiWa1ZaAWfOe0+QD+FzkaOZ7/VtUOB59SoYI5j6pq6jkO7QjMu9i0dhXo9AkTF+4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I4R3H9vY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746691835;
	bh=er9c4fZfkzYsG61VxLMQA8EJmZcd8pATLwgOEU0jdvg=;
	h=Date:From:To:Cc:Subject:From;
	b=I4R3H9vYlzbBvE0CoWtq0EsnXmUB1xRgJZx/szJtR5ZgF1HtxqMpqrFUExg6M0yIm
	 Pi4fMqDzCFqSEerZ/kTW3xcO+90PKanYgN71z02N/JHow6Yrcvs8rIee6j4JAcA5kA
	 XqbwNn8WRuR3ldGxocru5pNQpGkbfilNjcfI+us+1aqLxjUQiUrCmgc10nhHHmAtf7
	 O6ZaltkGYxniGltJrYyK03WS0KORSqlKG7YesYvFRI47KHdVdSEfRttztTTjApARe4
	 P5zC+NWNQmyYzpRDajZqs0qO/vy2LloqyjL0EJNCAgAEfL5yhcC9Qfd0LtZ+qn/WJB
	 D0ZhPzADiIw3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtPvY35DRz4x3d;
	Thu,  8 May 2025 18:10:33 +1000 (AEST)
Date: Thu, 8 May 2025 18:10:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>,
 <sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
 <sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
 <steven.price@arm.com>, <lukas@wunner.de>, Greg KH <greg@kroah.com>
Cc: Cedric Xing <cedric.xing@intel.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the devsec-tsm tree
Message-ID: <20250508181032.58fc7e5b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zTIk7l+XGAEGT6YFw3lx9MX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zTIk7l+XGAEGT6YFw3lx9MX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devsec-tsm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/virt/coco/guest/tsm-mr.c: In function 'tsm_mr_create_attribute_grou=
p':
drivers/virt/coco/guest/tsm-mr.c:228:29: error: assignment to 'const struct=
 bin_attribute * const*' from incompatible pointer type 'struct bin_attribu=
te **' [-Wincompatible-pointer-types]
  228 |         ctx->agrp.bin_attrs =3D no_free_ptr(bas);
      |                             ^

Caused by commit

  29b07a7b8f41 ("tsm-mr: Add TVM Measurement Register support")

interacting with commit

  9bec944506fa ("sysfs: constify attribute_group::bin_attrs")

from the driver-core tree.

I have applied the following merge resolution for today (there must be
a better solution).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 May 2025 17:52:55 +1000
Subject: [PATCH] fix up for "tsm-mr: Add TVM Measurement Register support"

interacting with "sysfs: constify attribute_group::bin_attrs" from the
driver-core tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/virt/coco/guest/tsm-mr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm=
-mr.c
index d75b08548292..37e6650bfb6c 100644
--- a/drivers/virt/coco/guest/tsm-mr.c
+++ b/drivers/virt/coco/guest/tsm-mr.c
@@ -225,7 +225,7 @@ tsm_mr_create_attribute_group(const struct tsm_measurem=
ents *tm)
=20
 	init_rwsem(&ctx->rwsem);
 	ctx->agrp.name =3D "measurements";
-	ctx->agrp.bin_attrs =3D no_free_ptr(bas);
+	ctx->agrp.bin_attrs =3D (const struct bin_attribute *const *)no_free_ptr(=
bas);
 	ctx->tm =3D tm;
 	return &no_free_ptr(ctx)->agrp;
 }
--=20
2.47.2

--=20
Cheers,
Stephen Rothwell

--Sig_/zTIk7l+XGAEGT6YFw3lx9MX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcZvgACgkQAVBC80lX
0GxDlAf/RIbLsajek1ZCokfXd1fbbnt3m3pu9T+yXaJ8O7KocTwSKYOiivUsEY0C
2EUcr7p6X+yx6iY+xy6soCtxWl8d2K++iqO1/OC+xLTY0yFv41GSjWWdFvdOsJrs
Qy/RnLBAWPFyEyw5Fh5y6DLXFw6sp91UcEajMQTFFib2qvPa5Fjw37KHmtH83psQ
kZQz8WTWsz+PsZRul0EyHU2ivyuYYXFWKgz2LA0u3/Yfou6qD4o5Z4+uaHNi0KxV
G0a1JeqbOsC8/wwAYv+rG2CINEoL+CZJUspmc1fHenVG+SIhMyedOAfJWvVOx6FP
xo6k3tEvyR20SkdR9EUA1wF8uxkeaw==
=j1Dr
-----END PGP SIGNATURE-----

--Sig_/zTIk7l+XGAEGT6YFw3lx9MX--

