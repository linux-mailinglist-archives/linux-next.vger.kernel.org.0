Return-Path: <linux-next+bounces-9204-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6DCC83B39
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A47E334A34A
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 07:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A74284894;
	Tue, 25 Nov 2025 07:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lJkouH9Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4213AA2D;
	Tue, 25 Nov 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764055492; cv=none; b=eNA4yaNHkC+TKDNChDUu3gw52qCtc2AYQzr/fOkkIWd01uDmU48eNuaBV03Th8swncp3qZXFV1is/Rp6bDIFVgY6Cc+II5F/ClTVwLQWYmgf5kQgbVxjJKSiIJ4QDMFkLz1oN0EYd0wjxIvaAI/SrPMNGfWbPoPTNJq5p/YGM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764055492; c=relaxed/simple;
	bh=4gCXHXE/KLWI57NlZnG7loiJAvLOYvdMDsoSF7bASlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JNjllkb0ms4gQQELq/4iV5Y1BQ8q4uzrA5v4UMtxeZKp2nUIn+USlquhnkO1D4rBFhBXyt9BnvgW48Pg+Tm3uM4MGgCxHGxYS6aBXDk+0FoQBrmh/L2xhj2Sgw4sif0thlo2KnU5ahRz99l5jB4gIMyMjCapmph3NXC6WWIJksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lJkouH9Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764055484;
	bh=6YA93AWD6Scbsba+KB8TxO1QcdeH1YEQ73wRoep7jGE=;
	h=Date:From:To:Cc:Subject:From;
	b=lJkouH9QK8L3dsgxp05WPJBhM+OPhFIvLUk9yQhCwab4hnoQ6Uxd1rslKo/L/EhsR
	 KdpJubrrazDTjvcya3tNzquy5CA0ZcAWXr+pWAkh+ccAQQVwoP71Oa3XFj76QOR+8c
	 +3NyARLknAisCW9yGFIEKuUemBPnba9rpfPQxccyd76URKJ9Lkzcl/0HP41E5qw08m
	 +GQncvJIzKVKdYfQ7E2vI8dZM9LvRdJp79eD4ekgrpkHwnBzozi7ySjNyhIIXsz9Hj
	 7BdD7w7ti6AwFcCXjkLFu8MtdImXDjZGfUNLLONSCpaSQTw35DsG2U63TFOqXMzzFm
	 0nTWRALdP3X4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFvMv1y2gz4w0L;
	Tue, 25 Nov 2025 18:24:43 +1100 (AEDT)
Date: Tue, 25 Nov 2025 18:24:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bitmap tree
Message-ID: <20251125182442.49ddb53a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=d5Z9BuRZ3v3a/FvTs33RM3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=d5Z9BuRZ3v3a/FvTs33RM3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bitmap tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/nand/raw/sunxi_nand.c:33:9: error: "field_get" redefined [-Werr=
or]
   33 | #define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) -=
 1))
      |         ^~~~~~~~~
In file included from include/linux/fortify-string.h:5,
                 from include/linux/string.h:386,
                 from include/linux/bitmap.h:13,
                 from include/linux/cpumask.h:11,
                 from arch/x86/include/asm/paravirt.h:21,
                 from arch/x86/include/asm/cpuid/api.h:57,
                 from arch/x86/include/asm/processor.h:19,
                 from include/linux/sched.h:13,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/dma-mapping.h:5,
                 from drivers/mtd/nand/raw/sunxi_nand.c:16:
include/linux/bitfield.h:298:9: note: this is the location of the previous =
definition
  298 | #define field_get(mask, reg)                                       =
     \
      |         ^~~~~~~~~
drivers/mtd/nand/raw/sunxi_nand.c:34:9: error: "field_prep" redefined [-Wer=
ror]
   34 | #define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_m=
ask))
      |         ^~~~~~~~~~
include/linux/bitfield.h:278:9: note: this is the location of the previous =
definition
  278 | #define field_prep(mask, val)                                      =
     \
      |         ^~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  c1c6ab80b25c ("bitfield: Add non-constant field_{prep,get}() helpers")

interacting with commits

  d21b4338159f ("mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_=
caps")
  6fc2619af1eb ("mtd: rawnand: sunxi: rework pattern found registers")

from the nand tree.

I have applied the following hack for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 Nov 2025 17:47:46 +1100
Subject: [PATCH] fix up for "bitfield: Add non-constant field_{prep,get}()
 helpers"

interacting with commits

  d21b4338159f ("mtd: rawnand: sunxi: introduce ecc_mode_mask in sunxi_nfc_=
caps")
  6fc2619af1eb ("mtd: rawnand: sunxi: rework pattern found registers")

from the nand tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi=
_nand.c
index 031ab651c5a8..b940eb5cf79a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -30,8 +30,8 @@
 #include <linux/reset.h>
=20
 /* non compile-time field get/prep */
-#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
-#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
+#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - =
1))
+#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_ma=
sk))
=20
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
@@ -185,7 +185,7 @@
 #define NFC_RANDOM_EN(nfc)	(nfc->caps->random_en_mask)
 #define NFC_RANDOM_DIRECTION(nfc) (nfc->caps->random_dir_mask)
 #define NFC_ECC_MODE_MSK(nfc)	(nfc->caps->ecc_mode_mask)
-#define NFC_ECC_MODE(nfc, x)	field_prep(NFC_ECC_MODE_MSK(nfc), (x))
+#define NFC_ECC_MODE(nfc, x)	sunxi_field_prep(NFC_ECC_MODE_MSK(nfc), (x))
 /* RANDOM_PAGE_SIZE: 0: ECC block size  1: page size */
 #define NFC_A23_RANDOM_PAGE_SIZE	BIT(11)
 #define NFC_H6_RANDOM_PAGE_SIZE	BIT(7)
@@ -879,7 +879,7 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nf=
c *nfc,
 	val =3D readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
=20
 	val &=3D ~NFC_USER_DATA_LEN_MSK(step);
-	val |=3D field_prep(NFC_USER_DATA_LEN_MSK(step), i);
+	val |=3D sunxi_field_prep(NFC_USER_DATA_LEN_MSK(step), i);
 	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
 }
=20
@@ -992,7 +992,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip=
 *nand,
 	*cur_off =3D oob_off + ecc->bytes + USER_DATA_SZ;
=20
 	pattern_found =3D readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found =3D field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	pattern_found =3D sunxi_field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_fou=
nd);
=20
 	ret =3D sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL, 0,
 				       readl(nfc->regs + NFC_REG_ECC_ST),
@@ -1121,7 +1121,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct na=
nd_chip *nand, uint8_t *buf
=20
 	status =3D readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found =3D readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found =3D field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	pattern_found =3D sunxi_field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_fou=
nd);
=20
 	for (i =3D 0; i < nchunks; i++) {
 		int data_off =3D i * ecc->size;
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/=d5Z9BuRZ3v3a/FvTs33RM3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklWboACgkQAVBC80lX
0Gzgcgf9EgjZEYlTLHKk6FU86vNFxJfPjFeGWrDCHUB7VRKzNYjr3/bEPywu62EJ
vGd1Reyj7hgGqp3Ku1uO9KZPE7zH/pZYse4mlHpOjfIvgZ8DZ6IZWO3QwtOi3SQ/
m0I7O9Ld5eB/XMu21Hg0Ug7SY6mUo1ubh/zogE3ytNy+KVafIPnZcWH+70S3PBiK
epFh0lfZbUw5QkYvjwJY1xjCX/m1j+KL0TVGRgBNyv7uee5hCdad7wyBywqdjQYL
eneVbjjo9u+1CKHJP5nLWcbYUfl3CzAAT4U/xO53Qy6+Wn+daBg/bgur73COkrjt
JI2HwaZkgtXvG3bR3iBkYR8/XciQZg==
=gxx/
-----END PGP SIGNATURE-----

--Sig_/=d5Z9BuRZ3v3a/FvTs33RM3--

