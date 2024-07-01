Return-Path: <linux-next+bounces-2754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FB91DAA4
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E45A01C21A08
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 08:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255A812C7FF;
	Mon,  1 Jul 2024 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ji9cPAlM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65DD128812;
	Mon,  1 Jul 2024 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823872; cv=none; b=uUTL1zDp17fmcSdxuV/vUUv3Cv+ppcBpLiOkJF9/1WO+gb+dVr4HzVMKAWJzEnPUdCKugFUca7jkF3qaLVZAGl1MX7M5mxe5yQGpy/SQW/sl0JnZ3mQKpqCYiAT0OPmIecLVorpKud4CF2O4+DkImWGi55O+tz0yeZk0joc/oYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823872; c=relaxed/simple;
	bh=enbFik6zV9Xmu6FbER/ccs/hIQ3iLSFP/Hy9O6wI3Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iboxvcLpZ+x9t6b0A9mlsDnCAy+HT4mHRFO0NJ56HD+BRbqv9fYMSZ7t08p6dQA8r/wSOkgIyar0S9n47uGTdl1AGx7FBDu0TZ35blaNWLbgWETYjywCskcQPmAwTZyFm8vN5/ta6Wzo6P1eyxDnVm156RW3DfWMQ1yiiojUK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ji9cPAlM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719823865;
	bh=1tJEm6YmoAW7fA3Ot0WnCO1StXIvHT+v8AiTsyv8SH4=;
	h=Date:From:To:Cc:Subject:From;
	b=ji9cPAlMUZy+5D4u0obuHcp32Q2bMPc6Gf5pKG4zFRAYA/WvdNrFxyUcJnW5wajZp
	 Abc7YAbZlL5w2ymVMaj5GLvWLWNBB0++PysCgadU//wDhsNZVKIcMgPRy0j0XGafOG
	 bh6XK/mnxVbHrdyXtUqEgSA+LrTMttJFbGjpXhRgTRybWr7wti9Tbpx9fYmJLU9ZCY
	 nBWErErbeGzLx6kSmjo9vv1LKe9B49v7I+89qWBJL5e9Q6z7X53PNbNEDKlC0yzJOc
	 3rPsR4N0AALmgjl0Xm12KieAHcu5h/y80SxKHwRWKiHJ3nda7DfCbKWKJkkI0F2mbF
	 0wvICxnP612WQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCKWs4FFwz4wbp;
	Mon,  1 Jul 2024 18:51:05 +1000 (AEST)
Date: Mon, 1 Jul 2024 18:51:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <20240701185104.52c159c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oJrhX/FkTrH24p6_sExpE1b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oJrhX/FkTrH24p6_sExpE1b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (i386 defconfig)
failed like this:

drivers/hid/hidraw.c: In function 'hidraw_send_report':
drivers/hid/hidraw.c:143:63: error: cast from pointer to integer of differe=
nt size [-Werror=3Dpointer-to-int-cast]
  143 |                 ret =3D __hid_hw_output_report(dev, buf, count, (__=
u64)file, false);
      |                                                               ^
drivers/hid/hidraw.c:154:56: error: cast from pointer to integer of differe=
nt size [-Werror=3Dpointer-to-int-cast]
  154 |                                    HID_REQ_SET_REPORT, (__u64)file,=
 false);
      |                                                        ^
drivers/hid/hidraw.c: In function 'hidraw_get_report':
drivers/hid/hidraw.c:231:56: error: cast from pointer to integer of differe=
nt size [-Werror=3Dpointer-to-int-cast]
  231 |                                    HID_REQ_GET_REPORT, (__u64)file,=
 false);
      |                                                        ^
cc1: all warnings being treated as errors

Caused by commit

  67eccf151d76 ("HID: add source argument to HID low level functions")

I applied the following patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Jul 2024 18:36:36 +1000
Subject: [PATCH] fix up for "HID: add source argument to HID low level
 functions"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hid/hidraw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index c2396916cdaa..34633f99f3e4 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -140,7 +140,7 @@ static ssize_t hidraw_send_report(struct file *file, co=
nst char __user *buffer,
=20
 	if ((report_type =3D=3D HID_OUTPUT_REPORT) &&
 	    !(dev->quirks & HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP)) {
-		ret =3D __hid_hw_output_report(dev, buf, count, (__u64)file, false);
+		ret =3D __hid_hw_output_report(dev, buf, count, (unsigned long)file, fal=
se);
 		/*
 		 * compatibility with old implementation of USB-HID and I2C-HID:
 		 * if the device does not support receiving output reports,
@@ -151,7 +151,7 @@ static ssize_t hidraw_send_report(struct file *file, co=
nst char __user *buffer,
 	}
=20
 	ret =3D __hid_hw_raw_request(dev, buf[0], buf, count, report_type,
-				   HID_REQ_SET_REPORT, (__u64)file, false);
+				   HID_REQ_SET_REPORT, (unsigned long)file, false);
=20
 out_free:
 	kfree(buf);
@@ -228,7 +228,7 @@ static ssize_t hidraw_get_report(struct file *file, cha=
r __user *buffer, size_t
 	}
=20
 	ret =3D __hid_hw_raw_request(dev, report_number, buf, count, report_type,
-				   HID_REQ_GET_REPORT, (__u64)file, false);
+				   HID_REQ_GET_REPORT, (unsigned long)file, false);
=20
 	if (ret < 0)
 		goto out_free;
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/oJrhX/FkTrH24p6_sExpE1b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCbfgACgkQAVBC80lX
0GwBTQf8CMmO/lMRq1cXSEtte+sol+3t4NC32rXxCsBm4Q/GHUzZC2w1Wdg1lPyj
HMJKMCTJuxuByURv58lWR+o+bN4iLFZdjhYuJAyR8WTNU6tSxnnwDkqV2u8TmPhe
bKviZ3q4RtUWcw+oxK2jcFemR5o+celpRPEnl8p+oeuzqt+kXQEFTSOME5+H65/K
JdchOFaxqZACoWXpSdaBPd6TST2Q+nR6F6JUTbCgPNA4curB0AvS6sjDM6g6JUbC
dnP0QoaEjB82+PoGByu2IU4HPziRodUOI90ZRUMgHybyfCEfllCw/5ifHAdNq4zn
XNBepcwzSRbC1gXB+cvpGCBknFTMzQ==
=JnhF
-----END PGP SIGNATURE-----

--Sig_/oJrhX/FkTrH24p6_sExpE1b--

