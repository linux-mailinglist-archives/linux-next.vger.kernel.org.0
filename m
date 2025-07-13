Return-Path: <linux-next+bounces-7507-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6051B0334F
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 00:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273521890710
	for <lists+linux-next@lfdr.de>; Sun, 13 Jul 2025 22:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225AB1EB5E5;
	Sun, 13 Jul 2025 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M3aJ91qm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741B8635C;
	Sun, 13 Jul 2025 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752445524; cv=none; b=F2he5q+ZPH9Nx4HZ2scaNMMVDQVoKTZ/+/t3+/eaF0/MIM/pFKfhoos6OiiQVNCSgaxmnHfLrZtVQRSPXd1uQmxqWxv3rRpGtwe/DuQZb6HCHn5jTqWfzwT30eZhOCbK475CskfBiTffUgGA8eJG+XH4khhL9UI+xYo2ubRR/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752445524; c=relaxed/simple;
	bh=KgZ76biEec1U4flJozGDoRuqCnLpK2FxetLm9Gi8M1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t8lS6CdJ5QgdhCCrpHjgKi+HJ66UHg8kuN7cZkEknZSssQlrrFtT/TyBFmWLCiYNn7QboOM78ME5Nejwc32IN2RI/RvwPsTMUvzFyrFouEFHPQN+zfNyspAixL6wkQAWJdcb3SYWyQUX/LEW1ptHwIIiDguzC2ywMXslb0zTABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M3aJ91qm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752445414;
	bh=2LbmthcW5sqZqFzdgzbxZsY9wCoW8S4X1TpR0y6/KyY=;
	h=Date:From:To:Cc:Subject:From;
	b=M3aJ91qmhgtbhk1qWn9dT2yYoxkHqJqncrNSI6spozvKcrXQVoo0274b26/7+fAAu
	 BawK2uws+c9/CVHqSKcoytl+zY7tTtsBkrguh4H5N62vioncxDSpIucVeaxGzeVi97
	 W0LRwf9OocA8CQuisahR1eSJ5Hzn1Q8RD/Ko5w3x21S2BF4PzIrbaebMJ4RURGdx7J
	 Jj3QbxUjYmBR1xPtHGtiVu1YxEUbNOjRdA1LcbXuod2YB8WMsALFDHzW0Q4scn0e03
	 rbdPofrs8A3qxQfwSHqjulrQ/1QK4eO6Qqmc8UPrvLOOxB8dOr9AsCyl8hXrYNe/yP
	 Ku2sP93oiqezg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgKjK36PBz4wbW;
	Mon, 14 Jul 2025 08:23:33 +1000 (AEST)
Date: Mon, 14 Jul 2025 08:25:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Eric Sandeen <sandeen@redhat.com>, Hongbo Li <lihongbo22@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the f2fs tree
Message-ID: <20250714082510.4226b91d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/98l24I7k7Go+M+rEX_r_9NO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/98l24I7k7Go+M+rEX_r_9NO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/f2fs/super.c

between commit:

  a0512c55d7f8 ("f2fs: switch to the new mount api")

from the f2fs tree and commit:

  165fa94de612 ("fs: enhance and rename shutdown() callback to remove_bdev(=
)")

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

diff --cc fs/f2fs/super.c
index 30c038413040,8667af9f76e4..000000000000
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@@ -3507,7 -3263,8 +3507,7 @@@ static const struct super_operations f2
  	.freeze_fs	=3D f2fs_freeze,
  	.unfreeze_fs	=3D f2fs_unfreeze,
  	.statfs		=3D f2fs_statfs,
- 	.shutdown	=3D f2fs_shutdown,
 -	.remount_fs	=3D f2fs_remount,
+ 	.remove_bdev	=3D f2fs_remove_bdev,
  };
 =20
  #ifdef CONFIG_FS_ENCRYPTION

--Sig_/98l24I7k7Go+M+rEX_r_9NO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0MkYACgkQAVBC80lX
0GwvbQgAjSL5h7WxScf7oO24HSx/5s+fEiCEy8Z6XqcQDl1gUav47D+vZPYjJhUH
ZhmU7EPec6V8AevDZqAOyoBC42Z+Gnoe8Y0BETIviQdEmB9biBIcE4P00mNCb+Vl
U5ZR4V2XrG+etSjVN3Zl5Wfwh34pUQFYVIdI1+vhIBcihEIgCLMB1sN0P37VTQl9
ITkI9KG0efDyQQLMSzqXXALdjSqPdNOMkMduu6UuEJ/KuRIPDPXIzQ/L8XjzTkMk
/BtwwLAdT2dpp+aMNmiM9Jpkqg9+6uIIem72DUoESDLEnNwzk0nI7ylIhzAZCC3/
o36hvw7BkDrciPBhTVxMosALyvvZGQ==
=ZgRp
-----END PGP SIGNATURE-----

--Sig_/98l24I7k7Go+M+rEX_r_9NO--

