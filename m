Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BF41FE390
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 04:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731319AbgFRCLi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 22:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730549AbgFRCLf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 22:11:35 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55569C06174E;
        Wed, 17 Jun 2020 19:11:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49nQR91GBPz9sWn;
        Thu, 18 Jun 2020 12:11:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592446293;
        bh=/d/Jhma+imEvxuAxLE9c24AL1eQWO7+jWKTQDSwtFuU=;
        h=Date:From:To:Cc:Subject:From;
        b=WAj0Sbvl7Gfat/I6lvM3LprLDd6BRofv56Id2XEhtbOTr9duy/2s+DtPkz7W3MD/3
         RQ/AqEMv41xsQaLADD1N+EB/818QsKxnOTaFJdMeMzFxh0VDTnSJS9Y9UYDQS2dMI1
         s0AK+UX2SIzG3ALM+C0whl8aF4uJevgxqJ2YByZg78pKJTxuZlY1MduYEBR8rmZeNA
         gQ8THUFznuHoefAx88YJ3cgrf11lakFxeEjgx7C6CNkDOunbNBFYKAdGcbGJqGQROt
         vUSjo8fQAyFMSWjJR/pojBQs0/XjGejWOL9nxZTh03yGfWqA7Hif/9L5JMoqKwtgvI
         sdURzcF0zX//A==
Date:   Thu, 18 Jun 2020 12:11:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the powerpc-fixes
 tree
Message-ID: <20200618121131.4ad29150@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O856NgubTpu=wpzyxLA68e+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O856NgubTpu=wpzyxLA68e+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/powerpc/kernel/syscalls/syscall.tbl

between commit:

  35e32a6cb5f6 ("powerpc/syscalls: Split SPU-ness out of ABI")

from the powerpc-fixes tree and commit:

  9b4feb630e8e ("arch: wire-up close_range()")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index c0cdaacd770e,dd87a782d80e..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -480,6 -524,8 +480,7 @@@
  434	common	pidfd_open			sys_pidfd_open
  435	32	clone3				ppc_clone3			sys_clone3
  435	64	clone3				sys_clone3
 -435	spu	clone3				sys_ni_syscall
+ 436	common	close_range			sys_close_range
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2

--Sig_/O856NgubTpu=wpzyxLA68e+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7qzVMACgkQAVBC80lX
0GwvewgAh+vJ/7gqcE/3Xk8Aya4tIWiLxqqpc5YVQlAH8zijoMf3p6i7hfZsuEM5
JmnLvrsiOlKdDQcmy0opuHd6HxtvVXmw3lTzShGPGb5ZDYg5tMYzWA/T8qpdGHpr
T42Da8GaxVuh9kZPLNu6AXFhe53lY/Xaol9ezWcYFrxjdcPXCbv3m7N0wlw5Hahc
hTIFCbhobIpLsC6DVQCmETW29B6Hl1hurkPA+RCR54NwIMjiFv1iBhbdYfpMZXrG
6J8wE96cwoQZJBWXrc7Ru9G78eIJGH7tmTEVMTDZuq7AfL1mXRAuJsoS9kiLHgCa
niMQB7k6Qte7mDnjdbxqVSeW+heHTQ==
=aO3b
-----END PGP SIGNATURE-----

--Sig_/O856NgubTpu=wpzyxLA68e+--
