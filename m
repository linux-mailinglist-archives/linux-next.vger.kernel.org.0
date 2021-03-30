Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB5934F462
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 00:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbhC3Wkr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 18:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbhC3Wkn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 18:40:43 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9E4C061574;
        Tue, 30 Mar 2021 15:40:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F94Cl2HCYz9sVm;
        Wed, 31 Mar 2021 09:40:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617144037;
        bh=ywPqiTvcnwI/MyxIao85KxRdULFyXrIiThWT8rsP/3M=;
        h=Date:From:To:Cc:Subject:From;
        b=uDqfd69pGE0c9EWZ25CzNpv0L3hIXU/Jx+A29WDrs2A6uAx5XbkfA9AlENpcqmaJ3
         TYz6fihOlNvVwUZMD2E9yqBO2Tdaklq4HeY85xOIDxB6l2YDw8wBNsKP8GJ84Auhzc
         +RZMEsjMFGzbp9d+/nnmCuwYPiQbmckXGpkBl+YfeMpf4WsEL5eDqtuOrFxmyWcqzE
         kGPOjLmfhY7j0T0mFWLvIzjYB2A2UBr+YzMm7uUK/Q4IIarRuGXE92muMovtN4wp00
         nRHZ2bQ8+Vt7rc0st/kKaritqKKXW+bPGW6wvAHQ2u7KE26l7Lj8CEXSQKoqai0cfh
         qazcmuPqn30sw==
Date:   Wed, 31 Mar 2021 09:40:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Alexandre Ghiti <alex@ghiti.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20210331094034.7481acca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/88.qBoJwmNC3H1waBmbfHkL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/88.qBoJwmNC3H1waBmbfHkL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/mm/kasan_init.c

between commits:

  f3773dd031de ("riscv: Ensure page table writes are flushed when initializ=
ing KASAN vmalloc")
  78947bdfd752 ("RISC-V: kasan: Declare kasan_shallow_populate() static")

from Linus' tree and commit:

  2da073c19641 ("riscv: Cleanup KASAN_VMALLOC support")

from the risc-v tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/mm/kasan_init.c
index 4f85c6d0ddf8,2c39f0386673..000000000000
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@@ -153,44 -141,31 +141,33 @@@ static void __init kasan_populate(void=20
 =20
  	local_flush_tlb_all();
  	memset(start, KASAN_SHADOW_INIT, end - start);
  }
 =20
+ static void __init kasan_shallow_populate_pgd(unsigned long vaddr, unsign=
ed long end)
+ {
+ 	unsigned long next;
+ 	void *p;
+ 	pgd_t *pgd_k =3D pgd_offset_k(vaddr);
+=20
+ 	do {
+ 		next =3D pgd_addr_end(vaddr, end);
+ 		if (pgd_page_vaddr(*pgd_k) =3D=3D (unsigned long)lm_alias(kasan_early_s=
hadow_pmd)) {
+ 			p =3D memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+ 			set_pgd(pgd_k, pfn_pgd(PFN_DOWN(__pa(p)), PAGE_TABLE));
+ 		}
+ 	} while (pgd_k++, vaddr =3D next, vaddr !=3D end);
+ }
+=20
  static void __init kasan_shallow_populate(void *start, void *end)
  {
  	unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
  	unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
- 	unsigned long pfn;
- 	int index;
- 	void *p;
- 	pud_t *pud_dir, *pud_k;
- 	pgd_t *pgd_dir, *pgd_k;
- 	p4d_t *p4d_dir, *p4d_k;
-=20
- 	while (vaddr < vend) {
- 		index =3D pgd_index(vaddr);
- 		pfn =3D csr_read(CSR_SATP) & SATP_PPN;
- 		pgd_dir =3D (pgd_t *)pfn_to_virt(pfn) + index;
- 		pgd_k =3D init_mm.pgd + index;
- 		pgd_dir =3D pgd_offset_k(vaddr);
- 		set_pgd(pgd_dir, *pgd_k);
-=20
- 		p4d_dir =3D p4d_offset(pgd_dir, vaddr);
- 		p4d_k  =3D p4d_offset(pgd_k, vaddr);
-=20
- 		vaddr =3D (vaddr + PUD_SIZE) & PUD_MASK;
- 		pud_dir =3D pud_offset(p4d_dir, vaddr);
- 		pud_k =3D pud_offset(p4d_k, vaddr);
-=20
- 		if (pud_present(*pud_dir)) {
- 			p =3D early_alloc(PAGE_SIZE, NUMA_NO_NODE);
- 			pud_populate(&init_mm, pud_dir, p);
- 		}
- 		vaddr +=3D PAGE_SIZE;
- 	}
+=20
+ 	kasan_shallow_populate_pgd(vaddr, vend);
 +
 +	local_flush_tlb_all();
  }
 =20
  void __init kasan_init(void)
  {
  	phys_addr_t _start, _end;

--Sig_/88.qBoJwmNC3H1waBmbfHkL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBjqOIACgkQAVBC80lX
0GwlbAf/W9WUrtXNPDQ2CqWk0OBDYzkAncOrSR/LzH4u5oDFwPyLLNe2nLUE2Tx9
c17LittaibtJzijA7ZSPzVhbGSTqYSAohRunT355AIKZHfrPEND7n0WcHkpSMVLr
zF0nC7UB9hkStKksp0Y16jBSjElg5EHNQq8IbYdHOO1w6SuosDArHSGQMAZ5L5wf
ZbaiKnuvE3Gmq53PQNu5caWp8GQmyp0U6+3fMdGTPufiMpc1ai+Tr+kD6OhpZD/h
NFAvmrHtnhVwyBIKO5/64l8W0wDtYDbQFHQQMUutMtKWjiGCNMu3p5ngOdhQr+Rs
UGk+Xhp1emw+xMOx8Ub1GnyhTC3I4w==
=Pxes
-----END PGP SIGNATURE-----

--Sig_/88.qBoJwmNC3H1waBmbfHkL--
