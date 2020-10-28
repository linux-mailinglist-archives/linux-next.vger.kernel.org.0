Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B5E29D99F
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732980AbgJ1W6H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:58:07 -0400
Received: from ozlabs.org ([203.11.71.1]:56585 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389712AbgJ1W4k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:56:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM3pr470Gz9sPB;
        Thu, 29 Oct 2020 09:56:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603925798;
        bh=U7zRT4tgTv+o0KJnAOrrNaeHKJdfAIbgnQrSPG9X1JQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Q3baMf2ZiOMF06wTH2gfWFTazBRfijWDGQpM5bPlX+GoCUyymmUbbljxb2N9ZTnIG
         kZgzTOHZa5txc2vRbjV3nt8L0ZimviHF+mZI0Iv6IWq7xbBDhhTsBUjXZbSSzSE4ic
         4vhOz2frhRoWbrz3RAXfg0rSZ2XLs+y3KAm5HD+8MANcW+VhOUNLPlN6Y4QFPOF0DR
         FT93rwWzsc916cgoR2uOByrWbZqJAreDAt5iHnFJBi4S1YeiZK9D8qOOD2toKqTWr6
         aPlUPARIBQv3kBDOfB7GhNVZs6olouH5Zaj+mc9rzg6dLBdusCB4JCtF5f5fi8nr7X
         IPKyDMomf7n0w==
Date:   Thu, 29 Oct 2020 09:56:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the samsung-krzk-fixes tree with the
 arm-soc-fixes tree
Message-ID: <20201029095635.3c3996a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/na9cRuTQKJHtlLNtLtJU.PA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/na9cRuTQKJHtlLNtLtJU.PA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the samsung-krzk-fixes tree got a conflict in:

  MAINTAINERS

between commit:

  421f2597bf42 ("MAINTAINERS: Move Kukjin Kim to credits")

from the arm-soc-fixes tree and commit:

  215f06d7efc2 ("MAINTAINERS: move Kyungmin Park to credits")

from the samsung-krzk-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 9bff94560b42,40b4a582b4cc..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2374,7 -2374,8 +2374,7 @@@ F:	drivers/i2c/busses/i2c-rk3x.
  F:	sound/soc/rockchip/
  N:	rockchip
 =20
- ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
+ ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES
 -M:	Kukjin Kim <kgene@kernel.org>
  M:	Krzysztof Kozlowski <krzk@kernel.org>
  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
  L:	linux-samsung-soc@vger.kernel.org

--Sig_/na9cRuTQKJHtlLNtLtJU.PA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Z9yMACgkQAVBC80lX
0GzYWgf/VfHkAXBwa0wdo2/ometxew1bu3V65UyDqgpkEQUGcSHZfKxdYkNiGezb
iat9HAWPaAykx5GC2ParPFTpzJ9iCcfReKxAl+NRtPNRPxbk9gCmQnpbkWZPbBtQ
RkGonxF5okE6x22fFteYZN3LuFAK+tWXSok3qO8HUq/Ome+I2h2cHVamvy/EGQje
ny6O3qOhWXgWyFQtIPp93snZMrDaxyqDfmb+Nxz6lemcE69NFbDUV+SmU+bWRL6n
MUhwfMR6Y2kSrVHBCFY4RnOs4vZO6pomH7g+p8Gjr/AX5X1LtBrJLYWC2kexgs9P
Kw9W50GGeDSCkgL+jhO9NqCdVrJCZA==
=nNNA
-----END PGP SIGNATURE-----

--Sig_/na9cRuTQKJHtlLNtLtJU.PA--
