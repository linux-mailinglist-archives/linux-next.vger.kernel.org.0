Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24FB16F5F3
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 04:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgBZDJr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 22:09:47 -0500
Received: from ozlabs.org ([203.11.71.1]:42819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727880AbgBZDJr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 22:09:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48S14R1GJtz9sRG;
        Wed, 26 Feb 2020 14:09:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582686583;
        bh=cqRHvWL2a9pRClRPp6kTFZI1jMlC1F0FT0QjK1SMZc0=;
        h=Date:From:To:Cc:Subject:From;
        b=lDqntfk29FCQ1aZQ2KUI/tVCan2qo2FDXTVf5W746RDIbrCXKmybT+kGMoCiPzDuo
         iT9uSbPFjwTehyNES5kaVYVxsKtqrFap7uggAjwArPFrU2z+dapxWB6dGUdaUZ4rKt
         zRbeo4H0KeBxe2rtLJwsmT0lW/M2ahefPkW/e0D0xaJ1N+RqqLtjJAOBXWPuNJ2Ypi
         CaOD5rN4g5ywsj7Aq0z1G9fYuJ5H4igo8Rfh0/GOPRsgo7THx+9tAGli+e+bBERu65
         XI190F0MKED9ngjkU6gL3+CydjpT3jY3lcL2MLIYkzRVZgbm9FtsvkiX9Xlj2EVtqP
         E4SLLLb+X1pBA==
Date:   Wed, 26 Feb 2020 14:09:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michal Simek <monstr@monstr.eu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the
 microblaze tree
Message-ID: <20200226140942.1a944ba9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TN6l1z6FOdpBmtF/m7NvSag";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TN6l1z6FOdpBmtF/m7NvSag
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/microblaze/include/asm/Kbuild

between commits:

  59d85c0a3696 ("microblaze: Remove architecture tlb.h and use generic one")
  7e8f54cd4e26 ("microblaze: Remove empty headers")

from the microblaze tree and commit:

  3ece10f6aa9e ("asm-generic: make more kernel-space headers mandatory")

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

diff --cc arch/microblaze/include/asm/Kbuild
index abb33619299b,f38696d2b462..000000000000
--- a/arch/microblaze/include/asm/Kbuild
+++ b/arch/microblaze/include/asm/Kbuild
@@@ -1,40 -1,8 +1,11 @@@
  # SPDX-License-Identifier: GPL-2.0
  generated-y +=3D syscall_table.h
- generic-y +=3D bitops.h
- generic-y +=3D bug.h
- generic-y +=3D bugs.h
- generic-y +=3D compat.h
- generic-y +=3D device.h
- generic-y +=3D div64.h
- generic-y +=3D dma-mapping.h
- generic-y +=3D emergency-restart.h
- generic-y +=3D exec.h
  generic-y +=3D extable.h
- generic-y +=3D fb.h
- generic-y +=3D hardirq.h
 +generic-y +=3D hw_irq.h
- generic-y +=3D irq_regs.h
- generic-y +=3D irq_work.h
- generic-y +=3D kdebug.h
- generic-y +=3D kmap_types.h
- generic-y +=3D kprobes.h
  generic-y +=3D kvm_para.h
- generic-y +=3D linkage.h
- generic-y +=3D local.h
  generic-y +=3D local64.h
  generic-y +=3D mcs_spinlock.h
- generic-y +=3D mm-arch-hooks.h
- generic-y +=3D mmiowb.h
  generic-y +=3D parport.h
- generic-y +=3D percpu.h
- generic-y +=3D preempt.h
- generic-y +=3D serial.h
- generic-y +=3D shmparam.h
  generic-y +=3D syscalls.h
 +generic-y +=3D tlb.h
- generic-y +=3D topology.h
- generic-y +=3D trace_clock.h
 +generic-y +=3D user.h
- generic-y +=3D vga.h
- generic-y +=3D word-at-a-time.h
- generic-y +=3D xor.h

--Sig_/TN6l1z6FOdpBmtF/m7NvSag
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5V4XYACgkQAVBC80lX
0GysUQf/VZIbMwy+46wMYpOWZqWyXQrIuaPllQdoVo91oXV46ymn+cowEcTLGiUy
YmM6K+RQ2DVPcc3M3PKTdfHVxYxpflGMe45YClJLLPmsMjjnXvEIA59U4BmZ+qg9
c11yW0O+0cVxLPUbq8DTt2bhxGhEedghR3W8mJQgIvskSl9F785+yuEE6Tdgc3dp
KZ2N2m8N/dmZNdyfdez32LF7xjvWWor37Bn6DVRoLq4ywNhpp60comsnqAUCsg1g
MkQ1fuRGHy2+s+ostIZqfKnFWopJ76UUeWeSE8iqGngPED8Cv69MKycX/k/MiroG
XOZioiU8KPquUmLTvcdgC7D9BC8SRw==
=m77t
-----END PGP SIGNATURE-----

--Sig_/TN6l1z6FOdpBmtF/m7NvSag--
