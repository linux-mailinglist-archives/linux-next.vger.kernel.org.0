Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBF3301EEA
	for <lists+linux-next@lfdr.de>; Sun, 24 Jan 2021 22:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbhAXV3f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 16:29:35 -0500
Received: from ozlabs.org ([203.11.71.1]:52751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbhAXV3f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Jan 2021 16:29:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DP5hs08WBz9sRR;
        Mon, 25 Jan 2021 08:28:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611523732;
        bh=XYlX9VRt2Pc+n5aeFtuJiMo2Ke4l25R8f+CfEvWGFAk=;
        h=Date:From:To:Cc:Subject:From;
        b=lOlXRjPX3uUIAFNG2G4DREWuJW0+HCKJ13L2CldiOc01yszX7CDUCf4pFgT2ebHjD
         aeQgaDNll2oE8cxJTDtUDrn/8IMUzPKvDVhcl/UPKryEK6//VX4rJI4CtpanEzBWRw
         cJSwaBFAlC67Eb5/kOha06YwmNSisJYVl13Xt7diQnt1iVArYRDNYKnh9Yww/GomMa
         czywkw3x0022IKGMq6migmnyZYpNigeacXR8PkNa/+1j/pAvBDpqRTyHy9mNTiv9E7
         oHbtsJOLMZyaYhpP98oKmd/aPo/pcjgAzbhi65ZZ1xbCUQiR9EWD5t49OxN9GZ0e4B
         imOgB5BwNFf2w==
Date:   Mon, 25 Jan 2021 08:28:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: linux-next: manual merge of the reset tree with the arm-soc tree
Message-ID: <20210125082837.49db69eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+T28/B4TUzFsbp_Ub2GFcq7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+T28/B4TUzFsbp_Ub2GFcq7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the reset tree got a conflict in:

  drivers/reset/Kconfig

between commit:

  89d4f98ae90d ("ARM: remove zte zx platform")

from the arm-soc tree and commit:

  def26913b66f ("reset: simple: add BCM4908 MISC PCIe reset controller supp=
ort")

from the reset tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/reset/Kconfig
index 8dd99ca2192c,752bef7e564f..000000000000
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@@ -173,7 -173,7 +173,7 @@@ config RESET_SCM
 =20
  config RESET_SIMPLE
  	bool "Simple Reset Controller Driver" if COMPILE_TEST
- 	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARC
 -	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || AR=
CH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC
++	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || AR=
CH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARC
  	help
  	  This enables a simple reset controller driver for reset lines that
  	  that can be asserted and deasserted by toggling bits in a contiguous,

--Sig_/+T28/B4TUzFsbp_Ub2GFcq7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAN5oUACgkQAVBC80lX
0GyUXQf/SaJ/ihxADUgUkiFMrrt4969mphIBn+cSuv9yDRFscl+appM6wG2N02nR
4VQzlQUF5IlVMZp9g/svf6YXcgtwXAw8/RRwuuXtoQULG8iGGg6w2tCXyA5VYDvJ
VIE7ZuAp/HCr9FG91YdOiaeQ1IhgRwGrHxbmESSy7OwlXCTcdG1GN9Lkt5pnVw29
PruwivM+bpFkiH2bYrRAoey6MlLbv4sgYo7Uvocu9Dv9+VFPH4IU9NTlRmfgOqfm
8QzFoCmfNGPfkSnis7GWTHihDlXoVImb1U5k4j2kcYllZzbDp26tO3B4mlSCgxNt
M7HAJHDrq17V3wqarF5jM3l7jto0/g==
=22P8
-----END PGP SIGNATURE-----

--Sig_/+T28/B4TUzFsbp_Ub2GFcq7--
