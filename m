Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE2A2C5F26
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 05:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389083AbgK0EKq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 23:10:46 -0500
Received: from ozlabs.org ([203.11.71.1]:38389 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgK0EKp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 23:10:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj1Pr0hqRz9s1l;
        Fri, 27 Nov 2020 15:10:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606450243;
        bh=n9Yi26F5OBO4PKmb8BO1U2D2/8TYoU1A337sZxnkoO4=;
        h=Date:From:To:Cc:Subject:From;
        b=LkuLCx/YqnErG27Vmh9GOv4w0soGjpfdMfeWFCuFp19YGiFX30qTLgHxgDO6nsPtd
         sk4BvNu6a5IeSkeNcQt05w0ZCv5i97QCP+veME52YSq8gpB2BO/Gw6zCts7I7Xk0Ml
         JXxVMWELdK3q4RZV8PA6VTkO+KAOfmjx2g9uTNelDeP9G/cRUPZtC6R3JKCzlD9qIa
         x6l97qe/+VcFC+tkiS61mQ/b2xCwCpbOltU8ehHWOgeTmZj4tXlP/8Fa5E5l9nJF+I
         P64crk+i8eb6aAH22vCEO/Nr3CTmrxCyeviwL/NqzYjR7gqE1Ud+onRoKRl1Gze7pW
         0BoHGpXeSv4WA==
Date:   Fri, 27 Nov 2020 15:10:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20201127151037.420aee20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AAR/qgPLKqHc9CdjEuaiO9d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AAR/qgPLKqHc9CdjEuaiO9d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

kernel/smp.c: In function 'csd_lock_wait_getcpu':
kernel/smp.c:133:13: error: 'call_single_data_t' {aka 'struct __call_single=
_data'} has no member named 'dst'
  133 |   return csd->dst; /* Other CSD_TYPE_ values might not have ->dst. =
*/
      |             ^~

Caused by commit

  545b8c8df41f ("smp: Cleanup smp_call_function*()")

[interacting with commit

  35feb60474bf ("kernel/smp: Provide CSD lock timeout diagnostics")

from before v5.10-rc1]

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Nov 2020 15:04:00 +1100
Subject: [PATCH] smp: fix up "smp: Cleanup smp_call_function*()"

An instance if "dst" was missed.

Fixes: 545b8c8df41f ("smp: Cleanup smp_call_function*()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index faf1a3ace6a9..1b6070bf97bb 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -130,7 +130,7 @@ static __always_inline int csd_lock_wait_getcpu(call_si=
ngle_data_t *csd)
=20
 	csd_type =3D CSD_TYPE(csd);
 	if (csd_type =3D=3D CSD_TYPE_ASYNC || csd_type =3D=3D CSD_TYPE_SYNC)
-		return csd->dst; /* Other CSD_TYPE_ values might not have ->dst. */
+		return csd->node.dst; /* Other CSD_TYPE_ values might not have ->dst. */
 	return -1;
 }
=20
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/AAR/qgPLKqHc9CdjEuaiO9d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/AfD0ACgkQAVBC80lX
0Gwsjgf+JfbEM+o5J8U6plvt/XAXHaMJaA7OFWBEBD1pzI3gF+aOdVI6zRbVUcL6
/yRSLS81gf+vYQN10xnJF0buSS6THzzH3XEWPsoNdeivo+QY0HnrEYdItu+G1r24
H7/ndcVpbrD5UnQrvqGQxBdk6owT2BG32XwBqdzR4aFpk57phGymK6vvUtrenoiJ
D4EEWtq4tIhskA2yeQR6H2a9eUixB+EQDgoszOlXtTeuhMVVcK44r7u2Fs1liWCI
Xcsv7wNKFo0j8S0TBMP2Tk2Yrei7DYpoI06ZM+lZiZ8bBGviZ/19vcqyd6db5aiN
VfLQPMT2VhaO5b8USz1mf2jJg4AHeA==
=MM2t
-----END PGP SIGNATURE-----

--Sig_/AAR/qgPLKqHc9CdjEuaiO9d--
