Return-Path: <linux-next+bounces-3285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A294E52F
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 04:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80FA81F22065
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 02:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493136F2EA;
	Mon, 12 Aug 2024 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dHY44vcZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E128EC;
	Mon, 12 Aug 2024 02:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723430877; cv=none; b=d8aJBLHr6N4Aq6uiE2Cnk9s5mWxrQB2hmegD97dfpUKrokCp17uU8L+pyS7LQ2SDFv//FX3aCGaCja9Y70g30MA2KLihI+g2hDYyAgW3Z1YeJ9cBVZmAsenuDlepPXWypVq6qfUKjSLOjEa+YJPlRLbsk0FEwiMzUGXq+5wiGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723430877; c=relaxed/simple;
	bh=RcIzZh/a6R/99IvA8xmkei1i4+I1J1uvS+/n1srxg+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rLG+ggKp1H05S+C7KiA8n/6+OvAkJ3KK3o0sAQT22iWF6YgHcL4Ej6iKstQjARk2Qh3BhBr1SCa1sB+5IjZ45K1ujB7pkpqUXSESzfENvRFD/rdqwVnp7PA4YGzmXHk53CBo1TbEXh+W3hOYoZj53mc4yXyo31/aw7PGF29WSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dHY44vcZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723430871;
	bh=jOFaRQpkex9bBK95cEfT7pluIQ5qYspy0/5tqTrdPw0=;
	h=Date:From:To:Cc:Subject:From;
	b=dHY44vcZjje2rNPMcN2bLhhfW1te9JcvikBJJDtWDbGAV8TzMa4oeXerDloVLgRoM
	 +4mrp+tHdsOb973rF2r0+8LHRGawjvw3IGwBgFRu6mAHkpDFn9dtM6GPmJ9B4a/FZ9
	 aUgkJxRIDfz+9rtD/nu3/QZO4t17CgRe6J8nbgsq/IgDOMN091zT7+Iakl29RmTOGW
	 VoA8xjLn2H3kClZPHk0fk+mCOrfzmC5qlkqfqssv/Cow5ZgKq2DtL+ohHNtOgxe9T+
	 y3FDZ5srFgBnkSOAAflLAC1dDHkLGD2TWiDPVqhGBT3T8wEEWg/Seb1ql7cfEJeLMd
	 Puch9wJq/m1Gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WhzTL4tk2z4wp0;
	Mon, 12 Aug 2024 12:47:50 +1000 (AEST)
Date: Mon, 12 Aug 2024 12:47:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Waiman Long <longman@redhat.com>
Subject: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <20240812124748.3725011b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LTIQjka=PZ6KsjzNSBPSkAH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LTIQjka=PZ6KsjzNSBPSkAH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  8c5f6f00c015 ("rcu: Use system_unbound_wq to avoid disturbing isolated CP=
Us")

from the rcu tree and commit:

  bf0d8d2996ff ("rcu/kvfree: Add kvfree_rcu_barrier() API")

from the slab tree.

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
index 0c8b56c4ee88,ebcfed9b570e..000000000000
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@@ -3614,7 -3631,7 +3611,7 @@@ kvfree_rcu_queue_batch(struct kfree_rcu
  			// be that the work is in the pending state when
  			// channels have been detached following by each
  			// other.
- 			queue_rcu_work(system_unbound_wq, &krwp->rcu_work);
 -			queued =3D queue_rcu_work(system_wq, &krwp->rcu_work);
++			queued =3D queue_rcu_work(system_unbound_wq, &krwp->rcu_work);
  		}
  	}
 =20

--Sig_/LTIQjka=PZ6KsjzNSBPSkAH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5d9QACgkQAVBC80lX
0Gw5Owf/eROXqYBFtEwMSohm3b1f0B4TfHRvHJEWcwXvOFXjOreE7nIaJmynjQby
sgeGhiBW355DWoGEzEoulgY+ktEp4tG3+VmssFrFxAdvpcEqPLpYSyR72VUI7vfa
k48oKlbFxELUOiT2QANEz0RhVgX/l362+ABWoroJChn8y9dMu1oIsxaLKqB36dZ+
uN5Mt+TfPSssBDWzc/OiJdmH13GDBtkiTV2n8NQ1a5Z3cYCr8cTRHWYixiNbZKsl
zIoWRZUyDNtLzI+BKxVhBnta/vfq066KUwOjACRgjRnRvJr00+EssO5iz/k8RwnU
njyVy/KeWCfUb7DB6tazyQpV3/aMHA==
=MWAR
-----END PGP SIGNATURE-----

--Sig_/LTIQjka=PZ6KsjzNSBPSkAH--

