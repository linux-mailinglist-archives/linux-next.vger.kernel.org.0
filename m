Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906ABFFEA6
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 07:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfKRGpJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 01:45:09 -0500
Received: from ozlabs.org ([203.11.71.1]:38589 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbfKRGpJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 01:45:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Gfb56XwSz9sPj;
        Mon, 18 Nov 2019 17:45:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574059506;
        bh=r7sXskfw+I7WzRaYq+oEFXXykLljQQeZd2JcPodyWDY=;
        h=Date:From:To:Cc:Subject:From;
        b=ME75umwCtcE9U0v7gK+Ovx08dSVyw15A1oc1EFNU2fRDjLN5vT1GdM5eBXrGhVNwX
         98Zni4YyuScNHqJiqHTiQ5gGG9DybTrvuNK/ppN4KBzPH1H8KLXdawJAT2J1Pl8XC8
         2ULYmhnXzoZCMekbvQz9EKZEhp+Ya5LHz383Ive0AeEzvbuC41KZe7CpNKqmfn8WH7
         eFWBNNv/hXC4UddClDgdMtdPTrRh0d2HxjTc4QYhEzwdaWKTYWdMdU7AC6Gl/MUTS3
         5Exwi52ImU/cjhSh9UZktwby/tcOu0i/pecMa2t6eQmCWHnCqxb2hXfSKzZHK7Q7dq
         Uom1U34jFYf3A==
Date:   Mon, 18 Nov 2019 17:45:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 risc-v tree
Message-ID: <20191118174501.73050c78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MmA=ucNM_PbkF5BIz9tamiY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MmA=ucNM_PbkF5BIz9tamiY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  arch/riscv/include/asm/io.h

between commit:

  0c3ac28931d5 ("riscv: separate MMIO functions into their own header file")

from the risc-v tree and commits:

  d092a8707326 ("arch: rely on asm-generic/io.h for default ioremap_* defin=
itions")
  38af57825313 ("riscv: use the generic ioremap code")

from the generic-ioremap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Nov 2019 17:42:04 +1100
Subject: [PATCH] fixup for moved code in riscv

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/riscv/include/asm/mmio.h | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index a297a835e402..a2c809df2733 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -14,20 +14,7 @@
 #include <linux/types.h>
 #include <asm/mmiowb.h>
=20
-#ifdef CONFIG_MMU
-void __iomem *ioremap(phys_addr_t offset, unsigned long size);
-
-/*
- * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we c=
an't
- * change the properties of memory regions.  This should be fixed by the
- * upcoming platform spec.
- */
-#define ioremap_nocache(addr, size) ioremap((addr), (size))
-#define ioremap_wc(addr, size) ioremap((addr), (size))
-#define ioremap_wt(addr, size) ioremap((addr), (size))
-
-void iounmap(volatile void __iomem *addr);
-#else
+#ifndef CONFIG_MMU
 #define pgprot_noncached(x)	(x)
 #endif /* CONFIG_MMU */
=20
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/MmA=ucNM_PbkF5BIz9tamiY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3SPe0ACgkQAVBC80lX
0Gzr9gf/U7Q56bk6ZDZgxf3EDieDVYqdkb0vU1MR5brDHbwfgGkgKTWDH3KVpHI0
+i4eJY9PHk2lzecs1x9XunAdLnPKPvCC+jetF/qvlpeU+StzJm+5eK2HT9UaVE5K
Zn1vinfNHUYZFDFE+oTRH1WmTPpSiYlADy++VRQW96ql3e8PJlNs0iRl102om1r8
yQYqKWxRppuG9a+w140/obM4jmk63YQQzrKKJoXC723qy9mOTpXjXwy9FRc4ab4b
OzllHAaKvX/lEoUmLZQOY+HNOqIBVuYLZ4NQ6E568Azj5u+v82GnM2gvXMLUGpe/
NGmDj6itndtVKmuBe7C8arRTK8i4Ag==
=xxUm
-----END PGP SIGNATURE-----

--Sig_/MmA=ucNM_PbkF5BIz9tamiY--
