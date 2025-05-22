Return-Path: <linux-next+bounces-6902-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCAAC05D5
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 09:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05A21B60E90
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 07:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04010221FD6;
	Thu, 22 May 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZorswpZN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FEF2222C0;
	Thu, 22 May 2025 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899327; cv=none; b=n2jTttgiLpeWHZNUyJ9rw4of5Q6MCmGl9ErTxkDn0oML55nBjZ3JOA9sC9vBPuy26E2r8sk3XjPJhRoyaOjnRizfYrD6Hl4Gn/n6xkhXv8+HhSSFD7ooWq94nFev0Xzg4J82OiUkmNmivbhqnu81pOPJnuPHMDZwIIrwOeB/AIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899327; c=relaxed/simple;
	bh=zOiIKPDu5GGuR/JA38cKv0rMyKIQRAkOPp5exaDW1uY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t5hOv6RRpvx2wksa3K+atrmi1oWRGKxESU4+Um4aB4Owwd5HTVLy9E07RwuLrzZLzqzGcpLHZ8Gsy4uJcbmWCfHivF4lD9XA8N0mY7Q8ti4mDI3g3NrdDdih580G+eskWhrPmGefS5rx12a0jAu+pkhXmMoyCjfekzp9lBeOTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZorswpZN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747899320;
	bh=wUzRbwPG5veR38xd8T1OVRRRbHwgdMdIMBd9nL3Cfgc=;
	h=Date:From:To:Cc:Subject:From;
	b=ZorswpZNOdQTp33PE6jwlBEe9yWxZPGni5oZ8SH/Dwq4SxPe42oD70KXGGCem7qZM
	 HhEp9BMNOVJcb5mcBTb3L48QOoTypp8rU6unZe5fEb4pgFt08agf1Nvoxqpz4t9pAH
	 0Pz87T0CIIp47ibA6MzejzqmxYElxHj2d2NwMCGgMRdichu4x594pQnpFkTzJJxSlU
	 k4hbB7IGQoVew1BQryocbqousZf5RfHRV0WbMQJUhC7esjKeTE29IEsbmfFSRXbm38
	 IcQ6F1xzYUvSgNzibE5aij5EWrOp7Fk/ehcFOPAuICrg/E+fPCnKisnB8w7mm661xG
	 0gSqm4zQ/MObw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b30SR6hyqz4xM1;
	Thu, 22 May 2025 17:35:19 +1000 (AEST)
Date: Thu, 22 May 2025 17:35:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: JP Kobryn <inwardvessel@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: linux-next: manual merge of the cgroup tree with the mm-stable,
 mm-unstable trees
Message-ID: <20250522173518.68d11f41@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ys7k0AK0AmHU=BNRblVpYDB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ys7k0AK0AmHU=BNRblVpYDB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cgroup tree got a conflict in:

  mm/memcontrol.c

between commits:

  60cada258dfe ("memcg: optimize memcg_rstat_updated")
  ff9798e05d33 ("memcg: memcg_rstat_updated re-entrant safe against irqs")

from the mm-stable tree,

  dc1bc55490f4 ("memcg: make memcg_rstat_updated nmi safe")

from the mm-unstable tree and commit:

  a97915559f5c ("cgroup: change rstat function signatures from cgroup-based=
 to css-based")

from the cgroup tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memcontrol.c
index 4e9771e6e340,fde0934e2837..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -573,22 -582,11 +573,22 @@@ static inline void memcg_rstat_updated(
  	if (!val)
  		return;
 =20
 -	css_rstat_updated(&memcg->css, cpu);
 -	statc =3D this_cpu_ptr(memcg->vmstats_percpu);
 -	for (; statc; statc =3D statc->parent) {
 -		stats_updates =3D READ_ONCE(statc->stats_updates) + abs(val);
 -		WRITE_ONCE(statc->stats_updates, stats_updates);
 +	/* TODO: add to cgroup update tree once it is nmi-safe. */
 +	if (!in_nmi())
- 		cgroup_rstat_updated(memcg->css.cgroup, cpu);
++		css_rstat_updated(&memcg->css, cpu);
 +	statc_pcpu =3D memcg->vmstats_percpu;
 +	for (; statc_pcpu; statc_pcpu =3D statc->parent_pcpu) {
 +		statc =3D this_cpu_ptr(statc_pcpu);
 +		/*
 +		 * If @memcg is already flushable then all its ancestors are
 +		 * flushable as well and also there is no need to increase
 +		 * stats_updates.
 +		 */
 +		if (memcg_vmstats_needs_flush(statc->vmstats))
 +			break;
 +
 +		stats_updates =3D this_cpu_add_return(statc_pcpu->stats_updates,
 +						    abs(val));
  		if (stats_updates < MEMCG_CHARGE_BATCH)
  			continue;
 =20

--Sig_/Ys7k0AK0AmHU=BNRblVpYDB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgu07YACgkQAVBC80lX
0GypyQgAkzvzqjc4/6Iuhb/k0MTk/pYu7TrVRbQ4SCWPn60jlx/VfYvL3YihJUFF
HjkGKnIQ7H3D/TpbGghEhupZ/zEDjB2qmxe9fP45aRscsrSSaZoiRQbREHS4U6Lz
Zx4i/26yxxiHdS4cs81mpls9e9JQC4qWVe+NjKAR5T3/Rh6KxeNnbBRIEvYfmeC5
LvzTmnJsK253+6mGh6oHJG73C7NfiZrhEAGGEW8bW4OczgWsd+EoB+D1tm6UlNhg
70nITN9f1o3CwiGG+HWv47cuigTyhiv/E1fNBr/Tg19ThC0RwlnK+hJpC1uJsocj
cWbAAOj3AtqkfKYdq2M7841rfBX2iA==
=cQdU
-----END PGP SIGNATURE-----

--Sig_/Ys7k0AK0AmHU=BNRblVpYDB--

