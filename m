Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BCF3A9BA4
	for <lists+linux-next@lfdr.de>; Wed, 16 Jun 2021 15:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbhFPNJ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Jun 2021 09:09:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39293 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233216AbhFPNJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Jun 2021 09:09:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4lpn3PJGz9sWF;
        Wed, 16 Jun 2021 23:07:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623848865;
        bh=LMw5KCA2t/DjasJxnr5Ba8pj4yCmDTbZ0x5VZi5+r18=;
        h=Date:From:To:Cc:Subject:From;
        b=gv8+gxSiJ7DvoaPkr4bh+BToUjRkOMvRYO0rSp1LBv/Mb/GTYqFqqxnZ7I5BQV/VD
         IVS+yHQBFVCZ6f6Wa2OTapnZHI8V/zI9s+Bvc2XWFevokkqaV2s0e4Cxe1ZQdvCINC
         TgD6STxRb3Ic8lOOqrSk7VYRJlCU7AVmbroih08NkQBYCfyQpM1OuK/ckAR1jEnbTa
         ghhanMCppq1Lq6xbYUFe+Ktprk6oatJZHrBlLeQiiAe5H9aKpRX0ulCH1nlxZpvt1T
         HB6lsBn+PzjEGfUG/maQ2+0D4YWebGnCJflV4zx0chqsuYJISeirQYYgwXn53wWv0b
         iQM60vKLKE4PA==
Date:   Wed, 16 Jun 2021 23:07:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20210616230744.34b8682f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X=+z8Wh0D0Ritm7BieTLkL8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/X=+z8Wh0D0Ritm7BieTLkL8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (sparc defconfig)
failed like this:

In file included from arch/sparc/include/asm/pgtable.h:7:0,
                 from include/linux/pgtable.h:6,
                 from include/linux/mm.h:33,
                 from include/linux/ring_buffer.h:5,
                 from include/linux/trace_events.h:6,
                 from include/trace/syscall.h:7,
                 from include/linux/syscalls.h:87,
                 from fs/io_uring.c:45:
arch/sparc/include/asm/pgtable_32.h: In function 'pud_pgtable':
arch/sparc/include/asm/pgtable_32.h:157:10: warning: return makes pointer f=
rom integer without a cast [-Wint-conversion]
   return ~0;
          ^

and many, many more like this.

This is an error due to (part of) the tree being built with -Werror

Caused by commit

  8aef6710db27 ("mm: rename pud_page_vaddr to pud_pgtable and make it retur=
n pmd_t *")

I have applied the following hack fix for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Jun 2021 22:51:50 +1000
Subject: [PATCH] mm: rename pud_page_vaddr to pud_pgtable and make it retur=
n pmd_t * fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/include/asm/pgtable_32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/p=
gtable_32.h
index 1e6b55425f3d..ffccfe3b22ed 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -154,7 +154,7 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 static inline pmd_t *pud_pgtable(pud_t pud)
 {
 	if (srmmu_device_memory(pud_val(pud))) {
-		return ~0;
+		return (pmd_t *)~0;
 	} else {
 		unsigned long v =3D pud_val(pud) & SRMMU_PTD_PMASK;
 		return (pmd_t *)__nocache_va(v << 4);
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/X=+z8Wh0D0Ritm7BieTLkL8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDJ96AACgkQAVBC80lX
0GzTGwgAg1efvjB9GJ+Jv++Etpib0ASNX0DVs9fUZUq3E1kiYPxc8qEx5dsziHEa
ZAJTBOo/VKM/tczb8eoZTlbLWDJ5e8UqhJQVW0DziX1aOOa/+S8nzu5OV+lVEzNy
c6bNIQmXXyw4auwzz6bw4L9MA3uRTwJECLDUCXM1KUB/896h8B5dv3VdfG3Y6nhM
Fr8Yy3UwZ4eXv0tda2JXV7nmw6OfZR3+KidJJn4wx6imqc9Oj66OG2NSD0JqfA22
CokHcr1iFDZ1QOWze25F5ue9HkXhMuBxc8hQD+/DpJxGYjDP7f/jnrK7FwTU3pqV
JqE3ai0+N7GuV2aFnwGLUbodWsLNHQ==
=LvIo
-----END PGP SIGNATURE-----

--Sig_/X=+z8Wh0D0Ritm7BieTLkL8--
