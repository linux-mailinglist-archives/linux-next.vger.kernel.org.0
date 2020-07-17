Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC1223A8A
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 13:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgGQLbc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 07:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQLbc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 07:31:32 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071AEC061755;
        Fri, 17 Jul 2020 04:31:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7TTs0Z8Kz9sR4;
        Fri, 17 Jul 2020 21:31:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594985489;
        bh=C7rxlE9t2pvSfb+zKvHwRtVJO7K0tZsNLdnDwVeIwkI=;
        h=Date:From:To:Cc:Subject:From;
        b=rizugNl9F62bloP0fLpj3jEdoam2FivCsC6lNFAcqzBCup4+GtHc6s5ej8x1leUew
         pjWcAOX3JnbMheXwqTlmMuOPNGl3qpI8nBMumrtmBm8rFfxJ7hk+/Fdu1VTOyyS8BB
         N+nDeoJfVsLJp4oM/ffbr1dvI3d32xmUTZOLpLPK/fOWtQ4HNg3yaeDYfDSogxSoPV
         9zHSOVUHD6nbN/oMz3JNtY+9akF7K8QobkJR8+3aM7PZbkop+PTepJ5RpjWnXTzIVu
         lboWanFGyoib7sHKA8kGvzMyDKTexgQBwkXbIqC/qrG1lJGWxBv0Bi4b5VTuuLDsuu
         KvGNtY0QsNWUQ==
Date:   Fri, 17 Jul 2020 21:31:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>
Subject: linux-next: build failure after merge of the akpm_current tree
Message-ID: <20200717213127.3bd426e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JvI_7a0cqs3/frHISe16Pg9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JvI_7a0cqs3/frHISe16Pg9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (i386 defconfig)
failed like this:

mm/hugetlb.c:1302:20: error: redefinition of 'destroy_compound_gigantic_pag=
e'
 1302 | static inline void destroy_compound_gigantic_page(struct hstate *h,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/hugetlb.c:1223:13: note: previous definition of 'destroy_compound_gigant=
ic_page' was here
 1223 | static void destroy_compound_gigantic_page(struct hstate *h, struct=
 page *page,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  d8d718553f84 ("mm,hwpoison: rework soft offline for in-use pages")

The preprocessor directives look like this:

static void destroy_compound_gigantic_page(struct hstate *h, struct page *p=
age,
#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
#ifdef CONFIG_CONTIG_ALLOC
#else /* !CONFIG_CONTIG_ALLOC */
#endif /* CONFIG_CONTIG_ALLOC */
#else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE */
static inline void destroy_compound_gigantic_page(struct hstate *h,
#endif

So, for now, I have applied the following hack to get it to build.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Jul 2020 21:17:37 +1000
Subject: [PATCH] fix up for hugetlb.c code movement

Fuxes: "mm,hwpoison: rework soft offline for in-use pages"
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1fe5f7229b24..589c330df4db 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1220,6 +1220,7 @@ static inline void ClearPageHugePoisoned(struct page =
*page)
 	page[3].mapping =3D NULL;
 }
=20
+#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
 static void destroy_compound_gigantic_page(struct hstate *h, struct page *=
page,
 					   unsigned int order)
 {
@@ -1244,7 +1245,6 @@ static void destroy_compound_gigantic_page(struct hst=
ate *h, struct page *page,
 	__ClearPageHead(page);
 }
=20
-#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
 static void free_gigantic_page(struct page *page, unsigned int order)
 {
 	/*
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/JvI_7a0cqs3/frHISe16Pg9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RjA8ACgkQAVBC80lX
0GxcAQf/YsHDnMRKfqD3TSfpI0aKlA7+JVxjQ45gbqO8Y7mQeiEeww1Xpk6Buf+W
tBszbsJY7j4PCJUON9HZ/gJGAFpImJlZ4kTEI+QQ0DZZ/8LhWfhfEvpDVHnhIei3
5G8K2FNK2BqA1KMlpNqwqHpUvfgQBGOjaX7K0F4tqcLKzfmCfqX5UJ79PjBHnTCK
4qUuY4g1MQ1bxRxtUfqkwQRzDt1MmNB2Gl7y94FqrFZDatJorLEC+RT9is0cW4x9
XDDGDLo9MgwWwH0PlWxBaQlW8O7lipjEBO2Y0l5bsvt9LSqLF6HwRwbisKFHniCF
rQGNwikLeSHaQuYpkt2XwOILlIw1cg==
=EtUl
-----END PGP SIGNATURE-----

--Sig_/JvI_7a0cqs3/frHISe16Pg9--
