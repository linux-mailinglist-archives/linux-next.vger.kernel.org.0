Return-Path: <linux-next+bounces-3393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5A95AC36
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 05:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552081F2514F
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 03:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8326B22611;
	Thu, 22 Aug 2024 03:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IelVBRjB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AB24205;
	Thu, 22 Aug 2024 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298190; cv=none; b=YJxDsseoTUckZRaEO6laDJdTDvvMn4Rn2/4WlDW12DFQQyjXIiNm/FIgKW+0M4AnGI6q6p1ua5gM3/nWqCFFTpyesjR6ZApDUO25EDtLiesBuvoviylRRW2sup/XOSJ6pnkPV2RlRe1vMlkVWttVX0WDPp8Ony8E3LSORyGxVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298190; c=relaxed/simple;
	bh=UuorxCV3+ChjOo7klWeO1cftK5wXw90F3dBFG8aOujU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SUh2GfXd40u98U+U/s8EVqJNnRBX2dQLJ1JB7kMX2rUtFX1LpY9k0wJesgm6LjLWaWdpq114/0qByEMz2apbpq+sNB/THxEjKaoQ9WBE3g0D3hOomNJ7zDTtP1Vqp3t05NgUMW+AIPw2AVHKB0xmf1+oDM5R0dRVBBOkOpwQH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IelVBRjB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724298183;
	bh=i44euMZuOUfNaH13pwfY/OuPZSrPZ5HSS+JYk10ESfU=;
	h=Date:From:To:Cc:Subject:From;
	b=IelVBRjBhEDZkr4VUFgEFA4R2N16B0Ys51ouQTvSMvq762OYbBICOVHouvFO8rAvm
	 ptJX1U8Cz2GPLbkcqPcO31HV2FVCyJ+93OOVET6JZGj4f3oIjUdizNSZtyjPQE/f5S
	 J26KrlX8b2TRe/7Ll4fifLJ6SwKHnjmUK2L1J4LXGOS5sYTS+Y2W+/X0P9MtLqcpdU
	 UliCRIHTlgMeey4MWBY2gkSHNOlNPEg5LeBEm6ImkakwNnpkEIoNWNUyc6lYao2ql+
	 SwWJ4ApVz88DMpzXqvTyDYT4I708Vbcu31fYY51VrD8GRgqyLpdGL8ywt1Upq8RULg
	 T1eMV+knj6dhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wq8DQ5rDxz4wj2;
	Thu, 22 Aug 2024 13:43:02 +1000 (AEST)
Date: Thu, 22 Aug 2024 13:43:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <20240822134301.73a2a94a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GrW3Z6VZhTu2AkPigY=6FVp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GrW3Z6VZhTu2AkPigY=6FVp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a semantic conflict in:

  kernel/sched/ext.c

between commit:

  863ccdbb918a ("sched: Allow sched_class::dequeue_task() to fail")

from the tip tree and commit:

  f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")

from the sched-ext tree.

I fixed it up (I applied the following merge fix) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 22 Aug 2024 13:37:43 +1000
Subject: [PATCH] fix up for "sched_ext: Implement BPF extensible scheduler
 class"

interacting with "sched: Allow sched_class::dequeue_task() to fail"
from the tip tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/sched/ext.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 571a7ea0b5cb..1a9a3cc68a98 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -2033,11 +2033,11 @@ static void ops_dequeue(struct task_struct *p, u64 =
deq_flags)
 	}
 }
=20
-static void dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq=
_flags)
+static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq=
_flags)
 {
 	if (!(p->scx.flags & SCX_TASK_QUEUED)) {
 		WARN_ON_ONCE(task_runnable(p));
-		return;
+		return true;
 	}
=20
 	ops_dequeue(p, deq_flags);
@@ -2072,6 +2072,8 @@ static void dequeue_task_scx(struct rq *rq, struct ta=
sk_struct *p, int deq_flags
 	sub_nr_running(rq, 1);
=20
 	dispatch_dequeue(rq, p);
+
+	return true;
 }
=20
 static void yield_task_scx(struct rq *rq)
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/GrW3Z6VZhTu2AkPigY=6FVp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbGs8UACgkQAVBC80lX
0GzhMAf9HbuL1wGXmjn+p1vy+vt1plbCtxfo4Jknqqq1BqiK0jqYtl0korieyDyX
2AbnYb2mTCAAqsNXn56jMt2MLmc2hMdfyKu4cZFYevODfN9XMIE4He9sd7yjC9m2
+JbFbDeMNmGthrj/tkY22A+zpidi8wJFNQ5sy1SiprgeV4eJXOSFMFDOWdWV0LIb
5uJ7O3Od8j+MG334gMHdf1MLtwSGLfTPRBrJZUa+zbHiXTbT4d1bug2ByIQQZcxi
eUT1uCiLm2LuqKTSrofNQqXwhKdb3w9sYhyPLsuSJKsJ4DT4mxYWRVPNmHnIqhTd
eHsGBZQkWdDGgdaFapEBEQ/N39thLA==
=6cu3
-----END PGP SIGNATURE-----

--Sig_/GrW3Z6VZhTu2AkPigY=6FVp--

