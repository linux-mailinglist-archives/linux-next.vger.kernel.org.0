Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D014425CC
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 03:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhKBDAC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 23:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhKBDAC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 23:00:02 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF92CC061714;
        Mon,  1 Nov 2021 19:57:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjvhL18PGz4xYy;
        Tue,  2 Nov 2021 13:57:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635821845;
        bh=pidXdGv0bM9++nTq59bGZx+P+sggoPMMZ7SzMRbYA1g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kJNd0hvcFhu6mdep32E2aU4iMNUm9c7YmvgsWRVSvzMabmATdiKs5umWVjFt0lz/T
         WTYHAMZpJmrTvKTBC0fkZrC/aoWmZXd/HN8lBPAmWT+0K30iII6oLk/jYJeMpQ9MW3
         sj9eQdjoVwxVFNHj3yFP0rktqBZCMVNMlHsKLWc6dYd7eSE74q+FMIf0fxPIr1A6d2
         EPnUeT+caTxyckO9SklgzHdXnIJkPqGSLvrZFfUOrTkxRK8C5wgYBW9OX/B/EqdCi9
         HwyiZuKIeZylKYtyeOpHeEc/6LNJBKyRlbnpPhw3TQs0URtCNqImih482nhi37tneV
         5jBj/LkzVbZ0g==
Date:   Tue, 2 Nov 2021 13:57:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Message-ID: <20211102135719.2011c55f@canb.auug.org.au>
In-Reply-To: <20211021123527.29ec17c5@canb.auug.org.au>
References: <20211021123527.29ec17c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lx+ECnxu0QLG73E5vMAWkJ.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Lx+ECnxu0QLG73E5vMAWkJ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 21 Oct 2021 12:35:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/include/asm/fpu/api.h
>=20
> between commit:
>=20
>   00ecd5401349 ("iommu/vt-d: Clean up unused PASID updating functions")
>=20
> from the iommu tree and commits:
>=20
>   a0ff0611c2fb ("x86/fpu: Move KVMs FPU swapping to FPU core")
>   ea4d6938d4c0 ("x86/fpu: Replace KVMs home brewed FPU copy from user")
>   90489f1dee8b ("x86/fpu: Move fpstate functions to api.h")
>   0ae67cc34f76 ("x86/fpu: Remove internal.h dependency from fpu/signal.h")
>   6415bb809263 ("x86/fpu: Mop up the internal.h leftovers")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/x86/include/asm/fpu/api.h
> index ca4d0dee1ecd,9263d708dff9..000000000000
> --- a/arch/x86/include/asm/fpu/api.h
> +++ b/arch/x86/include/asm/fpu/api.h
> @@@ -106,4 -108,34 +108,32 @@@ extern int cpu_has_xfeatures(u64 xfeatu
>    */
>   #define PASID_DISABLED	0
>  =20
>  -static inline void update_pasid(void) { }
>  -
> + /* Trap handling */
> + extern int  fpu__exception_code(struct fpu *fpu, int trap_nr);
> + extern void fpu_sync_fpstate(struct fpu *fpu);
> + extern void fpu_reset_from_exception_fixup(void);
> +=20
> + /* Boot, hotplug and resume */
> + extern void fpu__init_cpu(void);
> + extern void fpu__init_system(struct cpuinfo_x86 *c);
> + extern void fpu__init_check_bugs(void);
> + extern void fpu__resume_cpu(void);
> +=20
> + #ifdef CONFIG_MATH_EMULATION
> + extern void fpstate_init_soft(struct swregs_state *soft);
> + #else
> + static inline void fpstate_init_soft(struct swregs_state *soft) {}
> + #endif
> +=20
> + /* State tracking */
> + DECLARE_PER_CPU(struct fpu *, fpu_fpregs_owner_ctx);
> +=20
> + /* fpstate-related functions which are exported to KVM */
> + extern void fpu_init_fpstate_user(struct fpu *fpu);
> +=20
> + /* KVM specific functions */
> + extern void fpu_swap_kvm_fpu(struct fpu *save, struct fpu *rstor, u64 r=
estore_mask);
> +=20
> + extern int fpu_copy_kvm_uabi_to_fpstate(struct fpu *fpu, const void *bu=
f, u64 xcr0, u32 *pkru);
> +=20
>   #endif /* _ASM_X86_FPU_API_H */

This is now a conflict between Linus' tree and the iommu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Lx+ECnxu0QLG73E5vMAWkJ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGAqQ8ACgkQAVBC80lX
0GzPagf/SYMl07QLjjGppqLnqgxWaUL44KHx/vZaP2G/563ecCwLDrrCOot8Jj+r
wn4F2MItBcs/Sr4zMfSG1MsR5IeCYlYl8WJS5dWtzohbL31+ZwNx9wjGhit/paCw
E4r3z/ytkJCN8jgTCsk+GMryNAq/yUPjRnag/1FROxYkaE3vhnAwUpnzZvXLSNS2
jAR0zBYnZslBku8QVJRPmgoPHyEQjFiSi1253u0kDDK5Du+epSUnwVuY+nK8VWcx
p+GPQGqnWBOOKzZ5v/pE7sO4HLrhbfdG5wWklco59jTLWrum1sJ9ChHzrAsHWITT
w1bD0XT09Rai2JyR9aiwVPW64oatVA==
=1z7j
-----END PGP SIGNATURE-----

--Sig_/Lx+ECnxu0QLG73E5vMAWkJ.--
