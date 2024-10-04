Return-Path: <linux-next+bounces-4097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A74698FC92
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 05:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 819651C21EC2
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 03:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC582BAF5;
	Fri,  4 Oct 2024 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pOYvXYg0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C8175AD;
	Fri,  4 Oct 2024 03:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728014138; cv=none; b=GTp34V1oD+/ptefXR0bRc+70o7sAz4CdqVKmCgoRMswjxFtzdV9R7/uJSiG4xF2QWJa8O+5l3QeT05p1ZGPKfHx0gWXeOYtVq4kFwiyQ65eYBSbaxinFxKlm9aMKzZt04uuHsU/gVRD7iBLkWbwsLKhTTlUmDIhYbUX/FRj1+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728014138; c=relaxed/simple;
	bh=EFQL2PsqMhqgzsp3EO6jdxtxH85VSlbFbjaFlbVLCuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KOA8mv7yD2Gdgv1dpd7JTFIHgdZmAdFe6Qd9Pe8vxTTd/JL5KO/BcxUaFs2dMNNDrOkK5a9VdBSQ0T6o0u3QDFd6/yuVAHpK4PkJrxxrM23LzxNphAcC0SeU+lEPydiz2o9KxnqV0b2NXkZSd6fBRM7fzgofAS3KCShOfU9YGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pOYvXYg0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728014129;
	bh=eVYr4UF7D4ddfUGuHX9CtKLzk9YDRMng+T5NgKOt3bU=;
	h=Date:From:To:Cc:Subject:From;
	b=pOYvXYg0prj4qyCbDZLpXTMwCpRphIG5TW6ewi+ASs9U3AFrOV5zUcs+M9PRj5HOV
	 QwxBDjL2plHkfh5OTs8Xp4nMk7KXxPE9Nihm2DEMdcDAI0bv14i41Pn2Dq9Ny4iAYe
	 UEhOCO4teVGCiQWBwRsuSS8Mr4iI4yM7I3yC5qscauVH3jDTL0/AVqpSrABSMm6oEc
	 wGnBgcv2Hym4BpyD0qDkCp2SxlalSKk1SxtIBHmhd1BmKxBXIjwTEKzPnUtOIr68yE
	 ZTpd6jH0h1Op7vJ6yF0vZBrdaBWIXHdG933n35xSOGiCk3OPua6+8FCIHUUKPjyMsM
	 O9pc3asDEnZwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKZSx0Myfz4x8h;
	Fri,  4 Oct 2024 13:55:28 +1000 (AEST)
Date: Fri, 4 Oct 2024 13:55:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bruno Sobreira =?UTF-8?B?RnJhbsOnYQ==?= <brunofrancadevsec@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Luis Felipe Hernandez
 <luis.hernandez093@gmail.com>
Subject: linux-next: manual merge of the kunit-next tree with the mm tree
Message-ID: <20241004135527.1e2fc747@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sqZ9viu.bjIr850I6ZxrXQF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sqZ9viu.bjIr850I6ZxrXQF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got conflicts in:

  lib/math/Makefile
  lib/math/tests/Makefile

between commit:

  aa2cc84cfeb0 ("lib/math: add int_log test suite")

from the mm-nonmm-unstable branch of the mm tree and commit:

  f099bda563dd ("lib: math: Move kunit tests into tests/ subdir")

from the kunit-next tree.

I fixed it up (I used the latter version of lib/math/Makefile and see
below the signature by the patch immediately below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

rom: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 4 Oct 2024 13:51:56 +1000
Subject: [PATCH] fix up for "lib: math: Move kunit tests into tests/ subdir"

interacting with "lib/math: add int_log test suite" from the mm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/Kconfig.debug       | 2 +-
 lib/math/tests/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ed36fec4390..d3e44b17876d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3105,7 +3105,7 @@ config INT_POW_KUNIT_TEST
=20
 	  If unsure, say N
=20
-config INT_LOG_TEST
+config INT_LOG_KUNIT_TEST
 	tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index 64b9bfe3381d..89a266241e98 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -2,6 +2,6 @@
=20
 obj-$(CONFIG_DIV64_KUNIT_TEST)    +=3D div64_kunit.o
 obj-$(CONFIG_INT_POW_KUNIT_TEST)  +=3D int_pow_kunit.o
-obj-$(CONFIG_INT_LOG_TEST) +=3D int_log_kunit.o
+obj-$(CONFIG_INT_LOG_KUNIT_TEST)  +=3D int_log_kunit.o
 obj-$(CONFIG_MULDIV64_KUNIT_TEST) +=3D mul_u64_u64_div_u64_kunit.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) +=3D rational_kunit.o
--=20

--=20
Cheers,
Stephen Rothwell

diff --cc lib/math/tests/Makefile
index 83bbf1e47940,f9a0a0e6b73a..000000000000
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@@ -1,4 -1,6 +1,7 @@@
  # SPDX-License-Identifier: GPL-2.0-only
 =20
- obj-$(CONFIG_INT_POW_TEST) +=3D int_pow_kunit.o
+ obj-$(CONFIG_DIV64_KUNIT_TEST)    +=3D div64_kunit.o
+ obj-$(CONFIG_INT_POW_KUNIT_TEST)  +=3D int_pow_kunit.o
 +obj-$(CONFIG_INT_LOG_TEST) +=3D int_log_kunit.o
+ obj-$(CONFIG_MULDIV64_KUNIT_TEST) +=3D mul_u64_u64_div_u64_kunit.o
+ obj-$(CONFIG_RATIONAL_KUNIT_TEST) +=3D rational_kunit.o

--Sig_/sqZ9viu.bjIr850I6ZxrXQF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/Zy8ACgkQAVBC80lX
0GziLAf9Fgu7ULRZktqIjkS4Rc2byZ5Dd1g4sbquVDeeHEnTu7WouIIWf/fFx0kl
yS3nRSjcpUTrDgOTEMNhZTrKRzUtouY3rw3iNlerubSZQ0qysvdqHSsks3qJnj39
+GCkFeD2qPosJ3v4PiESXsDXa1vh2zKEFPeCPbwQutpQFle9XfxpfAAAZkA0JPZL
4QR7tWffcGGXuFIJm7Bk8hpOkhslpb5vKgMGkMm8i6loXsk9YJ6b1VWBdrJiDeFl
DAHIk/AayHN0AmF5T64jb85Bn5y5W9a2IMh0vqv8+Y3fkdrg/8WpoLjj9WF0T2VZ
gzRA3PtmbD2dbSp6/XhVJCUqjDgl4A==
=T6/8
-----END PGP SIGNATURE-----

--Sig_/sqZ9viu.bjIr850I6ZxrXQF--

