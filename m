Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DDB27195B
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 04:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgIUCgY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 22:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgIUCgY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Sep 2020 22:36:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2332EC061755;
        Sun, 20 Sep 2020 19:36:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BvpTx02gyz9sR4;
        Mon, 21 Sep 2020 12:36:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600655781;
        bh=S4MJY8JMup+AWKB8AHwtHY/lJhtUoFXs2nYPCSCNrTs=;
        h=Date:From:To:Cc:Subject:From;
        b=Hx2FBdfHPTBohZ3RsaLbD7YAPUJlmz8/HCYzwY1I13EtWbAoASblHqkOcXyY3mcdg
         mjR72KXTKX84KgpU8svW84DNwoYqd8MOlyvA0ZDN6Eu5b9zhCLUTp2C1AjEUNGuB98
         2TapqWRTQlwUY0pLnkcoB6WiYWr2ggTtfB8Dv588PXM1RwjvTsY84nGx0S467XVlTL
         gyKvUCkseQ7E7t5MDDWuNbwHc2ic18jq91ClqluAloxnSMtJ7/VTzaSwk81KHaf1t8
         GNQwOhEePvFWlPSsaJ4KHX6dFoEKe48BeJMnCQRyWLST6Ux0G3agh7MohlK0gxqK+K
         yB/Xcaf2ORjaw==
Date:   Mon, 21 Sep 2020 12:36:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Message-ID: <20200921123619.2986ea3b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RgGlW3x5VGD1UCBI6V6vQFQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RgGlW3x5VGD1UCBI6V6vQFQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  drivers/crypto/Kconfig

between commit:

  bfe8fe939a04 ("crypto: sa2ul - add Kconfig selects to fix build error")

from Linus' tree and commit:

  61f033ba18c3 ("crypto: sa2ul - Select CRYPTO_AUTHENC")

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

diff --cc drivers/crypto/Kconfig
index 52a9b7cf6576,c2950127def6..000000000000
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@@ -873,9 -873,7 +873,10 @@@ config CRYPTO_DEV_SA2U
  	select CRYPTO_AES
  	select CRYPTO_AES_ARM64
  	select CRYPTO_ALGAPI
+ 	select CRYPTO_AUTHENC
 +	select CRYPTO_SHA1
 +	select CRYPTO_SHA256
 +	select CRYPTO_SHA512
  	select HW_RANDOM
  	select SG_SPLIT
  	help

--Sig_/RgGlW3x5VGD1UCBI6V6vQFQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oEaMACgkQAVBC80lX
0Gxajgf+OvG+VcnVFycirKmyNkLZyzn70CjhdAXdDvONWm4IRS4vd2nz1PbjBrIS
bbP7mFnvtkp/MEVuu0UGTsUHHdZMVVul0sJD1H3bKhI+8QO2oOdyjTJSW1tvzHrY
ZvX79Kw45ODLurFX99xB/1rOs0nvAYJ7IXvbTFhEcwViAblczXM6qp3ileyB7gGf
t2DJ4nidg9SOITBjW+BpvnbBwIIQ72i3ZaxJhhuqaWWM0mDZ60hoyqGern6oKu8v
P8K8NGvpx4Rm+juhBr6BQUucRL12EwQTjRTag6jC1UQqzErG7z+x2ieNgEG2yMwS
xu8wi2hbfR2XYBCuPP8Upt/XeAQiaA==
=r6AE
-----END PGP SIGNATURE-----

--Sig_/RgGlW3x5VGD1UCBI6V6vQFQ--
