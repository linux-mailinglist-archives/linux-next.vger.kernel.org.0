Return-Path: <linux-next+bounces-5128-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B437CA084FD
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 02:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76543188BFF4
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 01:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158DD25771;
	Fri, 10 Jan 2025 01:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aacoLbbL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7D6149C50;
	Fri, 10 Jan 2025 01:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736473459; cv=none; b=c1dA1qy8PScqOQaQxHgRRt/BCzTr9JL2lSNZL6xWQrYsA1XUh9AO5l2AQLqQM9ZLE4jf8+uGOM8UJ4y/wF1cKM25RIzIbDE9KlOkoDw/PeNpwyDi4CHe/LuBnLLla4JCt9aaNsntd5ubGDEuMY1YtuRjS/A+zuiMGIb02NCjISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736473459; c=relaxed/simple;
	bh=QHkrxdgcdWWerA2WUGyi/mnyg4tIP8o1XE9qzv/9G+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sBqHsxmNBLW5nLN0Sj8fzjN9Modii3qX8CQL5pj98qahsK+4DWNRWG6UiR/W0wmR/bPMJUnxBfXsumlU4c4aIi/jsT4qEPUn8iD/OPAjY9CmjPvuoA52AYqxPyPRwvGkVCb8L0RTi7IzPuzcTWLQsx24vGpkdzI296sNuGqZZh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aacoLbbL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736473442;
	bh=Kaz/wzTXAIRBYQe4VTBIfWIMMWuFfgds2SHO3oWJi6I=;
	h=Date:From:To:Cc:Subject:From;
	b=aacoLbbLXDv1JmHKvqtN9h19FWH6PDO2pAoKl5V1OJ+luqompTp2ieONg4P7Fw/Uk
	 rRolcxx7BXJT+9/4vyzYX+Q06I5HGL3Lh2BDFzlTI2U6Q7P3T7dNpm4JFuu+4Kc+2u
	 hWNXzYfWgve/Bg3UePDrjCP9EiNjCvHP71PmS1FiqU7hrXx9HLeFSuXezvnC3RaZXe
	 sj9pAciuLDYKT1Kq3+tFCQOFvTqJirR/yiahsDCsKJZ/DAmTtUEvjGCbvWp5ZZw6aZ
	 WgBJgVyTH3evXvFLM6eKsVUNjE+ZtyIS5kFLkbQZC7SWgjLnrPgm/iiGEG8/K9w47w
	 dZPPEJX5G/XLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTkw15swBz4wcZ;
	Fri, 10 Jan 2025 12:44:00 +1100 (AEDT)
Date: Fri, 10 Jan 2025 12:44:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Luiz Capitulino
 <luizcap@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20250110124406.17190e3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fv1X7+wOTMVsEK8Sk.S_XYk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fv1X7+wOTMVsEK8Sk.S_XYk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

io_uring/memmap.c: In function 'io_region_allocate_pages':
io_uring/memmap.c:173:24: error: implicit declaration of function 'alloc_pa=
ges_bulk_array_node'; did you mean 'alloc_pages_bulk_node'? [-Wimplicit-fun=
ction-declaration]
  173 |         nr_allocated =3D alloc_pages_bulk_array_node(gfp, NUMA_NO_N=
ODE,
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        alloc_pages_bulk_node

Caused by commit

  1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")

interacting with commit

  4f6a90a13f78 ("mm: alloc_pages_bulk: rename API")

from the mm-unstable branch of the mm tree.

I have applied the following merge fix up patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 10 Jan 2025 12:40:38 +1100
Subject: [PATCH] fix up for "io_uring/memmap: implement kernel allocated
 regions"

interacting with "mm: alloc_pages_bulk: rename API" from the mm tree

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 io_uring/memmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io_uring/memmap.c b/io_uring/memmap.c
index dda846190fbd..361134544427 100644
--- a/io_uring/memmap.c
+++ b/io_uring/memmap.c
@@ -170,8 +170,8 @@ static int io_region_allocate_pages(struct io_ring_ctx =
*ctx,
 		goto done;
 	}
=20
-	nr_allocated =3D alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
-						   mr->nr_pages, pages);
+	nr_allocated =3D alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
+					     mr->nr_pages, pages);
 	if (nr_allocated !=3D mr->nr_pages) {
 		if (nr_allocated)
 			release_pages(pages, nr_allocated);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Fv1X7+wOTMVsEK8Sk.S_XYk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAe2YACgkQAVBC80lX
0GwYdwf/eeP1uuIQYb9g6YlwbXeBc03LwO42bC4We5uLe41g6VtOvvkUP6xfljPP
hhaxN/nJfjU5vdZ2SKOeOw34jlKFSOJFKCsZvVSm1w2z1Qg/V45XOZBMXQBjzf5n
+rkiTKNHkQfsu+3KZEni9DbpgbTCNjEFiXpwwRRuTcLmoU+zFvElEPjnxdJt01cY
QGKTjHvj/OdMykgGaxfVHUatma0/zaAvXucwMYiQQESUlxnz6S1PmDqSvMcdxzli
Cmp4d5nUwqdSVoh7QQNazGWtViRINf1UKcwXQI7Fu+obpnIA1UJE9p+SWFX4rINZ
UZvZ7rutH9kQFYcpkOKl1/yVjUr+GA==
=e+zn
-----END PGP SIGNATURE-----

--Sig_/Fv1X7+wOTMVsEK8Sk.S_XYk--

