Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADCC33AA03
	for <lists+linux-next@lfdr.de>; Mon, 15 Mar 2021 04:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhCODfm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Mar 2021 23:35:42 -0400
Received: from ozlabs.org ([203.11.71.1]:55571 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhCODfO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Mar 2021 23:35:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DzMVy0rlSz9sRf;
        Mon, 15 Mar 2021 14:35:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615779308;
        bh=QQsncaI3/ud9y7PXhBRoXc68yIOKxaMpziomPSRoIpY=;
        h=Date:From:To:Cc:Subject:From;
        b=EqfXlQWL7A8+Hp6wGp43R3d536fCDt49Jn5HYMN8JeB/7zne2xnaUD1x20gTVOBYS
         gn4BHcaRon/z+ZL2sjr+AmX1CNUgCCmR5ipoEnXRC56LfsZVJgt4lp1jl8Sd5K7n8K
         eIqyiLut3SlqsevEXs8h2LYwyyQglzWHAr3lasWZT8WEvEWl2auNR5rYiKHfRm1tpc
         0EXpDurlUaUkfnfaaU6NNFmjP97H3T2bIbONiO9+H28bX+eyt8J+1U3u2J1EBMvX2R
         mVXsJCnXwpoGXOobkrYBzLkUjxad6/jHKOMHz7tBi4+w3pvv+A58RB7C27EWLRSO3y
         8JdXM8jbDCNwA==
Date:   Mon, 15 Mar 2021 14:35:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wei Liu <wei.liu@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>, Juergen Gross <jgross@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Kelley <mikelley@microsoft.com>
Subject: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20210315143505.35af617b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7cJOdVc=GiLzO=KkM/+/Rv8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7cJOdVc=GiLzO=KkM/+/Rv8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hyperv tree got a conflict in:

  arch/x86/include/asm/mshyperv.h

between commit:

  a0e2bf7cb700 ("x86/paravirt: Switch time pvops functions to use static_ca=
ll()")

from the tip tree and commit:

  eb3e1d370b4c ("clocksource/drivers/hyper-v: Handle sched_clock difference=
s inline")

from the hyperv tree.

I fixed it up (I used the latter version of this file and then applied the
following patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Mar 2021 14:31:07 +1100
Subject: [PATCH] fix up for "x86/paravirt: Switch time pvops functions to u=
se
 static_call()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/clocksource/hyperv_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyper=
v_timer.c
index ce94f78eb851..1348afc6efbf 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -490,7 +490,7 @@ static __always_inline void hv_setup_sched_clock(void *=
sched_clock)
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
 {
 	/* We're on x86/x64 *and* using PV ops */
-	pv_ops.time.sched_clock =3D sched_clock;
+	paravirt_set_sched_clock(sched_clock);
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
 static __always_inline void hv_setup_sched_clock(void *sched_clock) {}
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/7cJOdVc=GiLzO=KkM/+/Rv8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBO1ekACgkQAVBC80lX
0GzSgggAjmZeWswJYv5do/8eqUgGXyRl1H6sMeYS+sH0txaKeh9+OyrmblD3OIzC
VPb++OAzStBjTZWTXk/Hqq7S3cyIqf5IKZwN/lPr05JsNTihLjrfJ/Pjy+75wVPF
iHzdmkUo1j4P9Uo1EDaTLyNq2ppye+L/NyhMg4ZJbGjlaVF7G4kDkyFg3FPJcfqt
bD8BJK4VARyG0U8p3nBjypNoyqbw2LyTaQPPOwoGIgr6s+5tyeUP7USsKLOvrVpS
L9xyXifKHJkJwQKlT0pt+2r6jiY17AWxfXRNlaww5ft2NtNesA7Tkq4wFc9BFqOK
86BfDdZiW0nNgr90k7Fp/KGIm3drSw==
=ypKE
-----END PGP SIGNATURE-----

--Sig_/7cJOdVc=GiLzO=KkM/+/Rv8--
