Return-Path: <linux-next+bounces-4238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C897F999D39
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 08:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C68B23B3E
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4941C1ABE;
	Fri, 11 Oct 2024 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I6GMgAru"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756C11187;
	Fri, 11 Oct 2024 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629724; cv=none; b=Avuofn2YvREW134CKB6n+WpByhSr9QWWb5tHv+Dw0DMH5+9laBnhvrZy0MpNrA+L1yQeYCxT8g6PY/DJEtKnhlGROcrkll6yzm2GbbW2CrmoSPVOP3BX+OanE6CrFvNpd6FYLvcQTpqTeCeWqJP+P1llW5K45NJkGYhBQVdBIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629724; c=relaxed/simple;
	bh=wZC6C1ZtWGQtJBe24ty2gAMGDS10CwoLb6BVabdQ7hE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+IYz4EBlvGWUVwfNUmxoKb7lS2LyVBWs8KfowO6vocmOWrOPopIhTAuf/I5A/XypPixRmJf38FwgKDVArkCSR1ZfPrV4XrOlWV5Ek0FW9BbIZcxvYnhY6jJU8iVnIx8sR+nZlEArvjsjoYSi1bDfZwL875vkqL6xMuOKWggaiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I6GMgAru; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728629718;
	bh=Qi4iD/zJpL0QLWvm+sFan1S5bXiafXVEvRaUNdox3AQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I6GMgAruyex4YqJZGgkwNVpc6Rop+GgCTJP1/dxJlxcF5l2+9OGH84in9QCBEc1/l
	 B0DaKKwaoi3zp/qHEsSg05Xg2QLcIvFdJtQNRci481EVQ7rG/TJawQ8BXawJTqofJT
	 AbGJo6ynGBSRlR6W6MI8dHeyyyCTiASupHsjKeBil6iBB8ehkSTVwhdRgL785QkW+Q
	 cwBVBGswHfDSJXoPAnImDwn0PvVO1CHTMNI2EvSstruvADejG7xIXBwfVHeGeHNKPs
	 4tK8DJhzY+XbWWd8+NuN7MVrkoJRb861yA+5Oe0VgQ74ahnXl97gV44dHEtNQgrE0T
	 tayid8YAXFF7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPy7928C4z4wb1;
	Fri, 11 Oct 2024 17:55:16 +1100 (AEDT)
Date: Fri, 11 Oct 2024 17:55:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20241011175516.37dc061b@canb.auug.org.au>
In-Reply-To: <20241011135515.75317b03@canb.auug.org.au>
References: <20241011135515.75317b03@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QOyKX8NtVGTer43kIdhPlC/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QOyKX8NtVGTer43kIdhPlC/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 11 Oct 2024 13:55:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> kernel/time/clocksource.c:1258:13: warning: '__clocksource_change_rating'=
 defined but not used [-Wunused-function]
>  1258 | static void __clocksource_change_rating(struct clocksource *cs, i=
nt rating)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Introduced by commit
>=20
>   5ce9bb4d5af2 ("clocksource: Remove unused clocksource_change_rating")
>=20
> CONFIG_CLOCKSOURCE_WATCHDOG is not set for his build.

This became a build failure in my powerpc allyesconfig build, so I
applied the following patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Oct 2024 17:26:18 +1100
Subject: [PATCH] fix up for "clocksource: Remove unused clocksource_change_=
rating"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/time/clocksource.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index e041ba81c2f7..4a497cf1dff7 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -171,7 +171,6 @@ static inline void clocksource_watchdog_unlock(unsigned=
 long *flags)
 }
=20
 static int clocksource_watchdog_kthread(void *data);
-static void __clocksource_change_rating(struct clocksource *cs, int rating=
);
=20
 static void clocksource_watchdog_work(struct work_struct *work)
 {
@@ -681,6 +680,15 @@ static void clocksource_dequeue_watchdog(struct clocks=
ource *cs)
 	}
 }
=20
+static void clocksource_enqueue(struct clocksource *cs);
+
+static void __clocksource_change_rating(struct clocksource *cs, int rating)
+{
+	list_del(&cs->list);
+	cs->rating =3D rating;
+	clocksource_enqueue(cs);
+}
+
 static int __clocksource_watchdog_kthread(void)
 {
 	struct clocksource *cs, *tmp;
@@ -1255,13 +1263,6 @@ int __clocksource_register_scale(struct clocksource =
*cs, u32 scale, u32 freq)
 }
 EXPORT_SYMBOL_GPL(__clocksource_register_scale);
=20
-static void __clocksource_change_rating(struct clocksource *cs, int rating)
-{
-	list_del(&cs->list);
-	cs->rating =3D rating;
-	clocksource_enqueue(cs);
-}
-
 /*
  * Unbind clocksource @cs. Called with clocksource_mutex held
  */
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/QOyKX8NtVGTer43kIdhPlC/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIy9QACgkQAVBC80lX
0GzkJwf/cNKxnijbEO1zJElqs30KAmW2YT6PhT6kjdB05bvXL2MUxc0cF3hTivfT
kH51X25YB+Wnt4hLlgJrpij+/sDLBZJoS+OqHKeWasdMKl2OqoqOicte8v22C7CW
2ELW14GPFyMQbrqv2F0oY+JEqWXwpbsLHneV5IVbVO9BwJp3XYuJ4StJRTkTQalz
50dL0TVsPvAtmwtds5HKZpdIqj1PC+ZZ57gT6D1/W0Rjt2BZstjnjCNZiMEs8iOf
/w2q4Wm5YcfW/q0EzdwaFNOjmtvN/XTsASHb6GskA2BCfvvTPD5ZHQ/nv++l+b1e
3ejqL5+wnzc7WzowU08mYT/LK83lOA==
=nH0+
-----END PGP SIGNATURE-----

--Sig_/QOyKX8NtVGTer43kIdhPlC/--

