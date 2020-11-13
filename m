Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA9E2B1626
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 08:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgKMHCp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 02:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgKMHCp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Nov 2020 02:02:45 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DB0C0613D1;
        Thu, 12 Nov 2020 23:02:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXTtn2Sxrz9sPB;
        Fri, 13 Nov 2020 18:02:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605250961;
        bh=Rkv381qprtefXC6KwG2DDIK3zuwdwvP0t8znTCZTTDA=;
        h=Date:From:To:Cc:Subject:From;
        b=Keiv8OKpo89cCc/c95Ijt5rIHw9LehLIUcUFsrBy7Fv2y2+G3ZqU739zbOEzjMsIZ
         JAHJE1cfI/CfxLtaibhgkM36LKh0kSQY3buZKT4JnA/Rd2yEpqQ65ksUaJGYi0KXO8
         e/TlIFcFddQFtQ8T6tM0IzZuUuxHo2YEQc/OlT4vwhiqQWlv6rjnXwE6CneQL3VVuD
         XYkZhJmSbMZVYVhLexhyF4e8n8KjvsH/IDaQe1DCvaL281maqxH8p1hSeYcPi+XltU
         PzgOj7/T+7rUkp8/tJGfNwvQpyYXs9ShZ3dlH4HDO4vz+C5Kz6efVJqAzFPv8S6ESS
         0ssiDnFK16c/g==
Date:   Fri, 13 Nov 2020 18:02:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20201113180239.0ee06fd2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8b19XPWAq99xHaUFCjRLPkm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8b19XPWAq99xHaUFCjRLPkm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (i386 defconfig)
failed like this:

mm/secretmem.c: In function 'secretmem_memcg_charge':
mm/secretmem.c:72:4: error: 'struct page' has no member named 'memcg_data'
   72 |   p->memcg_data =3D page->memcg_data;
      |    ^~
mm/secretmem.c:72:23: error: 'struct page' has no member named 'memcg_data'
   72 |   p->memcg_data =3D page->memcg_data;
      |                       ^~
mm/secretmem.c: In function 'secretmem_memcg_uncharge':
mm/secretmem.c:86:4: error: 'struct page' has no member named 'memcg_data'
   86 |   p->memcg_data =3D 0;
      |    ^~

Caused by commit

  5f964602825e ("secretmem: add memcg accounting")

memcg_data only exists when CONFIG_MEMCG is set.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Nov 2020 17:50:30 +1100
Subject: [PATCH] secretmem-add-memcg-accounting-fix2

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/secretmem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 5ed6b2070136..3dfdbd85ba00 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -69,7 +69,9 @@ static int secretmem_memcg_charge(struct page *page, gfp_=
t gfp, int order)
 	for (i =3D 1; i < nr_pages; i++) {
 		struct page *p =3D page + i;
=20
+#ifdef CONFIG_MEMCG
 		p->memcg_data =3D page->memcg_data;
+#endif
 	}
=20
 	return 0;
@@ -83,7 +85,9 @@ static void secretmem_memcg_uncharge(struct page *page, i=
nt order)
 	for (i =3D 1; i < nr_pages; i++) {
 		struct page *p =3D page + i;
=20
+#ifdef CONFIG_MEMCG
 		p->memcg_data =3D 0;
+#endif
 	}
=20
 	memcg_kmem_uncharge_page(page, PMD_PAGE_ORDER);
--=20
2.28.0

This unfortunately produced these warnings:

mm/secretmem.c: In function 'secretmem_memcg_charge':
mm/secretmem.c:70:16: warning: unused variable 'p' [-Wunused-variable]
   70 |   struct page *p =3D page + i;
      |                ^
mm/secretmem.c: In function 'secretmem_memcg_uncharge':
mm/secretmem.c:86:16: warning: unused variable 'p' [-Wunused-variable]
   86 |   struct page *p =3D page + i;
      |                ^

which I will fix up for the next linux-next release, if necessary.
--=20
Cheers,
Stephen Rothwell

--Sig_/8b19XPWAq99xHaUFCjRLPkm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+uL48ACgkQAVBC80lX
0Gz3ZQf/ZEfrYN0aAUrwrow4Yt62CHQ42sgt1Ubkm9/2XdD9VvWXeCSunW/76eXI
6JHrsOBk2QcZO9BQ4IuEAfzCFFt8BUifck2ZH/VZ66cj8Ccu4Hk9sIiRVkrNWdyw
UfzoYe+15PyJR7Ec+C1oL1Ud1mDCrt2+ZAcJSIvvVlxpwNDTBKWky2xsUSUR/jCo
r3d8sRx70yxyg6IdlCvRlQ8eCFlbYIsMrormwqTVQUXZNv7+wEFWWp8WazkfVJah
UskLFYieADkr9MfIyfd9VCR/w+xTDkTFs6/cSQwPzwRbvbiNiJm71C+EyT4A46jf
yM2tzKYiRRKp1dSSVpVcrdpcL8tEhQ==
=H+cW
-----END PGP SIGNATURE-----

--Sig_/8b19XPWAq99xHaUFCjRLPkm--
