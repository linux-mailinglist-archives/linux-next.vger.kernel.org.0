Return-Path: <linux-next+bounces-2251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88B8C1C6D
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 04:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0CFE1C20F56
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 02:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B16A13AA47;
	Fri, 10 May 2024 02:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MOJRT6vL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C793308A;
	Fri, 10 May 2024 02:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715308469; cv=none; b=TRLTRYjooeMzq13FdPTYxw5MgcidhQH4OS6TcwgrSpM/q3Qg5HLqMqWreempseRDcAUri9SMCv62SabtOWHpghVRvsnuLambz79JDQS5SblKshMzgzINaZ/XfrDxVqhRHxydjTZoqAyOphSMyIHyIIwHbx08mGO8KQgPi92pjJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715308469; c=relaxed/simple;
	bh=RONQCcVkfpHwqQxxXNfyzG8F8CRsLMZA3B5CZFoBAW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c8Kcfvayl0ap87i+VTYZ/JGBu6XK1+I7GZdW06LDSQfgYi+9Z9gvfvVjP2/EQ41vln4aQV94Sb5tJXWDCLQNrjgm85GFlGK28I2ClB8+sZIGjL7XfEzhr/vLFpA0OAosSg9xwkToSzJDD+YGRazL2cvLP9FPUIZParcGlzkUldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MOJRT6vL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715308463;
	bh=c4Yln7laJdQnB/sY0eWgMw9KfPclqSiKkkJQOYzu+1w=;
	h=Date:From:To:Cc:Subject:From;
	b=MOJRT6vLvzPi5LvwIUhZBO89/+4CZizP64ZXT+brTlgSWbrZJZvKOSOZlE458IJxO
	 D3CllnKHgjeVMmQNNOgIamv86ivPNDd6rc8+4bbebtb+EnPsfxYTTPQjR9itjzdQJz
	 Zt63e6iSY5Hhvl61AXFs+k6cLoaYMNT4Q3129wEZ1goJxITtlEswytRyy5J8oeBzoZ
	 QYu6lz8qRKmn2oP0tWuIc8vkiuSmWlDYzk/7/PojcZjrFpD7atg9zkli3KxDc0OqEw
	 2hGtz1n0gad7so7nk9uX+FWNKZUOB678/KWbRmQi6t2Zrj8NHK17kZMbbU8LqdDlCp
	 uPXIht7blU5ig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbCdB503wz4wcp;
	Fri, 10 May 2024 12:34:22 +1000 (AEST)
Date: Fri, 10 May 2024 12:34:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yu Kuai <yukuai3@huawei.com>
Subject: linux-next: manual merge of the block tree with the vfs tree
Message-ID: <20240510123419.42f727c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mv/csblki8sFVb0r.brxG_q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Mv/csblki8sFVb0r.brxG_q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-core.c

between commit:

  3f9b8fb46e5d ("Use bdev_is_paritition() instead of open-coding it")

from the vfs tree and commit:

  99dc422335d8 ("block: support to account io_ticks precisely")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc block/blk-core.c
index a4035dc7640d,01186333c88e..000000000000
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@@ -990,11 -986,12 +989,12 @@@ void update_io_ticks(struct block_devic
  	unsigned long stamp;
  again:
  	stamp =3D READ_ONCE(part->bd_stamp);
- 	if (unlikely(time_after(now, stamp))) {
- 		if (likely(try_cmpxchg(&part->bd_stamp, &stamp, now)))
- 			__part_stat_add(part, io_ticks, end ? now - stamp : 1);
- 	}
+ 	if (unlikely(time_after(now, stamp)) &&
+ 	    likely(try_cmpxchg(&part->bd_stamp, &stamp, now)) &&
+ 	    (end || part_in_flight(part)))
+ 		__part_stat_add(part, io_ticks, now - stamp);
+=20
 -	if (part->bd_partno) {
 +	if (bdev_is_partition(part)) {
  		part =3D bdev_whole(part);
  		goto again;
  	}

--Sig_/Mv/csblki8sFVb0r.brxG_q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY9h6sACgkQAVBC80lX
0GxadAf/aky9imn1d+DZPdqscorll9KRyQ3Ryt44jORhBPBXbMA3JjhObHR+eC10
C7ZMBsWTdbLnIfRnk5bObvjxn/F8d35pSn9tgn+pkddfYkJ6GuY9u0VGIGQ2UFMR
Kwk8UFdIGPibItKYJt0m+PTtzLDEKUu4hUVnYS3Xt8GhW5mRj6wYYxym7v/kXy4K
KxVknSPMo6HnnH5p8uwB+Dep24qPdhx5RfSKLP+qpwsvHqYkKj0xTRMV4+IpU11r
0dGc+GfNHPAehb+EPhfPzCOg0SjlmxvQntxiPPsfoX7LecbnLj5rXV11G4EHZ65w
Yev0sQ7Jisjc9H0jd5dDat0uOf4MTQ==
=Sage
-----END PGP SIGNATURE-----

--Sig_/Mv/csblki8sFVb0r.brxG_q--

