Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD012D27E9
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 10:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728780AbgLHJlD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 04:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgLHJlD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 04:41:03 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42ACC061749;
        Tue,  8 Dec 2020 01:40:22 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqwC52zT5z9sWC;
        Tue,  8 Dec 2020 20:40:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607420420;
        bh=SgR9rRLLr1wpSVNkvx0TwzJ8HMz7bq3+cs6tsbyEc2I=;
        h=Date:From:To:Cc:Subject:From;
        b=LOz5JpQjYf5HjjNeBUWfIuVZ9Lb7SNwdTt1qvJYyPtbLFfBZkcPivMFh1ibHAZ+Rt
         Rv6pNwkispda+2UI76IJ3A657fFA4Xnf5zoW3P8EwjTM4XCtdLdYqCtujQXiPuK9UL
         K9JBckgl8HB2DzV7MKLs8LfrMxIaQhHrbnw8GXoIFPzalD6VC+x5Y2voQssPl8BBfs
         RgvquyeAv51BA64SsxBzb1bbwRYb173dqRCJS9ZLMHLfomVvgGqLOZq3mPRaUtCmWc
         NHmWTdL/kn4JFsRsPeKjt1kcCaX8UzC4as9w7teAYwajS0c70HCk40HOUwYVkATern
         CYBlEqmdxhOng==
Date:   Tue, 8 Dec 2020 20:40:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Francis Laniel <laniel_francis@privacyrequired.com>,
        Ganesh Goudar <ganeshgr@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20201208204016.4eb18ca4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WhuzseIJmOBCjIOtWW=K0=l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WhuzseIJmOBCjIOtWW=K0=l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  drivers/misc/lkdtm/Makefile
  drivers/misc/lkdtm/lkdtm.h
  tools/testing/selftests/lkdtm/tests.txt

between commit:

  3ba150fb2120 ("lkdtm/powerpc: Add SLB multihit test")

from the powerpc tree and commit:

  014a486edd8a ("drivers/misc/lkdtm: add new file in LKDTM to test fortifie=
d strscpy")

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

diff --cc drivers/misc/lkdtm/Makefile
index 5a92c74eca92,d898f7b22045..000000000000
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@@ -10,7 -10,7 +10,8 @@@ lkdtm-$(CONFIG_LKDTM)		+=3D rodata_objcop
  lkdtm-$(CONFIG_LKDTM)		+=3D usercopy.o
  lkdtm-$(CONFIG_LKDTM)		+=3D stackleak.o
  lkdtm-$(CONFIG_LKDTM)		+=3D cfi.o
+ lkdtm-$(CONFIG_LKDTM)		+=3D fortify.o
 +lkdtm-$(CONFIG_PPC_BOOK3S_64)	+=3D powerpc.o
 =20
  KASAN_SANITIZE_stackleak.o	:=3D n
  KCOV_INSTRUMENT_rodata.o	:=3D n
diff --cc drivers/misc/lkdtm/lkdtm.h
index 79ec05c18dd1,6aa6d6a1a839..000000000000
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@@ -102,7 -104,7 +104,10 @@@ void lkdtm_STACKLEAK_ERASING(void)
  /* cfi.c */
  void lkdtm_CFI_FORWARD_PROTO(void);
 =20
+ /* fortify.c */
+ void lkdtm_FORTIFIED_STRSCPY(void);
+=20
 +/* powerpc.c */
 +void lkdtm_PPC_SLB_MULTIHIT(void);
 +
  #endif
diff --cc tools/testing/selftests/lkdtm/tests.txt
index 18e4599863c0,92ba4cc41314..000000000000
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@@ -68,4 -68,4 +68,5 @@@ USERCOPY_STACK_BEYON
  USERCOPY_KERNEL
  STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
  CFI_FORWARD_PROTO
+ FORTIFIED_STRSCPY
 +PPC_SLB_MULTIHIT Recovered

--Sig_/WhuzseIJmOBCjIOtWW=K0=l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/PSgAACgkQAVBC80lX
0GwEsAgAk4+6coRYdOFpzQs6pyo/XwOgK5qgBdXPsG7VYHQSQbt54tZylrmTvyrs
Q7sjjQnIvo0VxUlllPKV7i/A0v9G4cVcrWB6/fMfz2sjO5Hq45YnsJagT7xD04VX
cm1Fq3UCxrdACXhaVlR1JydEYEzAyplTjyGgpdgwB1Gv7nucW2uWtahusIIaB7s3
vv3DB+YSt8tjuVtzjNhI+OhiW8R0ExUnaa95F0Rsy8OrgFjdnH9f59GBlL+a3HKc
rvMfBS4M5kcf64Uik5SEHTs1ejWkzmL77S2EDZNWpBkYu4FHJXG1AMg3YIn/T7JW
AufpfmXzECUqaK8Ev3wfdi6QhOGx3Q==
=n6NW
-----END PGP SIGNATURE-----

--Sig_/WhuzseIJmOBCjIOtWW=K0=l--
