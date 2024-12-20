Return-Path: <linux-next+bounces-5010-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DD9F8A23
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 03:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826A5188DA41
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 02:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD051C6BE;
	Fri, 20 Dec 2024 02:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cr4T9ujR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873213D81;
	Fri, 20 Dec 2024 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734662265; cv=none; b=KLVPpzDg7p/ycs232jhLle6Bi+OYHK/SqkTL/M5kfs+Dr6Urhw8aF7P/zyr9K99nTxB0TK5cvGHKRTISr1vZMgpk0H0Q4vEdx8sGDlLTvFs2NNUsC3Zx2HqFByFEA+z/ezBIK/HnkDqIXVAuhAYdsJvPlaD1GfOP5E2XW+4B2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734662265; c=relaxed/simple;
	bh=iNxE5jgIPtKQwfomgb0Hs0FZnx/095lpq8wl8Ge3mEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iucPBRascg/xkRYN5gdzMluJEGj2XG2sFiYJ/YfYOE6nyItgwjrl/h57tE41W71c+fCrKayOVC32hMRdBxmVz9UCOyhuiFVAlZ6AuZ1tOJLUetJZO9ACQux4dkZ+xVkFpmwYJeEZuHbBX0CCPfx+FaaPO8jLi48dCGYRAe12Fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cr4T9ujR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734662254;
	bh=rl7NR2Og4SUCticRxLvFIIX6JIHZ7a1vcQIqnvbt8CA=;
	h=Date:From:To:Cc:Subject:From;
	b=cr4T9ujRQPosVFeMoFXlWtFRUkHSpLJtR3p0LpI7p9q0IuyE8VsnioXErWSPNjF3M
	 5QKZPYecveA/K/8LLwKyh9yOyC5Tl1ZuSQ0+lyobNYyGknmP01xc0fwoQH8JJe5XXc
	 woipxUCIJfvRerZBUsz1iCo+lDDVhqbEt8L1ZgOSVEIoiZkBhW9GCwVi/Lbv7DvLq2
	 Bv8RrRf+S99hq3pJ++wXajz57ftrlVnIzFwbE+JSF6yx70uhjvkOYZWM2/pYEIPMvy
	 Tcgq5kGZpk6yNdQipb2CSq5f/pkMLsZG2kJyPjINRzkMKJbol51akPp4isffS/Z90e
	 2CZegfSWezlww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDs5T6RKMz4x3J;
	Fri, 20 Dec 2024 13:37:33 +1100 (AEDT)
Date: Fri, 20 Dec 2024 13:37:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: linux-next: manual merge of the rcu tree with the mm tree
Message-ID: <20241220133738.1beae531@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S.vHHCANdWp/aJMvFMcx9/z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S.vHHCANdWp/aJMvFMcx9/z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  bf8f464ee259 ("kasan: make kasan_record_aux_stack_noalloc() the default b=
ehaviour")

from the mm tree and commit:

  049dfe96baf9 ("rcu: Report callbacks enqueued on offline CPU blind spot")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree.c
index 3885aae5f9cb,24f1cb292a92..000000000000
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@@ -3083,9 -3083,12 +3083,12 @@@ __call_rcu_common(struct rcu_head *head
  	}
  	head->func =3D func;
  	head->next =3D NULL;
 -	kasan_record_aux_stack_noalloc(head);
 +	kasan_record_aux_stack(head);
+=20
  	local_irq_save(flags);
  	rdp =3D this_cpu_ptr(&rcu_data);
+ 	RCU_LOCKDEP_WARN(!rcu_rdp_cpu_online(rdp), "Callback enqueued on offline=
 CPU!");
+=20
  	lazy =3D lazy_in && !rcu_async_should_hurry();
 =20
  	/* Add the callback to our list. */

--Sig_/S.vHHCANdWp/aJMvFMcx9/z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdk2HIACgkQAVBC80lX
0GwKXAgAkndqwcGZl3fUBBFIKwP+YrYzOFRJCf9OanDSDWRM9U7L8aXOoSRGMBAU
U9egon9xO8FuUw+ir+ipKEZz+ng+QvenKtxgnvk08snSMbsoYrEguq1zmYjsVIH5
L7ubFU0vquoZOdoii9MmHC1HCvy3rWOuodxYb5ouECRNOfkNZ2Skok1GwPf2MZzm
q1ORmvkO1GOPCF9O8askMFIhHXt6m4WXs78xqUMedJxZTJzaXJJ+TI67MsjfSqB/
xExHfgIVgxPZTCycb3r9jDmsjtAO9Hvukqp0aywAQqS9LeGMyZ+N25MMIWcJCEf4
05jQH9gPcJw6o9J5eh7IWYFZdQpESw==
=RhZ6
-----END PGP SIGNATURE-----

--Sig_/S.vHHCANdWp/aJMvFMcx9/z--

