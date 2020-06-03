Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCD61EC879
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 06:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgFCEnp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 00:43:45 -0400
Received: from ozlabs.org ([203.11.71.1]:52363 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgFCEnp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 00:43:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cGWb6Brxz9sT5;
        Wed,  3 Jun 2020 14:43:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591159422;
        bh=Mk3mlNv5ncjMLLmKa1F7y9YLv1Gi+SeM3+erHH5trio=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cpR8WdgQzum7TOFZtXLbCCSqO6L1UaymSQb9jRQmDcimAYX/KXKGMyk7cQ7D9mB1t
         ROi2kgNkAHo4r7jL8g/tD2wejcZ/hIT8vY4yHWgC7jHxy8Tyjj5GgizviLQYjgXSI1
         BgjZlMflmlr0hx9nF/YiujeGq9phRitNYcu4+ob8WjcRs/lioUqpVkt6niawHtnyzL
         vVwt/DAyUPWvaeDyfHK5cJnUARXgzOPlo9udCIC2N2wRocVR6cwxxAfNDDV/YJCe/8
         0hxCO/6I+O/sfLg9zp4r3YnVWLaXg0s9304IqLdw+g8yRMQaaCE0ASjOKzziK7bPrU
         oJsDqGd9D8USw==
Date:   Wed, 3 Jun 2020 14:43:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joerg Roedel <jroedel@suse.de>,
        Balbir Singh <sblbir@amazon.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Message-ID: <20200603144339.108a09bf@canb.auug.org.au>
In-Reply-To: <20200525210443.0904d583@canb.auug.org.au>
References: <20200525210443.0904d583@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r2psUgh4iv3Rv.ZFfZy8EE+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r2psUgh4iv3Rv.ZFfZy8EE+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 May 2020 21:04:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/x86/mm/tlb.c
>=20
> between commit:
>=20
>   83ce56f712af ("x86/mm: Refactor cond_ibpb() to support other use cases")
>=20
> from the tip tree and commit:
>=20
>   36c8e34d03a1 ("x86/mm: remove vmalloc faulting")
>=20
> from the akpm-current tree.
>=20
> diff --cc arch/x86/mm/tlb.c
> index c8524c506ab0,f3fe261e5936..000000000000
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@@ -345,48 -161,16 +345,20 @@@ void switch_mm(struct mm_struct *prev,=20
>   	local_irq_restore(flags);
>   }
>  =20
> - static void sync_current_stack_to_mm(struct mm_struct *mm)
> - {
> - 	unsigned long sp =3D current_stack_pointer;
> - 	pgd_t *pgd =3D pgd_offset(mm, sp);
> -=20
> - 	if (pgtable_l5_enabled()) {
> - 		if (unlikely(pgd_none(*pgd))) {
> - 			pgd_t *pgd_ref =3D pgd_offset_k(sp);
> -=20
> - 			set_pgd(pgd, *pgd_ref);
> - 		}
> - 	} else {
> - 		/*
> - 		 * "pgd" is faked.  The top level entries are "p4d"s, so sync
> - 		 * the p4d.  This compiles to approximately the same code as
> - 		 * the 5-level case.
> - 		 */
> - 		p4d_t *p4d =3D p4d_offset(pgd, sp);
> -=20
> - 		if (unlikely(p4d_none(*p4d))) {
> - 			pgd_t *pgd_ref =3D pgd_offset_k(sp);
> - 			p4d_t *p4d_ref =3D p4d_offset(pgd_ref, sp);
> -=20
> - 			set_p4d(p4d, *p4d_ref);
> - 		}
> - 	}
> - }
> -=20
>  -static inline unsigned long mm_mangle_tif_spec_ib(struct task_struct *n=
ext)
>  +static inline unsigned long mm_mangle_tif_spec_bits(struct task_struct =
*next)
>   {
>   	unsigned long next_tif =3D task_thread_info(next)->flags;
>  -	unsigned long ibpb =3D (next_tif >> TIF_SPEC_IB) & LAST_USER_MM_IBPB;
>  +	unsigned long spec_bits =3D (next_tif >> TIF_SPEC_IB) & LAST_USER_MM_S=
PEC_MASK;
>  =20
>  -	return (unsigned long)next->mm | ibpb;
>  +	BUILD_BUG_ON(TIF_SPEC_L1D_FLUSH !=3D TIF_SPEC_IB + 1);
>  +
>  +	return (unsigned long)next->mm | spec_bits;
>   }
>  =20
>  -static void cond_ibpb(struct task_struct *next)
>  +static void cond_mitigation(struct task_struct *next)
>   {
>  +	unsigned long prev_mm, next_mm;
>  +
>   	if (!next || !next->mm)
>   		return;
>  =20
> @@@ -587,20 -343,12 +559,11 @@@ void switch_mm_irqs_off(struct mm_struc
>   		need_flush =3D true;
>   	} else {
>   		/*
>  -		 * Avoid user/user BTB poisoning by flushing the branch
>  -		 * predictor when switching between processes. This stops
>  -		 * one process from doing Spectre-v2 attacks on another.
>  +		 * Apply process to process speculation vulnerability
>  +		 * mitigations if applicable.
>   		 */
>  -		cond_ibpb(tsk);
>  +		cond_mitigation(tsk);
>  =20
> - 		if (IS_ENABLED(CONFIG_VMAP_STACK)) {
> - 			/*
> - 			 * If our current stack is in vmalloc space and isn't
> - 			 * mapped in the new pgd, we'll double-fault.  Forcibly
> - 			 * map it.
> - 			 */
> - 			sync_current_stack_to_mm(next);
> - 		}
> -=20
>   		/*
>   		 * Stop remote flushes for the previous mm.
>   		 * Skip kernel threads; we never send init_mm TLB flushing IPIs,

This is now a conflict between commit

  94709049fb84 ("Merge branch 'akpm' (patches from Andrew)")

from Linus' tree and the above tip tree commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/r2psUgh4iv3Rv.ZFfZy8EE+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XKnsACgkQAVBC80lX
0GzenQgAn49b+i0imIshyXLFEfA/7vLb5kpFJ8JH22d73HtwAmZPR34pfaEES47R
3HLFukzA24FYLWf+L2Wc4L7WTVjVTL/JAZ0bcHezYHchojO2ePTcNuXghK9aBsB3
aYoqg6lbnCqxcxlC3SN5P8Sw+rynlpH7g3Kq3xG6l9kd69Sxs4NCcIdr3o3j6AvW
bz78pmpMQUFiE/AavZsjTK0zAkJqsbfHn0stNmzobcmY3GOe27SsLDNsBfHF/lBe
6ukIRRTHb/jkhpREkaYy1v/U+QUtDNGNl13Koomjo+nndtbdJXyTO+fSmr3R3Atq
0Izx87mjoVbFFs6yHqig37SbC6mvtQ==
=KNZW
-----END PGP SIGNATURE-----

--Sig_/r2psUgh4iv3Rv.ZFfZy8EE+--
