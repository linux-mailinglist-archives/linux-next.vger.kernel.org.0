Return-Path: <linux-next+bounces-2789-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F10F591EE00
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97F251F2235F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 04:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D289B2A1D7;
	Tue,  2 Jul 2024 04:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g+yM/vBd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2115A7A0;
	Tue,  2 Jul 2024 04:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719896308; cv=none; b=sbK8D7Ui5I6l77uKq22uU1rYs1UFEeQy13Xr+efHQc9E79VwxgmWx+Dr6t6yQ+3fPoFnRsSIqZrsTzEbd+M/K017UJDxSD1RNiFxOEGXLKTg7BCihFG3AIt0rIRfVit4924OaGIR8mPEw8SrO3HPNWdKM/xqJq98bq+16FHUgW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719896308; c=relaxed/simple;
	bh=AJ3kIwtK2LdnP7xcStE1JUwCs3ZO9xmlshimtlId0wM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tGn1/t9P20rQMZbDzvSc9WB7GW7z7igMDUMuwKD7KNn3EIfEcxRg2RisIezE+iA8f2XwZVRtUpeafEO4xL1B4MKGofnGZryfy+1i/I9FIPXXhYsPya5fbp+ImarbVSJ4XMSes0G5w3yZDAmUso3ZblQTedTUCpjfKZ/MhreGEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g+yM/vBd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719896302;
	bh=6lo576Kp59cVI11pY9bbCK6DPbXy67BQ66dZgq4jhaQ=;
	h=Date:From:To:Cc:Subject:From;
	b=g+yM/vBdhgx7s2WSJQtDkDVZ1JrVEdByGCTs2dWqpaXyA4HPr+Fm8308iv4Vib0zT
	 AzAANCLXR3YzOSJu0FUjp5aIjixaNst3UAlsTc+q+F+WI8xgp51snZySUUrbjNLYOn
	 kMuYyqfX/0CrmPsD89Y/D0SQrTr1kVQ9wmUeLtey/yDF2VzuN1cEwq+lmz11EYl4AK
	 oXYQ0lewVnPiMSUNeVdDIfVV0TOQhSHcaL6p4JrFpcJECs4nKDuXZfLOheOpX2GXkF
	 jjdS5tUI9qNigwIRQkaGrEVr5KsKsqOTFZK+spKVO3SQ/W4NHPG4F6P1Q1WXpCC24z
	 hFlk65gGpGHbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCrJr3m99z4wbr;
	Tue,  2 Jul 2024 14:58:20 +1000 (AEST)
Date: Tue, 2 Jul 2024 14:58:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@google.com>, Guenter
 Roeck <groeck@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <linux@weissschuh.net>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: linux-next: manual merge of the leds-lj tree with the
 chrome-platform tree
Message-ID: <20240702145819.3bd4e113@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/11QYbJkL6x_QzL4iq/kQb4w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/11QYbJkL6x_QzL4iq/kQb4w
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the leds-lj tree got a conflict in:

  MAINTAINERS

between commits:

  bc3e45258096 ("hwmon: add ChromeOS EC driver")
  c6ed48ef5259 ("power: supply: add ChromeOS EC based charge control driver=
")

from the chrome-platform tree and commit:

  8d6ce6f3ec9d ("leds: Add ChromeOS EC driver")

from the leds-lj tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index c89c84111696,a7deb8fa20ca..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -5210,19 -5135,11 +5210,24 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
  F:	sound/soc/codecs/cros_ec_codec.*
 =20
 +CHROMEOS EC CHARGE CONTROL
 +M:	Thomas Wei=C3=9Fschuh <thomas@weissschuh.net>
 +S:	Maintained
 +F:	drivers/power/supply/cros_charge-control.c
 +
 +CHROMEOS EC HARDWARE MONITORING
 +M:	Thomas Wei=C3=9Fschuh <thomas@weissschuh.net>
 +L:	chrome-platform@lists.linux.dev
 +L:	linux-hwmon@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/cros_ec_hwmon.rst
 +F:	drivers/hwmon/cros_ec_hwmon.c
 +
+ CHROMEOS EC LED DRIVER
+ M:	Thomas Wei=C3=9Fschuh <thomas@weissschuh.net>
+ S:	Maintained
+ F:	drivers/leds/leds-cros_ec.c
+=20
  CHROMEOS EC SUBDRIVERS
  M:	Benson Leung <bleung@chromium.org>
  R:	Guenter Roeck <groeck@chromium.org>

--Sig_/11QYbJkL6x_QzL4iq/kQb4w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDiOsACgkQAVBC80lX
0Gx1qAf+LmxInoYE6m3SPzbudcHjQ9fuwnlOPG4+7+IQ8jstwOCU/ilkFsHCThYE
JS1/RdvQOmLweOI6asc62xfNaEDfVr0u6l6QcvgCLg1yOMiLgxl6V2WLon3NN5VU
XtgvcpiGLPOJSugxCKzHW+Wt/ZWR0VNh8HmngQHpVFckxSNfXTNn4X2K0OV3TsyX
0RJJTHHd7l1e546b4CriGDYfPLdwZXNkbCl4vlOnyMZ8fzNSp8d/1H/qTFIiPXaS
GdibRGeVw0zwR1DADL70zFWroKUu8DI4VWpjsxrb0s1nDef+MvBvV1XwO7QShbp5
XZvUr6Cd00vAWzf+KJtFOBIZSAO4YA==
=RalT
-----END PGP SIGNATURE-----

--Sig_/11QYbJkL6x_QzL4iq/kQb4w--

