Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46AF2C00AF
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 08:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgKWHkU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 02:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727641AbgKWHkU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2020 02:40:20 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B003DC0613CF;
        Sun, 22 Nov 2020 23:40:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CffFY0JXhz9sRR;
        Mon, 23 Nov 2020 18:40:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606117217;
        bh=feBwx742S3KxPsGL6rDfJ09Kn4ZnORD8sGkRYwcY0Og=;
        h=Date:From:To:Cc:Subject:From;
        b=hzTsKrVrvVqhAY2PLgq/c9N58GEqXNEMyV4HI07riRoxZfNd+1h6YhPtIgsn3Hj4T
         JN1laq+Uz47M8OrV8y32cS3eGfcVSvWrNbRNqfiDPVywzeCDhI7KHmSINb+JoAAaKj
         ETZdHJNXiKrLjLcRLcRznTJ2EBH/neIGts6ANXl8PO34PL4cTu9B70Ntbfo6U62tGC
         +zepQJfIcBV3UfD9WuVwcSJ1NPY5l4/P7EaJJycyuaRPw22GR1pq1Co9oJEROM0Y8H
         syILem/9j4IhLBekDBVCJQWt8B1W53WoSvi0gY8+zT2Y7s1wJGKsYHGMyIJxFDxBrp
         3Wws9tTZ4d6ZQ==
Date:   Mon, 23 Nov 2020 18:40:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Daniel Axtens <dja@axtens.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20201123184016.693fe464@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EdvlojBL39g6k/WuaBky3z0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EdvlojBL39g6k/WuaBky3z0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging most of the trees, today's linux-next build (powerpc64
allnoconfig) failed like this:

In file included from arch/powerpc/include/asm/kup.h:18,
                 from arch/powerpc/include/asm/uaccess.h:9,
                 from include/linux/uaccess.h:11,
                 from include/linux/sched/task.h:11,
                 from include/linux/sched/signal.h:9,
                 from include/linux/rcuwait.h:6,
                 from include/linux/percpu-rwsem.h:7,
                 from include/linux/fs.h:33,
                 from include/linux/compat.h:17,
                 from arch/powerpc/kernel/asm-offsets.c:14:
arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: data definiti=
on has no type or storage class
   66 | DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
      | ^~~~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: error: type defaults t=
o 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=3Dimplicit-in=
t]
arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: parameter nam=
es (without types) in function declaration
arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_a=
ccess':
arch/powerpc/include/asm/book3s/64/kup-radix.h:180:6: error: implicit decla=
ration of function 'static_branch_unlikely' [-Werror=3Dimplicit-function-de=
claration]
  180 |  if (static_branch_unlikely(&uaccess_flush_key))
      |      ^~~~~~~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: error: 'uaccess_flus=
h_key' undeclared (first use in this function)
  180 |  if (static_branch_unlikely(&uaccess_flush_key))
      |                              ^~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: note: each undeclare=
d identifier is reported only once for each function it appears in
arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_a=
ccess_return':
arch/powerpc/include/asm/book3s/64/kup-radix.h:189:30: error: 'uaccess_flus=
h_key' undeclared (first use in this function)
  189 |  if (static_branch_unlikely(&uaccess_flush_key))
      |                              ^~~~~~~~~~~~~~~~~
arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'restore_user_a=
ccess':
arch/powerpc/include/asm/book3s/64/kup-radix.h:198:30: error: 'uaccess_flus=
h_key' undeclared (first use in this function)
  198 |  if (static_branch_unlikely(&uaccess_flush_key) && flags =3D=3D AMR=
_KUAP_BLOCKED)
      |                              ^~~~~~~~~~~~~~~~~

Caused by commit

  9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Nov 2020 18:35:02 +1100
Subject: [PATCH] powerpc/64s: using DECLARE_STATIC_KEY_FALSE needs
 linux/jump_table.h

Fixes: 9a32a7e78bd0 ("powerpc/64s: flush L1D after user accesses")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/=
include/asm/book3s/64/kup-radix.h
index 28716e2f13e3..a39e2d193fdc 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -63,6 +63,8 @@
=20
 #else /* !__ASSEMBLY__ */
=20
+#include <linux/jump_label.h>
+
 DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
=20
 #ifdef CONFIG_PPC_KUAP
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/EdvlojBL39g6k/WuaBky3z0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7Z2AACgkQAVBC80lX
0GwEzAgAoZEvlgCXERg+onNkmuCjQWCaqqGFZXyJV9Z7Tgs2pKSezeRvTn/Q2IuD
JxOWJuA9xnseQ6gScuUk7FbT4IqVNPEP4E6xcB3ijWqz+FoxCo13L0oHuvavKV7g
1YSDl0bI2lcTu3aLh8G4pl9u+Qsw2X7A1c/fOCRqzrJ9cPAQqI8n9bNJs6Wv7sSX
nbGvSWC/J9GXhr1eFtovk5sDjaIibxIK1wQrOfyJgN0N5CGBpvMTEOSMmhz1iyNI
UnsSeBQW9I5VWayCWBTLWfKCyvacpf4u3L8g4fyXQI4eL/ifTgmE35O/s1JEYmxn
LcL4KT4cDw4w/wLchVzvd81WVksT0Q==
=zrca
-----END PGP SIGNATURE-----

--Sig_/EdvlojBL39g6k/WuaBky3z0--
