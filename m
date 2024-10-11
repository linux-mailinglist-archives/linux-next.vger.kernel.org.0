Return-Path: <linux-next+bounces-4231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DC0999BC1
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14101B23122
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 04:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988851922C4;
	Fri, 11 Oct 2024 04:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VGw3h4Sf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4217828EB;
	Fri, 11 Oct 2024 04:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621770; cv=none; b=cRDy1Radl92OTH8t5K3qSmcYNvOYv1FpD1MWb08gwbzWi13IWGFLSFwLaZL0WikGrZWByTWpKRbsnqskp+o2I2fwKECdlx5gPibW876xDuNf4rT4KrUV3+0i4b0uMJqem4TqnMIDuteZ/nN67UFi5xQ5L1hKOqR/CbYGFactFYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621770; c=relaxed/simple;
	bh=WKoHtQ3Shd9jyF/7n3zw6+AuqxeuhzrjH5MwMRnLQGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YdXhOdRqFkKUs8VTz4t8cTGzHgjZ9HgkhE/kXNpXYVeBXzj8cbuc1fkcbyTbKNqsEAp9gBNmsVijSND78zBdULeecCMULIpzEfzRpiwottDkWV5MeFieWZa7snMDIwV8H+KtoJqLVyjU+XRY9r7FkFQYsLiiEn5f5cFjq6Zuuds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VGw3h4Sf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728621761;
	bh=lkwU82CX5DaBerlW7p3qaRCDFl8Xh+e50RB6heVkVwI=;
	h=Date:From:To:Cc:Subject:From;
	b=VGw3h4SfWRfwcEcJHPFnjOKDn0RMEo+rXh7qaQ+sXET2dkIlV/YNfarQPNBRupZ9h
	 qreojj1MJPo0NBBRlsVD3dS4f7NX1QWuz2/ohTwr9RPuGqbEfaL4Mtcym68K3aeLOg
	 vrbjqnJcdp5xXJ6EX6imaHQH5XuIibDaAEi7WZ3g+6VPlRET38jK/7uTv/ICwzkYSg
	 JPXdIx/oRyYhBYBYV+gSrPzuaDxPKnZeALoX3d5pDS/sJZ8m/aSloo68L0zfdKg6Sv
	 EyjVUrNM5QMzXYkB63t39bWBArDK6Dul9zCX0oL//nx0B/2Q2sNLXEai6bP/V+N1b+
	 zlxRnlfc9q2eA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPvB94NFZz4wb7;
	Fri, 11 Oct 2024 15:42:41 +1100 (AEDT)
Date: Fri, 11 Oct 2024 15:42:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Abhash Jha <abhashkumarjha123@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iio tree
Message-ID: <20241011154241.511878bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ok6U.VI4ReSyob4gJbvytdw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ok6U.VI4ReSyob4gJbvytdw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/iio/dac/ad5770r.c:20:10: fatal error: asm/unaligned.h: No such file=
 or directory
   20 | #include <asm/unaligned.h>
      |          ^~~~~~~~~~~~~~~~~
drivers/iio/adc/max1363.c:37:10: fatal error: asm/unaligned.h: No such file=
 or directory
   37 | #include <asm/unaligned.h>
      |          ^~~~~~~~~~~~~~~~~

Caused by commits

  c2c4826cfa46 ("iio: adc: max1363: Convert to get_unaligned_be16")
  0f87813bc338 ("iio: dac: ad5770r: Convert to get_unaligned_le16")

interacting with commit

  5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")

from Linus' tree (in v6.12-rc2).

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Oct 2024 15:35:57 +1100
Subject: [PATCH] fix up for asm/unaligned inclusions in ad5770r.c and max13=
63.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iio/adc/max1363.c | 2 +-
 drivers/iio/dac/ad5770r.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/max1363.c b/drivers/iio/adc/max1363.c
index d59cd638db96..d065b1ade95a 100644
--- a/drivers/iio/adc/max1363.c
+++ b/drivers/iio/adc/max1363.c
@@ -34,7 +34,7 @@
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
=20
-#include <asm/unaligned.h>
+#include <linux/unaligned.h>
=20
 #define MAX1363_SETUP_BYTE(a) ((a) | 0x80)
=20
diff --git a/drivers/iio/dac/ad5770r.c b/drivers/iio/dac/ad5770r.c
index 12c98f3e62a5..7d7f5110d66a 100644
--- a/drivers/iio/dac/ad5770r.c
+++ b/drivers/iio/dac/ad5770r.c
@@ -17,7 +17,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
-#include <asm/unaligned.h>
+#include <linux/unaligned.h>
=20
 #define ADI_SPI_IF_CONFIG_A		0x00
 #define ADI_SPI_IF_CONFIG_B		0x01
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Ok6U.VI4ReSyob4gJbvytdw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIrMEACgkQAVBC80lX
0Gx7AQf/dkbjSB0PtNZnL275xXqHv+yCpMTGAWAHHztiUE8JdnUV0gRYzHWYktFb
Av0JWl4eOL21TLXEOrQodofUNWd4OSgwx9UT/jOACyuSFLm9jNL48RY5zS4TdGcs
oMh5e9X/RLbPdoutCT7PdexBXs80TI5RL3tATZqLpZZOApBnbN2a3/Liqi8GR5AX
zo6jf3O4M1oUxk42cnEkE2oeDUDCH/ooLL48oTWh4rHUwkay8t7O9dO4x4UV/c8i
WwEHtafW6qvmr+/RDqyg7vkhFNkPfS2okbnOmKbvpPwGmXPm3xR/SVq9YBnXNUvI
CHFR+9IYArsBaYerk7kg2RgfJR8bHQ==
=j6A6
-----END PGP SIGNATURE-----

--Sig_/Ok6U.VI4ReSyob4gJbvytdw--

