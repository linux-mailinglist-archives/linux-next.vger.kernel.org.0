Return-Path: <linux-next+bounces-8725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD79C1227B
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 01:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 143BE4E4B9D
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 00:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8431A704B;
	Tue, 28 Oct 2025 00:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sjZOFES9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CED28682;
	Tue, 28 Oct 2025 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761610937; cv=none; b=ETqj+uKspHLIkrO3JmTyXjZcGUBVcifarM3p4mH0Gkyo7WSRyY6ROqxFeoCIuNAMncZ8cxGT2DGDKrRLJ4xsAqG+doAdHbxCahyOXeqY+FDd4hHoTbJZ/enfVcWZ67KvfcGkbXCXIzhmPJRIpmZ+dwM4C9z0ZVtXcZor/hqkHmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761610937; c=relaxed/simple;
	bh=/Nsy43OmyQgzmy4VsVKt9cic6upg9TxwfsjRAC6WvZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oUZoRKMo71OZB7XZO9msnt+97xofwjc4a88OEHdLbDep/lae5vgh9RdBoTTE85X9ldq8/k1MxHtnC6jnVaysJaY1vMj4Ndrpe6MI0fivQBApaN4ssOsZbJ7xacuk3jw4k5XFvgmyBiwudB+FfVTNw7rUG9aa1ytUkS11TXKkjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sjZOFES9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761610928;
	bh=46Sos33mfTH8OXy6O6FaIdv6yCA1kIk7+Ha9IqSpw70=;
	h=Date:From:To:Cc:Subject:From;
	b=sjZOFES9l6uh3vcOTw3je1AKSJx71zcm/wAIT6MIMHEGmY7uIvsWOcndpH0DF/+F6
	 cxrV7aeZVk/8Fw6ry/gBaPSpWseNBf1hapPp4mgQ3AUDu6vJKIxs/kgn4UfkqYWim8
	 wPKgbMTyPojTXeQ7wDz8wGLWhIfYfraAdb8ph0BmpRDs/CQu42w/nbYn4QVqmuMHu5
	 NneAJRHPPx/f+3vlhmDFZpGsmoPP0+HE9ONgNBcKzdT4RqDu+MMBeOyKZ6dSdSCjxJ
	 IBcZmjNEhgcTynSfY+fE8H2KVYLrn38jstx7GLZ+NmA4G1KH97k4NtCMUdv9/IEDqh
	 3fnJeT8dF/kqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwWKB5y23z4w2J;
	Tue, 28 Oct 2025 11:22:06 +1100 (AEDT)
Date: Tue, 28 Oct 2025 11:22:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Emil Tsalapatis (Meta)" <emil@etsalapatis.com>, Emil Tsalapatis
 <etsal@meta.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Tejun Heo
 <tj@kernel.org>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20251028112205.47129816@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qkMsA=A20wnBfewgFzGasY1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qkMsA=A20wnBfewgFzGasY1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/sched/ext.c

between commit:

  a8ad873113d3 ("sched_ext: defer queue_balance_callback() until after ops.=
dispatch")

from Linus' tree and commit:

  4c95380701f5 ("sched/ext: Fold balance_scx() into pick_task_scx()")

from the tip tree.

I fixed it up (see below - but I was not sure if the
"maybe_queue_balance_callback(rq);" is positioned correctly) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sched/ext.c
index ecb251e883ea,49f4a9e76348..000000000000
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@@ -2368,41 -2298,22 +2332,23 @@@ static struct task_struct *first_local_
  					struct task_struct, scx.dsq_list.node);
  }
 =20
- static struct task_struct *pick_task_scx(struct rq *rq)
+ static struct task_struct *pick_task_scx(struct rq *rq, struct rq_flags *=
rf)
  {
  	struct task_struct *prev =3D rq->curr;
+ 	bool keep_prev, kick_idle =3D false;
  	struct task_struct *p;
- 	bool keep_prev =3D rq->scx.flags & SCX_RQ_BAL_KEEP;
- 	bool kick_idle =3D false;
 =20
- 	/*
- 	 * WORKAROUND:
- 	 *
- 	 * %SCX_RQ_BAL_KEEP should be set iff $prev is on SCX as it must just
- 	 * have gone through balance_scx(). Unfortunately, there currently is a
- 	 * bug where fair could say yes on balance() but no on pick_task(),
- 	 * which then ends up calling pick_task_scx() without preceding
- 	 * balance_scx().
- 	 *
- 	 * Keep running @prev if possible and avoid stalling from entering idle
- 	 * without balancing.
- 	 *
- 	 * Once fair is fixed, remove the workaround and trigger WARN_ON_ONCE()
- 	 * if pick_task_scx() is called without preceding balance_scx().
- 	 */
- 	if (unlikely(rq->scx.flags & SCX_RQ_BAL_PENDING)) {
- 		if (prev->scx.flags & SCX_TASK_QUEUED) {
- 			keep_prev =3D true;
- 		} else {
- 			keep_prev =3D false;
- 			kick_idle =3D true;
- 		}
- 	} else if (unlikely(keep_prev &&
- 			    prev->sched_class !=3D &ext_sched_class)) {
- 		/*
- 		 * Can happen while enabling as SCX_RQ_BAL_PENDING assertion is
- 		 * conditional on scx_enabled() and may have been skipped.
- 		 */
+ 	rq_modified_clear(rq);
+ 	rq_unpin_lock(rq, rf);
+ 	balance_one(rq, prev);
+ 	rq_repin_lock(rq, rf);
++	maybe_queue_balance_callback(rq);
+ 	if (rq_modified_above(rq, &ext_sched_class))
+ 		return RETRY_TASK;
+=20
+ 	keep_prev =3D rq->scx.flags & SCX_RQ_BAL_KEEP;
+ 	if (unlikely(keep_prev &&
+ 		     prev->sched_class !=3D &ext_sched_class)) {
  		WARN_ON_ONCE(scx_enable_state() =3D=3D SCX_ENABLED);
  		keep_prev =3D false;
  	}

--Sig_/qkMsA=A20wnBfewgFzGasY1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkADK4ACgkQAVBC80lX
0GyRoAf9F4u2QKohmfjTWxY0TZVzYWFf+5uFhKpLG662VjctOEN4FeK4qTk++kjl
EMmbAYimzzhOHpiMrxVt3SwsXBnG4AArYdEG/hHPHg9EB4NlfFtl1u76W9Wbo5FR
QsuejUy0fVHC/gh5nI0bgV5FX+PADawdbisBcUqZPyP409MlCMJmXVmQwLKH9tTy
ZrdtpSBmSiG+fO9aczf3WfS6UUnZ8H0CN6xGHKX63z6LMmlYStsNI6GJexPI+1OV
ygPRxOlRd2J0hO4cZ5kcDTVtHyxeoksR0pPXKfi/Js4Oc0RFN91YPUyPmIa9WT5+
wR8yxN+2mnZ3NY34sppsMt3r2L8ZkA==
=4nPX
-----END PGP SIGNATURE-----

--Sig_/qkMsA=A20wnBfewgFzGasY1--

