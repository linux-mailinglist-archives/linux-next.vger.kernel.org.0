Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959512D574A
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 10:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbgLJJeN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 04:34:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55315 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727190AbgLJJeN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 04:34:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cs7yF6Lpxz9sVs;
        Thu, 10 Dec 2020 20:33:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607592807;
        bh=jjFWywpSc1VbnSW901BW08DNejRDb7vSQANKnNScfsc=;
        h=Date:From:To:Cc:Subject:From;
        b=Qo3ByDMsT3xTyDCAdT1mWJoxC5udR4miOTzkR4o8HDw1diIPwhrbuhj3ozHqAN6DC
         wmd+3mNFncIlsZ8/+RochiSrqNjB6Xh1WcYoNylcso6S6xYgKSoXOhJy2J7yvQCC8D
         bb+yuutYILWTTaHFfLBWLBjm7vvyABRmdnxSfaR4w824o3HNKU7z8RBqBz0E2L2O39
         cyqogeMT/gggbuVPpZ0jzmnDt3kNDNJZI4qi4ufX4GLLiKHdpPbmihBb3iiZu1DTvj
         /HFSpcqBN+WIXVXQVqe8AVJ9P+brkQDoBRUB1eyUfj7/dPSZcz1iaS1sHQyIyA8MCP
         bWTbId/ObopWg==
Date:   Thu, 10 Dec 2020 20:33:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20201210203323.5d53d41d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DVIE.9Szm4v9quGEdns5bS.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DVIE.9Szm4v9quGEdns5bS.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/kasan/quarantine.c: In function 'quarantine_put':
mm/kasan/quarantine.c:198:3: error: 'return' with no value, in function ret=
urning non-void [-Werror=3Dreturn-type]
  198 |   return;
      |   ^~~~~~
mm/kasan/quarantine.c:171:6: note: declared here
  171 | bool quarantine_put(struct kmem_cache *cache, void *object)
      |      ^~~~~~~~~~~~~~
mm/kasan/quarantine.c:200:16: error: 'info' undeclared (first use in this f=
unction)
  200 |  qlist_put(q, &info->quarantine_link, cache->size);
      |                ^~~~
mm/kasan/quarantine.c:200:16: note: each undeclared identifier is reported =
only once for each function it appears in

Caused by commits

  d6e0eb793f88 ("kasan: rename get_alloc/free_info")
  453989cf05d6 ("kasan: sanitize objects when metadata doesn't fit")

interacting with commit

  2ac05f7fcf5b ("kasan: fix object remaining in offline per-cpu quarantine")

from the akmp-current tree.

This goes on and on :-(

I have applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 10 Dec 2020 20:24:01 +1100
Subject: [PATCH] fixup for "kasan: rename get_alloc/free_info"

and "kasan: sanitize objects when metadata doesn't fit"
and "kasan: fix object remaining in offline per-cpu quarantine"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/kasan/quarantine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index c0331656f112..55783125a767 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -195,9 +195,9 @@ bool quarantine_put(struct kmem_cache *cache, void *obj=
ect)
 	q =3D this_cpu_ptr(&cpu_quarantine);
 	if (q->offline) {
 		local_irq_restore(flags);
-		return;
+		return false;
 	}
-	qlist_put(q, &info->quarantine_link, cache->size);
+	qlist_put(q, &meta->quarantine_link, cache->size);
 	if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
 		qlist_move_all(q, &temp);
=20
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/DVIE.9Szm4v9quGEdns5bS.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/R62MACgkQAVBC80lX
0GzIiggAhI+Qm/nJE5xEaVjhtp0rAL7xsXGLv1tCSCot7BJ2VdXcjhQw5zkOPJaZ
0J5VxCoGsMzWodalI6JEjh3jIKRU28CC7FZO/rlrmq4VZuSwA0ig4H7obVFh3uyp
OkQF4kCyPTaCdhAWjPCxcmhdWZKkj1dzfPTIQZlmcTK5eVA3q98pEUtuNOHz/pws
UXoHMaAQ9lZtZmh4YAczcrFzSCesploZDaBnJKxBWxpZwBuX2/nrWjM+yjO1mD3X
cEj9axp4Bi+U/gmmGixMmtYyyClUNx6mWg21C3FSEmdUCJJX3lvUgqpcnh+M1oW5
r7D7847ffCGtP6QgSkvR+sMBb0b+Lg==
=7KiL
-----END PGP SIGNATURE-----

--Sig_/DVIE.9Szm4v9quGEdns5bS.--
