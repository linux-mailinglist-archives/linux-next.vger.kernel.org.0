Return-Path: <linux-next+bounces-3184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE3094415B
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 04:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6FCC1F21FC9
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 02:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A7F13A3F0;
	Thu,  1 Aug 2024 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SSVcGdxf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA552D045;
	Thu,  1 Aug 2024 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722480344; cv=none; b=gKiPVXxiVmFhSNA8oIjxp9REbo4QUM1QYExNnUm3T96XR11u0pxEuSqIcLb1eNn5W8k6o3oFJuUuoWBA6k3Cq4gb1mH0nOK8bKHqLgjWkrmMuNBym/g1G5JtcbupQDMIIVaGcgq25Tyo3tTtdvS80ga4EVwwQDibyaTDwyVk148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722480344; c=relaxed/simple;
	bh=dR18zmq7uQrHklE2B4DS8PJg9xllzlqQCt7lxWDCn5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uNRHWkbd2DxgOAHXEiCVTV1d1tIv5aDPEGZxa+UPMZzZAGsCVzsM96I8O/Ks0gtSvD+gnzwfKrefF/RBOjDWVH8aCUYZbD7tU4VfOUc9kmw0W1E1kvYXYRoEgbq4uVVptcCUUaaAan6LRZam3176cEHNksN085ldK3yQT8rkHnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SSVcGdxf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722480338;
	bh=eDQzt/LQQvbtc/sFq3hd7Jrdjc8ljr+Qxi5LR+v80R4=;
	h=Date:From:To:Cc:Subject:From;
	b=SSVcGdxfWYR4OwhreiMnBLfww0wy7GCq7sLP13njVJOUmIyrkNQVw8kZUL+gxYEdl
	 ylTbSLzEDjM/YSLXiyBt7j/uZUERkEYkKJldWhLS571OayFm4JcqaBygS48InSkI7R
	 0macDqBWvHBIyEhCmXhH226T6+jvbYVhw3E4mGv4qvoosA9cHHd11b6sLXiUX3syRS
	 KpemTLivhH9JYhN6brNTpOzSHa6RA0GuRlt7p2sWYq8mgxL8GVsBQJOyZxSxBSItDx
	 ZNWe07CuhyYlfIaCIIxV/tX6WZHTsL2vD9dr4Py63MZKfLHpIt23ZVixQEJzUsAQmE
	 4L3DzV7veJ2qQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZCxt56Bcz4wb0;
	Thu,  1 Aug 2024 12:45:38 +1000 (AEST)
Date: Thu, 1 Aug 2024 12:45:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <20240801124538.63ce5dbe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0eSIcxwG3._aw7w1nT5Onc4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0eSIcxwG3._aw7w1nT5Onc4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/idle.c

between commit:

  a110a81c52a9 ("sched/deadline: Deferrable dl server")

from the tip tree and commit:

  a7a9fc549293 ("sched_ext: Add boilerplate for extensible scheduler class")

from the sched-ext tree.

I fixed it up (I think, see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sched/idle.c
index d560f7ffa463,c7a218123b7a..000000000000
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@@ -452,14 -452,14 +452,16 @@@ static void wakeup_preempt_idle(struct=20
 =20
  static void put_prev_task_idle(struct rq *rq, struct task_struct *prev)
  {
 +	dl_server_update_idle_time(rq, prev);
+ 	scx_update_idle(rq, false);
  }
 =20
  static void set_next_task_idle(struct rq *rq, struct task_struct *next, b=
ool first)
  {
  	update_idle_core(rq);
+ 	scx_update_idle(rq, true);
  	schedstat_inc(rq->sched_goidle);
 +	next->se.exec_start =3D rq_clock_task(rq);
  }
 =20
  #ifdef CONFIG_SMP

--Sig_/0eSIcxwG3._aw7w1nT5Onc4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq9tIACgkQAVBC80lX
0Gx62gf5AStVa70YNaWBZ78766ZVJycyTg/7TnYdUEgzipraOzSxUc0zhGFbmT0Z
myeCHUcXDHI4r4YNTL/II2ulNzl82X0jxYkQXpMA0Af0jv4PkcnzR3gZqsPdH6yN
I+LZbHLcekv844SVlphmbD/SyOlyttzHIwOoVwqZiNdFkE3ydn1HiToMl3KBPz2f
xNhMqyg/0f3h76zFKOlokw/jC0QRkSILUckRCo7zsb7Ec8P86rKo28Mid79L1J5M
cDJOlzPktIh/MMwEqRmeT8n4VHqguqy9MoxxeW7i+iw2ksPMrsQ7D6ykVra/nGAD
xDkm55b+syAgU4cepoffdzJ0h7WIKw==
=FZud
-----END PGP SIGNATURE-----

--Sig_/0eSIcxwG3._aw7w1nT5Onc4--

