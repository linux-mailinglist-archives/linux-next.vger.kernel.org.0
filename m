Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CE51E0414
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 02:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388603AbgEYAGB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 May 2020 20:06:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32873 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388149AbgEYAGA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 May 2020 20:06:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49VcnH5lthz9sRW;
        Mon, 25 May 2020 10:05:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590365158;
        bh=ZPoQ9H7598MG3VJm/FsLWVPvUIh344SeS7b3kjd5eTM=;
        h=Date:From:To:Cc:Subject:From;
        b=q9CZtlCub2egh6+STWYRlDd2jtOIHYsMrn4fohvYElcUkxyqH64pCobJv3wIpinNh
         X/I8bRUc7m37Hmi5tPchmxq75VFz/Vo+89KGPC/xSMTLb9yvKsGOpkZx9BhN/N/ZL0
         /sWIDNXx3JrZ3WFWp7mFqS7nqgQ7znbQ3fdNOV/YH4fhqwFCbYY98gCocpF5HhbyZA
         FA+ti1BetPeuSHSSMfkRquz/bv7THONZF6c0X6XgaCdBROMrbrgBh2I/5FBRgVc6Vv
         RBHSI3ZzKdA+xGnvT0S75dUZJFfQ1L7D+t1jFhHpLxo+BsBA9jphzeIOSIw7EV/q5Q
         uQOQuYg2jrEMg==
Date:   Mon, 25 May 2020 10:05:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Message-ID: <20200525100545.227d2ccc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WlB=6X48LSgxOBXSqLaVlwt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WlB=6X48LSgxOBXSqLaVlwt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/include/asm/module.h

between commit:

  62d0fd591db1 ("arch: split MODULE_ARCH_VERMAGIC definitions out to <asm/v=
ermagic.h>")

from Linus' tree and commits:

  ab7c01fdc3cf ("mips: Add MIPS Release 5 support")
  281e3aea35e5 ("mips: Add MIPS Warrior P5600 support")

from the mips tree.

I fixed it up (I used the former version fo this file and added the
patch below) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2020 10:03:07 +1000
Subject: [PATCH] mips: vermagic updates

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/mips/include/asm/vermagic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/vermagic.h b/arch/mips/include/asm/verma=
gic.h
index 24dc3d35161c..4d2dae0c7c57 100644
--- a/arch/mips/include/asm/vermagic.h
+++ b/arch/mips/include/asm/vermagic.h
@@ -8,12 +8,16 @@
 #define MODULE_PROC_FAMILY "MIPS32_R1 "
 #elif defined CONFIG_CPU_MIPS32_R2
 #define MODULE_PROC_FAMILY "MIPS32_R2 "
+#elif defined CONFIG_CPU_MIPS32_R5
+#define MODULE_PROC_FAMILY "MIPS32_R5 "
 #elif defined CONFIG_CPU_MIPS32_R6
 #define MODULE_PROC_FAMILY "MIPS32_R6 "
 #elif defined CONFIG_CPU_MIPS64_R1
 #define MODULE_PROC_FAMILY "MIPS64_R1 "
 #elif defined CONFIG_CPU_MIPS64_R2
 #define MODULE_PROC_FAMILY "MIPS64_R2 "
+#elif defined CONFIG_CPU_MIPS64_R5
+#define MODULE_PROC_FAMILY "MIPS64_R5 "
 #elif defined CONFIG_CPU_MIPS64_R6
 #define MODULE_PROC_FAMILY "MIPS64_R6 "
 #elif defined CONFIG_CPU_R3000
@@ -46,6 +50,8 @@
 #define MODULE_PROC_FAMILY "LOONGSON64 "
 #elif defined CONFIG_CPU_CAVIUM_OCTEON
 #define MODULE_PROC_FAMILY "OCTEON "
+#elif defined CONFIG_CPU_P5600
+#define MODULE_PROC_FAMILY "P5600 "
 #elif defined CONFIG_CPU_XLR
 #define MODULE_PROC_FAMILY "XLR "
 #elif defined CONFIG_CPU_XLP
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/WlB=6X48LSgxOBXSqLaVlwt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7LC9kACgkQAVBC80lX
0GzQ7AgApgDpcM21Lyk3zKpaGn3T9YapcHWVidzVrr2QUHyj+mvV1OCxZeqc6+1s
3OVupwvmoIqD5hZKWxFcU4Avqe6ubZ6pvcQyCpCGzXdMYuRMt6Cyr2FutCYeHxb3
CDubD5vBAAOH4UXQ4nE7FaZUOjTDALas6BiTcbYYWWC3fOvQ90SkA60LVqtMINFL
U0tWol262pwJpCiwUDsaJ+8ZlMc0AYFz292xcmAhu59LLnqsmmZBXI0B0N2q4maW
YIMKnuYxefaEG8ydtZXs3dzuyY3qQJXWcpiGSG6quNSMz1Clqh/8QqGwjCYIGlDA
JX716Wimbug21rgK3/of+/qEmpLntA==
=p3YC
-----END PGP SIGNATURE-----

--Sig_/WlB=6X48LSgxOBXSqLaVlwt--
