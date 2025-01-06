Return-Path: <linux-next+bounces-5042-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCEEA01EAD
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B934188011A
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DB4148314;
	Mon,  6 Jan 2025 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H3QMC215"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A032AD24;
	Mon,  6 Jan 2025 04:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736139221; cv=none; b=Np5q4EXsHrGldPje1jc/lnrMlfm3O8KkbN0xdxOoPgByRkNtQsvgwVlWnTh6D+rLNjWKsQsf1NkCwNeuHJzzZ5TldgBdGy4RKFDQkPdXdtH4RGoc1UAd1G4b0DglLrpsfmRX2zvokwE/ky6l1w7ZAgMQ4htM2bbz6bGdeUXMEg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736139221; c=relaxed/simple;
	bh=EHqHnKtOgodgrqEb9vk77CMlCeZn+sg86C3LeuVpX5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wkoeivo4/+XfIHy+dHFLcisYDYtqA+4TE3ZpseR0YBYULgaj8Ir/4wjvAKDI9f37vq0gjcRNRox15lplgEQilzNdNadw2AvDPAVsuv6jSrc7X59aJkayx4Xmu7roGGVclIxgUoHikMyHqozpOYlFhQhS5oPYQkxxhwNNBEEjcmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H3QMC215; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736139208;
	bh=elJA45iwj7FURuEP0SqweB0TerwxNN06rAxeBfKMhcU=;
	h=Date:From:To:Cc:Subject:From;
	b=H3QMC215kiH8rYOVy60jL/jqdxMGU9YkhTLfGJkaAm2knfiDWbEJ8Ucc3r7K/RutY
	 bk+uMdx0/xyMKMTfyI/z5V7GIOyMzA/fjcNgPnT6Xquajo6mxAcQnhHdFbPS3+zCJ2
	 kfLI3cBzWxH7jpH1ThuTu/79Q1gVwoIoTF5joHtueFBoFRH8fNOcAX7sWHyQR5MvGI
	 wzIwi49nFsXBrOLx+YzT7hzwcSHl3Y0j9xGSUfxfOI+aFM7uvu3I+i5tB36LEYlhZD
	 x4We6Q0WKkkARyDIwbXx2o2u4ksnn3D8D0dWWm2fEpmpvrXPrTVt7+jnYuprIJkLln
	 B8tjEtdGL8kCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRMJQ4f04z4wj1;
	Mon,  6 Jan 2025 15:53:26 +1100 (AEDT)
Date: Mon, 6 Jan 2025 15:53:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20250106155332.050670e4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9eYxED8PJI2=_T=1HhgPDQ=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9eYxED8PJI2=_T=1HhgPDQ=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/i2c/i2c-core-base.c: In function 'delete_device_store':
drivers/i2c/i2c-core-base.c:1350:58: error: passing argument 3 of 'device_f=
ind_child' from incompatible pointer type [-Wincompatible-pointer-types]
 1350 |         child_dev =3D device_find_child(&adap->dev, &addr, __i2c_fi=
nd_user_addr);
      |                                                          ^~~~~~~~~~=
~~~~~~~~~~
      |                                                          |
      |                                                          int (*)(st=
ruct device *, void *)
In file included from include/linux/acpi.h:14,
                 from drivers/i2c/i2c-core-base.c:16:
include/linux/device.h:1085:49: note: expected 'device_match_t' {aka 'int (=
*)(struct device *, const void *)'} but argument is of type 'int (*)(struct=
 device *, void *)'
 1085 |                                  device_match_t match);
      |                                  ~~~~~~~~~~~~~~~^~~~~

Caused by commit

  f1e8bf56320a ("driver core: Constify API device_find_child() and adapt fo=
r various usages")

interacting with commit

  3cfe39b3a845 ("i2c: Replace list-based mechanism for handling userspace-c=
reated clients")

from the i2c tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Jan 2025 15:33:36 +1100
Subject: [PATCH] fix up for "driver core: Constify API device_find_child() =
and
 adapt for various usages"

interacting with commit

  3cfe39b3a845 ("i2c: Replace list-based mechanism for handling userspace-c=
reated clients")

from the i2c tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index bd90a6084fc0..c21a16aa96dc 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1306,10 +1306,10 @@ new_device_store(struct device *dev, struct device_=
attribute *attr,
 }
 static DEVICE_ATTR_WO(new_device);
=20
-static int __i2c_find_user_addr(struct device *dev, void *addrp)
+static int __i2c_find_user_addr(struct device *dev, const void *addrp)
 {
 	struct i2c_client *client =3D i2c_verify_client(dev);
-	unsigned short addr =3D *(unsigned short *)addrp;
+	unsigned short addr =3D *(const unsigned short *)addrp;
=20
 	return client && client->flags & I2C_CLIENT_USER &&
 	       i2c_encode_flags_to_addr(client) =3D=3D addr;
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/9eYxED8PJI2=_T=1HhgPDQ=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7YcwACgkQAVBC80lX
0Gy5JAf/U3ygmivkERtFwgy5gAIDQk8R6VLO4WNdaEJ/1IM5k3Ve8381foOGMb9n
vDpDEvV/+E7FjClqCXHgxonRhRaGVog5d6XMNiXeHfjAO1FB+siXmfCZ5UANHe0D
viSj05QueoP+7Tmeo9sr9eFjlCAR9u3VYS1vg8a6lDt9qgRctPlxO/eESylb/XIo
rC2pIQYgC1p0Ixw0fvuOirbKhYb7xxxv2+hHT1aM6/6yJQ9wwVjTjDF5XlTOU1O2
IlJIgOoojj25Eqo6lPg7YM3QwUenKZhtVlVR4vB8KhUbxdErKICEDxpg6lXQ4OsY
dvwRGzCuhljChyODxk1Dk9dMOPrPcA==
=G673
-----END PGP SIGNATURE-----

--Sig_/9eYxED8PJI2=_T=1HhgPDQ=--

