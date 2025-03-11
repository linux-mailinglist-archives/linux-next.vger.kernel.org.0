Return-Path: <linux-next+bounces-5731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2DA5BD26
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56FEE162A14
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CE122D7A5;
	Tue, 11 Mar 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NodEJ58v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72E22B590;
	Tue, 11 Mar 2025 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687392; cv=none; b=gNy+E9fPo84pGTeVzX6bj8ZfAz55pRRmWXimxWkWfRGaac8bt9v6vuvSDVLIanzl4BeDcEKgbnMIv8zy8SG6i8re+XUvmy2IsuR34vCs9ZCUKjfEVnYxsDdeU+MXU7iajGGR+rNjFaMmVBhlgjJZa6Koz6XQc4tDDZ3CO6x/Rqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687392; c=relaxed/simple;
	bh=UDGL2txRQNbSMDxGZPIk3jdFe6dTZoJpC7aA0g+9Myw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S9389oLCLXZ2jdkvfDphO6i1YjPHc0uu98NzptgoDI2CeNTf/TaGa8h3ekrlgBq/bpGhICc2C3lC0vUCyQeqX/kpqOrFRyf8aHVRAHiES4QLn0Y5IqjREKvm7auFJ3NYGSyuK3gZHLHQmm0UzzhIEq+NIaEEEkl8Cqie39TCgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NodEJ58v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741687388;
	bh=yOyLo636gdHYkYOR5ytwm46bl/Jigs7X69ylyD0SSBg=;
	h=Date:From:To:Cc:Subject:From;
	b=NodEJ58veYZY4QumzTEEEo1e8NAslG2RrbHQXMM46b3BRe11nklBrJFkZaPZyZywu
	 f/hh6GgWjGrWLgBF+c5SL5MT9Urd68uX71d8ZnB/NOsLRhBVQhawv151IM1dLreYnV
	 R3QausbUQ+NBy1QmmOsNUF9oi32PCyIRuej44kxeGm2LcbcVTJjGKGTyUJu/rcTW+B
	 gFSErjbrubMwgN9+QlVpYH5IApG6ZBOIKKMi9NAoer5aslfy+iz4rQNTSniut+iEbC
	 b2xMLeMDsMdmD0SplLpVrvbEiRsrueOjPZv9wX67yazYvNBK8HVzTqOzTdOGeCHYh2
	 ZfbUL19C0/unQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBq8B5438z4xCy;
	Tue, 11 Mar 2025 21:03:06 +1100 (AEDT)
Date: Tue, 11 Mar 2025 21:03:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the watchdog tree
Message-ID: <20250311210305.3c5a2313@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BNf521ZN9cmOQ5EkDnqB/XS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BNf521ZN9cmOQ5EkDnqB/XS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the watchdog tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/watchdog/lenovo_se30_wdt.c: In function 'lenovo_se30_wdt_probe':
drivers/watchdog/lenovo_se30_wdt.c:272:31: error: implicit declaration of f=
unction 'devm_ioremap' [-Wimplicit-function-declaration]
  272 |         priv->shm_base_addr =3D devm_ioremap(dev, base_phys, SHM_WI=
N_SIZE);
      |                               ^~~~~~~~~~~~
drivers/watchdog/lenovo_se30_wdt.c:272:29: error: assignment to 'unsigned c=
har *' from 'int' makes pointer from integer without a cast [-Wint-conversi=
on]
  272 |         priv->shm_base_addr =3D devm_ioremap(dev, base_phys, SHM_WI=
N_SIZE);
      |                             ^

Caused by commit

  c284153a2c55 ("watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30=
 platform")

Somewhere alogn the way a change to some include file means that
linux/io.h is no longer implicitly included.  I have added the following
patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Mar 2025 20:50:05 +1100
Subject: [PATCH] watchdog: lenovo_se30_wdt: include io.h for devm_ioremap()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/watchdog/lenovo_se30_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/lenovo_se30_wdt.c b/drivers/watchdog/lenovo_s=
e30_wdt.c
index f25429da0cec..024b842499b3 100644
--- a/drivers/watchdog/lenovo_se30_wdt.c
+++ b/drivers/watchdog/lenovo_se30_wdt.c
@@ -5,6 +5,7 @@
=20
 #define dev_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/io.h>
 #include <linux/dmi.h>
 #include <linux/delay.h>
 #include <linux/iommu.h>
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/BNf521ZN9cmOQ5EkDnqB/XS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQClkACgkQAVBC80lX
0GxXPAf9Gow1Sl1EH5nimJR6XywYojBzo19TzGw889qEOOqRAMyloCqHAhb3C/Xu
PXDC2lpjfvUwqmSRk/vvELvJsyhmdzTREdBOTW4gndUETxUA2Hm1fHST/77+rvS0
ZO8I/PDEj1O3n0FCaZzUtwruMNIyZPIoTP/4+0pABUo9X53w2hx8Yas6Pe7cJIZ6
tSZhJ9S+nAytQHCONmqrNJU7KzKvnYv/3RNvyg0qtlTuV6KjCWrTxHffNtDM0PoS
FEkcLmHA1CxGAN6yz/reLReZG2AFBroRNvNTGZpzOyU9aPDJQpTv78z8UiIFbQ8o
67eZ9R5hRJlKS4nDbUfETYDpjGKM8A==
=/HQr
-----END PGP SIGNATURE-----

--Sig_/BNf521ZN9cmOQ5EkDnqB/XS--

