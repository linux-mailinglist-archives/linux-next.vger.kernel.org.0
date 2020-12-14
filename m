Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7D62DA45C
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 00:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgLNXrK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 18:47:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45813 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727300AbgLNXrJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 18:47:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvyhf0k3xz9sRK;
        Tue, 15 Dec 2020 10:46:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607989587;
        bh=+zLolRCIT4qpIfZSJNjSg4Xw4U1OY+fGl+wCDLOzkjg=;
        h=Date:From:To:Cc:Subject:From;
        b=cnKfDbOMM3mjDgexqgrr1T84BKlaYj6kaGYaJkGTotX1LnyZyGvv3/2as5aZ7/qNC
         Iv9IL7pJtNm28c/DXH8TfeWvVxmASFpJITza20lNZu8U32BxtBD1GsPF9NI01xDpAe
         y3vMuHAff5Zyn3ArYWSybNgkWQmCcazV7KHvHDfTH9VOpRxJd5r/brUoNGtDlPw5L8
         MIZ4RV/N0Y3mq78q2VjnwEWK/rfV7iXxnNkHSEp1Odphs5cvn364b13NtJyE1hCfRK
         K6uj2aCFB/5bNbZwVCDydR05sUvwJfw+PQ/G4Y1sW0bjHA3xcMaJysoNJxqnccLeUI
         FR+PVB0YOR01g==
Date:   Tue, 15 Dec 2020 10:46:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jeff Layton <jlayton@kernel.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Eric Biggers <ebiggers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ceph tree
Message-ID: <20201215104624.603c75da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZCBAKa_hl0AZPkIEEKSZPi8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZCBAKa_hl0AZPkIEEKSZPi8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ceph tree, today's linux-next build (x86_64
allmodconfig) failed like this:

net/ceph/messenger_v2.c:13:10: fatal error: crypto/sha.h: No such file or d=
irectory
   13 | #include <crypto/sha.h>
      |          ^~~~~~~~~~~~~~

Caused by commit

  cd1a677cad99 ("libceph, ceph: implement msgr2.1 protocol (crc and secure =
modes)")

interacting with commit

  a24d22b225ce ("crypto: sha - split sha.h into sha1.h and sha2.h")

from the crypto tree (and now in Linus' tree).

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 15 Dec 2020 10:40:58 +1100
Subject: [PATCH] fixup for "crypto: sha - split sha.h into sha1.h and sha2.=
h"

conflicting with

"libceph, ceph: implement msgr2.1 protocol (crc and secure modes)"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/ceph/messenger_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ceph/messenger_v2.c b/net/ceph/messenger_v2.c
index 5e38c847317b..c1ebb2aa08b5 100644
--- a/net/ceph/messenger_v2.c
+++ b/net/ceph/messenger_v2.c
@@ -10,7 +10,7 @@
 #include <crypto/aead.h>
 #include <crypto/algapi.h>  /* for crypto_memneq() */
 #include <crypto/hash.h>
-#include <crypto/sha.h>
+#include <crypto/sha2.h>
 #include <linux/bvec.h>
 #include <linux/crc32c.h>
 #include <linux/net.h>
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/ZCBAKa_hl0AZPkIEEKSZPi8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/X+VAACgkQAVBC80lX
0Gz6mgf/XJ06Oo1tsJeiQa8ZiqjyuvOOt6mNgqoe6KyFrgKFDUS83t4TDbMiJlKa
5O9bavpKw0Sv8SdmB2mo0T4OLqtOcjQQSxsGHOw3XO/KkKECIePOVg6rYHSdIC4+
Dl19BKXNm+IbjgyYlnVAAYEbwZr0PVK9TzStMkRRcWgu6VK4rivprihIPTBbJL9W
UWpQRMd3/jRNsj+HQTUq/1DM8DQ40EMNb7GNFoks2Ia4zAYSILa2796FCPHNI98q
paBRqQtA9gfnAT8ZsAIDic5Ytn5L3vc+1yoVPBuOdBCbLjHuNREWqMy04dmfQj4K
bBvkbY+IOK0aKX200DGPXS4P1G6uhQ==
=FYzZ
-----END PGP SIGNATURE-----

--Sig_/ZCBAKa_hl0AZPkIEEKSZPi8--
