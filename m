Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787ED3A7271
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 01:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhFNX2V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 19:28:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229649AbhFNX2V (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Jun 2021 19:28:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3ndM2Z21z9sW7;
        Tue, 15 Jun 2021 09:26:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623713176;
        bh=t6ATnoOYPpJMGmFo2AhsznoFooeXAebu8YAy2+PmRf4=;
        h=Date:From:To:Cc:Subject:From;
        b=hlHYPDkJ9U1VK5YsUTN/MHCDzPVyTz8m+GWsBoOYXQLj6GNC7eQz8tWbvwHzbNslG
         G4UObBcyDtM6WQhJHq6CBmh/uFkYED+RMC+BcY4HxmNnR73YUDmNRbe5YfdJF9VaMD
         4vmUrS4/Y/3r+XeoZLM5Kh4tl2XpbO+qVNo+JAgByUwVL1ZXpfmnQeSM0TK9hZ8Kpa
         UIP+WTW0l5ilxFMaeyzRdcOe1cAX+so6wxZXjstOaryPrjo4EuZTOvUT/F+RvoiNTC
         PsshRp1TCji6ThCl7XfpVKjVCYeN88ds9V4yVgwH8gxIsG6T2SWG4qQMgj8J5lGrb5
         ry3ucflahNDxg==
Date:   Tue, 15 Jun 2021 09:26:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Jisheng Zhang <jszhang@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20210615092614.2adc91af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_bx4Ib2ZuFtz2k.2p9MMZOB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_bx4Ib2ZuFtz2k.2p9MMZOB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  42e0e0b453bc ("riscv: code patching only works on !XIP_KERNEL")

from Linus' tree and commits:

  3332f4190674 ("riscv: mremap speedup - enable HAVE_MOVE_PUD and HAVE_MOVE=
_PMD")
  14512690a165 ("riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT")

from the risc-v tree.

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
index 18ec0f9bb8d5,227033595994..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -61,11 -60,12 +61,12 @@@ config RISC
  	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
  	select HANDLE_DOMAIN_IRQ
  	select HAVE_ARCH_AUDITSYSCALL
+ 	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
 -	select HAVE_ARCH_JUMP_LABEL
 -	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 +	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
 +	select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
  	select HAVE_ARCH_KASAN if MMU && 64BIT
  	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
 -	select HAVE_ARCH_KGDB
 +	select HAVE_ARCH_KGDB if !XIP_KERNEL
  	select HAVE_ARCH_KGDB_QXFER_PKT
  	select HAVE_ARCH_MMAP_RND_BITS if MMU
  	select HAVE_ARCH_SECCOMP_FILTER
@@@ -80,9 -81,11 +82,11 @@@
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

--Sig_/_bx4Ib2ZuFtz2k.2p9MMZOB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDH5ZYACgkQAVBC80lX
0GwLYwgAjT/kEjzysOIaR0F47ozyxwFQnwcWbCWU2p1Plzmo0/6t4wGzznrNNbAK
spUeP8u1TQWt/HVC/TkT/GkSvGss6LmSCm5l8WY1+MzvTw43nFwqZHZkhTrLyKCv
IUGTsjUcPwl+KO+LkphpYbsGTknnswNhXthAMNi4OS4DP1+NDmeLzFymNzYAmrXE
jcX4XhG0LPO6UQIx0ZJz02Jqxg9utYBhwLSO+WFxsqLMN8NTr9xfgHOym7HG+qiu
yPOcURkeJVhlL0MfCT1wu951vDm+wNherOTcY/BJVi2bI8NUlAXHGCg1IGQrxYTL
7qHVwWVLdaeHS4Q//POUi0kqQCFvxA==
=O1qM
-----END PGP SIGNATURE-----

--Sig_/_bx4Ib2ZuFtz2k.2p9MMZOB--
