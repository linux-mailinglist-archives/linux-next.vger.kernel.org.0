Return-Path: <linux-next+bounces-4283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF499FA8A
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 23:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4E61C23C3C
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 21:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6560621E3A3;
	Tue, 15 Oct 2024 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BucKLOAo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769E21E3B6;
	Tue, 15 Oct 2024 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029097; cv=none; b=bRujKDLr5FUpPwuZp8O9kZQ7ROvx0pmWlL2dOWtINmsRdgxER5aEQ957hDzEHaBatVixYucx9pPwyRWbBkNsZPncJaaHzvD6y66DpqAwskMUozyTngUaRtOSkYQB5Vv665BDa9oG6jwrkub0MTT+F3ttef06+5Qm0Y1RfHyEeRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029097; c=relaxed/simple;
	bh=2zI5kAHr+cQNWNYA3yjJUh93aKT+MlDG8tuCMNcopao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AFGSDLsAq2uMxXgl0w2/dBfGkLQ6hyHtzPv+6FsJ5CaYUqYn+PZbZWVCu0S3vZxocIMOU4d8gz0r8wphyYJGq4ZBFUESF9lO0isbUDDPEemAd4ugNzMSuSVQkdDD9rujfuteTRUp1TJecaZcf+dSVYVdjR/7IMTtYMz//v31igI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BucKLOAo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729029090;
	bh=cJEBS0gJTk8xjY8qdCOtkTutpldCcHDNuFARAduiyss=;
	h=Date:From:To:Cc:Subject:From;
	b=BucKLOAoyNxPff6/ANG1JhozhZniecJRSPT3josOMKfHOcOXL2EAZtz8/KJkbfqtz
	 KUcFQC52PYJ7+DXuQwUuksKtjzXzshoTnrz381odQIb9pUDOIWRonlTg/fBz42walt
	 KmQkwenhACSHkY7ORDqFY117TJ1Jq13SDOn35NzleUxW/397/+6JZ6XxaR//WRDzYO
	 i51zuznkpbuBwf4jAuzfmvrFqkNO/9yoHqYPo72goThhVwfnjKD4rbobCiuSXqmyyW
	 puj4Bod32gS8zvHvYvnGig/pWmEYTVlvjv1zQtg/MJQSabgGwYmn5OQm4DBAWzkxbH
	 dJxe1VAr9Lkpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSnqP33B4z4wxm;
	Wed, 16 Oct 2024 08:51:29 +1100 (AEDT)
Date: Wed, 16 Oct 2024 08:51:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Jeff Layton <jlayton@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20241016085129.3954241d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6qqZdx1iwV6AKhWd13fNbdS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6qqZdx1iwV6AKhWd13fNbdS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/btrfs/file.c

between commit:

  377781e9e6f8 ("btrfs: drop unused parameter iov_iter from btrfs_write_che=
ck()")

from the btrfs tree and commit:

  e2e801d6e625 ("btrfs: convert to multigrain timestamps")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/file.c
index 033f85ea8c9d,e5384ceb8acf..000000000000
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@@ -1124,27 -1120,7 +1124,7 @@@ void btrfs_check_nocow_unlock(struct bt
  	btrfs_drew_write_unlock(&inode->root->snapshot_lock);
  }
 =20
- static void update_time_for_write(struct inode *inode)
- {
- 	struct timespec64 now, ts;
-=20
- 	if (IS_NOCMTIME(inode))
- 		return;
-=20
- 	now =3D current_time(inode);
- 	ts =3D inode_get_mtime(inode);
- 	if (!timespec64_equal(&ts, &now))
- 		inode_set_mtime_to_ts(inode, now);
-=20
- 	ts =3D inode_get_ctime(inode);
- 	if (!timespec64_equal(&ts, &now))
- 		inode_set_ctime_to_ts(inode, now);
-=20
- 	if (IS_I_VERSION(inode))
- 		inode_inc_iversion(inode);
- }
-=20
 -int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from, size_t c=
ount)
 +int btrfs_write_check(struct kiocb *iocb, size_t count)
  {
  	struct file *file =3D iocb->ki_filp;
  	struct inode *inode =3D file_inode(file);

--Sig_/6qqZdx1iwV6AKhWd13fNbdS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcO4+EACgkQAVBC80lX
0GyYcwf+KRWsb+QLU2OfKwoEUwZTVayX8WUc0SHsf9vDKtg7B/lrxp0xzj3jNCo0
qqsgrBsixy477QOCJb43H+0jNjkDSY9V8uTSVSWnKCDl97SAADuYiJvTSngyiULD
jDxjZMPEh0o6n/Hv7QitIXeirrheAk2PuOaYuddxGAaPkPUfcVng0JjRwspJCpy+
3lMhRk2pgLfrI7YHTeYS+SLX9VfHODXaQ8vTrtNKjbjIcaIKRUgUaAmrng/uIzqn
8DdyHR0jfAKMxpoc9uw+0l/tqhip75yJx8UNh8ir0VQ5s2mKRctL/raC/7z2+5PU
tFuxf+oRn8mybwACsOpPJcoHbihYbQ==
=zOv3
-----END PGP SIGNATURE-----

--Sig_/6qqZdx1iwV6AKhWd13fNbdS--

