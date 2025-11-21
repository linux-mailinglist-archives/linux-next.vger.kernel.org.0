Return-Path: <linux-next+bounces-9130-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE8DC77285
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DDA9F34DB30
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 03:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94692D73A1;
	Fri, 21 Nov 2025 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NbB55LuW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9871E5B95;
	Fri, 21 Nov 2025 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763695518; cv=none; b=I1UDXfAQnRCjXYAgVgvWaDEiCBq30z9+xV8jug9ENlitdSPx8Vc+Lp5PVFo023xQxHWnuEZRctfwLCiyUu95prpIglxnWEsPfNseMjcPYGp8h+7WqgWHhVAo3EKADdlJawg6hxneGqmoKzMAu5yDn6hsHRW0iI/ZaepWRmsGqSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763695518; c=relaxed/simple;
	bh=NJPLbhlBC3sUwzKi//CyVbo7E2Ksd4m1K1uQdp/Ucqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DEwtvwzJbAp1KGcYN/ka1HX03gDMzVAXlXuiI+VHAQr2T3gKMPEVCvED7DdVRMlVkNRUubhuY9uKU2wgGm1lrfpj7/tgjIlmIysJv33NkM5NaKHhYQTnD3N8Bcm76UBvKpJsCKHy99fQYP/3ubUppnvtB6+FALZwOwjS7VAO5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NbB55LuW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763695514;
	bh=c0AZu1N9a175AfsA7wSHK/suoejETVc6JN69/3LsOlQ=;
	h=Date:From:To:Cc:Subject:From;
	b=NbB55LuW+iIVJwRZkd3ykV3monZ5sWpFWn523dBZ0TdGyVlFPHDOzvRLYCF/H6Dpy
	 PKItTRZd1s0C67AnXJOB+p94tLFVyYum0/8gTq9HQpij4gJXko3FrcSkjxDcsN6t2/
	 LJ+E6L9AaX08XvaRJmFCp3eki5Iy5oHx4d/kDsobn+KuQbEZZPF4cA4SkTmei9Dd48
	 nbX7YNqAwRbVja6ofMiSqizbItLlKTL66lwsdPss6i/g8OCuaFct7Yn5Q/WhfsHl+Y
	 8HdHFdBqKa0J9Z/+wvySL8OFOI7QLEnVMBQldUNO+V0bjF11NmWe2GuSqsEwFbhW/A
	 3stgkteulJfJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCLFP0rkDz4w0Q;
	Fri, 21 Nov 2025 14:25:12 +1100 (AEDT)
Date: Fri, 21 Nov 2025 14:25:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Hans de Goede <hdegoede@redhat.com>, Mark
 Gross <markgross@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the staging tree with the drivers-x86
 tree
Message-ID: <20251121142512.371a77fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WP5/5G+=A0HcqwmJu.pVCux";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WP5/5G+=A0HcqwmJu.pVCux
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/platform/Kconfig
  drivers/platform/Makefile

between commit:

  e2c1b56f3dfa ("platform/x86: wmi: Move WMI core code into a separate dire=
ctory")

from the drivers-x86 tree and commit:

  aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/Kconfig
index 6bb645aed3d1,324c69c63f76..000000000000
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@@ -19,4 -19,4 +19,6 @@@ source "drivers/platform/x86/Kconfig
 =20
  source "drivers/platform/arm64/Kconfig"
 =20
 +source "drivers/platform/wmi/Kconfig"
++
+ source "drivers/platform/raspberrypi/Kconfig"
diff --cc drivers/platform/Makefile
index 533f500dfcff,b0935c602ada..000000000000
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@@ -13,4 -13,4 +13,5 @@@ obj-$(CONFIG_CHROME_PLATFORMS)	+=3D chrom
  obj-$(CONFIG_CZNIC_PLATFORMS)	+=3D cznic/
  obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/
  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+=3D arm64/
 +obj-$(CONFIG_ACPI_WMI)		+=3D wmi/
+ obj-$(CONFIG_BCM2835_VCHIQ)	+=3D raspberrypi/

--Sig_/WP5/5G+=A0HcqwmJu.pVCux
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf25gACgkQAVBC80lX
0GwgDAf+K3+NRk9ouWMuOP7mwz8EERzgY/Tt3KlbAOC00UJGUnFDd3vOO8oJ2HuC
sgC50p0OsKp5s9f4u30bCVbzIacYqJ/d3Xwfg1FYhjxDws73sj6aJ+ockbknwToa
3lNi1f25CLXDNPY6b0tBJsYjCZa6zAMeaQy0/ISf0X7JQMjs4AxdrDbkJf8pRp4L
PIkNWzlCiCDz9NsU1eSrkw9CDjffSiZuCdfCHX5hL9VjmJ/BM1Ds3LWP/DK+jIlY
neeffYIsOeHIVvhng28CuOmZXPWQeHhu2d7b5qMfOMXnmo4ETnk+G0XZU9X16MAy
6rni6V9Y2AOAR5Ugl5JFL4RGjU0rAg==
=DcWC
-----END PGP SIGNATURE-----

--Sig_/WP5/5G+=A0HcqwmJu.pVCux--

