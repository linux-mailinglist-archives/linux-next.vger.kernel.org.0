Return-Path: <linux-next+bounces-7676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909CB0CF04
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 03:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9A5516F33D
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 01:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAA514A60D;
	Tue, 22 Jul 2025 01:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZjVwWu9P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C67EC5;
	Tue, 22 Jul 2025 01:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753146896; cv=none; b=o03CZQ+QaP5GQEPfjAkN4TLhrjy76/JoUYhnmjtAPHKnP/7kzDGpNS7y2PSoVPDr5w5hpDYb7QiWRVD6OybwTKPZg/sMBC9m5HBmCrsafBnVe2XPpmbID8GKpfvXc2RLcvEdCo5xz2vBShDD5o+z/lXdVFuTjMjLuCpATgEgkpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753146896; c=relaxed/simple;
	bh=ZyY4PExMxEOKVdqiLGrdi79e8Qe799VgbI8KM0RWKCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CsjYu2ZiZtVHYQYXl67yTbLsA+53UyqjEoGnFlCLZ5NjnKDQGVRofHwNhbWxy9abTJVZHejsg6pZe3mH5T6RJIZZ7ZYGwozsry9Zr7SUxzI1BJCC7cgUGNxbtMgiygxBzI5jluhX5fzkAdw9nOSG4doMHZr2PvN0aXCde8WIvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZjVwWu9P; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753146732;
	bh=IbtrKg/FwI2zyW7puEU3DT9rKVvustOl2IwtxnY+xWA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZjVwWu9PU/v0TNnqSr2TGvOeNbGsYNMTBM7dKIrxH9Ydj3MXO+Lv579psaSUzkTkJ
	 ZzdoXJvkdnyCL4Wv7t49oV2axlEAQ5emCMrCDg3IQ9NQ0pQc//CabamJ85rf16yR5W
	 XOgHqHl1Fxa0VWBMUrty7+n0y2U/NHPw1QNfR7QctB/dCS8hsXdMAjkN/cNGWrNZEF
	 e0hkqZKGHQzC4gLijM0rUxNF0t02AMEBe3qPae+7kspI+DuYzu8pNvsjtYr/SWgsSC
	 onjszdIQrOUTTYbDgglq79WJLc6KF3Ltts+3d/KgFlje77vcTg2rKNkwjr/OuKz9bY
	 ni3cfZlHbJIig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmK4C6B6Cz4x11;
	Tue, 22 Jul 2025 11:12:11 +1000 (AEST)
Date: Tue, 22 Jul 2025 11:14:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Gary Yang
 <gary.yang@cixtech.com>, Guomin Chen <Guomin.Chen@cixtech.com>, Justin Chen
 <justin.chen@broadcom.com>, Lihua Liu <Lihua.Liu@cixtech.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Chen <peter.chen@cixtech.com>
Subject: linux-next: manual merge of the mailbox tree with the arc-soc tree
Message-ID: <20250722111448.2426a159@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z+.EPQLc.AK9CfzH83iy0fK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z+.EPQLc.AK9CfzH83iy0fK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got conflicts in:

  drivers/mailbox/Kconfig
  drivers/mailbox/Makefile

between commit:

  fe2aa2361ddb ("mailbox: add CIX mailbox driver")

from the arc-soc tree and commit:

  6aecd1f31f8e ("mailbox: Add support for bcm74110")

from the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mailbox/Kconfig
index 4fef4797b110,865da8986e53..000000000000
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@@ -340,14 -349,14 +349,24 @@@ config THEAD_TH1520_MBO
  	  kernel is running, and E902 core used for power management among other
  	  things.
 =20
 +config CIX_MBOX
 +        tristate "CIX Mailbox"
 +        depends on ARCH_CIX || COMPILE_TEST
 +        depends on OF
 +        help
 +          Mailbox implementation for CIX IPC system. The controller suppo=
rts
 +          11 mailbox channels with different operating mode and every cha=
nnel
 +          is unidirectional. Say Y here if you want to use the CIX Mailbox
 +          support.
 +
+ config BCM74110_MAILBOX
+ 	tristate "Brcmstb BCM74110 Mailbox"
+ 	depends on ARCH_BRCMSTB || COMPILE_TEST
+ 	default ARCH_BRCMSTB
+ 	help
+ 	  Broadcom STB mailbox driver present starting with brcmstb bcm74110
+ 	  SoCs. The mailbox is a communication channel between the host
+ 	  processor and coprocessor that handles various power management task
+ 	  and more.
+=20
  endif
diff --cc drivers/mailbox/Makefile
index 786a46587ba1,1c0627297474..000000000000
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@@ -73,4 -75,4 +75,6 @@@ obj-$(CONFIG_QCOM_IPCC)		+=3D qcom-ipcc.
 =20
  obj-$(CONFIG_THEAD_TH1520_MBOX)	+=3D mailbox-th1520.o
 =20
 +obj-$(CONFIG_CIX_MBOX)	+=3D cix-mailbox.o
++
+ obj-$(CONFIG_BCM74110_MAILBOX)	+=3D bcm74110-mailbox.o

--Sig_/Z+.EPQLc.AK9CfzH83iy0fK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+5ggACgkQAVBC80lX
0GxaAgf/RCHyEV46T8yTy+kQyZz5scJxBQN/bm7G/e9/JZJtpgut1ES8QvxKf9ys
PqFRNIIHyRIgRCvbiGqzq7KCrsrQMZ5EoPvWHwEUTUo+waAC+t7+iqw/3U5WHPs7
W2X/dOv0/W1hHToT/ktArSnHKgnA6xB1jFAQTqS0risUgM/jM5U4dJLpNLBSaj+B
BEgZmLWhFfkLN5ny5ZXCMa/xyS++aiSgGfVkGH2/SjUz93+xOKLH8Qez10oWqEPi
VCYB+2p4QShv94r5thFgAn6HmLtwveKXwLK2gMZs1IsVQjH4X/UQCrLXxaEqp+WH
TVQOztMFQ+ebKwVnlrYrxebnJll+qA==
=W1aI
-----END PGP SIGNATURE-----

--Sig_/Z+.EPQLc.AK9CfzH83iy0fK--

