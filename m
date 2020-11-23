Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B502C1969
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 00:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgKWXZV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 18:25:21 -0500
Received: from ozlabs.org ([203.11.71.1]:35003 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgKWXZT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 18:25:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cg3Cw1Vnfz9sSs;
        Tue, 24 Nov 2020 10:25:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606173916;
        bh=U0b4WFh9tzIMKyMK25/hRq6XCQdlyVDVgYC507y3xPw=;
        h=Date:From:To:Cc:Subject:From;
        b=gQHBLv0dG3DYsw7XxirEi1lR6MFTsUytyk079pQ7ZzlkxY/5VDaqwurx/6415i5hJ
         rLzZF3nu1GneZrE4eZFYG3x38nTTNYEDF84jUC/ryT/KpqSos+cVKIc2fUtQOMW/hw
         Qr6MeZDFLeqiXQgk/AYjQe58wqUZJ5/WkCwEfLsUPtsmIWX22zwZPJiVgEBblV8yrz
         YeqRe+U04oAW1OJ6Y8MmH+GdSKsj/sy/vfiqCmr8fOO88dOsL7T1DFOrd8dmqWOgyX
         ThqXkX5VJQcVvuRz8vLd4J12NRyZoOE+sFda9DspfcTXgcEE0LzTqBq5KiLAFKj5jq
         +oEa4HEQZbkUQ==
Date:   Tue, 24 Nov 2020 10:25:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the s390 tree with the asm-generic tree
Message-ID: <20201124102514.0bea1349@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j26pNq_K4+qMt.pBWQUb7rc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j26pNq_K4+qMt.pBWQUb7rc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/include/asm/mmu_context.h

between commit:

  93e2dfd39438 ("s390: use asm-generic/mmu_context.h for no-op implementati=
ons")

from the asm-generic tree and commits:

  ab177c5d00cd ("s390/mm: remove unused clear_user_asce()")
  87d598634521 ("s390/mm: remove set_fs / rework address space handling")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/mmu_context.h
index 66f9cf0a07e3,87a84fc59fc3..000000000000
--- a/arch/s390/include/asm/mmu_context.h
+++ b/arch/s390/include/asm/mmu_context.h
@@@ -70,23 -69,8 +70,6 @@@ static inline int init_new_context(stru
  	return 0;
  }
 =20
- static inline void set_user_asce(struct mm_struct *mm)
- {
- 	S390_lowcore.user_asce =3D mm->context.asce;
- 	__ctl_load(S390_lowcore.user_asce, 1, 1);
- 	clear_cpu_flag(CIF_ASCE_PRIMARY);
- }
-=20
- static inline void clear_user_asce(void)
- {
- 	S390_lowcore.user_asce =3D S390_lowcore.kernel_asce;
- 	__ctl_load(S390_lowcore.kernel_asce, 1, 1);
- 	set_cpu_flag(CIF_ASCE_PRIMARY);
- }
-=20
- mm_segment_t enable_sacf_uaccess(void);
- void disable_sacf_uaccess(mm_segment_t old_fs);
 -#define destroy_context(mm)             do { } while (0)
--
  static inline void switch_mm(struct mm_struct *prev, struct mm_struct *ne=
xt,
  			     struct task_struct *tsk)
  {
@@@ -121,18 -98,18 +97,18 @@@ static inline void finish_arch_post_loc
  		__tlb_flush_mm_lazy(mm);
  		preempt_enable();
  	}
- 	set_fs(current->thread.mm_segment);
+ 	__ctl_load(S390_lowcore.user_asce, 7, 7);
  }
 =20
 -#define enter_lazy_tlb(mm,tsk)	do { } while (0)
 -#define deactivate_mm(tsk,mm)	do { } while (0)
 -
 +#define activate_mm activate_mm
  static inline void activate_mm(struct mm_struct *prev,
                                 struct mm_struct *next)
  {
  	switch_mm(prev, next, current);
  	cpumask_set_cpu(smp_processor_id(), mm_cpumask(next));
- 	set_user_asce(next);
+ 	__ctl_load(S390_lowcore.user_asce, 7, 7);
  }
 =20
 +#include <asm-generic/mmu_context.h>
 +
  #endif /* __S390_MMU_CONTEXT_H */

--Sig_/j26pNq_K4+qMt.pBWQUb7rc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+8RNoACgkQAVBC80lX
0GwDMgf/fxU6cyadfi2N0vsOLrSvBOpdjDa7jMDL+DlPEvLfxP5BN6T4QkcaAO77
tvx5y8PowVdvdgA0Fh7LZlclXc67j0tWhRLUgm7PSC+4iTUyA2t9KcUNukefMmnb
lgD5rDgMfGORiG34oQuJ0MP6vsR7+w8kmTClHmWdAJ0XVuZiaYqXZdQyHA8nyGmy
GUPWES5SlQ5TqJ+CfPPzQqm4IAArFRPtNSSlNOMY6/PTfVPiruq2xR66Ntu8vLpK
pzLoBPJ+L0R7R9yx7YKCJbWj2Le4MiOCYa8baUZX2GcbgfAQzLF07cGf//+yJXZS
cRoQ1gxud1IgPqNzW0YBKoyFiaCKrw==
=cvHF
-----END PGP SIGNATURE-----

--Sig_/j26pNq_K4+qMt.pBWQUb7rc--
