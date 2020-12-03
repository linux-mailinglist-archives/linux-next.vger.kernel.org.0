Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098072CD1D6
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 09:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgLCIxf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 03:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgLCIxd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 03:53:33 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5CAC061A4D;
        Thu,  3 Dec 2020 00:52:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmqNc5QNnz9sPB;
        Thu,  3 Dec 2020 19:52:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606985569;
        bh=CVr4YX+Bk9HsWwon3ivVVAYTYd1URPLmyoPl5JfykA8=;
        h=Date:From:To:Cc:Subject:From;
        b=jrLsUZrJW+SWJH4BB1ePcJgfPWplMsjupll4kqGtZXbtEwfWAewVnboZiJlV/XEb5
         LHOZKMuuW9fLvNu4Qq3lZmAuiXDB560bxVxF91kVEoTqiZ88NP5cJVi8tc68js8knf
         yha2htEwKSrPsXrxm54ILFxQvA1d8zhYE+UrE8ESDBbZlRlXwtN5PtUUs8fb8w/X1k
         IShLcCpd+KaGQx3oKroPplHLHcYDMiyy3MLeq1RaXUKe3uHAKuHeYft2r13bBcB78/
         VVA4fpqKSxYDk6mdVb12SbNvVExI4m/cxhG4gtkPPpXxTfZFrhmVp6stNbfpIIq7Jh
         JkTqx5x3whd9Q==
Date:   Thu, 3 Dec 2020 19:52:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20201203195247.498b7ac1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cvdHHyu7fxt9F+8JOd4hM..";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cvdHHyu7fxt9F+8JOd4hM..
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/kasan/quarantine.c: In function 'quarantine_put':
mm/kasan/quarantine.c:197:15: error: 'info' undeclared (first use in this f=
unction)
  197 |   qlink_free(&info->quarantine_link, cache);
      |               ^~~~
mm/kasan/quarantine.c:197:15: note: each undeclared identifier is reported =
only once for each function it appears in
mm/kasan/quarantine.c:199:3: error: 'return' with no value, in function ret=
urning non-void [-Werror=3Dreturn-type]
  199 |   return;
      |   ^~~~~~
mm/kasan/quarantine.c:171:6: note: declared here
  171 | bool quarantine_put(struct kmem_cache *cache, void *object)
      |      ^~~~~~~~~~~~~~

Caused by patches

  "kasan: rename get_alloc/free_info"
  "kasan: sanitize objects when metadata doesn't fit"

I have applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 3 Dec 2020 19:41:49 +1100
Subject: [PATCH] kasan-rename-get_alloc-free_info-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/kasan/quarantine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index feae26ea5cbb..d98b516f372f 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -194,9 +194,9 @@ bool quarantine_put(struct kmem_cache *cache, void *obj=
ect)
=20
 	q =3D this_cpu_ptr(&cpu_quarantine);
 	if (q->offline) {
-		qlink_free(&info->quarantine_link, cache);
+		qlink_free(&meta->quarantine_link, cache);
 		local_irq_restore(flags);
-		return;
+		return false;
 	}
 	qlist_put(q, &meta->quarantine_link, cache->size);
 	if (unlikely(q->bytes > QUARANTINE_PERCPU_SIZE)) {
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/cvdHHyu7fxt9F+8JOd4hM..
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Ip18ACgkQAVBC80lX
0GxR4Qf/dq19EiH/ubACSjcTch4TfIUOuBPP2/cBkbNo+fihPxUgQ8kUd5+2oMDj
hZGrFGZV/k2NRTaG9+PRMObiaO3cCfzpLkO4fInictNbqRjXfPE4pzDD240dLmbX
/hJFkLcCQp+90kJ9+ho/NAEeZzCEbQknQhWssGroqQpUcuL/3ReurDXtWgrZf8Vy
9rlSU+XAOeqKZGxsrrsqHpw3e3UkOPbrY34f87OKhrrNCVDuXAwr8rT/ZIOPX9fm
kxBzo3WNmmOzzTOoXHFcG6sE3RsqSbeV9DRGc2r36vhqTJM9UtdDh9WJVO21ivqC
TEeDicbOk8hzAghB3GOp6k47m3YpqA==
=na+e
-----END PGP SIGNATURE-----

--Sig_/cvdHHyu7fxt9F+8JOd4hM..--
