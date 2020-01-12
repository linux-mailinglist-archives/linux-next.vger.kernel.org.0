Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58238138890
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2020 23:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbgALWus (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 17:50:48 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60179 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbgALWus (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jan 2020 17:50:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47wsPx47Psz9s29;
        Mon, 13 Jan 2020 09:50:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578869446;
        bh=a40F7aV+hWzizltZThnoRmNQqVG+tCjrmJGUSDxJcSE=;
        h=Date:From:To:Cc:Subject:From;
        b=qPkSFftygoxCdS17z92QrtHv9IZ3zF+rd/I8zVakIY8AS3BRMixfMhN+g7sz3j6W/
         f+QFBIC0m2RFFxO9Me6jtePAcPzele2+JyYgNMIpuajGTFkrmEp8s5pRSmVMhvgeG2
         dTMEoewO8KLEmzZXUMUb78gvEJTeK6o7ZlfMwiI+qR+Kr8kvf/FQfWbsnoi1rRt8HO
         seTcNvMc9CRB08yEwXZFbu85M81GVa1yyoMQhC2hi1lV0Wq3x0ln08WIkRu3pzDdHb
         inB+txpbIivkbPJRmiup0kav3eX36A/G2W1mwuSU2oQ6tuDHJ3rOC+sMhE4z0sb7Ck
         CI+hLUMhRHH2Q==
Date:   Mon, 13 Jan 2020 09:50:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kars de Jong <jongk@linux-m68k.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Subject: linux-next: manual merge of the vfs tree with the m68k tree
Message-ID: <20200113095037.156597ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qdDVBgrf0IRmeQx=vnxyL/T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qdDVBgrf0IRmeQx=vnxyL/T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  arch/m68k/kernel/syscalls/syscall.tbl

between commit:

  e8bb2a2a1d51 ("m68k: Wire up clone3() syscall")

from the m68k tree and commit:

  0a51692d49ec ("open: introduce openat2(2) syscall")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index a00a5d0db602,2559925f1924..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -434,4 -434,5 +434,5 @@@
  432	common	fsmount				sys_fsmount
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
 -# 435 reserved for clone3
 +435	common	clone3				__sys_clone3
+ 437	common	openat2				sys_openat2

--Sig_/qdDVBgrf0IRmeQx=vnxyL/T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4bor0ACgkQAVBC80lX
0GxS6gf9EyIhphzB22czNbb6SV+mMX/x9U6I9YDZFvrKO9xvuH/3qi9JVZxVIn8J
Acq62df3bJu4SOkn8C6a+xS5ZAx4IVWc8pWvnqdybxQuRiZXFsFOiN8smuJeP0k+
iPyg2JN5/me94oDIL9fAHhXmuviQeGrlYRHQfsdVijuDVb3ynqKOsHQKtE/vwv28
wGLSLcje7fGU9fet11c42ajD4+N+vOAUH9gOJCUxnvHxySPaxxGDb3njaClJfbW9
r2dSQwlSBvyJyeUCAx+bgE+dOA/B+I6wB4K5n6w1nKRnI8rmSFkjjKresytvaqWO
iW3SJ3AbCM1xZfW8Sff7N8KFdHocJg==
=qU5P
-----END PGP SIGNATURE-----

--Sig_/qdDVBgrf0IRmeQx=vnxyL/T--
