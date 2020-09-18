Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F5726F558
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 07:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIRFVd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 01:21:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33059 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726222AbgIRFVd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 01:21:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt2Hs5rBWz9sSf;
        Fri, 18 Sep 2020 15:21:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600406490;
        bh=YuNkjMY+PPETCNlgaTO4CnNygY4KP4AnSDSyMlGt4mo=;
        h=Date:From:To:Cc:Subject:From;
        b=tPa0ZYJRuUySqDwpzgNn32SSZVQb/492jhKstS3//zh8AfQjFXVuyapf+Xjd8rNGL
         IJNLovwSl6dcLgVq6SVXLNvfCODbCdTso+NllNoshfAjOnoMReNI/hNgxELrHRu5ct
         B6HKZ0asNIoZUVvsJ3qo9SVM2S5/T8PajodPy19VP1nYGIEIcmtbOuvUf82lTdEhP+
         axnz9d6OYjeviS1npj6l3rIWSsdkpKR4jFl7/KNlBGr7pSK0R4oVNwmM8E05rUtKSM
         TqrHRmAgqBKO+dyj0mfXd5UP0gdCjZw3Ri87wAOVar7/GQc6DB9rx5rFpalHK5b0xd
         PIbE/vFWnXNOQ==
Date:   Fri, 18 Sep 2020 15:21:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the staging tree with the crypto tree
Message-ID: <20200918152127.4414b524@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8uQtOioeX7eIItwlkcKMxkL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8uQtOioeX7eIItwlkcKMxkL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/rtl8192e/Kconfig

between commit:

  054694a46d64 ("staging/rtl8192e: switch to RC4 library interface")

from the crypto tree and commits:

  243d040a6e4a ("staging: rtl8192e: fix kconfig dependency warning for RTLL=
IB_CRYPTO_TKIP")
  02c4260713d6 ("staging: rtl8192e: fix kconfig dependency warning for RTLL=
IB_CRYPTO_WEP")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/rtl8192e/Kconfig
index 4c440bdaaf6e,31e076cc6f16..000000000000
--- a/drivers/staging/rtl8192e/Kconfig
+++ b/drivers/staging/rtl8192e/Kconfig
@@@ -25,7 -26,8 +26,8 @@@ config RTLLIB_CRYPTO_CCM
  config RTLLIB_CRYPTO_TKIP
  	tristate "Support for rtllib TKIP crypto"
  	depends on RTLLIB
+ 	select CRYPTO
 -	select CRYPTO_ARC4
 +	select CRYPTO_LIB_ARC4
  	select CRYPTO_MICHAEL_MIC
  	default y
  	help
@@@ -35,7 -37,8 +37,8 @@@
 =20
  config RTLLIB_CRYPTO_WEP
  	tristate "Support for rtllib WEP crypto"
+ 	select CRYPTO
 -	select CRYPTO_ARC4
 +	select CRYPTO_LIB_ARC4
  	depends on RTLLIB
  	default y
  	help

--Sig_/8uQtOioeX7eIItwlkcKMxkL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9kQ9cACgkQAVBC80lX
0Gxr2Qf/bawMPref1jwdFOCFNVKlpscttUQrex19Y8Q1aoBWtAvM1Yrds9nnnwG4
edvKq+bBUoCtMvQ6ZV6pSrxRvjtfHFbsGaef7XqdEwvBhfvuoWtrhCeBNMAJwplV
4lZLxQLarQrgZgcpDhpAbU3FIy15EK/GFfiJAkvag4Ma5YJufrSJzEHTyvr/YJY5
NASEKDAI+PnLI5z4WdyObT6H0Ew6Zj4k3NECb5Hqn4QaAkis6cUT5uFyR7+/vzMu
jrhvHWmuQki9T4BHe5Bs+azfo+fjGzfDxOAKBkkrrcCOis5F0h3zVhAZadIhM9V3
XWVi+WtqRYz16+zAtu1JV6ZDqfy2Hw==
=M0Gs
-----END PGP SIGNATURE-----

--Sig_/8uQtOioeX7eIItwlkcKMxkL--
