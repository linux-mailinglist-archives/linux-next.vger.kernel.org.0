Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBF6EF368
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 03:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387473AbfKECXn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 21:23:43 -0500
Received: from ozlabs.org ([203.11.71.1]:59633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730245AbfKECXm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 21:23:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476YPR5LH8z9sPF;
        Tue,  5 Nov 2019 13:23:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572920619;
        bh=l5dCxP2eylLUgWMrShKOATMKHD7bsW1qpxHjVZCdiy8=;
        h=Date:From:To:Cc:Subject:From;
        b=PCdW9n+ydCMcu6avVXOB7n08zf8Y3nQFeUO95M4nuFlU1qNu85RImUEplQb4zdRyX
         uXOIdaAvr9sVWO4hmD4Nfcvhnapnf9LU5a7Ehl4gt7+SataZOTDIEAyb75Z68E58d4
         yI+XiAakv2EM38xsayiyNqk5wEYTA3Ep0mMteugQE4VwMBtsrX+oogvK3JWa03erJx
         f0aJGJTP2muIvehrohpVj8bFtWsL/iJfqkPduHlbhng5F+txusW0TyM6X7fcVUi876
         nTfx4lTUkihs4Iw/rjewFmQ0JhGeuXqCxd5mcIHmENukoofm4gzPvmw61o8fcz0M66
         itsAYTancgMGw==
Date:   Tue, 5 Nov 2019 13:23:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Eric Biggers <ebiggers@google.com>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Message-ID: <20191105132337.2d65cf0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eo3vTQNDaDmtEpv/KxN8=Qo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eo3vTQNDaDmtEpv/KxN8=Qo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm/crypto/Kconfig

between commit:

  f703964fc668 ("crypto: arm/aes-ce - add dependency on AES library")

from Linus' tree and commits:

  b4d0c0aad57a ("crypto: arm - use Kconfig based compiler checks for crypto=
 opcodes")
  b95bba5d0114 ("crypto: skcipher - rename the crypto_blkcipher module and =
kconfig option")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/crypto/Kconfig
index 043b0b18bf7e,c618c379449f..000000000000
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@@ -96,9 -96,8 +96,9 @@@ config CRYPTO_AES_ARM_B
 =20
  config CRYPTO_AES_ARM_CE
  	tristate "Accelerated AES using ARMv8 Crypto Extensions"
- 	depends on KERNEL_MODE_NEON
- 	select CRYPTO_BLKCIPHER
+ 	depends on KERNEL_MODE_NEON && (CC_IS_CLANG || GCC_VERSION >=3D 40800)
+ 	select CRYPTO_SKCIPHER
 +	select CRYPTO_LIB_AES
  	select CRYPTO_SIMD
  	help
  	  Use an implementation of AES in CBC, CTR and XTS modes that uses

--Sig_/eo3vTQNDaDmtEpv/KxN8=Qo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3A3SoACgkQAVBC80lX
0GyepwgAkUyGhI24dDcq5CqWdl3Y9u7P+EzCRPulkBQMul4EKZ2Nx6vZcIHBq24D
pi5L6Ciq4eAfiUU5gnO3AZhe+RGEiiEJ4QKBN5OQ5zewRoR+7vxF9S6zwgNC/MxM
fo5CBjd/85tOzoVQAib6r4/qGgPQq7sgK0lFNdBU9ypUWSxiccm9lGIqwaTBfioY
e+P7v8imZk1UKu9Jqmr/4mpmgkpDaDJqKh+/ND2OqJAXjI9YUhw1ry8UcixKqpnH
yWyauNUrNHS5twEp+3r9ijvsmr3mhdRHgELRzqTpE8SWI3oEt8AJoPT7sPIxIC14
AVuG/Mc7nH4Hl8HcGNs6leSBCNj6MA==
=U0M+
-----END PGP SIGNATURE-----

--Sig_/eo3vTQNDaDmtEpv/KxN8=Qo--
