Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 881B5374C0C
	for <lists+linux-next@lfdr.de>; Thu,  6 May 2021 01:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhEEXoM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 May 2021 19:44:12 -0400
Received: from ozlabs.org ([203.11.71.1]:56849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229601AbhEEXoM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 May 2021 19:44:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FbCvN0vvqz9rx6;
        Thu,  6 May 2021 09:43:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620258193;
        bh=PbaNRl7xPq9bgj5Sa6DQB8u0DHHaIu0USpQCshLKhKk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J7G0BxD5PQNwa05TgccUsvg9SZOO9SMveMXBpmxkEEPDUb/P1wkA72/HgFTIn8J7W
         /euNfudRJ2brUHgk4U03WwKMKA5fmwQ7wEP+kwrpN5d8ID+TOqpB3jKHfOT5YpmyNJ
         tsfod3Wu9LnFP5LS8pjNN1qy9I5q03yi7PIorUMyj7R5LNZbTpd6r5nMSPe9yRhoj0
         FOa8nA0erAv66XXc4I+NlWbUNrtzruSpN3uGYSgyXGtdoC9A/VBCXiXUVaQqKclyd0
         U8/iXnwRJ+JdWy/FYpyI+zyIesetzi9iBa1y7DuVWKCsHiezZ29J5/v8qh+oB1dZC/
         kHHfUzK/E8gSA==
Date:   Thu, 6 May 2021 09:43:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Message-ID: <20210506094311.7f9b2500@canb.auug.org.au>
In-Reply-To: <20210505113959.43340f19@canb.auug.org.au>
References: <20210505113959.43340f19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_=zdsKjBwFPYIA7J+BROiyJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_=zdsKjBwFPYIA7J+BROiyJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 5 May 2021 11:39:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/powerpc/Kconfig
>=20
> between commit:
>=20
>   c6b05f4e233c ("powerpc/kconfig: Restore alphabetic order of the selects=
 under CONFIG_PPC")
>=20
> from the powerpc tree and commits:
>=20
>   fd7d5c273c43 ("mm: generalize HUGETLB_PAGE_SIZE_VARIABLE")
>   301ba77ae03c ("mm: generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/powerpc/Kconfig
> index ab17a56c3d10,d4333049b813..000000000000
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@@ -118,11 -118,10 +118,13 @@@ config PP
>   	# Please keep this list sorted alphabetically.
>   	#
>   	select ARCH_32BIT_OFF_T if PPC32
> + 	select ARCH_ENABLE_MEMORY_HOTPLUG
> + 	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  +	select ARCH_HAS_COPY_MC			if PPC64
>   	select ARCH_HAS_DEBUG_VIRTUAL
>  +	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  +	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> @@@ -163,8 -162,9 +165,8 @@@
>   	select BUILDTIME_TABLE_SORT
>   	select CLONE_BACKWARDS
>   	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
> - 	select DMA_OPS_BYPASS			if PPC64
>   	select DMA_OPS				if PPC64
> + 	select DMA_OPS_BYPASS			if PPC64
>  -	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC64 && PPC_PSERIES
>   	select DYNAMIC_FTRACE			if FUNCTION_TRACER
>   	select EDAC_ATOMIC_SCRUB
>   	select EDAC_SUPPORT
> @@@ -182,15 -181,12 +184,15 @@@
>   	select GENERIC_STRNCPY_FROM_USER
>   	select GENERIC_STRNLEN_USER
>   	select GENERIC_TIME_VSYSCALL
>  -	select GENERIC_GETTIMEOFDAY
>  +	select GENERIC_VDSO_TIME_NS
>   	select HAVE_ARCH_AUDITSYSCALL
> - 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>  +	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
> + 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>   	select HAVE_ARCH_JUMP_LABEL
>  +	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <=3D 14
>   	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <=3D 14
>  +	select HAVE_ARCH_KFENCE			if PPC32
>   	select HAVE_ARCH_KGDB
>   	select HAVE_ARCH_MMAP_RND_BITS
>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> @@@ -231,19 -227,23 +233,20 @@@
>   	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
>   	select HAVE_MOD_ARCH_SPECIFIC
>   	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>  -	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if (PPC64 && PPC_BOOK3S)
>  -	select HAVE_OPTPROBES			if PPC64
>  +	select HAVE_OPTPROBES
>   	select HAVE_PERF_EVENTS
>   	select HAVE_PERF_EVENTS_NMI		if PPC64
>  -	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENT=
S_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
>   	select HAVE_PERF_REGS
>   	select HAVE_PERF_USER_STACK_DUMP
>  -	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
>  -	select MMU_GATHER_RCU_TABLE_FREE
>  -	select MMU_GATHER_PAGE_SIZE
>   	select HAVE_REGS_AND_STACK_ACCESS_API
>  -	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
>  +	select HAVE_RELIABLE_STACKTRACE
>  +	select HAVE_RSEQ
>   	select HAVE_SOFTIRQ_ON_OWN_STACK
>  +	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-=
guard=3Dtls -mstack-protector-guard-reg=3Dr2)
>  +	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-=
guard=3Dtls -mstack-protector-guard-reg=3Dr13)
>   	select HAVE_SYSCALL_TRACEPOINTS
>   	select HAVE_VIRT_CPU_ACCOUNTING
>  -	select HAVE_IRQ_TIME_ACCOUNTING
>  -	select HAVE_RSEQ
> ++	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
>   	select IOMMU_HELPER			if PPC64
>   	select IRQ_DOMAIN
>   	select IRQ_FORCED_THREADING

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_=zdsKjBwFPYIA7J+BROiyJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCTLY8ACgkQAVBC80lX
0Gx5VAgAh1qjr8a37Dbt4WyzmMdz137RgU4LlAP/meLG4odEy0dtFbsQrHKWkaWH
JJCil+tSJWJBs8tYI1Oh9FVEYopl/O5m7zlqVS2cSzIptpYNKMe4+UAeKK8n73V0
ereni02KRrNwZwS6RWXFTQuwaORz/GxyZm8BG4iRLMVMMQHhbGd2g4+CYOBSKaFS
BvJyUW/c6giSK2TdNT2TzQ/w+pkun/k3me3bpRtjBKuHBimIa9MECHQFaQ+kwR+O
jfxRbrsL3v0pnD4KlSZW+fJrfTFylOeULay0QFGXT4NGHBdooGg4iXbxFxsicnWV
/IAn4/i66BKb1UENCicQ5Iq2z2bMPQ==
=y7W6
-----END PGP SIGNATURE-----

--Sig_/_=zdsKjBwFPYIA7J+BROiyJ--
