Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D5C424D43
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 08:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhJGG3N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 02:29:13 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56395 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbhJGG3N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 02:29:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQ1ZX3qdCz4xR9;
        Thu,  7 Oct 2021 17:27:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633588038;
        bh=zjtDx4zHNJR4VbDkoPY/89x/X8qlLQcoip/asQkFUp8=;
        h=Date:From:To:Cc:Subject:From;
        b=WePKzxnlQ/lKg3Si8MMFZNKK/3KX6HjCPupK3dezwjCKbzbAfYXzA+MC+fpggPv1z
         3v+2cPaFjCAwonQBV+T38+NusmXEaGG7Nl3XCgLujzatDaQFq/n/zKAohno/tc2+4Q
         UMPfaOOhwDc9iEqlc7jPRE6w1Ds7kAoek1db6HGIzVwUZnZ8tLRozBhMhTdBvelPFJ
         H84GKFwevqp9Rp/n9IY8zfnbGaRi+Y7f0FnicEUPQxePLjY/0kOTDlZP+fGr6o2CaR
         28q0dKS/TG66PSiky3048mHIvjgt903mpwYl42sTpnzVm5ZuAbXZjfU7q8JGLHinoB
         npqjctXoIUGWA==
Date:   Thu, 7 Oct 2021 17:27:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20211007172713.2b8ffca0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RHZ9LbH/JA=oRFmb4GCgR.i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RHZ9LbH/JA=oRFmb4GCgR.i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  include/linux/sched/mm.h
  kernel/sched/core.c

between commit:

  8d491de6edc2 ("sched: Move mmdrop to RCU on RT")

from the tip tree and commits:

  5a21ba83ddb2 ("lazy tlb: introduce lazy mm refcount helper functions")
  ade2ef2cb563 ("lazy tlb: allow lazy tlb mm refcounting to be configurable=
")

from the akpm-current tree.

I don't know if my merging of both these makes sense, but guidance
is welcome.

I fixed it up (see below, and used the latter version of kernel/sched/core.c
) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/sched/mm.h
index aca874d33fe6,fd6e4d14f477..000000000000
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@@ -49,35 -49,27 +49,56 @@@ static inline void mmdrop(struct mm_str
  		__mmdrop(mm);
  }
 =20
 +#ifdef CONFIG_PREEMPT_RT
 +/*
 + * RCU callback for delayed mm drop. Not strictly RCU, but call_rcu() is
 + * by far the least expensive way to do that.
 + */
 +static inline void __mmdrop_delayed(struct rcu_head *rhp)
 +{
 +	struct mm_struct *mm =3D container_of(rhp, struct mm_struct, delayed_dro=
p);
 +
 +	__mmdrop(mm);
 +}
 +
 +/*
 + * Invoked from finish_task_switch(). Delegates the heavy lifting on RT
 + * kernels via RCU.
 + */
 +static inline void mmdrop_sched(struct mm_struct *mm)
 +{
 +	/* Provides a full memory barrier. See mmdrop() */
 +	if (atomic_dec_and_test(&mm->mm_count))
 +		call_rcu(&mm->delayed_drop, __mmdrop_delayed);
 +}
 +#else
 +static inline void mmdrop_sched(struct mm_struct *mm)
 +{
 +	mmdrop(mm);
 +}
 +#endif
 +
+ /* Helpers for lazy TLB mm refcounting */
+ static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
+ {
+ 	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
+ 		mmgrab(mm);
+ }
+=20
+ static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
+ {
+ 	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
 -		mmdrop(mm);
++		mmdrop_sched(mm);
+ 	} else {
+ 		/*
+ 		 * mmdrop_lazy_tlb must provide a full memory barrier, see the
+ 		 * membarrier comment in finish_task_switch which relies on
+ 		 * this.
+ 		 */
+ 		smp_mb();
+ 	}
+ }
+=20
  /**
   * mmget() - Pin the address space associated with a &struct mm_struct.
   * @mm: The address space to pin.

--Sig_/RHZ9LbH/JA=oRFmb4GCgR.i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFek0EACgkQAVBC80lX
0GyPogf9ESZOk8MRUi5zZ0xXa/cPiX1hGaPZDOU+WJdyxvIalfhmQmY7QuU1cNpQ
E5b2RjUWcwiFf3K63Y9F9RrT/TVBEARx5QnFUKnnU0x1koRvy2mrcwaM31s10X7+
sMdAmEbhUCKB8BAGQ3vCOeKl2VQdJytUcGsMsyu8Mj61CKWHRrPxv0Cf4W0OT7B5
/7xDvFk+B1VoAmO8h4LIR2N6873MV3YTO1iq1EGy7lDA8zn6Ze+yo5xWEQBE/zOW
ugTZGZblVaAh3mQxii3H55qrRsiLVXjpgSVHtLNqDk8VS9XVXgAY5anfCUy7PbS4
4Hj0F9mhyd7UZCTUZn8zrPPywjbRRg==
=DCeU
-----END PGP SIGNATURE-----

--Sig_/RHZ9LbH/JA=oRFmb4GCgR.i--
