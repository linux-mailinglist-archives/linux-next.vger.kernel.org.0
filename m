Return-Path: <linux-next+bounces-7016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FEACBF33
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 06:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0838B7A6431
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 04:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2551F0E20;
	Tue,  3 Jun 2025 04:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RC9Qwwbx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94797173;
	Tue,  3 Jun 2025 04:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748924858; cv=none; b=Q6ZWhUvKsX7lnZTvKZ4zXgpf0oaLvcHWmkon3yVX1OPgX1tWycpsSJlZAOvHVESEruHLP1E769xkTJqvu/k9l5lFyANMUCPIhfB6tzFukr9v0rVy76r/nCwju+OcivhS04XDsuB9VWih81CP/rvm7xyDOpWfhnMof0LiCc2SMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748924858; c=relaxed/simple;
	bh=mFKbqTKrOWdaKQobo/BncdjSnIChCDEf7FoGojpDD2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B/w4CVJizDCIhwdV+Tq14L6SEujJBH0z+cKeBS002tpV98U6fL6eH9ltEmbUXHkP0ox9vEQlOlU+vM2cfLIL598zI0bK7cjwcPQWBTFy+ap5uTXBW8se8cLAhaVkSL5X5/eGddB4lBF+SVwSeKr8OTLDGAESHnTu0e0BFuNQaIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RC9Qwwbx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748924851;
	bh=C1QWK1JZcLIQ9k3n48xFjIAiFC4pxjDkSghW5mWvMmI=;
	h=Date:From:To:Cc:Subject:From;
	b=RC9QwwbxQTzaP/TgFtPK1kY35JWcigxlRryN0rPMndm8RoGhhTqco1d2j0dDiIaa2
	 XYW4DW/YTJNLKCBvUVCmW41e3l5+tseQVMdruyOwyE8VzoiapeJuKeCmsSc82hZZBY
	 pUCuSaT6F6WjkWk4nwRDzG1DhSP2333cCaMljf2Bm3VLd0RvUkfnAAxW3KPebAsBBh
	 iWfV/ElPCQRhsT8X9M/x3yNVSSrCgdmDre3fFRNR03K3ALek03pPs2dRy6H5efkfoo
	 QN6rgRvu7BAEwOmoG0Hwko3vlHDuLlsaXyZIie/w/Oo6aZgT0hEZZZRFognrSgkgUq
	 CfRZuQBkf3FmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBHkC0fdsz4xcT;
	Tue,  3 Jun 2025 14:27:30 +1000 (AEST)
Date: Tue, 3 Jun 2025 14:27:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Florian
 Fainelli <f.fainelli@gmail.com>
Cc: Akshay Gupta <akshay.gupta@amd.com>, Andrea della Porta
 <andrea.porta@suse.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the broadcom
 tree
Message-ID: <20250603142730.084cf0a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UZTyZjK8c2jVAG3qy/fWr59";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UZTyZjK8c2jVAG3qy/fWr59
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  drivers/misc/Kconfig
  drivers/misc/Makefile

between commit:

  d04abc60a903 ("misc: rp1: RaspberryPi RP1 misc driver")

from the broadcom tree and commit:

  e15658676405 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/Kconfig
index e12e445a10fa,0de7c35f6fe5..000000000000
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@@ -660,5 -647,5 +659,6 @@@ source "drivers/misc/uacce/Kconfig
  source "drivers/misc/pvpanic/Kconfig"
  source "drivers/misc/mchp_pci1xxxx/Kconfig"
  source "drivers/misc/keba/Kconfig"
 +source "drivers/misc/rp1/Kconfig"
+ source "drivers/misc/amd-sbi/Kconfig"
  endmenu
diff --cc drivers/misc/Makefile
index 9ed1c3d8dc06,b628044fb74e..000000000000
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@@ -75,4 -73,4 +74,5 @@@ lan966x-pci-objs		:=3D lan966x_pci.
  lan966x-pci-objs		+=3D lan966x_pci.dtbo.o
  obj-$(CONFIG_MCHP_LAN966X_PCI)	+=3D lan966x-pci.o
  obj-y				+=3D keba/
 +obj-$(CONFIG_MISC_RP1)		+=3D rp1/
+ obj-y				+=3D amd-sbi/

--Sig_/UZTyZjK8c2jVAG3qy/fWr59
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+ebIACgkQAVBC80lX
0GwMswf8ChoyTMgsY8DSrhMeUjF2lk/kUhEY4LFrh6W9JA3eBCtFlZRnDEU9+rx1
yYy6kyb/z+AKmDHMk2jG/hpEwsKUw1gAdWTG7Em2zKkvFwxa0m+K833yNRASsgFq
twNhHaC3dCCC/BU4y/k1KFZmdt1zO4NI7lpze6+/FRUfweuCfps/mMgGcx2pcrmL
OQckfaTTZj2B5qlfxd92OrWMSPSQ2z10HXhRb6h5DoshQWVeQxyk6uUcWBrLU9Et
bc8nmw3K/9IKfLon0tpQG/odJ/DqszNlwkcVYVe0hfBAfvfsM5CqOqge5Ict8gic
GW2IvwAUx4tTw14Js95LUPXYCPCMTQ==
=RFjI
-----END PGP SIGNATURE-----

--Sig_/UZTyZjK8c2jVAG3qy/fWr59--

