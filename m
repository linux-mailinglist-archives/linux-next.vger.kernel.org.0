Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB4528AAFF
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 00:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbgJKWwE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Oct 2020 18:52:04 -0400
Received: from ozlabs.org ([203.11.71.1]:41801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387708AbgJKWwD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Oct 2020 18:52:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8cWM6R68z9sSG;
        Mon, 12 Oct 2020 09:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602456721;
        bh=fIRvN6W5v39OZV/PI6qLoNzqSNymGAo8vtLl7AfgHr8=;
        h=Date:From:To:Cc:Subject:From;
        b=TRBSxgmAIqWxlUZfKB4DPCnxRBEs9iqHeJAaQol+PswBHQTgIixo3YYiJlv1cpO66
         0d67Qu/4tzzSMmj9I/55TvEkP04tCE+e+eBzthaQIGEM2JMigw1SQ6SXa/kwbO+2n4
         k4SmlwK524RVleJDbLDYTKfPQZeT1v1PatAm8h+SL2mwHEFVA+4Egv2rJw6FAhdUpz
         nlYPtdV43icja9gRA4HGPJEF9gf7q9Ot9g86Lt3uOS1SQE3vuSKM3rAU+TkKXOqTua
         rr+zxAZOnYbajBe3zQ2yzM5QcX1HY02muWNWNVwNLtrES/bw0+0ZR9v9BnP/9UR04f
         4MP4EkAWn00Kg==
Date:   Mon, 12 Oct 2020 09:51:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the arm64 tree with the asm-generic
 tree
Message-ID: <20201012095158.779c6d9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lN7TGM5Qqm/+r7wgw9jm1l8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lN7TGM5Qqm/+r7wgw9jm1l8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/mmu_context.h

between commit:

  f911c2a7c096 ("arm64: use asm-generic/mmu_context.h for no-op implementat=
ions")

from the asm-generic tree and commit:

  48118151d8cc ("arm64: mm: Pin down ASIDs for sharing mm with devices")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/mmu_context.h
index fe2862aa1dad,0672236e1aea..000000000000
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@@ -174,9 -174,16 +174,15 @@@ static inline void cpu_replace_ttbr1(pg
   * Setting a reserved TTBR0 or EPD0 would work, but it all gets ugly when=
 you
   * take CPU migration into account.
   */
 -#define destroy_context(mm)		do { } while(0)
  void check_and_switch_context(struct mm_struct *mm);
 =20
- #define init_new_context(tsk,mm)	({ atomic64_set(&(mm)->context.id, 0); 0=
; })
+ static inline int
+ init_new_context(struct task_struct *tsk, struct mm_struct *mm)
+ {
+ 	atomic64_set(&mm->context.id, 0);
+ 	refcount_set(&mm->context.pinned, 0);
+ 	return 0;
+ }
 =20
  #ifdef CONFIG_ARM64_SW_TTBR0_PAN
  static inline void update_saved_ttbr0(struct task_struct *tsk,
@@@ -245,8 -251,12 +251,11 @@@ switch_mm(struct mm_struct *prev, struc
  void verify_cpu_asid_bits(void);
  void post_ttbr_update_workaround(void);
 =20
+ unsigned long arm64_mm_context_get(struct mm_struct *mm);
+ void arm64_mm_context_put(struct mm_struct *mm);
+=20
 +#include <asm-generic/mmu_context.h>
 +
  #endif /* !__ASSEMBLY__ */
 =20
  #endif /* !__ASM_MMU_CONTEXT_H */

--Sig_/lN7TGM5Qqm/+r7wgw9jm1l8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+DjI4ACgkQAVBC80lX
0GxFHAf7Bdi6RDISnaXZnrhn+rc6pobGbLcoahUYwnkk/DgpX4t34PRcYnbB5o2k
XIJyXzEREqdmEHixrNv/Lro1XgINjIFHs7kH8TYebLAeoIgDUr4N2YLJ/sP8hFgf
ZaM+/Kvw8NJA77/56GcDYYNrVp5REnUrMMTztaJ17S/+zm65d084sy81wFvKnGAU
OQmWkQBdboyen2yDiG7mUKazaAGJvXF64qyr/U0MGZqntLPlBg3/Vu9UW0A2eYIg
zhYHZBfZOYGi2HzOPVVYy0G4EGJIlmDkt0F1DKd4lEAVOK6lBfv7YKaNS1Ax/XNN
+UqyGKyI8lsIYVox7tm+9voe50YkLQ==
=7BKA
-----END PGP SIGNATURE-----

--Sig_/lN7TGM5Qqm/+r7wgw9jm1l8--
