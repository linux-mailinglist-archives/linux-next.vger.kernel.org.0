Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC0D8170F76
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 05:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgB0ELs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 23:11:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727735AbgB0ELs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Feb 2020 23:11:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48SfPX08QVz9sR4;
        Thu, 27 Feb 2020 15:11:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582776704;
        bh=yNFUcnpml+FsBU7BWuCEdg2x8J9IX3byuw9ehhhzzKk=;
        h=Date:From:To:Cc:Subject:From;
        b=rgmkXNnn3sV+/jGwzLayvEQcwtkpfBP8CJuVwNRjFaN5WYOT1l+/ohras3Ucbkiwj
         97kS1OHMA6rQ92Xnz+hIwXIzADm4o5Lmu8UAYPYmFX2yhOQX7q8+qXnBNl4o47s+v8
         yw5K5NL4LPaALxRZnk/NCMMxzpTzJ2p0MDSrxE4ev6OejcUedc8gyzyUWRXsdhPXR0
         MsojWQO3VZr6Lshh9AmUMlTpetFRPz12b5/3VcVrDtXB+QtRxRDFpsq8iGftTxc1OF
         rAqPWLts4pCd0bg+vEkP6XjeHLYUt5KKlYGdtB1viGKEYBY2n+Pp6wgY8uMO1dDoy+
         8FFj5I14lQ3IQ==
Date:   Thu, 27 Feb 2020 15:11:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arjun Roy <arjunroy@google.com>,
        David Miller <davem@davemloft.net>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200227151143.6a6edaf9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SiKcDAG0YNuCNkgg/Codyh9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SiKcDAG0YNuCNkgg/Codyh9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (sparc defconfig)
failed like this:

In file included from include/linux/list.h:9:0,
                 from include/linux/smp.h:12,
                 from include/linux/kernel_stat.h:5,
                 from mm/memory.c:42:
mm/memory.c: In function 'insert_pages':
mm/memory.c:1523:41: error: implicit declaration of function 'pte_index'; d=
id you mean 'page_index'? [-Werror=3Dimplicit-function-declaration]
   remaining_pages_total, PTRS_PER_PTE - pte_index(addr));
                                         ^
include/linux/kernel.h:842:40: note: in definition of macro '__typecheck'
   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
                                        ^
include/linux/kernel.h:866:24: note: in expansion of macro '__safe_cmp'
  __builtin_choose_expr(__safe_cmp(x, y), \
                        ^~~~~~~~~~
include/linux/kernel.h:934:27: note: in expansion of macro '__careful_cmp'
 #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
                           ^~~~~~~~~~~~~
mm/memory.c:1522:26: note: in expansion of macro 'min_t'
  pages_to_write_in_pmd =3D min_t(unsigned long,
                          ^~~~~

Caused by patch

  "mm/memory.c: add vm_insert_pages()"

sparc32 does not implement pte_index at all :-(

I have added the following patch for today.  This may not be correct
or enough.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 27 Feb 2020 14:57:49 +1100
Subject: [PATCH] arch/sparc: add a definition of pte_index for the 32 bit k=
ernel

This is now needed for vm_insert_pages()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/include/asm/pgtable_32.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/p=
gtable_32.h
index 6d6f44c0cad9..dc7a4d69cb18 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -326,6 +326,8 @@ static inline pmd_t *pmd_offset(pud_t * dir, unsigned l=
ong address)
 }
=20
 /* Find an entry in the third-level page table.. */
+#define pte_index(address)	\
+	 ((address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
 pte_t *pte_offset_kernel(pmd_t * dir, unsigned long address);
=20
 /*
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/SiKcDAG0YNuCNkgg/Codyh9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5XQX8ACgkQAVBC80lX
0Gy3wwf/dUZXIqsCAD8/Sr+rQDJKDu2ASb1knvFT3sDI1KypMvnlbJfpzS546vBM
FhdaK6Ikvb29PM4WKX/my+UmiYPjabIUc3fC8tDK+FswbT1m1zsRRIExaxQSlPoD
npvsUQehKGG2FOoKTqk3g/y9sXEKWfdT3hU9i13CzdTxWKQGyFItc5VtbIjVlUfw
zgBnsRDPecT7TB2e3quhZ+CSa4FNLIBqon+KGHdCx8pzl+6V5zK5Rq8RZqHKfbwU
+SfM+XGlj5XGx+u1aS0zQmAwnsf6Z2j25iRG/HhaeFDfVzanIfM7iqvVBx/39SZg
PWAeuBbwNniFzbMSx4/V4+ZI8e8RnQ==
=iWcA
-----END PGP SIGNATURE-----

--Sig_/SiKcDAG0YNuCNkgg/Codyh9--
