Return-Path: <linux-next+bounces-7509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE9B03578
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 07:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85E63167585
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 05:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070AF1F417E;
	Mon, 14 Jul 2025 05:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qlRAfAfR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11C18D;
	Mon, 14 Jul 2025 05:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752469964; cv=none; b=V3sgLa+/GYzmRxTFOndMuPMKM5T4DE2XfbXm1BxTN3pEh5Kd5PDMPKI4kyBFaP0EyGaQm50bJqphL7xZUsNhJRecTLZkg0Ci0LDYKEBZkAddhMIi6Me+uqmjeVMBcLt3nrN5RvP1l4yw8y4bnv3iA8c9IF62ktKTmGXJVnvuRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752469964; c=relaxed/simple;
	bh=bjXIj2NW2ENyB+v3zwdbAHRxsCOs9Zu3CbFS4c0w/xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aj4IltEccD44qIvcXcZ+Hj4yhm9Fa9wTrY887jDtE/bWD1KZkQikzHVajqd51aHZkxpijWpf2B+ioFpFCZLgUlJxTaOU63UFn/ql/mntImCmoFLeEn8nxk9dOv9jVyQCROWO8x2XlCg8vRahTRQ1lk8iNMgstIuEY00EPAS5HEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qlRAfAfR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752469855;
	bh=zzMCZDIyh8x+TPcVLivrHVOvQoCnaH/bb5c5gJcOS+k=;
	h=Date:From:To:Cc:Subject:From;
	b=qlRAfAfRTFZZUO6L839DxrjLv+v5O3m8CcQ5Jj+LVEXLblpxT3hbyghKo2kwY+amM
	 UtDfS9f5foLvokImW7TZl6fwjR4m0/3XlX0Gb0gnAT7nv7FinOhfEnvh/tCP1aNCa7
	 GJVsLsPMEc9Z8UueSJLepmb7sAUtpwZOHlNsLps+PXtVYg7Uar9r5LKM+SZVACOrs6
	 rFPeQ3cNCBSoCcKwO6tRLzl7Hqx2Kl2EEc47wxSOycT3giUoPPQiAb3Gt0ffs347x1
	 nHzjA+vRas09BrC3AMlGv7Epo04k4ZElabUeJElWW1bN2sdlWuKGgX+zyEN69AduIL
	 afgDFQ1GwzLRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgVlL3Xxyz4wbW;
	Mon, 14 Jul 2025 15:10:54 +1000 (AEST)
Date: Mon, 14 Jul 2025 15:11:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Torsten Hilbrich <torsten.hilbrich@secunet.com>
Subject: linux-next: manual merge of the drivers-x86 tree with the
 drivers-x86-fixes tree
Message-ID: <20250714151130.4e236389@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/COljwCKoursMaeZHlKPACVt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/COljwCKoursMaeZHlKPACVt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/Makefile

between commit:

  2bfe3ae1aa45 ("platform/x86: Fix initialization order for firmware_attrib=
utes_class")

from the drivers-x86-fixes tree and commit:

  651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")

from the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/x86/Makefile
index bea87a85ae75,0530a224bebd..000000000000
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@@ -58,19 -58,12 +58,14 @@@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+
  # Hewlett Packard Enterprise
  obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
 =20
 +obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
 +
- # IBM Thinkpad and Lenovo
+ # IBM Thinkpad (before 2005)
  obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
- obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop.o
- obj-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D lenovo-wmi-hotkey-utilitie=
s.o
- obj-$(CONFIG_LENOVO_YMC)	+=3D lenovo-ymc.o
  obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
- obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
- obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
- obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
- obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
- obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
+=20
+ # Lenovo
+ obj-y				+=3D lenovo/
 =20
  # Intel
  obj-y				+=3D intel/

--Sig_/COljwCKoursMaeZHlKPACVt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0kYIACgkQAVBC80lX
0Gxc4Qf9G/U539gmZd9gEpn4HxqW6UktAbB4HGjj+9JlJU3DOBsH5+1gihPEtFIm
IEDpUWayv3PlENY3lPlTKSBGvoLEC1h+uhLjEq0+JUMfWwHOE78drLb4vK4BgFRL
ARja3NRu/vJfx3wIdU0KWoet9pdxihSYN5cRA430Bb8xygRWO9afBJFrAVQI5DVp
0e94fMT0fpS6L5I9y9asdfv7Bmwo6shIEvqg5ROsEugkFwTu/sfSp8TC5icEPu5Z
UXOylnD3uQyZZkFjov6HN5S9cDIL1GX8JpN+980YXh4YS04bN3IipRwLbWhTOg9w
1gzXS/rlF/Y1PTYpk1EWJEBsHULXeg==
=NqFY
-----END PGP SIGNATURE-----

--Sig_/COljwCKoursMaeZHlKPACVt--

