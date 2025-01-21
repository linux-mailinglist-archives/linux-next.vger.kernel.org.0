Return-Path: <linux-next+bounces-5273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948FA17661
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 04:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE2A188A1E4
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 03:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01530148832;
	Tue, 21 Jan 2025 03:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UXYjMY71"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC615278E;
	Tue, 21 Jan 2025 03:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737431406; cv=none; b=BxqkefZpv79ninUh7nCuo+u6KxQx5Z7kCXNTmyY9vYw5zd3jAbKk+hVapeW7ZTrbRZSc/ocgvRfWrmmK/wvzm1BZHxKfKbjZYfoPTx2lqkkId/NnUBm6yzzFiiU1Iz2FjKtn49lYYWBSDORL37tvVw7kGFfwJIz9fWPtwriUuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737431406; c=relaxed/simple;
	bh=c7ZwDuf9xzD+VJqIXfQD6P43ehhgtqZJHPVVozDAD2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KwapvDbftMb/hollhncafd/D+o139sQgAM6BIHt5ip1Y744imUzlSswjADwpRZxLkzaCzA0RWkwASw6SIZw48aPV819vFLwqpbKntWtcKALlvfWlhYOB9GrYsuZTuOaFS/bgvj2UjjHlDUBdYxOx5xPHrPORDUfPKwI0/I3yEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UXYjMY71; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737431390;
	bh=y/wBvjo9DEIQFR7U0lxWHhTgyFegKPswZaF7TUVkFNg=;
	h=Date:From:To:Cc:Subject:From;
	b=UXYjMY71GRYVGAs09OD7launk9gEG5/27E9B6aVT1IK3W9kbyrVf25pMPKk8KXJCC
	 XLOdkQoSVyMuo+GWWEQ09kNCm0d1KnLgnU0hRMor7/7mDuuE67z342VlWGveaeCixd
	 Ob4jTQh/ilMFZfr7zRdxdQwczjlrzqgM5T4vhG5G4rtuTdYOYRHoRprcRitximIzWE
	 PXRcBMrK2thTTHseRhGlGp+m+cxEAIHaghmtF8Kxe3ysojbAW0vhIian+a5vjDtNxu
	 Godq8qYQhv60PPFKuPfVgC/GY9sFnSMcU8JUSQDKa8+RZTwJpEGjuA9gs9I4OHDBFh
	 NDVeB6kERuN0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcYB55Ycrz4x8Y;
	Tue, 21 Jan 2025 14:49:48 +1100 (AEDT)
Date: Tue, 21 Jan 2025 14:49:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Kent Overstreet
 <kent.overstreet@linux.dev>
Cc: John Garry <john.g.garry@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the bcachefs tree
Message-ID: <20250121144955.35b11773@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SAiZV1_T+0qvXrzMn+5bhKz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SAiZV1_T+0qvXrzMn+5bhKz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/bcachefs/move.c

between commits:

  6a967d3330d9 ("bcachefs: data_update now embeds bch_read_bio")
  b4edf03721c3 ("bcachefs: cleanup redundant code around data_update_op ini=
tialization")

from the bcachefs tree and commit:

  19206d3f5ef7 ("block: Delete bio_set_prio()")

from the block tree.

I fixed it up (see bottom and the folloing merge resolution patch) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Jan 2025 14:45:32 +1100
Subject: [PATCH] fix up for "block: Delete bio_set_prio()"

interacting with commits

  6a967d3330d9 ("bcachefs: data_update now embeds bch_read_bio")
  b4edf03721c3 ("bcachefs: cleanup redundant code around data_update_op ini=
tialization")

from the bcachefs tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bcachefs/data_update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/data_update.c b/fs/bcachefs/data_update.c
index e11d05a4b31e..19b1668c53c0 100644
--- a/fs/bcachefs/data_update.c
+++ b/fs/bcachefs/data_update.c
@@ -818,7 +818,7 @@ int bch2_data_update_init(struct btree_trans *trans,
 	m->rbio.bio.bi_iter.bi_size	=3D buf_bytes;
 	m->rbio.bio.bi_iter.bi_sector	=3D bkey_start_offset(k.k);
=20
-	bio_set_prio(&m->op.wbio.bio, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0));
+	m->op.wbio.bio.bi_ioprio =3D IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0);
=20
 	return 0;
 enomem:
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/move.c
index 0f60025a9532,67fb651f4af4..000000000000
--- a/fs/bcachefs/move.c
+++ b/fs/bcachefs/move.c
@@@ -287,10 -294,26 +287,10 @@@ int bch2_move_extent(struct moving_cont
  	ret =3D bch2_data_update_init(trans, iter, ctxt, &io->write, ctxt->wp,
  				    io_opts, data_opts, iter->btree_id, k);
  	if (ret)
 -		goto err_free_pages;
 +		goto err_free;
 +
 +	io->write.rbio.bio.bi_end_io =3D move_read_endio;
- 	bio_set_prio(&io->write.rbio.bio, IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0=
));
++	io->write.rbio.bio.bi_ioprio =3D IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0);
 =20
  	io->write.op.end_io =3D move_write_done;
 =20

--Sig_/SAiZV1_T+0qvXrzMn+5bhKz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmePGWMACgkQAVBC80lX
0Gwu4gf/cWzl1sPKFkiRgHBJuNN9yoY8Hny08R81F4MKCjgbCdeMVdMtazmqR1op
od1TeGwvKgU6Cl0QYAvM8GrcX5MSnCwyD6a5VOF7KR6PEnd1sI/rlq9cMQx+vgUs
ll0c2+KAl/cAum4jKm2MFxccDJTKH8nm2AIAY/0czPmDUpe286BKSOqULctaVc30
eUcev2LPGkRL8QZH7APF/QHlXilIvylrEQir5DPJgowlXJjVNf2XMaxKnsY5shXO
nNhnpBFeuF/5T4JTEFDSqUlM8eKpauO26vX8On6uO+DCSpe7PYShJGwGKAfJVEBv
BSL84tsk+iEIKwfjKOzehkO9cvC5qg==
=bEMr
-----END PGP SIGNATURE-----

--Sig_/SAiZV1_T+0qvXrzMn+5bhKz--

