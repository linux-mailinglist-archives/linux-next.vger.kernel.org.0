Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28ACFFBDCB
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 03:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfKNCVk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 21:21:40 -0500
Received: from ozlabs.org ([203.11.71.1]:50351 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbfKNCVk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Nov 2019 21:21:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47D4wt0X4jz9sNT;
        Thu, 14 Nov 2019 13:21:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573698096;
        bh=shChhN5EF9KgXRXrKBtuHFrRtChjGLsebmVlDt06m7Q=;
        h=Date:From:To:Cc:Subject:From;
        b=mVGXWZyInQ8ZghGJNyWcbcUdSEEWLCCQizt7pEjGbYO653gWawqyJ1FAbGvQCkS7L
         JY1YndT+cXSwGCiqHeIVOqCAT8af23iPhs7if4uIFz1YLzqFzFFA37WacNN1JkfZDK
         6+hjsHxa94WVia0ZqOEWQGJyxryGnEkNbAVkwrHmWpjzEmHDrMwL7xJGsaT57ovSf6
         IpddjfzX7Yz1YnlY1c05Pz1xYnbXzRyNHnIuhSktJWxp91HHub7CWV8A7Htrqa0ORV
         5KmZp8jlJIewQca4ME2k3QWka3PZXflLMYsDvKD+EJiP9i0GgoFYxvipwP4xNxYvl3
         2wI5JjmfO7gUQ==
Date:   Thu, 14 Nov 2019 13:21:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: linux-next: manual merge of the devicetree tree with the arm-soc
 tree
Message-ID: <20191114132131.56089c64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BB1LBtqI5ejPny06wVC/iyM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BB1LBtqI5ejPny06wVC/iyM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml

between commit:

  577dd5de0990 ("arm64: dts: juno: add GPU subsystem")

from the arm-soc tree and commit:

  3afd6389f320 ("dt-bindings: gpu: mali-midgard: add samsung exynos 5420 co=
mpatible")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 018f3ae4b43c,c9bdf1074305..000000000000
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@@ -21,11 -29,8 +29,12 @@@ properties
        - items:
            - enum:
               - amlogic,meson-gxm-mali
+              - realtek,rtd1295-mali
            - const: arm,mali-t820
 +      - items:
 +          - enum:
 +             - arm,juno-mali
 +          - const: arm,mali-t624
        - items:
            - enum:
               - rockchip,rk3288-mali
@@@ -34,16 -40,8 +44,7 @@@
            - enum:
               - rockchip,rk3399-mali
            - const: arm,mali-t860
-       - items:
-           - enum:
-              - samsung,exynos5250-mali
-           - const: arm,mali-t604
-       - items:
-           - enum:
-              - samsung,exynos5433-mali
-           - const: arm,mali-t760
 =20
-           # "arm,mali-t628"
 -          # "arm,mali-t624"
            # "arm,mali-t830"
            # "arm,mali-t880"
 =20

--Sig_/BB1LBtqI5ejPny06wVC/iyM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3MuisACgkQAVBC80lX
0GzqRgf/VJZvk856gDSfif6dvyn2qDIRlIUcPqIyFw/t3FyYMGyzMFBvdeY5kgYL
7iLDz7NSrMYfKnjUDL/HxiSAcAKUxuFu0R5hDpwnJqWda7pvWsLS5dY8+e8cIiOG
S0XhpMwZSksWHvIekdZPtVmEDh5DYoH3NWDAVhMehrVs93IV9fe3eqcAHyYSBeZ2
+iLBXn/j0DKW9kmRouMvk7rIAscozbgMXjH6CjZ9WzVCXnYnL134vdQu0tr4XDm+
CCQcy3JILuVhoBxvDhqWTy1njJsKV6+zkFa3mF2rlRbm0ByIID3xS5SnJPi5MRc2
lbja4SfiZ8hsQKel+Ga4OXIlXCAgag==
=w8qt
-----END PGP SIGNATURE-----

--Sig_/BB1LBtqI5ejPny06wVC/iyM--
