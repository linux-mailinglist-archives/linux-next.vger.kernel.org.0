Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C001B3138
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 19:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfIORn7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 13:43:59 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43394 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIORn7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 13:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8GlbM0Gk56jQSQ6J7WUvwVe9z+NrK2oBzeQQBTaeJ3w=; b=hn8txgJNqujrZw8x6TUDgOO/G
        bjqYEgB0bySzdXeyKyecfQZIphuxYpEmWb2EJKx/6z1fW4EoNbMtXA3pvMrywLWtA7TqEhpg2AgdE
        KF63FI9P7KoIK4NL793jp7rnkoLZn8Ym30m4huYtZTkwCKR5CjHYR1RUQfUy9p7T/nHNs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9YZ1-0000mg-WB; Sun, 15 Sep 2019 17:43:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 0AC0E274154D; Sun, 15 Sep 2019 18:43:54 +0100 (BST)
Date:   Sun, 15 Sep 2019 18:43:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Joerg Schmidbauer <jschmidb@de.ibm.com>,
        Ingo Franzki <ifranzki@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the s390 tree with the s390-fixes tree
Message-ID: <20190915174354.GB4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/configs/debug_defconfig

between commit:

  3361f3193c747e8b ("s390: update configs")

=66rom the s390-fixes tree and commit:

  3c2eb6b76cabb7d9 ("s390/crypto: Support for SHA3 via CPACF (MSA6)")

=66rom the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/configs/debug_defconfig
index 74e78ec5beb68,a08e3dcd3e9db..0000000000000
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@@ -638,99 -580,6 +638,101 @@@ CONFIG_NLS_ISO8859_1=3D
  CONFIG_NLS_ISO8859_15=3Dm
  CONFIG_NLS_UTF8=3Dm
  CONFIG_DLM=3Dm
 +CONFIG_UNICODE=3Dy
 +CONFIG_PERSISTENT_KEYRINGS=3Dy
 +CONFIG_BIG_KEYS=3Dy
 +CONFIG_ENCRYPTED_KEYS=3Dm
 +CONFIG_SECURITY=3Dy
 +CONFIG_SECURITY_NETWORK=3Dy
 +CONFIG_FORTIFY_SOURCE=3Dy
 +CONFIG_SECURITY_SELINUX=3Dy
 +CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
 +CONFIG_SECURITY_SELINUX_DISABLE=3Dy
 +CONFIG_INTEGRITY_SIGNATURE=3Dy
 +CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
 +CONFIG_IMA=3Dy
 +CONFIG_IMA_DEFAULT_HASH_SHA256=3Dy
 +CONFIG_IMA_WRITE_POLICY=3Dy
 +CONFIG_IMA_APPRAISE=3Dy
 +CONFIG_CRYPTO_USER=3Dm
 +# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
 +CONFIG_CRYPTO_PCRYPT=3Dm
 +CONFIG_CRYPTO_CRYPTD=3Dm
 +CONFIG_CRYPTO_TEST=3Dm
 +CONFIG_CRYPTO_DH=3Dm
 +CONFIG_CRYPTO_ECDH=3Dm
 +CONFIG_CRYPTO_ECRDSA=3Dm
 +CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
 +CONFIG_CRYPTO_AEGIS128=3Dm
 +CONFIG_CRYPTO_AEGIS128L=3Dm
 +CONFIG_CRYPTO_AEGIS256=3Dm
 +CONFIG_CRYPTO_MORUS640=3Dm
 +CONFIG_CRYPTO_MORUS1280=3Dm
 +CONFIG_CRYPTO_CFB=3Dm
 +CONFIG_CRYPTO_LRW=3Dm
 +CONFIG_CRYPTO_PCBC=3Dm
 +CONFIG_CRYPTO_KEYWRAP=3Dm
 +CONFIG_CRYPTO_ADIANTUM=3Dm
 +CONFIG_CRYPTO_XCBC=3Dm
 +CONFIG_CRYPTO_VMAC=3Dm
 +CONFIG_CRYPTO_CRC32=3Dm
 +CONFIG_CRYPTO_XXHASH=3Dm
 +CONFIG_CRYPTO_MICHAEL_MIC=3Dm
 +CONFIG_CRYPTO_RMD128=3Dm
 +CONFIG_CRYPTO_RMD160=3Dm
 +CONFIG_CRYPTO_RMD256=3Dm
 +CONFIG_CRYPTO_RMD320=3Dm
 +CONFIG_CRYPTO_SHA3=3Dm
 +CONFIG_CRYPTO_SM3=3Dm
 +CONFIG_CRYPTO_TGR192=3Dm
 +CONFIG_CRYPTO_WP512=3Dm
 +CONFIG_CRYPTO_AES_TI=3Dm
 +CONFIG_CRYPTO_ANUBIS=3Dm
 +CONFIG_CRYPTO_ARC4=3Dm
 +CONFIG_CRYPTO_BLOWFISH=3Dm
 +CONFIG_CRYPTO_CAMELLIA=3Dm
 +CONFIG_CRYPTO_CAST5=3Dm
 +CONFIG_CRYPTO_CAST6=3Dm
 +CONFIG_CRYPTO_FCRYPT=3Dm
 +CONFIG_CRYPTO_KHAZAD=3Dm
 +CONFIG_CRYPTO_SALSA20=3Dm
 +CONFIG_CRYPTO_SEED=3Dm
 +CONFIG_CRYPTO_SERPENT=3Dm
 +CONFIG_CRYPTO_SM4=3Dm
 +CONFIG_CRYPTO_TEA=3Dm
 +CONFIG_CRYPTO_TWOFISH=3Dm
 +CONFIG_CRYPTO_842=3Dm
 +CONFIG_CRYPTO_LZ4=3Dm
 +CONFIG_CRYPTO_LZ4HC=3Dm
 +CONFIG_CRYPTO_ZSTD=3Dm
 +CONFIG_CRYPTO_ANSI_CPRNG=3Dm
 +CONFIG_CRYPTO_USER_API_HASH=3Dm
 +CONFIG_CRYPTO_USER_API_SKCIPHER=3Dm
 +CONFIG_CRYPTO_USER_API_RNG=3Dm
 +CONFIG_CRYPTO_USER_API_AEAD=3Dm
 +CONFIG_CRYPTO_STATS=3Dy
 +CONFIG_ZCRYPT=3Dm
 +CONFIG_PKEY=3Dm
 +CONFIG_CRYPTO_PAES_S390=3Dm
 +CONFIG_CRYPTO_SHA1_S390=3Dm
 +CONFIG_CRYPTO_SHA256_S390=3Dm
 +CONFIG_CRYPTO_SHA512_S390=3Dm
++CONFIG_CRYPTO_SHA3_256_S390=3Dm
++CONFIG_CRYPTO_SHA3_512_S390=3Dm
 +CONFIG_CRYPTO_DES_S390=3Dm
 +CONFIG_CRYPTO_AES_S390=3Dm
 +CONFIG_CRYPTO_GHASH_S390=3Dm
 +CONFIG_CRYPTO_CRC32_S390=3Dy
 +CONFIG_CORDIC=3Dm
 +CONFIG_CRC32_SELFTEST=3Dy
 +CONFIG_CRC4=3Dm
 +CONFIG_CRC7=3Dm
 +CONFIG_CRC8=3Dm
 +CONFIG_RANDOM32_SELFTEST=3Dy
 +CONFIG_DMA_CMA=3Dy
 +CONFIG_CMA_SIZE_MBYTES=3D0
 +CONFIG_DMA_API_DEBUG=3Dy
 +CONFIG_STRING_SELFTEST=3Dy
  CONFIG_PRINTK_TIME=3Dy
  CONFIG_DYNAMIC_DEBUG=3Dy
  CONFIG_DEBUG_INFO=3Dy


--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+eFoACgkQJNaLcl1U
h9BG5Qf+Ilf94j76DDrh6oITbngx0+eU5Olh5IClqwEw0Lk5LpWZ/vPiE3EGG9Mg
il35/uqoT2NfN5/cYsGCLCLkCKczWYcy4oWozOTo/MtwXEl2mvMmRhJBZw7Tqs/U
IF8eIesaMIFYfDQO2QwN5Lf/4ObHyAZP6A43FS88JnCj7fVHJzGW2u3sXSAFF0Vh
VmW7DVRwo8EFzfDUo5GmfmPv0Tk3MB27L2HUvHF5mytkIzpwnLGY31zNRRAAP6WF
gw0oeBrbbt+IrYoCqQvCQ7LfuLG533wFyB8mGZk6ERSA8vVgoo1VJYVc81MEVsEl
tJ9TkzfZI0X5qLz9EF/oNWbEkXQHDA==
=oHnu
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
