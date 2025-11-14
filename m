Return-Path: <linux-next+bounces-8980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BB4C5B48C
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 05:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7AB43BA61A
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B62D227990C;
	Fri, 14 Nov 2025 04:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CtoRxjHa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2F21D3C0;
	Fri, 14 Nov 2025 04:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093611; cv=none; b=UQa2XjICWr9sSiJC1+ISoII5PD+Rng2jvPIegntAHwK7mNvaweEto3Ore1XD6mPatlo0Mzl9AbA0NUudHh1azPBMgjdgZLRKEjNe/cED/bMT9fHi8c3HReWtG8w1p1Yy7iZd+gMZrkkcaKXwN7cd917yg95wXij83gHLQibVU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093611; c=relaxed/simple;
	bh=2JRzTiWhGolpHwKyJnMER8rzRPEYo0dEexPX8lAjpv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GeNm+odJyJfCx7MUqiYc27ChgWGFEdLBfeoYcECjv9yE7oYJ2CtWIR7++/Gm8A7CSoScuQhCrNJT6+mRVQ3W7+VXKmbH3Hg6yP/NBtU99ZqphbgJvXKcmovj0NxLs09c3N7USe5BjTXwZcZepPjxrFH5Ba0kmTlslHZaeIhVGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CtoRxjHa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763093604;
	bh=17ol8c5KQ9/wSXRQ08bDVdWpuTZHDMwcpVvARBwPTak=;
	h=Date:From:To:Cc:Subject:From;
	b=CtoRxjHaw5MTWA4qtoNgKmWEMiEyuSOvpXMCBfglxQMglrzx1+GG0UO+X+wjAG6dd
	 mtyYKMKt3On4QE+qfFW7N5ZdFRrRAw6SdlEGLwZ5+t7FvwbnLfBkYkD5jjDgiRXQVF
	 3fSwgVgQ4dMafnR8gZx0VYMcKkMV37BiIh48nsJLHTVzkSEuNgzmc0EP21RyqvO/vP
	 0OUVn3rFIWMsA0eTgG8tvlsntHXEN5v7ZFKfH3zBmKIxhzf4Ma0RMekn2Vy72Yyych
	 KXEH9jcwR9LMRu/sh/YqRtGC3hkrvfShcFiE0znmi+gC52E76ryRP0tcD19Jj9/VLr
	 9AWu+7Ut8jruA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d73fB4xMvz4w9m;
	Fri, 14 Nov 2025 15:13:22 +1100 (AEDT)
Date: Fri, 14 Nov 2025 15:13:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, "Cc: Andrew Morton"
 <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the slab tree with the mm-unstable tree
Message-ID: <20251114151321.092927a1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//IGMEmM9CC/JAWXDxvnD9ye";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//IGMEmM9CC/JAWXDxvnD9ye
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  mm/mempool.c

between commit:

  25c4d8d29dbb ("mempool: clarify behavior of mempool_alloc_preallocated()")

from the mm-unstable tree and commit:

  5c829783e5f8 ("mempool: improve kerneldoc comments")

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

diff --cc mm/mempool.c
index cceb09b75ebe,e14d1cf46c72..000000000000
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@@ -456,13 -568,12 +568,12 @@@ EXPORT_SYMBOL(mempool_alloc_noprof)
 =20
  /**
   * mempool_alloc_preallocated - allocate an element from preallocated ele=
ments
-  *                              belonging to a specific memory pool
-  * @pool:      pointer to the memory pool which was allocated via
-  *             mempool_create().
+  *                              belonging to a memory pool
+  * @pool:	pointer to the memory pool
   *
-  * This function is similar to mempool_alloc, but it only attempts alloca=
ting
+  * This function is similar to mempool_alloc(), but it only attempts allo=
cating
 - * an element from the preallocated elements. It does not sleep and immed=
iately
 - * returns if no preallocated elements are available.
 + * an element from the preallocated elements. It only takes a single spin=
lock_t
 + * and immediately returns if no preallocated elements are available.
   *
   * Return: pointer to the allocated element or %NULL if no elements are
   * available.

--Sig_//IGMEmM9CC/JAWXDxvnD9ye
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWrGEACgkQAVBC80lX
0GyEKAf/V9R/SKgXsof7JTwGjqyQooBrCdWq1cv3AL9TqrCwycUo7HT+bbFf98bF
RC0hiEh/wo341kFdTc2kWOWnsh3U2Nvy72oPFB1yTVE8b5ZLGcKaaKG4PEJuTpX2
rNwKeTJb3hGet+x51WFytPmHHyylNvOu6Yj0ZrEOyTUXDJz4wPIRzFhO1VMpj4qR
Swqm6FujcgHEnAIqojlnfwzWmK41cebHS8T1j8Tjn6jD52CJ0HraFJK47Sf+v16Z
WOn+UwfH8Uo20PykZTwoUyznH41g0/jLNkgPkywT3Miz+pe95CuNySked4h0RwRH
h8kTkPtUe0wPYIpw8iOQz6o4Hy/uLw==
=pYp/
-----END PGP SIGNATURE-----

--Sig_//IGMEmM9CC/JAWXDxvnD9ye--

