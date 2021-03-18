Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B57B34028A
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 10:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCRJ4r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 05:56:47 -0400
Received: from ozlabs.org ([203.11.71.1]:42041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229834AbhCRJ4P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Mar 2021 05:56:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1MqH31w8z9sR4;
        Thu, 18 Mar 2021 20:56:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616061371;
        bh=NNXXZY2072IJh5OxbTX/I/GytUNXlOBdyDfwRlzxgCw=;
        h=Date:From:To:Cc:Subject:From;
        b=igZt6P1XJgPbKhHrAgC2wyXS+PnSsMc3xMMqUbV/VSkx/hYfWkvQF7qo5AyDsJ9CK
         ESlb/qmVhuwe5wBvY4DOnGyHZ/tG8XFBN2vnICQN0izBGn0awYMpZAWyu747VR2Aoo
         DOTbYVZPOMdk3LrmbfB2c0Tvi/o+iCj2ibwm6qwLf8+pw62hRAKnrriEx0W4UERh4Y
         03MEWTKrE770st/Nnh/zx1m0uslhEM/YFj4670xKvUXCSOstjvQkDI0NfmdqfcHSZa
         0UffGicjLbWukAONsQO5Irt5+HMZyFY9U6LpPAhiq0Dp/2QOyNN9+RkCY2UEu1c6E7
         3EgMQNIDutlMw==
Date:   Thu, 18 Mar 2021 20:56:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210318205607.63aebcc6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0ShCK.lqvGhewYNZ.P0iyjn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0ShCK.lqvGhewYNZ.P0iyjn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) failed like this:

In file included from arch/sparc/include/asm/pgtable_32.h:25:0,
                 from arch/sparc/include/asm/pgtable.h:7,
                 from include/linux/pgtable.h:6,
                 from include/linux/mm.h:33,
                 from mm/vmalloc.c:12:
mm/vmalloc.c: In function 'vmalloc_to_page':
include/asm-generic/pgtable-nopud.h:51:27: error: implicit declaration of f=
unction 'pud_page'; did you mean 'put_page'? [-Werror=3Dimplicit-function-d=
eclaration]
 #define p4d_page(p4d)    (pud_page((pud_t){ p4d }))
                           ^
mm/vmalloc.c:643:10: note: in expansion of macro 'p4d_page'
   return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
          ^~~~~~~~
mm/vmalloc.c:643:25: warning: return makes pointer from integer without a c=
ast [-Wint-conversion]
   return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
mm/vmalloc.c:651:25: warning: return makes pointer from integer without a c=
ast [-Wint-conversion]
   return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
          ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  70d18d470920 ("mm/vmalloc: fix HUGE_VMAP regression by enabling huge page=
s in vmalloc_to_page")

I have applied the following hack path for today (hopefully someone can
come up with something better):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 18 Mar 2021 18:32:58 +1100
Subject: [PATCH] hack to make SPARC32 build

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/vmalloc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 57b7f62d25a7..96444d64129a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -640,7 +640,11 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
 	if (p4d_none(*p4d))
 		return NULL;
 	if (p4d_leaf(*p4d))
+#ifdef CONFIG_SPARC32
+		return NULL;
+#else
 		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
+#endif
 	if (WARN_ON_ONCE(p4d_bad(*p4d)))
 		return NULL;
=20
@@ -648,7 +652,11 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
 	if (pud_none(*pud))
 		return NULL;
 	if (pud_leaf(*pud))
+#ifdef CONFIG_SPARC32
+		return NULL;
+#else
 		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
+#endif
 	if (WARN_ON_ONCE(pud_bad(*pud)))
 		return NULL;
=20
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/0ShCK.lqvGhewYNZ.P0iyjn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBTI7cACgkQAVBC80lX
0GzMfwf7B30Md+vulx+3oV7lMisikH4dc3DmGKKxov3AKkDMFdHkpderYxGyNZxH
Txb0A++gu4tgWL2YmOcsUbq/ftVyPphV3cRyPPPJW39q5VuCeBU9uZ9t/20tk1V5
EPyMISsM/zCMKrxgREp+6bJVBCwVeBlWXF5PHxtE2LyjrmEX5qcRD1EUcx5KImjs
cxOhKXHkO0DBhuJduRZm5eZ7vSTltD/5WZ7CH4HMphk/qz4xR3+g/6CvqteSTIkw
fy+hAv1D+R7i8/P4SP6p8FD24n7bAUufPG4T1g2BYOSkeclFuzCHJMZ22Y11vtf4
QnH/UalYKpqBleKCFW0arknElCbxUw==
=dPCL
-----END PGP SIGNATURE-----

--Sig_/0ShCK.lqvGhewYNZ.P0iyjn--
