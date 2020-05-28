Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD91E5BBA
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 11:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgE1JWT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 05:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbgE1JWT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 05:22:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7C7C05BD1E;
        Thu, 28 May 2020 02:22:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xhzm2Lltz9sSJ;
        Thu, 28 May 2020 19:22:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590657735;
        bh=Fp4GVOzcbEnK6RqBJSixgdXUegD8+m1wTRF4rLXA8uE=;
        h=Date:From:To:Cc:Subject:From;
        b=ZOH/Rv4/V12lXoLDkgggMxYq4i04upO/0MpPYwMvwW0p0reAI1zM5fpKiqif4TPIx
         Ly9n6fV3ys7GFE2dAF93e7HwFy6AgTWulXeQj3o18jIqtQsUp2T3bzyuVj/xvT+/L2
         WA4n5Uwm/hMYjNTa0LT7UIiudY0HL90mDFPyiBBswOWvGqT2651emvERRW9GA41A0M
         tc/esK+byQK7h7WtwnRHbf+e7xUs+Y5t2wU+12vQgY9NCfSHqXqDRxElwxSbMa85gN
         2tGYYWRCHP6i2eNTjMjV/qTf+edMI8CLuNzedg4ChzUzm9R0/+ool2r4OAdvVbO/0E
         bd4HHCqeDuxQA==
Date:   Thu, 28 May 2020 19:22:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zong Li <zong.li@sifive.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the rsic-v
 tree
Message-ID: <20200528192211.2449bd4f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G4jwG.GiBQmy5HOToZ+j._7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/G4jwG.GiBQmy5HOToZ+j._7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  b151fefd23b7 ("riscv: sort select statements alphanumerically")

from the rsic-v tree and commits:

  e8d3552c4f20 ("mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option")
  4d01b8e6220f ("riscv: support DEBUG_WX")

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

diff --cc arch/riscv/Kconfig
index de5c95119de9,68418201734a..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -12,47 -12,29 +12,47 @@@ config 32BI
 =20
  config RISCV
  	def_bool y
 -	select OF
 -	select OF_EARLY_FLATTREE
 -	select OF_IRQ
  	select ARCH_HAS_BINFMT_FLAT
 +	select ARCH_HAS_DEBUG_VIRTUAL if MMU
+ 	select ARCH_HAS_DEBUG_WX
 +	select ARCH_HAS_GCOV_PROFILE_ALL
 +	select ARCH_HAS_GIGANTIC_PAGE
 +	select ARCH_HAS_MMIOWB
 +	select ARCH_HAS_PTE_SPECIAL
 +	select ARCH_HAS_SET_DIRECT_MAP
 +	select ARCH_HAS_SET_MEMORY
 +	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
 +	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
  	select ARCH_WANT_FRAME_POINTERS
 +	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
  	select CLONE_BACKWARDS
  	select COMMON_CLK
 +	select EDAC_SUPPORT
 +	select GENERIC_ARCH_TOPOLOGY if SMP
 +	select GENERIC_ATOMIC64 if !64BIT
  	select GENERIC_CLOCKEVENTS
 +	select GENERIC_IOREMAP
 +	select GENERIC_IRQ_MULTI_HANDLER
  	select GENERIC_IRQ_SHOW
  	select GENERIC_PCI_IOMAP
 +	select GENERIC_PTDUMP if MMU
  	select GENERIC_SCHED_CLOCK
 +	select GENERIC_SMP_IDLE_THREAD
  	select GENERIC_STRNCPY_FROM_USER if MMU
  	select GENERIC_STRNLEN_USER if MMU
 -	select GENERIC_SMP_IDLE_THREAD
 -	select GENERIC_ATOMIC64 if !64BIT
 -	select GENERIC_IOREMAP
 -	select GENERIC_PTDUMP if MMU
  	select HAVE_ARCH_AUDITSYSCALL
 +	select HAVE_ARCH_KASAN if MMU && 64BIT
 +	select HAVE_ARCH_KGDB
 +	select HAVE_ARCH_KGDB_QXFER_PKT
 +	select HAVE_ARCH_MMAP_RND_BITS if MMU
  	select HAVE_ARCH_SECCOMP_FILTER
 +	select HAVE_ARCH_TRACEHOOK
  	select HAVE_ASM_MODVERSIONS
 +	select HAVE_COPY_THREAD_TLS
  	select HAVE_DMA_CONTIGUOUS if MMU
 +	select HAVE_EBPF_JIT if MMU
  	select HAVE_FUTEX_CMPXCHG if FUTEX
- 	select HAVE_MEMBLOCK_NODE_MAP
 +	select HAVE_PCI
  	select HAVE_PERF_EVENTS
  	select HAVE_PERF_REGS
  	select HAVE_PERF_USER_STACK_DUMP

--Sig_/G4jwG.GiBQmy5HOToZ+j._7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PgsMACgkQAVBC80lX
0GyzTggAilHQ0D6JscPlzKcd95bmH2hEEHQSF1YaSsfdjhbF6j+TmfRDTLA64zKr
pslx5bbBTdLZQeYTOgmZCJim3mCIBRITsfiyOnetcGLN5G70oOrI6jpf3rHy5rH0
zCcQ6xf77v1dcMHNL8L0GOtFlGrQNQo19/LI9lhZSDH2Sxt/vjPOIQAImZ2/PrBu
S84YvMUnc65t3hpIhDE0PbkMULQ0pjg1eiFAhuaFvj4ojyGY2hvaOSXfbIfBYVNK
XxP1jc2MLyS19DEGuBA+yjFbjhqdwGdHcCf1xwRF+p1Krpf6EXLSQr/5FPAc60yG
ESHAEKrd3LqMebqLW14ZtheXqN21Rw==
=0l/H
-----END PGP SIGNATURE-----

--Sig_/G4jwG.GiBQmy5HOToZ+j._7--
