Return-Path: <linux-next+bounces-5043-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA970A01EB6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8E04162142
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFEB1798F;
	Mon,  6 Jan 2025 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gu48/aHB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F817E0;
	Mon,  6 Jan 2025 05:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736139897; cv=none; b=spfOBy46RcjLFB5cEvoNeMVKmFl68JoX3ncwyEH+msmpWIYJoVCIbUQiYUG65YU45aZl1TgDvxkoVheno8p8MKX9SezZUVnvS7KFA4UcSE8xJq/zlQ45mQcyQYKNaegPsmv3XhrWxzdqFL1QTAKtAU7yWdey+i4bUQP4ygYIhu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736139897; c=relaxed/simple;
	bh=3YMPuOqhBaf3Q9ShIJuG1jxrdfsrjP4NDqeU0InTGoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wql+QxSooJpClgLdgGm5/UnfDZHiu0IO/KouVlGsD5gHFNn3qvEEABF+6/2beASo+AWin6eP3iVNqNeSUUqCTXfKvtyDqjxGiUB7GZYzcS6m3cSAfaWDI9vu09f1kmX6G/IKuogYjuBPJDHEB0KO1ngjBsko12X3SpnJXnQnjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gu48/aHB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736139885;
	bh=s4qteG4rFZis4JgZUW7yl3Ja83qUMNJF99a3rcr+CXI=;
	h=Date:From:To:Cc:Subject:From;
	b=Gu48/aHBBHu0qzxYXuoAq60whB8RYEEzw5w+eatsiwxWSFo45W0r38Cirr7FsxgKQ
	 SlkZWTV7rBOmX/qxZfBzvDoC+WX6SsdNOnodFpin5aByZk92YGUhaWxhIbov/JPliW
	 Quql3qNraAplIkACke0iL9Z6CbC1noodnNnklnIHOlPijgn7GYOFeRruGU6B/Cis2B
	 rPygXWT0evD0MZL3jxo1abmI+zRFgbdeZqMU4Tv2SiM41ZzG56XRnxPPOInlcpze15
	 vlits4R0WFRNeuZIyeytc8EbgVuYvx5/pUwkYwsJxMaNCuBipz2v5tNOFF9/L2cvt+
	 iIr07mtDQRj6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRMYT4VYsz4wxx;
	Mon,  6 Jan 2025 16:04:45 +1100 (AEDT)
Date: Mon, 6 Jan 2025 16:04:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Lee Jones <lee@kernel.org>
Cc: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250106160451.277432a1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1bdw_biJ=FLoQp7e23+U1go";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1bdw_biJ=FLoQp7e23+U1go
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/leds/leds-turris-omnia.c: In function 'omnia_find_mcu_and_get_featu=
res':
drivers/leds/leds-turris-omnia.c:457:56: error: passing argument 3 of 'devi=
ce_find_child' from incompatible pointer type [-Wincompatible-pointer-types]
  457 |         mcu_dev =3D device_find_child(dev->parent, NULL, omnia_matc=
h_mcu_client);
      |                                                        ^~~~~~~~~~~~=
~~~~~~~~~~
      |                                                        |
      |                                                        int (*)(stru=
ct device *, void *)
In file included from include/linux/acpi.h:14,
                 from include/linux/i2c.h:13,
                 from drivers/leds/leds-turris-omnia.c:8:
include/linux/device.h:1085:49: note: expected 'device_match_t' {aka 'int (=
*)(struct device *, const void *)'} but argument is of type 'int (*)(struct=
 device *, void *)'
 1085 |                                  device_match_t match);
      |                                  ~~~~~~~~~~~~~~~^~~~~

Caused by commit

  f1e8bf56320a ("driver core: Constify API device_find_child() and adapt fo=
r various usages")

interacting with commit

  b4c3960da27d ("leds: turris-omnia: Use command execution functions from t=
he MCU driver")

from the leds-lj tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Jan 2025 15:58:47 +1100
Subject: [PATCH] fix up 2 for "driver core: Constify API device_find_child()
 and adapt for various usages"

interacting with commit

  b4c3960da27d ("leds: turris-omnia: Use command execution functions from t=
he MCU driver")

from the leds-lj tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/leds/leds-turris-omnia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-om=
nia.c
index 7d3b24c8ecae..4fe1a9c0bc1b 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -438,7 +438,7 @@ static int omnia_mcu_get_features(const struct i2c_clie=
nt *mcu_client)
 	return reply;
 }
=20
-static int omnia_match_mcu_client(struct device *dev, void *data)
+static int omnia_match_mcu_client(struct device *dev, const void *data)
 {
 	struct i2c_client *client;
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/1bdw_biJ=FLoQp7e23+U1go
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7ZHMACgkQAVBC80lX
0GzwMQgAkwI3dI6GYV57Co+7+mw4k9YR9pc0Vb1Zlp7nKGHO/DHqW5CONwTYrrAv
EsjgMRt28nLRKfS+Qaq31ThJocE8d8J4ugm9jgM2Uu0HrfO0s0IuLr1wgfXR2kFU
Dsj2dhyN1jiKkKHg1Ci4SL9Vx4RceVS6Pb0vWDflQALFJYCs+VhoFXIwNzAADMaT
PPssjNrSMVEw9SKx5gml1HGZ1B27bU0ZPw03CubKiljxHN5heDoTHid21Y8RS3t9
91CHMb9FWuh7l9jSi45s/LzyPh4R8ngsVzrinIvlRGB5GdlkvCM7CoQn+204KYKu
s+X6vA+sm9vjdVPDKtmnWkye8NGxYw==
=lTTe
-----END PGP SIGNATURE-----

--Sig_/1bdw_biJ=FLoQp7e23+U1go--

