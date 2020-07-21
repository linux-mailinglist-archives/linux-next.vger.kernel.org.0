Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029B3227DE8
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 12:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgGUK5Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 06:57:24 -0400
Received: from ozlabs.org ([203.11.71.1]:49365 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgGUK5W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 06:57:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9wXY6qsFz9sRR;
        Tue, 21 Jul 2020 20:57:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595329039;
        bh=J+9zp2Z8DFT/0OYfTcuALdCOFIbrhWRfmGxBbTJkzp0=;
        h=Date:From:To:Cc:Subject:From;
        b=gNYVKog2/PX2As5kgfmR9zlqyYmdGETbyxnMXbZp59G2wTyzutuD/JvDfHKh9zugz
         f6XP3WnpHqd8dKmmceD3gKP2fZYRnP72Xc/YODUU+UUP3zVLeBInZ4Z3uGq+iCPJj6
         Ty6g65pz08BOSulX6eHCVFFi1dYd1Il6NOgSYUZAqz1/268S2qhIWBdzG6zQP8lxyp
         cSc+M+lToPIb1miRmIfmd6oI0dNBudVD5aXqhHLLSNYGtLUK2D38jNlzQSGnjyHZiE
         KKLskb9UdCuRc/X/ohL+kc3riAaY6WuKk716tWaCy3E9Fd+Ji4HrXEYrb2yzZc3meQ
         ORF+detWijXjA==
Date:   Tue, 21 Jul 2020 20:57:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Roman Gushchin <guro@fb.com>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200721205716.6dbaa56b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g2JfB=U//Fv2CxlRkdYiFBA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g2JfB=U//Fv2CxlRkdYiFBA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build
(sparc64 defconfig) failed like this:

mm/hugetlb.c: In function 'free_gigantic_page':
mm/hugetlb.c:1233:18: error: 'hugetlb_cma' undeclared (first use in this fu=
nction); did you mean 'hugetlb_lock'?
      cma_release(hugetlb_cma[page_to_nid(page)], page, 1 << order))
                  ^~~~~~~~~~~
                  hugetlb_lock

Caused by commits

  ee0889218f26 ("mm/hugetlb: avoid hardcoding while checking if cma is enab=
led")
  8729fda59982 ("mm-hugetlb-avoid-hardcoding-while-checking-if-cma-is-enabl=
ed-fix")

I have added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Jul 2020 20:44:57 +1000
Subject: [PATCH] mm/hugetlb: better checks before using hugetlb_cma

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/hugetlb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4b560c7555e7..4645f1441d32 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1229,9 +1229,10 @@ static void free_gigantic_page(struct page *page, un=
signed int order)
 	 * If the page isn't allocated using the cma allocator,
 	 * cma_release() returns false.
 	 */
-	if (IS_ENABLED(CONFIG_CMA) &&
-	    cma_release(hugetlb_cma[page_to_nid(page)], page, 1 << order))
+#ifdef CONFIG_CMA
+	if (cma_release(hugetlb_cma[page_to_nid(page)], page, 1 << order))
 		return;
+#endif
=20
 	free_contig_range(page_to_pfn(page), 1 << order);
 }
@@ -1242,7 +1243,8 @@ static struct page *alloc_gigantic_page(struct hstate=
 *h, gfp_t gfp_mask,
 {
 	unsigned long nr_pages =3D 1UL << huge_page_order(h);
=20
-	if (IS_ENABLED(CONFIG_CMA)) {
+#ifdef CONFIG_CMA
+	{
 		struct page *page;
 		int node;
=20
@@ -1256,6 +1258,7 @@ static struct page *alloc_gigantic_page(struct hstate=
 *h, gfp_t gfp_mask,
 				return page;
 		}
 	}
+#endif
=20
 	return alloc_contig_pages(nr_pages, gfp_mask, nid, nodemask);
 }
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/g2JfB=U//Fv2CxlRkdYiFBA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8WygwACgkQAVBC80lX
0GxK/wf+KlMYKrTpUnvzB6DZ4MLfZ/xNSWMW4ZlUM9olUIzPCnyHPqerCQ+QLjzV
j01ATlqQ17209hRcHgPdiQC8lZnI6fvpRCdvz6GXGTuHfPK1AOwvRAP5dIRzAINU
M6naCe1xNkYEknqtrTDflPB1Lg6srqR7e55MGB/GJ+rpckorrrO1ES2tOIbs2TrZ
/9rY+8GGfiEIlEZVAEQ0XiXJsuN23xJllyxf4LwoqyRT8nChjrs/gq4fjnKDwZ4S
hT3Yo5jLdyw0Vpcrbb+rVLSX5BM5jVBwRH9RwVPGwYsXIbGc5+SvbbPxdKf1pw+c
Jc6tXP1YTExX6npbNMmnpMQS1Nwn7A==
=oTU0
-----END PGP SIGNATURE-----

--Sig_/g2JfB=U//Fv2CxlRkdYiFBA--
