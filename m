Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25222B3CF2
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 07:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgKPGRH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 01:17:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgKPGRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 01:17:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZJkn2kRsz9sPB;
        Mon, 16 Nov 2020 17:17:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605507425;
        bh=53Ww9hM6cWh2ShMkOwIVkNfHnjU1pd0mjAsgj/ztTyg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iAVn6ox5JXuFHwQHxgteue+UACFZKfEp8yUs41nup4K1ynbEwLApw3+RLIH19wCVs
         M4ep7VyLYJkA+v2cMxLEsD8MpbMPdIBwjbu+TtDFQQXRre3Sy+00b9yjs0vmIu7ltO
         fxujeYUl5JEl9SiMkGG33zQyZb7zn6U6HoLIDWISN1yKyI7LdO3xlnRuiNu4dSiUeg
         dW72OVCO4oqnop9+XyaPh3VS5MJUFnlK1WD33Cgc6wuPuNkEHlLET5rBcLq1iAobcu
         AzSNkX3TtcA54C0qPAxPrt8r7MQu2FPT507xg+YmjIhcf7CAtXZViXO/V3PoO/qMSA
         IRo+wNvgOgkVQ==
Date:   Mon, 16 Nov 2020 17:17:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20201116171704.565df6ad@canb.auug.org.au>
In-Reply-To: <20201115090105.GX4758@kernel.org>
References: <20201113180239.0ee06fd2@canb.auug.org.au>
        <20201113171452.087c489c1ef58e472667577e@linux-foundation.org>
        <20201115090105.GX4758@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GkXNrfrMFJ8zZ7_KlgR4V8r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GkXNrfrMFJ8zZ7_KlgR4V8r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Sun, 15 Nov 2020 11:01:05 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>
> My preference would be to put the entire function body in '#ifdef
> CONFIG_MEMCG' here.

OK, so today I used this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Nov 2020 16:55:10 +1100
Subject: [PATCH] secretmem-add-memcg-accounting-fix2

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/secretmem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 5ed6b2070136..c7a37b2d01ed 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -59,6 +59,7 @@ bool secretmem_active(void)
=20
 static int secretmem_memcg_charge(struct page *page, gfp_t gfp, int order)
 {
+#ifdef CONFIG_MEMCG
 	unsigned long nr_pages =3D (1 << order);
 	int i, err;
=20
@@ -72,11 +73,13 @@ static int secretmem_memcg_charge(struct page *page, gf=
p_t gfp, int order)
 		p->memcg_data =3D page->memcg_data;
 	}
=20
+#endif
 	return 0;
 }
=20
 static void secretmem_memcg_uncharge(struct page *page, int order)
 {
+#ifdef CONFIG_MEMCG
 	unsigned long nr_pages =3D (1 << order);
 	int i;
=20
@@ -87,6 +90,7 @@ static void secretmem_memcg_uncharge(struct page *page, i=
nt order)
 	}
=20
 	memcg_kmem_uncharge_page(page, PMD_PAGE_ORDER);
+#endif
 }
=20
 static int secretmem_pool_increase(struct secretmem_ctx *ctx, gfp_t gfp)
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/GkXNrfrMFJ8zZ7_KlgR4V8r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+yGWAACgkQAVBC80lX
0Gz85wf/cY8cijPLbCsrbdxADSyMXMtPvOE2qMn7PTZwKKpnhkoiVe9puw6ArJwv
X/FfabMrR9NomNOfB4/KoMWwD7SqOIM4qxQcHwE7fd7zOqBTPviG7spX+pXxAa5m
mtkJcpfRAfDw23WG9w8fwbZUe/JGGTg0f3RRfd/uRZWgVBYVv273s0ivKGgvaYCP
turJiD6wre/RWtLYyWzeLeZddt4jbobih90p7S2zDoaZjUJ3/tQkZF4CB3I1FV2z
Z59T46h02aZOTgNwTUpUwkgueOyase323Km9OpgnYEEaOZIBWmjriZwIPW/xC0pC
5aQ3d3b4dK4uNWoDDAXBIiwrU/WBVQ==
=jkmX
-----END PGP SIGNATURE-----

--Sig_/GkXNrfrMFJ8zZ7_KlgR4V8r--
