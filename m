Return-Path: <linux-next+bounces-9166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F37BCC7EC69
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 02:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8315F345191
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 01:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EB117C21E;
	Mon, 24 Nov 2025 01:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r0MJ2/KD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8918635;
	Mon, 24 Nov 2025 01:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949013; cv=none; b=jlB3ALi/t26vEjo81pGjF0dnmaHdsiAVwtjHF2o5+Vb3XyY4jjLLHKXv3Dx757pyrMTFhEYmhFhaJn/oa3n/tO+gKodu0aaoa/EvkSMtHYx6ziktNyrIK8+cNuY1lUKbDveFTsvzWYeLRj0mGsclkpgQJh5FcYDseFMVUmTfMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949013; c=relaxed/simple;
	bh=EexIyOjZ4MDB9GPBPW6h8zFermI8XFMArfsCCAQ1yaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rVDFmKNSViaLVTVh0PjE/2ZXQTG7SAIw+oE9DI3b8peM+I2XIb0SYcLKwjO6NopEkiM3h4ku5L94WVkt6FLrycnpQRbMV2XzpUh7uAPa8lRlq78f/D6wIpaeqBb/kUkiSjWET0+jrmJaZ6bGUHt82/ER6l/JTEPJKC8HVpBYPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r0MJ2/KD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763949008;
	bh=xrwgy+29SeeNQ0b0x/eBH5VPFsDbXGbDnQtmmgMA0e0=;
	h=Date:From:To:Cc:Subject:From;
	b=r0MJ2/KDbKwy97gvArb82HWWDhufKq4eLFc1aXcbSXCXgoIradGnrV1sXXX/kQ56S
	 QsCoHZNJ5bi+CPDAesHjtPGz5WZ+1t9Q4CG4pB00g3924rOZP5noM98MPcsPQ8XbiM
	 jDN3rfy1Zlbhb8eJ2s+ql5mfcOfkBanEyCVgoZEfVPjaQfB8GB4Bus41bv6M19zUQc
	 8t+0vyBPqEFZFY+kYLe4a4HSdWVsFpdUFsChwcsB3WixDxiDKz+K7H/YL/hkiRdsqH
	 RTjATHbwlfW0U6fvTCvK+Zz8ShvlAEo74v6PpHFuQWFoEUXYDbmK72KOcPScakKi8T
	 bS0GS+zaBMtdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF80J0xy1z4wCm;
	Mon, 24 Nov 2025 12:50:06 +1100 (AEDT)
Date: Mon, 24 Nov 2025 12:50:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Networking <netdev@vger.kernel.org>, Bala-Vignesh-Reddy
 <reddybalavignesh9979@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the
 mm-nonmm-unstable tree
Message-ID: <20251124125006.3953f1d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y87jSbv5hknfprRYnzUxBoH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y87jSbv5hknfprRYnzUxBoH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  tools/testing/selftests/drivers/net/gro.c
  tools/testing/selftests/drivers/net/hw/toeplitz.c

between commit:

  7edd42093cb0 ("selftests: complete kselftest include centralization")

from the mm-nonmm-unstable tree and commits:

  89268f7dbca1 ("selftests: net: relocate gro and toeplitz tests to drivers=
/net")
  fdb0267d565a ("selftests: drv-net: add a Python version of the GRO test")
  9cf9aa77a1f6 ("selftests: drv-net: hw: convert the Toeplitz test to Pytho=
n")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/drivers/net/gro.c
index 76aa75469a8c,995b492f5bcb..000000000000
--- a/tools/testing/selftests/drivers/net/gro.c
+++ b/tools/testing/selftests/drivers/net/gro.c
@@@ -57,7 -57,8 +57,8 @@@
  #include <string.h>
  #include <unistd.h>
 =20
 -#include "../../kselftest.h"
 +#include "kselftest.h"
+ #include "../../net/lib/ksft.h"
 =20
  #define DPORT 8000
  #define SPORT 1500
diff --cc tools/testing/selftests/drivers/net/hw/toeplitz.c
index 4b58152d5a49,afc5f910b006..000000000000
--- a/tools/testing/selftests/drivers/net/hw/toeplitz.c
+++ b/tools/testing/selftests/drivers/net/hw/toeplitz.c
@@@ -52,7 -52,8 +52,8 @@@
  #include <sys/types.h>
  #include <unistd.h>
 =20
 -#include "../../../kselftest.h"
 +#include "kselftest.h"
+ #include "../../../net/lib/ksft.h"
 =20
  #define TOEPLITZ_KEY_MIN_LEN	40
  #define TOEPLITZ_KEY_MAX_LEN	60

--Sig_/y87jSbv5hknfprRYnzUxBoH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjuc4ACgkQAVBC80lX
0Gz/rgf+I73HhbpYIqv6sHjqcRRdMOveEW/yAa/G3+BB0ZRrP71dtgKKbVJiOJZN
CCJn+0SkU1Q40bw2C/9TZN6/h3JyIge+zLiqrkt4Yid6/7QS5fe8YxImwBZPKoFZ
gx0iQHfc7uzPyDu/U1frttQRVIV/wzMMvatgTl5bj0O0FdtF0ypAQZAjcq3sbvIw
qddo7OcH0D+rSztkNwoTTCiHWLF2KHG48wcTTrduwkpFDEzOsdVBOAmQAelyhtJH
TtwQjAr1WDhjO5ZLb3Bw5BAQIYXlK8H8b5GcdUZnBDEvuIGPOfk2lEG7GOwz60OX
l8l2KcgP/t6FXb9Jc12AqydbXr4oig==
=j0qQ
-----END PGP SIGNATURE-----

--Sig_/y87jSbv5hknfprRYnzUxBoH--

