Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891E82D6F73
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 05:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392848AbgLKEv0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 23:51:26 -0500
Received: from ozlabs.org ([203.11.71.1]:60335 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395411AbgLKEvQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 23:51:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CsddP3t59z9sW1;
        Fri, 11 Dec 2020 15:50:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607662233;
        bh=Ix9qdW5cDlA5jKPFGWv72uKVYN92bQkim+Hu2xtcDkY=;
        h=Date:From:To:Cc:Subject:From;
        b=jpt9VOy2jBg6b/ny2sn/7h19Mgs2oFKdFfMJruTNlKFNxWe1tVUrH2GogO84rbT6R
         BbQib02H8WUcJI1UByNfLtBq6J+YGWsN0HWuRjOuurfi6YgNeC9hGQjBLMRkI4zjCJ
         S+EvhbMvx1saqaekUEn618+bNXu2USGwgPuccetXQhP16ZxUT9BDVL9JKCgtQA7JEs
         oROdCfAHjZ3RQxiDpkTeXKaHlIyjPnCiwtHeghuS78MVJkwmQLsVBTHSP1VwXOCDaN
         yZrykH+c+8saLEMMWW77lwWpLkZFZG1UR+xZhefcnPk+iMwx0ZlYiD5j/nJugYMRK8
         lbmH5WiLZ53eg==
Date:   Fri, 11 Dec 2020 15:50:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20201211155031.0e35abf2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=lCDg9F9NQ0CoSPOAa_E5sD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=lCDg9F9NQ0CoSPOAa_E5sD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/cred.h:13,
                 from security/integrity/ima/ima_mok.c:12:
security/integrity/ima/ima_mok.c: In function 'ima_mok_init':
include/linux/key.h:292:29: warning: passing argument 7 of 'keyring_alloc' =
makes pointer from integer without a cast [-Wint-conversion]
  292 | #define KEY_ALLOC_SET_KEEP  0x0020 /* Set the KEEP flag on the key/=
keyring */
      |                             ^~~~~~
      |                             |
      |                             int
security/integrity/ima/ima_mok.c:42:5: note: in expansion of macro 'KEY_ALL=
OC_SET_KEEP'
   42 |     KEY_ALLOC_SET_KEEP,
      |     ^~~~~~~~~~~~~~~~~~
include/linux/key.h:410:30: note: expected 'struct key_restriction *' but a=
rgument is of type 'int'
  410 |      struct key_restriction *restrict_link,
      |      ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
security/integrity/ima/ima_mok.c:43:5: error: passing argument 8 of 'keyrin=
g_alloc' from incompatible pointer type [-Werror=3Dincompatible-pointer-typ=
es]
   43 |     restriction, NULL);
      |     ^~~~~~~~~~~
      |     |
      |     struct key_restriction *
In file included from include/linux/cred.h:13,
                 from security/integrity/ima/ima_mok.c:12:
include/linux/key.h:411:18: note: expected 'struct key *' but argument is o=
f type 'struct key_restriction *'
  411 |      struct key *dest);
      |      ~~~~~~~~~~~~^~~~
security/integrity/ima/ima_mok.c:36:26: error: too many arguments to functi=
on 'keyring_alloc'
   36 |  ima_blacklist_keyring =3D keyring_alloc(".ima_blacklist",
      |                          ^~~~~~~~~~~~~
In file included from include/linux/cred.h:13,
                 from security/integrity/ima/ima_mok.c:12:
include/linux/key.h:406:20: note: declared here
  406 | extern struct key *keyring_alloc(const char *description, kuid_t ui=
d, kgid_t gid,
      |                    ^~~~~~~~~~~~~

Caused by commit

  33c36b2053de ("certs: Fix blacklist flag type confusion")

I have applied the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Dec 2020 15:46:09 +1100
Subject: [PATCH] fixup for "certs: Fix blacklist flag type confusion"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 security/integrity/ima/ima_mok.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/integrity/ima/ima_mok.c b/security/integrity/ima/ima_=
mok.c
index ce8871d96f12..5594dd38ab04 100644
--- a/security/integrity/ima/ima_mok.c
+++ b/security/integrity/ima/ima_mok.c
@@ -38,8 +38,7 @@ __init int ima_mok_init(void)
 				(KEY_POS_ALL & ~KEY_POS_SETATTR) |
 				KEY_USR_VIEW | KEY_USR_READ |
 				KEY_USR_WRITE | KEY_USR_SEARCH,
-				KEY_ALLOC_NOT_IN_QUOTA,
-				KEY_ALLOC_SET_KEEP,
+				KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_SET_KEEP,
 				restriction, NULL);
=20
 	if (IS_ERR(ima_blacklist_keyring))
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/=lCDg9F9NQ0CoSPOAa_E5sD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/S+pcACgkQAVBC80lX
0GzMMAf/WqirhT/tIKAgVbQwk65AddQqe6+yIuKSsdp8B169ZDoM80TjwuBL5j7c
vUa4QJcs5qowXMMTqdIlVeuZh/UUhstyYrxhiEX9gu+uMArk7jzjHyyzzlGUY7uh
vU2bIe/fT0XAT8s4mQtbsrSuWbpKCPVS+LqFeNaRhmhDcl+KpQ+JSBi8m9kpfI5P
rWko1xyHtKT5daFx/GV9HBwbbWzlZOMAkrVS+hErQJpUG6ln7Nys6+OFDIRCaWQh
uOdg/w5ZL2k+fHDOMwaqlUdQP4vHUUB4jTkyFC+vJ9aImrsUwltbJqXr1i6MyMcd
C0GdOo1AOFp/zBbLnfTYRKZsHt44Tg==
=vOIr
-----END PGP SIGNATURE-----

--Sig_/=lCDg9F9NQ0CoSPOAa_E5sD--
