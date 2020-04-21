Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7D1B1E0D
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 07:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDUFMr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 01:12:47 -0400
Received: from ozlabs.org ([203.11.71.1]:54217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725795AbgDUFMr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Apr 2020 01:12:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495sBz2ljkz9sP7;
        Tue, 21 Apr 2020 15:12:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587445964;
        bh=kRYwJ8+v3TDEL7Vf+kKyDQ72TRLTgSM6bWAyzSYbWWM=;
        h=Date:From:To:Cc:Subject:From;
        b=rd86yj9Co/DZxjkRu7cx1Y3kiPL9W0qnry1rD2m6G3SGX/Ujw/Nr999jKv4VS5iqp
         o9F981Ymv2LgHcASgnX6pBTH+LsPC4HY41qSoF/rCmxnllhtKFYrSiamTv+tAasNxx
         tiAEIR7yKNqZ1zAaKMUWdTCGADljAnlQsxWSAtCESwm03X6isBXH/b4/mE+f7W4kwa
         b4ccBTUT1xcRv3sRGllAKYuNb1GBS2FxGaP2h+XNTafkr1GZTtBlTY+wA70cmFJSn9
         xbq9EBsS4vHkESQoJ60Gn64Sw1BfT05+sX5nXcjuyI/DwnLt9bnekTJ2Mi+lAJ3qj4
         32fvfeCSFdTGQ==
Date:   Tue, 21 Apr 2020 15:12:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shukun Tan <tanshukun1@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Zaibo Xu <xuzaibo@huawei.com>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20200421151240.4dfc679a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=Pp9gtCv0MP_l1TJCgowVDE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=Pp9gtCv0MP_l1TJCgowVDE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (powerpc
allyesconfig) failed like this:

WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && (ARM64 || COMPILE_TE=
ST [=3Dy]) && PCI [=3Dy] && PCI_MSI [=3Dy] && (UACCE [=3Dy] || UACCE [=3Dy]=
=3Dn) && ACPI
  Selected by [y]:
  - CRYPTO_DEV_HISI_SEC2 [=3Dy] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && PCI=
 [=3Dy] && PCI_MSI [=3Dy] && (UACCE [=3Dy] || UACCE [=3Dy]=3Dn) && (ARM64 |=
| COMPILE_TEST [=3Dy] && 64BIT [=3Dy])
  - CRYPTO_DEV_HISI_ZIP [=3Dy] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && PCI =
[=3Dy] && PCI_MSI [=3Dy] && (ARM64 || COMPILE_TEST [=3Dy] && 64BIT [=3Dy]) =
&& (!CPU_BIG_ENDIAN [=3Dy] || COMPILE_TEST [=3Dy]) && (UACCE [=3Dy] || UACC=
E [=3Dy]=3Dn)
  - CRYPTO_DEV_HISI_HPRE [=3Dy] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && PCI=
 [=3Dy] && PCI_MSI [=3Dy] && (UACCE [=3Dy] || UACCE [=3Dy]=3Dn) && (ARM64 |=
| COMPILE_TEST [=3Dy] && 64BIT [=3Dy])

drivers/crypto/hisilicon/qm.c: In function 'qm_soft_reset':
drivers/crypto/hisilicon/qm.c:2915:7: error: implicit declaration of functi=
on 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=
=3Dimplicit-function-declaration]
 2915 |   s =3D acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev),
      |       ^~~~~~~~~~~~~~~~~~~~~
      |       acpi_evaluate_object

Caused by commit

  6c6dd5802c2d ("crypto: hisilicon/qm - add controller reset interface")

Unfortunately not fixed by commit

  f88480e300ac ("crypto: hisilicon/qm - fix build failure with ACPI off")

[the moral is "don't select symbols that have dependencies" :-( ]

I have added the following patch for today

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Apr 2020 14:56:49 +1000
Subject: [PATCH] crypto: hisilicon/qm add more ACPI dependencies

due to the selects of CRYPTO_DEV_HISI_QM which now depends on ACPI

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/crypto/hisilicon/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/hisilicon/Kconfig b/drivers/crypto/hisilicon/Kc=
onfig
index 99e962e39f36..9c3b3ca815e6 100644
--- a/drivers/crypto/hisilicon/Kconfig
+++ b/drivers/crypto/hisilicon/Kconfig
@@ -29,6 +29,7 @@ config CRYPTO_DEV_HISI_SEC2
 	depends on PCI && PCI_MSI
 	depends on UACCE || UACCE=3Dn
 	depends on ARM64 || (COMPILE_TEST && 64BIT)
+	depends on ACPI
 	help
 	  Support for HiSilicon SEC Engine of version 2 in crypto subsystem.
 	  It provides AES, SM4, and 3DES algorithms with ECB
@@ -53,6 +54,7 @@ config CRYPTO_DEV_HISI_ZIP
 	depends on ARM64 || (COMPILE_TEST && 64BIT)
 	depends on !CPU_BIG_ENDIAN || COMPILE_TEST
 	depends on UACCE || UACCE=3Dn
+	depends on ACPI
 	select CRYPTO_DEV_HISI_QM
 	help
 	  Support for HiSilicon ZIP Driver
@@ -62,6 +64,7 @@ config CRYPTO_DEV_HISI_HPRE
 	depends on PCI && PCI_MSI
 	depends on UACCE || UACCE=3Dn
 	depends on ARM64 || (COMPILE_TEST && 64BIT)
+	depends on ACPI
 	select CRYPTO_DEV_HISI_QM
 	select CRYPTO_DH
 	select CRYPTO_RSA
--=20
2.25.1

--=20
Cheers,
Stephen Rothwell

--Sig_/=Pp9gtCv0MP_l1TJCgowVDE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6egMgACgkQAVBC80lX
0GwazQf+NqlysT+QiDaCEgZ5CUA0w4YxrqSamBOwyIY3d5uAqZ+2XOslwMzk47r3
RndSM2lYlu5N1ykIz+VcdunWsYJlDg3MIU8lMmcfO87JIZYlqRH0I73nP2Wy6//k
RSwUhy3evMt8GZJ3ZBYWhmVn+CjrFnCzqiUgp6+sm184n3pwHC9i+obRwlB76R0z
CeLXn6GyqfsaU+VRAILooNJg6r8C5TaIWyunN9mI4BMRWGXDS70N7dfi6l6iKUho
k3w7Rl0V6gAFxDYZJ6z9bzbRxN/zLxnw0UwFR7YnnrP8riZOna0GvgccdDXw1qoG
+XRq+yZYbDye3XzCOU3fifNmFzreFQ==
=eCj2
-----END PGP SIGNATURE-----

--Sig_/=Pp9gtCv0MP_l1TJCgowVDE--
