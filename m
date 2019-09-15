Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 722A1B3220
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 23:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfIOVCb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 17:02:31 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38324 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbfIOVCb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 17:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=aOYuSu+DysqaW6OXxGQc9xt8yb25q+4i2GsEgLjhPMI=; b=ZyxjqBwGWVC28mUC0xW/yBaQX
        Iv8Z1xz5It1/J6NkB5fXulwtEsvShqpJsXBExvzOf9b0I1QX3ZNhTM0wWJl/05mmnXJDuNSPPLPQR
        qTlViTmxFUWxigrWn9wb8ZQMcVfTZI+zjFXLRTRf0ovdeBJHUaBq9nbhK1nXR4qtLJVSU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9bf7-0001NN-TA; Sun, 15 Sep 2019 21:02:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 062AD27415FF; Sun, 15 Sep 2019 22:02:24 +0100 (BST)
Date:   Sun, 15 Sep 2019 22:02:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the crypto tree with the s390 tree
Message-ID: <20190915210224.GG4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/s390/crypto/aes_s390.c

between commit:

  9e323d45ba94262 ("s390/crypto: xts-aes-s390 fix extra run-time crypto sel=
f tests finding")

=66rom the s390 tree and commit:

  ce68acbcb6a5d5d ("crypto: s390/xts-aes - invoke fallback for ciphertext s=
tealing")

=66rom the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/crypto/aes_s390.c
index 6d2dbb5089d5c,d4f6fd42a1050..0000000000000
--- a/arch/s390/crypto/aes_s390.c
+++ b/arch/s390/crypto/aes_s390.c
@@@ -586,10 -586,7 +586,10 @@@ static int xts_aes_encrypt(struct blkci
  	struct s390_xts_ctx *xts_ctx =3D crypto_blkcipher_ctx(desc->tfm);
  	struct blkcipher_walk walk;
 =20
 +	if (!nbytes)
 +		return -EINVAL;
 +
- 	if (unlikely(!xts_ctx->fc))
+ 	if (unlikely(!xts_ctx->fc || (nbytes % XTS_BLOCK_SIZE) !=3D 0))
  		return xts_fallback_encrypt(desc, dst, src, nbytes);
 =20
  	blkcipher_walk_init(&walk, dst, src, nbytes);
@@@ -603,10 -600,7 +603,10 @@@ static int xts_aes_decrypt(struct blkci
  	struct s390_xts_ctx *xts_ctx =3D crypto_blkcipher_ctx(desc->tfm);
  	struct blkcipher_walk walk;
 =20
 +	if (!nbytes)
 +		return -EINVAL;
 +
- 	if (unlikely(!xts_ctx->fc))
+ 	if (unlikely(!xts_ctx->fc || (nbytes % XTS_BLOCK_SIZE) !=3D 0))
  		return xts_fallback_decrypt(desc, dst, src, nbytes);
 =20
  	blkcipher_walk_init(&walk, dst, src, nbytes);

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+pt8ACgkQJNaLcl1U
h9Cm2gf/VuusW3RMqQZNbJn5y6hVGj1iUCp1wifHCZstfJ5giC94fwOhMts/0AHO
xVXealRRiGl3xUXndbELze+0q3M5EF33yBQjYOLMjH5DrCTGZZea0qQthWP6jcRg
3Tpmch80FiDRuMhTYQX6esbVD5zPJppAn+lSEHtcCBcTJINpiVrXACFX0e2Ij+BD
H3HUnUQ5Axo3RXdHoEgP1+HyhfAN3MUyCfeGgS5SBOq45gedY4QDwwUYmaTdhWCi
fEjXBlYQqzPnaT0vKtBrFdlaZP0gr2be7oDws18j/JiQZv6zaU5MdZrq0t1oQfox
/TXOvz4Wwbk4MKZwE77Jewqd47QZ2w==
=8zpR
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
