Return-Path: <linux-next+bounces-4133-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6CD993E12
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 06:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6F5B2857D7
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 04:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAE16BFC0;
	Tue,  8 Oct 2024 04:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WnTpSxfI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5F2B9BB;
	Tue,  8 Oct 2024 04:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728362474; cv=none; b=mKvf4BrdhISVgDj4IDYESBLbxoO69rtYYvVruZ5XO6tgNYBOB3ktOo41al3ugMyeT1pLz5VjdMhqn+IwsfVHi90CxYP+JepnXvfMt6uWeEBdvFeLoWPwBxvn0xzORP8iJSjMQfxnozemzwHcW4THaamuKyT8wT34VAa9yvg7mBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728362474; c=relaxed/simple;
	bh=800sQRpwWtd2Nso0PNRfyuq4WH+aUeRLp7QhuSAqDCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gK29bb5df8yzyUl+mqFfiRxJJ32Rhba+h344z7irydqrj9Ah3D1zyXUrpQvaQtb0plpdTeIewUX5CgJbo2gLRc5znjknU1SUxVE/dOsAFjZJnVS8r3HNKC4Iuo3Ez68E2GcEVCaeCtS98HtVkGBTmphFh94MJ5GKfMqYekRnOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WnTpSxfI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728362466;
	bh=Attr3NIe1THRgGTAt7KQjMYr+jVu2jddlhA7+Wj6OOw=;
	h=Date:From:To:Cc:Subject:From;
	b=WnTpSxfIPALLwkPFgkdUYwbQvEZ4u1WKAAVE4Tvn5KR1UCEh1gCZtPPh0v1I0R6YW
	 8n+65eykzlrA/O8ORZGVlM2r8MEXDskZf54POKAQFR3ovq9L5ICUI2u+yy9f2bYYS/
	 /eOoiWcRMzbNGD2n2Dn+OVdEZrQ7vmXvNfR04goQtYmk+OjSfcA7ETAzZzBQPnL8Zm
	 xfe4Kf8X2jgRUpXSb9oZ1aju5MAq+7rUKP2fGwcZWj6HySKZPUbGTvs3/U5vHYLXJx
	 5BhDXKrG8hy4PSI+Vpax12+fJ4CyAmHqNQuv2x5XVQWVllyEr32/iivm+7PiZCvztJ
	 K4AJUeYyHtPPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN3Hf4r76z4w2F;
	Tue,  8 Oct 2024 15:41:01 +1100 (AEDT)
Date: Tue, 8 Oct 2024 15:41:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Abhash Jha
 <abhashkumarjha123@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iio tree
Message-ID: <20241008154101.1c607649@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WxelsY14j1zdEk+OauMA+KS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WxelsY14j1zdEk+OauMA+KS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/iio/proximity/vl53l0x-i2c.c:30:10: fatal error: asm/unaligned.h: No=
 such file or directory
   30 | #include <asm/unaligned.h>
      |          ^~~~~~~~~~~~~~~~~

Caused by commit

  762186c6e7b1 ("iio: proximity: vl53l0x-i2c: Added continuous mode support=
")

interatcing with commit

  5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")

from Linus' tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Oct 2024 15:31:23 +1100
Subject: [PATCH] fix up for "iio: proximity: vl53l0x-i2c: Added continuous
 mode support"

interacting with commit

  5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iio/proximity/vl53l0x-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl=
53l0x-i2c.c
index 5a137859c2b6..bd076b2c9d95 100644
--- a/drivers/iio/proximity/vl53l0x-i2c.c
+++ b/drivers/iio/proximity/vl53l0x-i2c.c
@@ -27,7 +27,7 @@
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
=20
-#include <asm/unaligned.h>
+#include <linux/unaligned.h>
=20
 #define VL_REG_SYSRANGE_START				0x00
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/WxelsY14j1zdEk+OauMA+KS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEt90ACgkQAVBC80lX
0GyBzgf/UOSo+xFU3fT00jbS2SrpWtJZznDX+9U0EPhf2h+lFpCOJM1pHOgUI57t
6zDO764dswUali8mPPMUevKRZc62yr6Gmm9Dgj5Vl8MM/BlZF9pGoSOWOfySLh20
SlgBUoYMjeOEgHTyBoTaomZ0u4ZR4fvb+g2M6o5YviHj2DNVRjfQdNsPbheRHueU
UHBuQH3IcveTapYsDnPeKMtwPeA4/ZVbXz4GTN7fmMInC7JRCkuhbkPVWQh9i85o
YitHl4Q8GSMJxnRSvD3ECw81myjXhRttkhEbsWJ2iXZ2iH2BZK/R6F31UivC7zGF
6cjIlJMgARDk+e+p+3irxc+upYEFtQ==
=VLG7
-----END PGP SIGNATURE-----

--Sig_/WxelsY14j1zdEk+OauMA+KS--

