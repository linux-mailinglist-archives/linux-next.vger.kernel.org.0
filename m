Return-Path: <linux-next+bounces-313-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 323DC80C092
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 06:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF200280C2D
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 05:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6116B1C680;
	Mon, 11 Dec 2023 05:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PiI14Tvr"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6C0BB;
	Sun, 10 Dec 2023 21:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702271111;
	bh=2bMvFBYXWcfp2ouUWoL02aetKfFSicVSbQG0BnVLvgw=;
	h=Date:From:To:Cc:Subject:From;
	b=PiI14TvrhiVFtc8aqiRfqwnZLdh5fV1fI3RO7F3P00x+K/0Tj0z6e64Y+7dwcCFie
	 NZtkxbHsX+qvtWlagIieu+BPK7HUPTxU7E7G1nWm9pFOmff7pgvvIFtzM7k9tlOpNE
	 pkDwbRqt46b5d/swC30mPfpYkLcfp/3WXPHXExPbuGtRbX7et9Nd96zoq+PV2oasoO
	 EMhQKZyVIEBCmOksHdOgsGeKjbwLiK9j6T4pO9zLjUJEeHiOLWI/M4czNOX3J/H8gU
	 l2Kdmx8mN1XrZ2yg3WoS8iG/h5cEHcnk8BFd8q7k5DtUvZrcL4El0njJAZloWIrMbd
	 /ai27P+uSQJiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpV6t6wJ6z4wdD;
	Mon, 11 Dec 2023 16:05:10 +1100 (AEDT)
Date: Mon, 11 Dec 2023 16:05:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi
 Sankar <quic_sibis@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the devicetree tree
Message-ID: <20231211160510.0aef871b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NifI8pb5z4tTy.c4lsC=IVl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NifI8pb5z4tTy.c4lsC=IVl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/clk/qcom/gcc-x1e80100.c:6786:15: error: variable 'gcc_x1e80100_driv=
er' has initializer but incomplete type
 6786 | static struct platform_driver gcc_x1e80100_driver =3D {
      |               ^~~~~~~~~~~~~~~
drivers/clk/qcom/gcc-x1e80100.c:6787:10: error: 'struct platform_driver' ha=
s no member named 'probe'
 6787 |         .probe =3D gcc_x1e80100_probe,
      |          ^~~~~
drivers/clk/qcom/gcc-x1e80100.c:6787:18: warning: excess elements in struct=
 initializer
 6787 |         .probe =3D gcc_x1e80100_probe,
      |                  ^~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gcc-x1e80100.c:6787:18: note: (near initialization for 'gc=
c_x1e80100_driver')
drivers/clk/qcom/gcc-x1e80100.c:6788:10: error: 'struct platform_driver' ha=
s no member named 'driver'
 6788 |         .driver =3D {
      |          ^~~~~~
drivers/clk/qcom/gcc-x1e80100.c:6788:19: error: extra brace group at end of=
 initializer
 6788 |         .driver =3D {
      |                   ^
drivers/clk/qcom/gcc-x1e80100.c:6788:19: note: (near initialization for 'gc=
c_x1e80100_driver')
drivers/clk/qcom/gcc-x1e80100.c:6788:19: warning: excess elements in struct=
 initializer
drivers/clk/qcom/gcc-x1e80100.c:6788:19: note: (near initialization for 'gc=
c_x1e80100_driver')
drivers/clk/qcom/gcc-x1e80100.c: In function 'gcc_x1e80100_init':
drivers/clk/qcom/gcc-x1e80100.c:6796:16: error: implicit declaration of fun=
ction 'platform_driver_register' [-Werror=3Dimplicit-function-declaration]
 6796 |         return platform_driver_register(&gcc_x1e80100_driver);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gcc-x1e80100.c: In function 'gcc_x1e80100_exit':
drivers/clk/qcom/gcc-x1e80100.c:6802:9: error: implicit declaration of func=
tion 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werr=
or=3Dimplicit-function-declaration]
 6802 |         platform_driver_unregister(&gcc_x1e80100_driver);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |         driver_unregister
drivers/clk/qcom/gcc-x1e80100.c: At top level:
drivers/clk/qcom/gcc-x1e80100.c:6786:31: error: storage size of 'gcc_x1e801=
00_driver' isn't known
 6786 | static struct platform_driver gcc_x1e80100_driver =3D {
      |                               ^~~~~~~~~~~~~~~~~~~

Caused by commit

  0d18bcdebb2f ("of: Stop circularly including of_device.h and of_platform.=
h")

interacting with commit

  161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1=
E80100")

from the qcom tree.

I have applied the following merge resolution patch.  This patch could
be applied to the gcom tree.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Dec 2023 15:47:55 +1100
Subject: [PATCH] fix up for "of: Stop circularly including of_device.h and =
of_platform.h"

interacting with
"clk: qcom: Add Global Clock controller (GCC) driver for X1E80100"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clk/qcom/gcc-x1e80100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e8010=
0.c
index 74db7fef237b..d7182d6e9783 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -4,8 +4,9 @@
  */
=20
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
=20
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
--=20
2.40.1

--=20
Cheers,
Stephen Rothwell

--Sig_/NifI8pb5z4tTy.c4lsC=IVl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2mIYACgkQAVBC80lX
0Gx6rQf/avsCDiA0e7a4rvf20UsXkd20M9uiXwzK7ib09gzvhYxmpE5iZZaZHp6T
tXP52ZYR5mBiDwp6MAMT6doQ+J2x4JM5JJyco+mOgT1vpv2lc92e/0cqkntyYDni
H21pt7JXXJIAzF6VigItAMpcr60zZX+/oy7vdcADlhdp/oQiJo8L7U19+a9kAsvF
TrXfh0hGyGYO2VUTjAX07flH2poRg1NiKbH3QF1phO3VNWa7fEVtsGLZ5FhFqnrS
r4TIN9eNo66iUI3rD2yYxIezfJlFfcaotND3MNi37fXS9b7jgJ+8/LEipJHCBM4Y
f63gMBsf2ifAZw3SOkSlJHNxwzFlAQ==
=CiCe
-----END PGP SIGNATURE-----

--Sig_/NifI8pb5z4tTy.c4lsC=IVl--

