Return-Path: <linux-next+bounces-4700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5A9C14BF
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 04:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA5A1C2257C
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 03:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A7F1917F4;
	Fri,  8 Nov 2024 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hPzxGdSc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74093126C0A;
	Fri,  8 Nov 2024 03:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036817; cv=none; b=d4tzlmN0GtLe7bImZNBhwuCX/epW74KVZNGDkAEXusJpIILX1SjeDJP8x5gYgYeKAdSEN2Tnt/RChRXhqjeE02vGhvLIv6/THcH2y3hU2iEv+kDD9RInEHdPhEyvmWwuTn4UtHsjvpQs8D/1wnILHn2wF0N+MdDHfl46Ys9ZAys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036817; c=relaxed/simple;
	bh=nKb6Olhb7wDs2d9mq5cgNJcx5ZJO6XdVJTdrG7Vf3rA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tw3t0dI3NKMLk4sFDlWCGfcblva7aPwCe2iggoDzlUvjfhyydp4TqV6oo06V4HD6LBgIIyUDbzG3mJVkm2lNjsZpBu1jTOVTwll+fMoD5FZ9M3U9trTRY+U//uoW6rXiytP6i76VZeiC+JVHTK20ZkPDuZWXn/gKdUGqZoL/Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hPzxGdSc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731036808;
	bh=hS2bhoAqx2Bhg/xigxq+0fySwFLwDmPl2Qj0sfgqZMI=;
	h=Date:From:To:Cc:Subject:From;
	b=hPzxGdScX+h6FaM1qPQ/VpbfY86WTuEaNTQDKctSr73wJz4makYhdjHJ6+BxcsALl
	 By6Pp8otxEJ3rMZSwHaS94W5o6+81N68g8DfhYjX/GsleykjjxRGqkcCV+jdE7mvU7
	 /VOfDgKNsTcKEmjBT0/+EpKbsOt5FeFOBiJCl3F/9Lur5dhAk9goWGz+eCGVA1pf/m
	 E0tI/vJTNWpNhRKQ+MnS2h98XYY+VNSLYAetpwuSa7OBraAAOMkBAHsyXe7qzjpVvk
	 6FHhRyDftAPs0HUxkKt1XXMj9kBqFv0KlAjAskrAlMIn+H2isJJaGhiRbL99xCKuMa
	 5lF8vM+CfBj/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xl4KL6tBSz4wy9;
	Fri,  8 Nov 2024 14:33:26 +1100 (AEDT)
Date: Fri, 8 Nov 2024 14:33:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Jens Axboe <axboe@kernel.dk>
Cc: hexue <xue01.he@samsung.com>, Nam Cao <namcao@linutronix.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20241108143328.6d819fcb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pbq5oN=tdOBlv6PnSE0YoSV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pbq5oN=tdOBlv6PnSE0YoSV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

io_uring/rw.c: In function 'io_hybrid_iopoll_delay':
io_uring/rw.c:1179:9: error: implicit declaration of function 'hrtimer_init=
_sleeper_on_stack'; did you mean 'hrtimer_setup_sleeper_on_stack'? [-Wimpli=
cit-function-declaration]
 1179 |         hrtimer_init_sleeper_on_stack(&timer, CLOCK_MONOTONIC, mode=
);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         hrtimer_setup_sleeper_on_stack

Caused by commit

  f3bef7aaa6c8 ("hrtimers: Delete hrtimer_init_sleeper_on_stack()")

interacting with commit

  01ee194d1aba ("io_uring: add support for hybrid IOPOLL")

from the block tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Nov 2024 14:06:37 +1100
Subject: [PATCH] fix up for "hrtimers: Delete hrtimer_init_sleeper_on_stack=
()"

interacting with commit

  01ee194d1aba ("io_uring: add support for hybrid IOPOLL")

from the block tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 io_uring/rw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/rw.c b/io_uring/rw.c
index 93526a64ccd6..c792af8c4476 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1176,7 +1176,7 @@ static u64 io_hybrid_iopoll_delay(struct io_ring_ctx =
*ctx, struct io_kiocb *req)
 	req->flags |=3D REQ_F_IOPOLL_STATE;
=20
 	mode =3D HRTIMER_MODE_REL;
-	hrtimer_init_sleeper_on_stack(&timer, CLOCK_MONOTONIC, mode);
+	hrtimer_setup_sleeper_on_stack(&timer, CLOCK_MONOTONIC, mode);
 	hrtimer_set_expires(&timer.timer, kt);
 	set_current_state(TASK_INTERRUPTIBLE);
 	hrtimer_sleeper_start_expires(&timer, mode);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Pbq5oN=tdOBlv6PnSE0YoSV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcthogACgkQAVBC80lX
0GwAcwgAjblZNa6BKmjS1KArenAoD4Easen0xHYzFP9jZsFlveAtrYFMPTDsFBb0
HSC2lfjSuSAivH1vmzUr4sWpds/Gz+J9CX0tXbX3n1mfAEs/g3wuBHvR8r2MJ9di
D+4YA1trA2eR6RyYq6vefacKXZbiG0yvkSfmfc58lXiw06jMUBZ3x7ox+s5N78pa
MJJT4k8MmfWzRRehjSj9Na6OygcO0ovtk9/PHeDUe1qxzYJh3P11wLhG4njNDDth
69tntXyF3xzT8tM0v/jWWsRIJ2xeVZx1WLn6AhyI2GKflQnYWxlXqFSz92X71qR0
fIxclPmFcDtR5nijh9oyncNtU6Sm9A==
=ZglG
-----END PGP SIGNATURE-----

--Sig_/Pbq5oN=tdOBlv6PnSE0YoSV--

