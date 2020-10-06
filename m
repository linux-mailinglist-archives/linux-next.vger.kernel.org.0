Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EE9284A65
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 12:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgJFKjM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 06:39:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45871 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJFKjM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 06:39:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5DV36053z9ryj;
        Tue,  6 Oct 2020 21:39:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601980748;
        bh=88JnpQ7C+gTPN1c0ndqW0e0KCBQd0VM16IPzZbRxXPo=;
        h=Date:From:To:Cc:Subject:From;
        b=Wm0KbNw5+u9sHKyC5Qs6bZAvuZS9Ybh1uu/74QvtQ5SxJewQ2C/LU+JcArcUI8oJr
         QxZptoPonhHfDqvic4+sghrMUTdsnKYKy264fMc4uHEV60cyi7mOAzmKp7WkOAo8tm
         zzLeyq4nK1Ez0x6ShcSja5PpCXyjKozLEXnNZRXm4FiW8enLhNFYvM6zrpdaf2cNPh
         R4cy67ANoBHm6TzfU0KEWCwomwFdAcTj0Kw+Orx1RE2THWIRbZ8awccUbJFF/wHzdh
         1dNUb4ic++lBq1rOCdvH+B/KHCHHkYf4lSvgVBkMSUXb/0Cx1FevlrgRFRRe7r8AKk
         N8+EMwDMHTX5A==
Date:   Tue, 6 Oct 2020 21:39:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Atish Patra <atish.patra@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20201006213906.08554ae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QuaTwP8UxkmkDMdTUVhTZAO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QuaTwP8UxkmkDMdTUVhTZAO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/mm/init.c

between commit:

  c29c38fa2a8b ("RISC-V: Remove any memblock representing unusable memory a=
rea")

from the risc-v tree and commits:

  3520eeb79142 ("arch, drivers: replace for_each_membock() with for_each_me=
m_range()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

It also looks like there is a bug in that risc-v tree patch: mem_start
is used uninitialised in setup_bootmem().
--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/mm/init.c
index 812a48c91a95,bc72bb6b5fe0..000000000000
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@@ -152,20 -141,25 +152,20 @@@ disable
  }
  #endif /* CONFIG_BLK_DEV_INITRD */
 =20
 -static phys_addr_t dtb_early_pa __initdata;
 -
  void __init setup_bootmem(void)
  {
- 	struct memblock_region *reg;
- 	phys_addr_t mem_start, end =3D 0;
 -	phys_addr_t mem_size =3D 0;
 -	phys_addr_t total_mem =3D 0;
+ 	phys_addr_t mem_start, start, end =3D 0;
  	phys_addr_t vmlinux_end =3D __pa_symbol(&_end);
  	phys_addr_t vmlinux_start =3D __pa_symbol(&_start);
+ 	u64 i;
 =20
  	/* Find the memory region containing the kernel */
- 	for_each_memblock(memory, reg) {
- 		end =3D reg->base + reg->size;
+ 	for_each_mem_range(i, &start, &end) {
+ 		phys_addr_t size =3D end - start;
 -		if (!total_mem)
 +		if (!mem_start)
- 			mem_start =3D reg->base;
- 		if (reg->base <=3D vmlinux_start && vmlinux_end <=3D end)
- 			BUG_ON(reg->size =3D=3D 0);
+ 			mem_start =3D start;
+ 		if (start <=3D vmlinux_start && vmlinux_end <=3D end)
+ 			BUG_ON(size =3D=3D 0);
 -		total_mem =3D total_mem + size;
  	}
 =20
  	/*
@@@ -542,18 -455,11 +533,18 @@@ static void __init setup_vm_final(void
  {
  	uintptr_t va, map_size;
  	phys_addr_t pa, start, end;
- 	struct memblock_region *reg;
+ 	u64 i;
 =20
 -	/* Set mmu_enabled flag */
 -	mmu_enabled =3D true;
 -
 +	/**
 +	 * MMU is enabled at this point. But page table setup is not complete ye=
t.
 +	 * fixmap page table alloc functions should be used at this point
 +	 */
 +	pt_ops.alloc_pte =3D alloc_pte_fixmap;
 +	pt_ops.get_pte_virt =3D get_pte_virt_fixmap;
 +#ifndef __PAGETABLE_PMD_FOLDED
 +	pt_ops.alloc_pmd =3D alloc_pmd_fixmap;
 +	pt_ops.get_pmd_virt =3D get_pmd_virt_fixmap;
 +#endif
  	/* Setup swapper PGD for fixmap */
  	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
  			   __pa_symbol(fixmap_pgd_next),

--Sig_/QuaTwP8UxkmkDMdTUVhTZAO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98SUoACgkQAVBC80lX
0GzL2Qf6A/4fOgFUcUt8QAulXpyS4Qe60EepexdyNkCLlcrctE3HdI4fZNUxPrge
ch84X2RyXhM1boNXoUhDOXQWuorreWkzJai75GSE/1G6o4rymjLI5YwmHoIWRzj+
jhpIWxtPfVEmBfOP6duNry+g0le+PEU5HcOA5AgLO9Qaf2d/l5VbtyZE+OKMyHmD
p1QijUc7H/9XRiC4TsifNFKm7WN8QMZGcw6ZU3FNNX7YZYVze4YxDIVj2zyKFZGk
/UTw8nkRPVTcgxcYR02UKKDIXuPtaU3i20uOOPngklVDaCbztvbbiWk9O0P8SU+E
xXYOn1a+/X5qunRCnyp24HiOWqKpeg==
=oWC7
-----END PGP SIGNATURE-----

--Sig_/QuaTwP8UxkmkDMdTUVhTZAO--
