Return-Path: <linux-next+bounces-2933-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141C92DD43
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 02:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DA01281BE7
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 00:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B408C36C;
	Thu, 11 Jul 2024 00:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bou4A+Gg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA4BD50F;
	Thu, 11 Jul 2024 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720656271; cv=none; b=P1E1uI6Xswg/g/Y7uS7PzuS6b12Lt4qEyMKzEpKsFDDKTkk9x+NqXmh1efTv5TzqtA3Cr6CpxEG7jOGS5Vid3wbXa7PtLl4CY6wH2s2vUtQXUkxF/+SHCVAYwrV4aOxz9WrJCQM8kog9kfg6BTWorWeUQo+30ipTR8RHL9YhpWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720656271; c=relaxed/simple;
	bh=XM90dbcp/JbGwBq2wpVJRws05B9EOJ6qjXhbAIwlnko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AtUfeCliwpfu9RS+7Afc/C4ZiqKVL/D3rFV0IfpjTQ1rdTc5w1K0xxFrhJT9SaCHoip3Tsmqo7kSGqsi8uiTfj6VKyV8E7vvY/QHp9MJuHKE1lUjWYJVkAsK2C248JeBDws9Eq8lCVd7MvrcxcDGmAnCnjF8skMjCojCo/AaTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bou4A+Gg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720656267;
	bh=cCfBDeX3DWyl6oSLL5B9uJLLnnZA8kcwSNhWXmrggCw=;
	h=Date:From:To:Cc:Subject:From;
	b=Bou4A+Gg/hZccKQWvTKKm8ITJvFiovGU7Sdrw0tYfHRkB9L0vY6JfsdjxPz1e/XjS
	 v3t9eFZe6RRzPZ/LD0jp01+eG7h9MIP9vRivDp8aNwWq9j62go0gH1SRcK7gv3kz22
	 KblwMKR1BSSy0z36LIH+WisTEwr25NZ9ygvVtSw4K1T4RAtH2Epl76HmLPSPP8ALaY
	 aNrkb6uUJdSLBMzwDv5Fb+aJ19FrxR0lQI/tJKb9NfFal1elbdp7uzs/TVMsk/Kahu
	 DUXUwEiIKc6Kk+vMeFZApiYJeU1TvhDOuPDbQOgLBFZhO9Q+IRhv8VwM3lNf2iS3po
	 yI8aC2fYW7eYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKFMZ6csbz4w2R;
	Thu, 11 Jul 2024 10:04:26 +1000 (AEST)
Date: Thu, 11 Jul 2024 10:04:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bcachefs tree with Linus' tree
Message-ID: <20240711100426.2ae8af91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hF0XYGS3Rna/6o6Le.YZkn8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hF0XYGS3Rna/6o6Le.YZkn8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/btree_gc.c

between commit:

  b5cbb42dc59f ("bcachefs: Repair fragmentation_lru in alloc_write_key()")

from Linus' tree and commits:

  282e9325dd4a ("bcachefs: bch_alloc->stripe_sectors")
  f75ad706a1cf ("bcachefs: fsck_err() may now take a btree_trans")

from the bcachefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/btree_gc.c
index 7c72a9e6f511,2e9ccb2071ff..000000000000
--- a/fs/bcachefs/btree_gc.c
+++ b/fs/bcachefs/btree_gc.c
@@@ -899,14 -812,14 +812,16 @@@ static int bch2_alloc_write_key(struct=20
  	alloc_data_type_set(&gc, gc.data_type);
 =20
  	if (gc.data_type !=3D old_gc.data_type ||
- 	    gc.dirty_sectors !=3D old_gc.dirty_sectors)
- 		bch2_dev_usage_update(c, ca, &old_gc, &gc, 0, true);
- 	percpu_up_read(&c->mark_lock);
+ 	    gc.dirty_sectors !=3D old_gc.dirty_sectors) {
+ 		ret =3D bch2_alloc_key_to_dev_counters(trans, ca, &old_gc, &gc, BTREE_T=
RIGGER_gc);
+ 		if (ret)
+ 			return ret;
+ 	}
 =20
 +	gc.fragmentation_lru =3D alloc_lru_idx_fragmentation(gc, ca);
 +
- 	if (fsck_err_on(new.data_type !=3D gc.data_type, c,
- 			alloc_key_data_type_wrong,
+ 	if (fsck_err_on(new.data_type !=3D gc.data_type,
+ 			trans, alloc_key_data_type_wrong,
  			"bucket %llu:%llu gen %u has wrong data_type"
  			": got %s, should be %s",
  			iter->pos.inode, iter->pos.offset,
@@@ -916,21 -829,28 +831,23 @@@
  		new.data_type =3D gc.data_type;
 =20
  #define copy_bucket_field(_errtype, _f)					\
- 	if (fsck_err_on(new._f !=3D gc._f, c, _errtype,			\
+ 	if (fsck_err_on(new._f !=3D gc._f,				\
+ 			trans, _errtype,				\
  			"bucket %llu:%llu gen %u data type %s has wrong " #_f	\
 -			": got %u, should be %u",			\
 +			": got %llu, should be %llu",			\
  			iter->pos.inode, iter->pos.offset,		\
  			gc.gen,						\
  			bch2_data_type_str(gc.data_type),		\
 -			new._f, gc._f))					\
 +			(u64) new._f, (u64) gc._f))				\
  		new._f =3D gc._f;						\
 =20
 -	copy_bucket_field(alloc_key_gen_wrong,
 -			  gen);
 -	copy_bucket_field(alloc_key_dirty_sectors_wrong,
 -			  dirty_sectors);
 -	copy_bucket_field(alloc_key_stripe_sectors_wrong,
 -			  stripe_sectors);
 -	copy_bucket_field(alloc_key_cached_sectors_wrong,
 -			  cached_sectors);
 -	copy_bucket_field(alloc_key_stripe_wrong,
 -			  stripe);
 -	copy_bucket_field(alloc_key_stripe_redundancy_wrong,
 -			  stripe_redundancy);
 +	copy_bucket_field(alloc_key_gen_wrong,			gen);
 +	copy_bucket_field(alloc_key_dirty_sectors_wrong,	dirty_sectors);
++	copy_bucket_field(alloc_key_stripe_sectors_wrong,	stripe_sectors);
 +	copy_bucket_field(alloc_key_cached_sectors_wrong,	cached_sectors);
 +	copy_bucket_field(alloc_key_stripe_wrong,		stripe);
 +	copy_bucket_field(alloc_key_stripe_redundancy_wrong,	stripe_redundancy);
 +	copy_bucket_field(alloc_key_fragmentation_lru_wrong,	fragmentation_lru);
  #undef copy_bucket_field
 =20
  	if (!bch2_alloc_v4_cmp(*old, new))

--Sig_/hF0XYGS3Rna/6o6Le.YZkn8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPIYoACgkQAVBC80lX
0GxpGwf/Q0pV0GGPMHOmhINRjUSrD95ggH6M0cVQA4r2WLD6gnmlIz4nwbRXQ/zB
0uzQnfY6/yUDdx77Q7xi4dlZkoocmL/pCRuXYnz1OY/8NdcXQMBEBxY1Z/8CI/Jw
ltVREbTFpHqWUyALoVApk6gYPPYqDI7o1NfWh0ZMtBQ8KHOyDH2Hio3sDsyR919F
Pv6rflIIETGcIqdoifnVu4NurTQX1c95V0LfFd6s/GY0DOEevatsWSmqKnCTseJE
xaajpiTPCHay10vb9KVzsEppGa1BzpMHKqhHi2kDvP9c8dbTEuM1V236d7C7SB9E
Dvb/j67heanTKQSAz0ZvdZl/Uts3jw==
=hWlm
-----END PGP SIGNATURE-----

--Sig_/hF0XYGS3Rna/6o6Le.YZkn8--

