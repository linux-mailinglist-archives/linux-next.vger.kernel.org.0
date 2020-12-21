Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946322DF79F
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 03:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgLUCLF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 21:11:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39187 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726919AbgLUCLF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 21:11:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Czjbt0W4Qz9sVj;
        Mon, 21 Dec 2020 13:10:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608516618;
        bh=V9UVI2PvqIaf/yrp5phh+JLtvpEaSk5a+6OJkvKRgA0=;
        h=Date:From:To:Cc:Subject:From;
        b=JlR4vlgwiHv8P3K9mkE6zxphLr1lQOOzSndCREQxGXqxZpMUzT8Z8rqpLENqvsLSr
         7qs6RttPY9sqV1o4cbmpwMI9Krg6TWurpRZ/XdmeFFsRNF3//8ay4GB5fwtVGczc10
         zRJihweKqdNy0i/mFO66rdUJmF5BGOlx0qaJeLyeWgbvIWu6Jk2BKGH4R3zXl9G4N0
         CaRwkP5+GX74c6V3kaJu6j+Oat1yhS6cJlaikpvMPZI91n0x1Iac1fR5pi87U+QmAv
         vxml8ORwcE/5LUxIETqKkcqVOpm/yFb9tmZ4ODN86Eqtl2oqH/eZ15/IweaT6QeZq/
         HqCoVtFQggCWw==
Date:   Mon, 21 Dec 2020 13:10:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20201221131017.128c89b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BzH8.PRlEOqjyuYVlKL7+7/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BzH8.PRlEOqjyuYVlKL7+7/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/kasan/quarantine.c: In function 'quarantine_put':
mm/kasan/quarantine.c:207:15: error: 'info' undeclared (first use in this f=
unction)
  207 |   qlink_free(&info->quarantine_link, cache);
      |               ^~~~

Caused by commit

  120d593a8650 ("kasan: fix memory leak of kasan quarantine")

interacting with commit

  cfbc92088e1d ("kasan: rename get_alloc/free_info")

Can we please get this sorted out once and for all?

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Dec 2020 13:07:42 +1100
Subject: [PATCH] kasan: fix memory leak of kasan quarantine fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/kasan/quarantine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/quarantine.c b/mm/kasan/quarantine.c
index 3f3b3d902c18..091a57f942b3 100644
--- a/mm/kasan/quarantine.c
+++ b/mm/kasan/quarantine.c
@@ -204,7 +204,7 @@ bool quarantine_put(struct kmem_cache *cache, void *obj=
ect)
=20
 	q =3D this_cpu_ptr(&cpu_quarantine);
 	if (q->offline) {
-		qlink_free(&info->quarantine_link, cache);
+		qlink_free(&meta->quarantine_link, cache);
 		local_irq_restore(flags);
 		return false;
 	}
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/BzH8.PRlEOqjyuYVlKL7+7/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/gBAkACgkQAVBC80lX
0GwNWwgAlrPv8jREH+leMyZMw3LsinVBn78o0VzTDvbB42A9m78FaswrnAeLzgc7
CR9vfvzP6kZ/Pbdx2OcpAdzwEl56eRDc+R3xtopGlCyz42ROHFZDJlpHOGIU23QS
XFtFi4q6BfzNd3HTh23akVIIRfdHRKZHSyQ8t+/4Hjf16y6Us83AsGvpvOF21vqJ
ojrJnCwhf2E8SvHHP/snW018wJDWeUoCIQxnS53Ny6bVm0vitQFoejuDZJr6tjK1
U0U/aJs0UTetNAKCaMsx1ENhbm+3d0cIjsU/7gayuz3PgeoazXYHvfr3bXbR5N6i
JRS3n9fyL1ydQ5uCSJQ8QvPbAEkFVA==
=wVjd
-----END PGP SIGNATURE-----

--Sig_/BzH8.PRlEOqjyuYVlKL7+7/--
