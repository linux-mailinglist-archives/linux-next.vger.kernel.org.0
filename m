Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874CD1E0C6A
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 13:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390010AbgEYLE4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 07:04:56 -0400
Received: from ozlabs.org ([203.11.71.1]:55005 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389930AbgEYLEy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 07:04:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49VvPY1N1tz9sPF;
        Mon, 25 May 2020 21:04:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590404691;
        bh=vqJW3U9Kr/VnRD5n+k5na38ywhEDWSc9rmtReGEIdTw=;
        h=Date:From:To:Cc:Subject:From;
        b=IHXf24/VYwanOckLfO5AZIy2GjxwyQRt+feoBs2JNfPMhhd3PxdSsC9BI1cSokK9H
         ddrSGEDlLsXh2RD2EFJeHX9GVkgQbmPBLxvbhk3Jp/kI8QWFrWqNXscJbwmxtNviRT
         Twb4uyJOTxFZhsksTt6wbCXGfm946HoZ2HJTGX+BUgmqV07nwPTScRqRKIuPAaN7TV
         Ds7OEXZJapYepehzT0I/WrrHptglhiwdmPUK8aHbFJCyawehe/EkRBwQOwRmS1HrL+
         g5novGMGhqT/N9Cvw03115O5IhrvLYiak3SH6HzzIj1Lej4Noz8ezbugbInUUfNRz+
         0tgV4Hq+yMbrg==
Date:   Mon, 25 May 2020 21:04:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joerg Roedel <jroedel@suse.de>,
        Balbir Singh <sblbir@amazon.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20200525210443.0904d583@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hl.C9T28t6O0frUX+OSEIhN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hl.C9T28t6O0frUX+OSEIhN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/mm/tlb.c

between commit:

  83ce56f712af ("x86/mm: Refactor cond_ibpb() to support other use cases")

from the tip tree and commit:

  36c8e34d03a1 ("x86/mm: remove vmalloc faulting")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/tlb.c
index c8524c506ab0,f3fe261e5936..000000000000
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@@ -345,48 -161,16 +345,20 @@@ void switch_mm(struct mm_struct *prev,=20
  	local_irq_restore(flags);
  }
 =20
- static void sync_current_stack_to_mm(struct mm_struct *mm)
- {
- 	unsigned long sp =3D current_stack_pointer;
- 	pgd_t *pgd =3D pgd_offset(mm, sp);
-=20
- 	if (pgtable_l5_enabled()) {
- 		if (unlikely(pgd_none(*pgd))) {
- 			pgd_t *pgd_ref =3D pgd_offset_k(sp);
-=20
- 			set_pgd(pgd, *pgd_ref);
- 		}
- 	} else {
- 		/*
- 		 * "pgd" is faked.  The top level entries are "p4d"s, so sync
- 		 * the p4d.  This compiles to approximately the same code as
- 		 * the 5-level case.
- 		 */
- 		p4d_t *p4d =3D p4d_offset(pgd, sp);
-=20
- 		if (unlikely(p4d_none(*p4d))) {
- 			pgd_t *pgd_ref =3D pgd_offset_k(sp);
- 			p4d_t *p4d_ref =3D p4d_offset(pgd_ref, sp);
-=20
- 			set_p4d(p4d, *p4d_ref);
- 		}
- 	}
- }
-=20
 -static inline unsigned long mm_mangle_tif_spec_ib(struct task_struct *nex=
t)
 +static inline unsigned long mm_mangle_tif_spec_bits(struct task_struct *n=
ext)
  {
  	unsigned long next_tif =3D task_thread_info(next)->flags;
 -	unsigned long ibpb =3D (next_tif >> TIF_SPEC_IB) & LAST_USER_MM_IBPB;
 +	unsigned long spec_bits =3D (next_tif >> TIF_SPEC_IB) & LAST_USER_MM_SPE=
C_MASK;
 =20
 -	return (unsigned long)next->mm | ibpb;
 +	BUILD_BUG_ON(TIF_SPEC_L1D_FLUSH !=3D TIF_SPEC_IB + 1);
 +
 +	return (unsigned long)next->mm | spec_bits;
  }
 =20
 -static void cond_ibpb(struct task_struct *next)
 +static void cond_mitigation(struct task_struct *next)
  {
 +	unsigned long prev_mm, next_mm;
 +
  	if (!next || !next->mm)
  		return;
 =20
@@@ -587,20 -343,12 +559,11 @@@ void switch_mm_irqs_off(struct mm_struc
  		need_flush =3D true;
  	} else {
  		/*
 -		 * Avoid user/user BTB poisoning by flushing the branch
 -		 * predictor when switching between processes. This stops
 -		 * one process from doing Spectre-v2 attacks on another.
 +		 * Apply process to process speculation vulnerability
 +		 * mitigations if applicable.
  		 */
 -		cond_ibpb(tsk);
 +		cond_mitigation(tsk);
 =20
- 		if (IS_ENABLED(CONFIG_VMAP_STACK)) {
- 			/*
- 			 * If our current stack is in vmalloc space and isn't
- 			 * mapped in the new pgd, we'll double-fault.  Forcibly
- 			 * map it.
- 			 */
- 			sync_current_stack_to_mm(next);
- 		}
-=20
  		/*
  		 * Stop remote flushes for the previous mm.
  		 * Skip kernel threads; we never send init_mm TLB flushing IPIs,

--Sig_/hl.C9T28t6O0frUX+OSEIhN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7LpksACgkQAVBC80lX
0GyNkAf9GICn1Mww2MmQEZQxmyyal+SdgjHa10MPbAYeaJFPPVJoPnFdn47rWrg/
c/z9fxZuXiv2bL2yjOJEcF0/JT1BJXaYZzJid6RiI1ooXLcw+9RsSZHBZAnTn1Sg
aKufTGdRA8skpFCalDJ4q1zaYd6EiniI2cgLpJtVQK4ktnjDRcKNSUx/5MMFqUCP
5PXLpNXqpsoJSx2bY3db6kBLbFBoCEt1LBYZGXW8UI2rYzi34PiF6kh8m2XBWPSV
PoObe9QQML1LqUSd79xmtMSZqw6McNI+RCq2aM25g8XKtNGN8RkxraSO8+kYX6rr
cQbmeIJXKdWRQnV91ZbzzseI1ut9UA==
=Whvo
-----END PGP SIGNATURE-----

--Sig_/hl.C9T28t6O0frUX+OSEIhN--
