Return-Path: <linux-next+bounces-2859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEB492B051
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E551F24401
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B77D147C86;
	Tue,  9 Jul 2024 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Aw6mzwjz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5313C9A7;
	Tue,  9 Jul 2024 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507042; cv=none; b=LYR3sT2n3SfdFj5M4v8wXLtNkiFJcyNlamqL0t4/W+A4km5Qm1JocJkAn8n4Iaaxh+HjC0UDg3643rfaRJaAGsYJdXfUf/rX6/vo/Kmkd7rp43gi+lNfsRblTdXOiyRsd1KtLC1IuEbcFQl7u+CvpVQh+BhsGEeo9eM9q3GkapI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507042; c=relaxed/simple;
	bh=wvBQb9Zrj7Q9RvOYWEJ3T8kjv8ALZ8ZYxYNw5FJhUPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gl0/+aaIH5RDbyFZxjAxVelrgJz8uXzkndYzR2Gmz2eGf745JyoBbkiDivZmZiCYcztkg4mnApeAi7o8tyaEVvFERH1VoXItHzuwpNRfFn8SGl0ACiR3Bc2Prz1QQylUtQ4JCemasbHx0vTuUmXJ8Fj91yAZHIWDgLltZj+bmsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Aw6mzwjz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720507038;
	bh=0e6LDdlETbI34An3vSVmgAQ/JuY3aRZkXcGqTkCWFXE=;
	h=Date:From:To:Cc:Subject:From;
	b=Aw6mzwjzpyONcxXZhCoCiOGDUEg3W9YM0MHbbTK0JBT+Qe6kLw3iRP5nl0U5gXRVA
	 REiQly/XFnfBFhqoxTWEbS43c7+eS5ycOn34MWPKrYzdR3gsockvz9Lh6kZIorPOiz
	 4mfjUn0Ch3tsctKO2ws/0I7XMVihvfbuqO9iIDgPOM5w704CdeCD+L9JoagqgEgu63
	 v1ZQACAj01sFq9Qc35PLpyaAvzHx3ppNl1RX7hAhHBV3v8Js3MCDUcQ+Tx/lLpFxqf
	 8/8A3xWH3BfGmt7F4An9oglUDFzo8ExaES7ZmNu58Q3ne6WNSkIUP9Zbs7Fe2u4aXh
	 U/ld9cglM/DCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJB9m2xYBz4xQW;
	Tue,  9 Jul 2024 16:37:16 +1000 (AEST)
Date: Tue, 9 Jul 2024 16:37:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: David Plowman <david.plowman@raspberrypi.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst
 <nick.hollinghurst@raspberrypi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20240709163715.3bcd6ab3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LLRyCjwUfGVoOapVNN1ZBj8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LLRyCjwUfGVoOapVNN1ZBj8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initia=
lization of 'void (*)(struct platform_device *)' from incompatible pointer =
type 'int (*)(struct platform_device *)' [-Werror=3Dincompatible-pointer-ty=
pes]
 1786 |         .remove         =3D pispbe_remove,
      |                           ^~~~~~~~~~~~~
drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near i=
nitialization for 'pispbe_pdrv.<anonymous>.remove')
cc1: all warnings being treated as errors

Caused by commit

  0edb555a65d1 ("platform: Make platform_driver::remove() return void")

interacting withc commit

  12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")

from the vl4-dvb-next tree.

I have applied the following fix up patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Jul 2024 16:03:05 +1000
Subject: [PATCH] fix up for "platform: Make platform_driver::remove() retur=
n void"

interacting with commit

  12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")

from the v4l-dvb-next tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers=
/media/platform/raspberrypi/pisp_be/pisp_be.c
index e74df5b116dc..7596ae1f7de6 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int pispbe_remove(struct platform_device *pdev)
+static void pispbe_remove(struct platform_device *pdev)
 {
 	struct pispbe_dev *pispbe =3D platform_get_drvdata(pdev);
=20
@@ -1765,8 +1765,6 @@ static int pispbe_remove(struct platform_device *pdev)
 	pispbe_runtime_suspend(pispbe->dev);
 	pm_runtime_dont_use_autosuspend(pispbe->dev);
 	pm_runtime_disable(pispbe->dev);
-
-	return 0;
 }
=20
 static const struct dev_pm_ops pispbe_pm_ops =3D {
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/LLRyCjwUfGVoOapVNN1ZBj8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM2psACgkQAVBC80lX
0Gyf8wf/baWep99MNzEME4/nIVkQHEFidvtVri78Hc3DIvOaf67CD2/HrRVB8KMh
A5KqtbfeIiN2PCcLTCFE0ROb9Dg7ZWVz1glwLfJ5DTj/tMHytu52nvCqiQMjCgva
HxW4d+Svgk7RrGQlF+qLjmKs3KXAhSS1kjcc97dNH4+8x2ZJl+F+E6r1prPEJ1mI
HlSZcXYC50ipu8Mk1uKj/DrQxZYAGchUTYoKj9zwvZGJgpVdhe+qh6zNH8M0dJX1
W/NMXHfGA+RiOGVJ0W5GqPZDOU+lBmJquNEXOwQ9Vt+GQEppLy5SHa22PHAB5rBt
y2zi5Yn6+27Ytlr2onRQNSvolmrBEQ==
=saEg
-----END PGP SIGNATURE-----

--Sig_/LLRyCjwUfGVoOapVNN1ZBj8--

