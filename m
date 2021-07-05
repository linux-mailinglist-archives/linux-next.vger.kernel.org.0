Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EBE3BC41A
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 01:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhGEXey (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 19:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhGEXex (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2021 19:34:53 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC5FC061574;
        Mon,  5 Jul 2021 16:32:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GJhmQ5HGgz9sX1;
        Tue,  6 Jul 2021 09:32:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625527931;
        bh=DCzoFW4nPHTJDqTMPXUIpmwAYwoayEBpKKlwUbAjZX4=;
        h=Date:From:To:Cc:Subject:From;
        b=ayTrbWwLRKNRXrPoo900Nk+RAlnpMT71YeBrBGtRWb+v1z0Xkz1YSAz7KvaerMc2e
         sKJNULg8aU2rQsB3m39oz95ipMMAH03YIKoSVG6FpjIHJ5cnRnBEGrc/q6xDlpCTRm
         D8g85hwZLaGbR5pQG0SP9ftYS43ogodBBN/mvKMo6SmmkyOidhG+HIUvwsTo4wSqeQ
         HWN1UHzfjRInEbu0tXfmJkJSphCtyNmEL9kYDXT7X4nDwgSg7LOT7/4jnpnmQ7sDUd
         o91Vb6017+6wNhGXAhX3KoOHVwIG/py9fNjBL2ADV5XfDKtZD0mU57gT+EhRvHTyaN
         j2se6tQHStIFA==
Date:   Tue, 6 Jul 2021 09:32:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Nanyong Sun <sunnanyong@huawei.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20210706093205.446f150a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SSamkxRfta8Tue1RUFCOmnj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SSamkxRfta8Tue1RUFCOmnj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Kconfig

between commits:

  42e0e0b453bc ("riscv: code patching only works on !XIP_KERNEL")
  63703f37aa09 ("mm: generalize ZONE_[DMA|DMA32]")

from Linus' tree and commits:

  e88b333142e4 ("riscv: mm: add THP support on 64-bit")
  3332f4190674 ("riscv: mremap speedup - enable HAVE_MOVE_PUD and HAVE_MOVE=
_PMD")
  7fa865f5640a ("riscv: TRANSPARENT_HUGEPAGE: depends on MMU")
  47513f243b45 ("riscv: Enable KFENCE for riscv64")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

N.B. The new select of HAVE_ARCH_TRANSPARENT_HUGEPAGE is out of order :-(

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/Kconfig
index 469a70bd8da6,7304278dbbe9..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -61,11 -60,12 +61,12 @@@ config RISC
  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
  	select HANDLE_DOMAIN_IRQ
  	select HAVE_ARCH_AUDITSYSCALL
 -	select HAVE_ARCH_JUMP_LABEL
 -	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 +	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 +	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
  	select HAVE_ARCH_KASAN if MMU && 64BIT
  	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
+ 	select HAVE_ARCH_KFENCE if MMU && 64BIT
 -	select HAVE_ARCH_KGDB
 +	select HAVE_ARCH_KGDB if !XIP_KERNEL
  	select HAVE_ARCH_KGDB_QXFER_PKT
  	select HAVE_ARCH_MMAP_RND_BITS if MMU
  	select HAVE_ARCH_SECCOMP_FILTER
@@@ -80,9 -80,11 +81,11 @@@
  	select HAVE_GCC_PLUGINS
  	select HAVE_GENERIC_VDSO if MMU && 64BIT
  	select HAVE_IRQ_TIME_ACCOUNTING
 -	select HAVE_KPROBES
 -	select HAVE_KPROBES_ON_FTRACE
 -	select HAVE_KRETPROBES
 +	select HAVE_KPROBES if !XIP_KERNEL
 +	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 +	select HAVE_KRETPROBES if !XIP_KERNEL
+ 	select HAVE_MOVE_PMD
+ 	select HAVE_MOVE_PUD
  	select HAVE_PCI
  	select HAVE_PERF_EVENTS
  	select HAVE_PERF_REGS
@@@ -104,7 -106,7 +107,8 @@@
  	select SYSCTL_EXCEPTION_TRACE
  	select THREAD_INFO_IN_TASK
  	select UACCESS_MEMCPY if !MMU
 +	select ZONE_DMA32 if 64BIT
+ 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 =20
  config ARCH_MMAP_RND_BITS_MIN
  	default 18 if 64BIT

--Sig_/SSamkxRfta8Tue1RUFCOmnj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDjlnUACgkQAVBC80lX
0GzeIgf+Ixu3a5ZI5RLsaYyxUsTidHWc4jyTiwA108TfZszzBIciEnzusz3+peU/
42e7DQKVMwPsalAMLxOn+MbjyylaVQpuXlcRirfodVpc7yhfptyK621ccDKOgJVZ
8ZvStmRMQILQQCnPBvPA3itRg9DpwttLmnwLlXmS0uK3p2wJyJDzlrR2jVt9oA0o
/fPp0rZqp/F8ITRbJ8Ylfj3ct5WI8a0MrBqpyjJWjKcwLr3FI30mEphx4BscvjiA
ehIg1BbfmaP5HgLQE+QQtRT0sS+mJj1NWjerzVlFHGZ1/QWLPK+Mx3IzKos79peE
V0TyAGKnC1Gt1yLDH0J5t2SSsTL7bQ==
=IDrv
-----END PGP SIGNATURE-----

--Sig_/SSamkxRfta8Tue1RUFCOmnj--
