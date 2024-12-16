Return-Path: <linux-next+bounces-4960-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA69F2948
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 05:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5979E18850A5
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 04:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D566157E6B;
	Mon, 16 Dec 2024 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J1Ga8HSa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602001804E;
	Mon, 16 Dec 2024 04:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734323252; cv=none; b=pNGTBRIbQEOZZEIRpN+RAIgUvvIswqOyKyIFcrx/VNpKDJnleNtw8+w68ZgT4aY85+4il3gEKWgxz7XF/aFKkszH2iWamVeaq4hWNizDL4usD0od09PKt3s0FV9cck84X+/Om88Np1v0FtGlCJFCMDYP5zA+btMmFLALDhLcSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734323252; c=relaxed/simple;
	bh=otPDCT+zNuLeY30xEpg3VzSC84h3SWofTQjeGTFRVXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BgRq1inzgF1SjZoJgQP4VRC4nsCr+SMd0wl5yk9155gcwNQQ++snjTRnZ5vk6nJ0bO4rRJWoOsXs3P7Et1gHWov+/IeG+cGfyhyetsrMkNLXjzwICaaAgX1qjo8Y7MNW4BDlfLY68sVEMcM5MIvHafDkG8UHjJZSFdoXFtGlLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J1Ga8HSa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734323238;
	bh=N/oRaOSR2vryUH9BMfzLb8IpNMFy8XD1TRPbK4O4IdA=;
	h=Date:From:To:Cc:Subject:From;
	b=J1Ga8HSanOzk09IgMeGlht1eQzUf5T0vRdTG5AmRsV/x28YEhLfW31tAtie53MN5X
	 VMUEpHG2ij82BqstGxPbBSMaA7XSBVR37gYSYEBXOo1Y0tUUGFrgxtZWKhcc7qcqpr
	 gfo0iYV1rISqdebXi9n+SdPeA520T8xDxl1uw3knJFqvGp1OZ9Tz0ufStPwHibTMKc
	 FDmTePliBBkYvdsm0mKsJDEpcc3x3LVVrdcS3uVmisVS4m9pKJj2hAK6jh9VZWh07D
	 +51PCPVHReSNJwv1sOgyFSEntiCutK3J4gIVrYolbGS9Fm3r0JMIzPttGc+RqP00fN
	 h1YsAenR3NOww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBRjy0ryVz4wcn;
	Mon, 16 Dec 2024 15:27:17 +1100 (AEDT)
Date: Mon, 16 Dec 2024 15:27:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: linux-next: manual merge of the slab tree with the mm tree
Message-ID: <20241216152721.15c5864d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/db+KhbC4UMnHXa75F0tRldg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/db+KhbC4UMnHXa75F0tRldg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  e20b770a87b4 ("kasan: make kasan_record_aux_stack_noalloc() the default b=
ehaviour")

from the mm-unstable branch of the mm tree and commit:

  c44d336ad5ba ("mm/slab: Move kvfree_rcu() into SLAB")

from the slab tree.

I fixed it up (I used the former and applied the following patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Dec 2024 15:23:41 +1100
Subject: [PATCH] fix up for "mm/slab: Move kvfree_rcu() into SLAB"

interacting with commit

"kasan: make kasan_record_aux_stack_noalloc() the default behaviour"

form the mm tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/slab_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 69f2d19010de..4030907b6b7d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1944,7 +1944,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 		return;
 	}
=20
-	kasan_record_aux_stack_noalloc(ptr);
+	kasan_record_aux_stack(ptr);
 	success =3D add_ptr_to_bulk_krc_lock(&krcp, &flags, ptr, !head);
 	if (!success) {
 		run_page_cache_worker(krcp);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/db+KhbC4UMnHXa75F0tRldg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfrCkACgkQAVBC80lX
0GxylggAkUAJTOczg6BUJBXsWLjedZgSN9bSCc6mFgQQbPr5Yferr8dkCBqN+kNX
nQnSiAlOvwN0V48Hm/KRCcuCIUXL2R3CiAbV/cmkz6xHoRnZPt5fSUZ/7QIdvO6N
ZS/q2UYl4wvKWjdpq5/8k6ny63BdY0AkWM7IQ/3Qma/dALFMvycrX3Hv38bAjpQc
EC9RVSCehs2xMGaJRpBpGSKEHRs9MwkXWctbUe3p1YE1cm6yCCJCZ2XVzfh8bOnW
Ewp31kgpt8xiJvy5gzaEFyk1Ozw+/AVsfqy1618pXj2tcWJTQjEJukkTRICxjKk0
wHzwecL2JC1unxee9lYwU/Qils6gjA==
=IXFb
-----END PGP SIGNATURE-----

--Sig_/db+KhbC4UMnHXa75F0tRldg--

