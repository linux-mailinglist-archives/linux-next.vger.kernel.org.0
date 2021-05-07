Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93C3375E55
	for <lists+linux-next@lfdr.de>; Fri,  7 May 2021 03:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhEGBZe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 May 2021 21:25:34 -0400
Received: from ozlabs.org ([203.11.71.1]:32903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233027AbhEGBZe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 May 2021 21:25:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fbt5m6vdWz9sVt;
        Fri,  7 May 2021 11:24:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620350671;
        bh=ETRnR5fHuW4jXaXVrrh+RNqMvm8+yUBWnkNZMYrRX9k=;
        h=Date:From:To:Cc:Subject:From;
        b=d5qsfMe7EOXptXMIO7xOVBJd7606ezmrOmFBnaOWGZSXoRoP1Xvs/hbJcJOuU4NWp
         DB19T0Nwg9PcfbgcB/zCcUrGm3kUDcFupCB0XmA4T2wnCl0q56jfzyBF2HcKlMI++B
         N2gcqdfxFm7PoWjcAkLs4+2R6ImnqyX+jzjL2HXmnCxOtnAm67eraBGemTvW5n2LEU
         9Ho6FYcm18Rd7ejzorQnj50/x0JaT0aRkSCmU1xE/xC9d5kRFQ86E39yU2Omqy/96b
         mMlEggM8fYWWamhdbvvSUg87QLthnsWA0leEp3IfW8Xgc/1sk2x7P/Sthn3tOqcFoy
         rodL/xCgfFMfw==
Date:   Fri, 7 May 2021 11:24:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the akpm tree with the risc-v tree
Message-ID: <20210507112426.7ed1f439@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mNohuNOr67vozaVCaGFNX6B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mNohuNOr67vozaVCaGFNX6B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/riscv/include/asm/set_memory.h

between commit:

  8d91b0973358 ("riscv: Consistify protect_kernel_linear_mapping_text_rodat=
a() use")

from the risc-v tree and commit:

  e022d55b4d97 ("set_memory: allow set_direct_map_*_noflush() for multiple =
pages")

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/set_memory.h
index 086f757e8ba3,b766f2ccd9de..000000000000
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@@ -26,14 -27,8 +26,14 @@@ static inline void protect_kernel_text_
  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { re=
turn 0; }
  #endif
 =20
 +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
 +void protect_kernel_linear_mapping_text_rodata(void);
 +#else
 +static inline void protect_kernel_linear_mapping_text_rodata(void) {}
 +#endif
 +
- int set_direct_map_invalid_noflush(struct page *page);
- int set_direct_map_default_noflush(struct page *page);
+ int set_direct_map_invalid_noflush(struct page *page, int numpages);
+ int set_direct_map_default_noflush(struct page *page, int numpages);
  bool kernel_page_present(struct page *page);
 =20
  #endif /* __ASSEMBLY__ */

--Sig_/mNohuNOr67vozaVCaGFNX6B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCUlsoACgkQAVBC80lX
0GycTQf9HKnM/AgbrDacAaMiDLvfZatmWOgYfncJ6c+h1iGcG5jRzzul1GboWDD6
OUF4HwbGFZrKjUZ9VlqqlceC0KXc0Pr3qu/feDd9w4nPocHTOPUVO/42q1zMMZm1
fOc4p6Zp6PpKzf32tr2RFcB67WfjLiISnON7QgX+KJpVGRjwm9fx58hC9JHkxcQs
svk8OszgnQqUDRcr9+2cD55ZsMPC9H1MysWhQPR/HalzuneO2thoKvO6tHaOPQbm
sORc0eeFn49hFUIFZbR5QYElLV3DDRBWDI943JmRnwYzbE0Al5eercRpGPPJrefS
2uaFujx20Xc6H3Y2I2rwZOaQ14r5tg==
=JLAQ
-----END PGP SIGNATURE-----

--Sig_/mNohuNOr67vozaVCaGFNX6B--
