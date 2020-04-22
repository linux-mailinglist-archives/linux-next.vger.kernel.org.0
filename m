Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D49D1B379A
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 08:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgDVGjm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 02:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgDVGjm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 02:39:42 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30541C03C1A6;
        Tue, 21 Apr 2020 23:39:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 496W4p1ZTlz9sRN;
        Wed, 22 Apr 2020 16:39:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587537578;
        bh=HetjwFcCPllHwYqcVQt5dzRVpiFFvTaW7Z/y3khbovk=;
        h=Date:From:To:Cc:Subject:From;
        b=ULKCsgJT45PDL/BlotGATp6YVRJ6UMmpNaqtMLhQAoUQh2pJjvRkUFwwIh1pgio1c
         /qxIVp06NPT+I0bgDx1Qyx6Yq/FIrKI7Ay6u+SqB9tOiclx+p/MCY99IdydLzVEIu3
         id/SKVgWdVrGtkypkeHQ2HMXjmxPbEXwQY1696/0zRGFPiixofvXFcDBEoRMflvxcK
         OGHL8Ls3OMhCNeiXmm5QCirFBPDOlQx+Lu80H9xmPBHwlSrehxmYC+ZmW6wrdbMMlh
         9ecAKQkQWpDyo3aGxqe8+bTP8hRkXlNb1sIMFSFu35Wwe5zyk+nCBq9OyIz6Loz5FO
         B41bh7ePOYcZQ==
Date:   Wed, 22 Apr 2020 16:39:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Haren Myneni <haren@linux.ibm.com>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200422163935.5aa93ba5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dS27h1O0JnSRFS7JJdx_l1R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dS27h1O0JnSRFS7JJdx_l1R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/powernv/vas-fault.c: In function 'update_csb':
arch/powerpc/platforms/powernv/vas-fault.c:130:2: error: implicit declarati=
on of function 'use_mm' [-Werror=3Dimplicit-function-declaration]
  130 |  use_mm(window->mm);
      |  ^~~~~~
arch/powerpc/platforms/powernv/vas-fault.c:142:2: error: implicit declarati=
on of function 'unuse_mm' [-Werror=3Dimplicit-function-declaration]
  142 |  unuse_mm(window->mm);
      |  ^~~~~~~~

Caused by commit

  7fe021a3f1c9 ("kernel: better document the use_mm/unuse_mm API contract")

interacting with commit

  c96c4436aba4 ("powerpc/vas: Update CSB and notify process for fault CRBs")

from the powerpc tree.

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Apr 2020 16:35:23 +1000
Subject: [PATCH] powerpc/vas: fix up for {un}use_mm() rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/plat=
forms/powernv/vas-fault.c
index 25db70be4c9c..266a6ca5e15e 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -127,7 +127,7 @@ static void update_csb(struct vas_window *window,
 		return;
 	}
=20
-	use_mm(window->mm);
+	kthread_use_mm(window->mm);
 	rc =3D copy_to_user(csb_addr, &csb, sizeof(csb));
 	/*
 	 * User space polls on csb.flags (first byte). So add barrier
@@ -139,7 +139,7 @@ static void update_csb(struct vas_window *window,
 		smp_mb();
 		rc =3D copy_to_user(csb_addr, &csb, sizeof(u8));
 	}
-	unuse_mm(window->mm);
+	kthread_unuse_mm(window->mm);
 	put_task_struct(tsk);
=20
 	/* Success */
--=20
2.25.1

--=20
Cheers,
Stephen Rothwell

--Sig_/dS27h1O0JnSRFS7JJdx_l1R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6f5qcACgkQAVBC80lX
0GxE7QgAgDep0KJguHqQoY328f2BUYcc2F3HFkc3ksHyC4LFO5PQyEYD/uwXvGTT
QyGoPx8vYYUsa6On5PU6gbUicbWlYcsTZ8hmU3wQ0yyVnUtm0aoOdeEv86zanbBW
ZfAndCQXpU+A5dGDxFa5F9BrmgOXuH7ktH2aDmpIpFLR7Pzt1YL65G/hH5Dim4Mx
mzBggwT+XlIo+ah3dpGGjJfhfk5/aT36KwCWCsEjsh+qg4B+qYfpdbNbt7KrrpGo
ItU0D3xB0UVbIpYuAQQ51RjlR+KHqp91Ar9DTpY2Hw9gcBQXDLcU4QxwqbP+TAwC
LFaZRxtW33PHIuOnGNR0BUeyKTfR9g==
=iRvE
-----END PGP SIGNATURE-----

--Sig_/dS27h1O0JnSRFS7JJdx_l1R--
