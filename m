Return-Path: <linux-next+bounces-9159-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8233C7E957
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 00:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F0ED343C71
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 23:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16935226541;
	Sun, 23 Nov 2025 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HKp6980W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9EF9C0;
	Sun, 23 Nov 2025 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763939116; cv=none; b=llWpsdGPJfIoUChysu16xxyTPEvzDTXuwJDCo5JoliQjp7RGMl2KktBInjik81+6M28UWHZxLesGzTs32JZNP/zA6O5Y7X3q5hL/SCcaJezzR0/t0+VEdhYPVsHqBhUxS3fYXWnQWSb190CxLyoQdx4AyU7+Va8PaCn6ZRBVgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763939116; c=relaxed/simple;
	bh=EAtZjaptEVRFl/ihXwoNRerOE2Xk1nFqnWZNIhpuoMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KilNlQ8zGKhg2HejxzCkiFC72sYoAUwvs30Jq0PNz1m/DsvN/sTl3W9Qa+C3dV4boHjPpa87Az8c8UMs2njoR8qiH/PpZ9jBGmia07LTBA1X3O9rH6xZVRWR5J2hxNqgD6+KLm2eIio9deQASyOjPDKrGa02wMlSSX0NLxcEVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HKp6980W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763939110;
	bh=X6Fwvv06WVAG2tf9yVTv1oZg1IyT7k7lW+qOqoJ+t0I=;
	h=Date:From:To:Cc:Subject:From;
	b=HKp6980WDtgZrnsDM3AaAeos6f3MOFohmi77wjg8us69xjaY7skstHNGPFiPxwnGx
	 ci+VlRm/otevBu+ZRZWypxEB/EkZwvugnNjOMbDzApeSu9qQoMy7udwH9/jkiiTh3T
	 HKCi3otVNdhfnPqmGTZtHvSbkNwmGy2eaaV5/7nvxwDxwURZW/byQuoIpofuCdwiuD
	 RXpUVzuj2qoknSjj/T5XFP5zlP7u4x7m7wOOxeG3luAjWI/4+vSuRoIi/EDfkIl1HH
	 WA3+GHe1xiOcxKxfuo4OzLLMqzVDxirRtOXD8l1fTohBQkZ8bEyGHH7Fv2n5bI4Q0T
	 7pblCqRJCzxEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF4Kw5wT7z4w9q;
	Mon, 24 Nov 2025 10:05:08 +1100 (AEDT)
Date: Mon, 24 Nov 2025 10:05:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.cz>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, David Sterba
 <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs_brauner tree with the btrfs
 tree
Message-ID: <20251124100508.64a6974a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=DW+C5VjyOogH5AIEnUXJ9X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=DW+C5VjyOogH5AIEnUXJ9X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/bits.h:30,
                 from include/linux/gfp_types.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:16,
                 from fs/btrfs/ordered-data.c:6:
fs/btrfs/ordered-data.c: In function 'btrfs_mark_ordered_io_truncated':
fs/btrfs/ordered-data.c:561:37: error: implicit declaration of function 'fo=
lio_end'; did you mean 'folio_nid'? [-Wimplicit-function-declaration]
  561 |         ASSERT(file_offset + len <=3D folio_end(folio));
      |                                     ^~~~~~~~~
include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON=
_INVALID'
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
fs/btrfs/ordered-data.c:561:9: note: in expansion of macro 'ASSERT'
  561 |         ASSERT(file_offset + len <=3D folio_end(folio));
      |         ^~~~~~
In file included from include/linux/bits.h:30,
                 from include/linux/bitops.h:6,
                 from fs/btrfs/extent_io.c:3:
fs/btrfs/extent_io.c: In function 'submit_range':
fs/btrfs/extent_io.c:1621:31: error: implicit declaration of function 'foli=
o_end'; did you mean 'folio_nid'? [-Wimplicit-function-declaration]
 1621 |         ASSERT(start + len <=3D folio_end(folio));
      |                               ^~~~~~~~~
include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON=
_INVALID'
   30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
      |                                                               ^
fs/btrfs/extent_io.c:1621:9: note: in expansion of macro 'ASSERT'
 1621 |         ASSERT(start + len <=3D folio_end(folio));
      |         ^~~~~~

Caused by commit

  48f3784b17d9 ("btrfs: Use folio_next_pos()")

interatcing with commits

  98dad9ca0426 ("btrfs: reduce extent map lookup during writes")
  c7459b067d9d ("btrfs: make sure all ordered extents beyond EOF is properl=
y truncated")

from the btrfs tree.

I applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Nov 2025 09:51:32 +1100
Subject: [PATCH] fix up for "btrfs: Use folio_next_pos()"

interacting with commits

  98dad9ca0426 ("btrfs: reduce extent map lookup during writes")
  c7459b067d9d ("btrfs: make sure all ordered extents beyond EOF is properl=
y truncated")

from the btrfs tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/extent_io.c    | 2 +-
 fs/btrfs/ordered-data.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 995439dff185..3e4056dd8b55 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -1618,7 +1618,7 @@ static int submit_range(struct btrfs_inode *inode, st=
ruct folio *folio,
=20
 	ASSERT(IS_ALIGNED(start, sectorsize));
 	ASSERT(IS_ALIGNED(len, sectorsize));
-	ASSERT(start + len <=3D folio_end(folio));
+	ASSERT(start + len <=3D folio_next_pos(folio));
=20
 	while (cur < start + len) {
 		struct extent_map *em;
diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
index 51c0a910ea81..731032b40821 100644
--- a/fs/btrfs/ordered-data.c
+++ b/fs/btrfs/ordered-data.c
@@ -558,7 +558,7 @@ void btrfs_mark_ordered_io_truncated(struct btrfs_inode=
 *inode, struct folio *fo
 	u64 cur =3D file_offset;
=20
 	ASSERT(file_offset >=3D folio_pos(folio));
-	ASSERT(file_offset + len <=3D folio_end(folio));
+	ASSERT(file_offset + len <=3D folio_next_pos(folio));
=20
 	while  (cur < file_offset + len) {
 		u32 cur_len =3D file_offset + len - cur;
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/=DW+C5VjyOogH5AIEnUXJ9X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjkyQACgkQAVBC80lX
0GzYzAf8DT/a1eBvv7YVJ8JDiCFUiQT8Mmr4Cmvtkrloc61G/6Mx9PDS+4Wn6/28
qLHgZGlUc99RIGH6DxRcCbiOaNdJV3CE6sBmHy2PfEaT3d9DmVb+XjF1LLse6pOO
b2vHHV8qSdcO/EJUF70URVzc6SAAxPBqruv1O3MRNrWy0nv1c7yX1XM3qOM7d1kq
3hDZKqk7NgcDMY3nX/Y2Uz0+ILUIYJhoH4/8I0c3EVAwcvz2zHDBMNNBrT+e4fQO
kAPs0v4xH+B3PAHYSW6g6gIe2N6G+nGDVS8ZdMmWK44vku1v/PLlPKUFgJlqWr27
setIAR1jKtZHAtHO6Yy/G8klu7CuBg==
=BU6+
-----END PGP SIGNATURE-----

--Sig_/=DW+C5VjyOogH5AIEnUXJ9X--

