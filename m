Return-Path: <linux-next+bounces-4028-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF0898B2CF
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C89A1C2252E
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 03:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0FE1A4E6B;
	Tue,  1 Oct 2024 03:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JMijx/5w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889A1A3BDA;
	Tue,  1 Oct 2024 03:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754269; cv=none; b=lBc3nCjKVJgIkAiaH9ILym1tVkiFhum1Wyz0QxdKe69Of/aLDNBmI7DxiBbyR2F3Pl3Okk/9iIZNJ2fqDAiw6BjWXNDsGRJ62qwig8iTzC2D4XsVCLnBSA7uiivC1DQF6FCPyAlPPfBHPkueTcKH6o2beWQjN8lpD8wKL+qkQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754269; c=relaxed/simple;
	bh=+1eY5IM1p5jLz7GeMos4QLCDwZ4qbVk5D42JF2qyPFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DjGyTayN42+se/4sBl+TMdC4mEoIzEA2UkwbEhA/N8I+3f+p2iRmICgjGb02tBU8Jx2rTN7rpyE1NJS1Cbi1TRvGhM8YgHbGHO5viKouvLaN/k0EVs85NAdgSZeESDMOSHBFMqRRaea/AzbYLy2TM3FaFMTdgxQyHYArFG/AHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JMijx/5w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727754264;
	bh=o85ZSs1JxUk96tNL/VHXsBO5EZCr2Gnnq3HJjjUVRdA=;
	h=Date:From:To:Cc:Subject:From;
	b=JMijx/5wxRwSrT421Tw5tNeulrD3za+UJiHd9CtfiFVgNUjLs8+zczj+i100/8VNJ
	 QI6/fcFQnxK7ASJSOu72wofh3+CbWmeCXo/h6hdcZ3SEmgp4IeAJ2O0K9n1/3vFuyD
	 DIdI6ssCSsvyy2cLJSBIy+kdyJSyGY/BZDE+Azor+JQdQhhgUmrBS8zs1dmKlPEQhe
	 wYrzAGQHSHxmd9aydioJ89FJHn2+WU8NV/7CVARGzIPiwReScbxybAjXDUksky7gsU
	 y8fpAaTwj7Tp3gy0I6yRpInafu0SckPUzQ8eEawQL+nJDTG+OWcn+a8eNLfPsCJvc0
	 14EOF8tin1wXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHkMW4nnmz4wbv;
	Tue,  1 Oct 2024 13:44:23 +1000 (AEST)
Date: Tue, 1 Oct 2024 13:44:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the random tree
Message-ID: <20241001134423.62b12a80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yF4rS.XBUsBuJe2NcK6fZ.T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yF4rS.XBUsBuJe2NcK6fZ.T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the random tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/random.=
h>")

interacting with commit

  5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")

from the drm-xe tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Oct 2024 13:33:48 +1000
Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in <l=
inux/random.h>"

interacting with commit

  5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")

from the drm-xe tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe=
_bo.c
index 7d3fd720478b..3a14b70f12b8 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -7,7 +7,7 @@
 #include <kunit/visibility.h>
=20
 #include <linux/iosys-map.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/swap.h>
=20
 #include <uapi/linux/sysinfo.h>
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/yF4rS.XBUsBuJe2NcK6fZ.T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7cBcACgkQAVBC80lX
0GwZkQf9GrlJRrEbN5cxj6KZdJuGDY2LO/AIDgRnXHOEvLKWbquTn1whaoc1GnHy
zRPwOjleLZfjmRndaAOXoxS0Zr+GqsOR1pyd8q5ARfUH9bUUq2thMepLvFppUhLc
dIiklmvyQfappQt0nEW5w6CQl0Yn/qoiK8yztg+c64Vb9rkImTfmjbxB9ZP6bPiS
LM+guIuYFKM4jiHmwLS3lWJrm7h5oKtB76pl/0ZFW9A48pNCS3d+ugf7PF/J0uJN
mxj1ksCBAXraxHmd8R+KYwOzaDNrrX0Ymg26p6kLjwtPxKlCVpeRIMwkYyOgSBlP
lj7N7FcWWc614kazFcEosbCU1Bkc9w==
=8+0c
-----END PGP SIGNATURE-----

--Sig_/yF4rS.XBUsBuJe2NcK6fZ.T--

