Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9443AE6AC
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 12:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhFUKDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 06:03:45 -0400
Received: from ozlabs.org ([203.11.71.1]:50859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230121AbhFUKDo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 06:03:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7lRX13XVz9sRN;
        Mon, 21 Jun 2021 20:01:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624269689;
        bh=dBb2+K0TLZesQiLcrKsk8UfkvLC+JRRBlUxFzU2cdt8=;
        h=Date:From:To:Cc:Subject:From;
        b=T78TGbwqbjbJ7w0wqnUaz4zUm1uAnbLsc7jJBjo2zwPUShBmET7zQCU3l+tQFX92K
         l3zka4pgYjGF+0m64ghlaQDkmBIz/fAq5kvJ+Gkn32oxFhwCRc+W7v9pohzojAM+Nz
         VmU272Mob6PIAi56doCLspkhpwJcp+GEj5Cy8CLR/Cj80jxw1vbVtNQa08i3bBd72O
         xiQVxoCkDJ2SHHuaEAchH3agriRCCulsUN7LNwr6k/sZidnQ4TReV0eu4l1Z1H7UyH
         JjvhId+0ABYMd2vvvffNBKnJ+WKiBEqidNF1OZ0k2usr04l4/LoyGOIee6jARrQ5It
         M69uKQGskbhfw==
Date:   Mon, 21 Jun 2021 20:01:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Kelley <mikelley@microsoft.com>
Subject: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20210621200125.46d66127@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hAQ=i+v+uA.nZwFP6JE4t2V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hAQ=i+v+uA.nZwFP6JE4t2V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  arch/x86/hyperv/hv_init.c

between commit:

  c43426334b31 ("x86: Fix leftover comment typos")

from the tip tree and commit:

  a4d7e8ae4a54 ("Drivers: hv: Move Hyper-V extended capability check to arc=
h neutral code")

from the hyperv tree.

I fixed it up (the comment changed by the former commit was move so I
applied the following merge fix patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Jun 2021 19:56:59 +1000
Subject: [PATCH] x86: move of part of "Fix leftover comment typos"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hv/hv_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index f0053c786891..7f42da98d377 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -27,7 +27,7 @@ bool hv_query_ext_cap(u64 cap_query)
 	 * output parameter to the hypercall below and so it should be
 	 * compatible with 'virt_to_phys'. Which means, it's address should be
 	 * directly mapped. Use 'static' to keep it compatible; stack variables
-	 * can be virtually mapped, making them imcompatible with
+	 * can be virtually mapped, making them incompatible with
 	 * 'virt_to_phys'.
 	 * Hypercall input/output addresses should also be 8-byte aligned.
 	 */
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/hAQ=i+v+uA.nZwFP6JE4t2V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDQY3UACgkQAVBC80lX
0Gzg/wf+MZcrZGYPQ7CDJ7XqJJ4lDuVT1l0KfdqN8ntGOVwt+CLXzPCczPo07aII
UHJoy6XYVvb17PUonxeOO7j2+IY2uyNUwPovU/Uv0a3gdN8dl+JkEm2aMcjq3pQZ
9DfH8DQw0fMyrfSTK19mUAIZLUpovChbeRnM/G5AvRsRTU9f6BcgaP1qhJfWKT4E
pGwso7h8wpHM8PiJgDShjGz0l9b9Pl1J7wi978k5n9uZyFNuBn71k9kf0wftd/4r
F36hgttv0plknZ3jPM//5qaOKZOLGw31ZoWb9QB1Ux320ZlnVuoWBHZL1HVIxp95
Afy/ZBA7XokqinXwztRGqUauON0khg==
=gFTM
-----END PGP SIGNATURE-----

--Sig_/hAQ=i+v+uA.nZwFP6JE4t2V--
