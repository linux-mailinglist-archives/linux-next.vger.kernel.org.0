Return-Path: <linux-next+bounces-8198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C32B44A97
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 01:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252601C8555B
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 23:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14202EAB98;
	Thu,  4 Sep 2025 23:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f3nh6/RQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA81A76BB;
	Thu,  4 Sep 2025 23:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757030183; cv=none; b=XAR3kM6j32ERFP5aiI7OUUgp7RprnDqnxp+K3MDPJIi2qwm5soYEWJdTA+WaudM9n+4/gybZBo+OODlLUWQY6wUqS2EGe2HPc8pmJuo+WdZRf1hJcp30ackYzH2TdWeV2N2FfuGyIrEsfLz/MrS9Gn6PINq417aEl0SAP4dDv+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757030183; c=relaxed/simple;
	bh=otVE6t2/BThNskCmixx2DqkMpeXZzZ1KMufsKRkyUXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pLNjHH3BU640IUMlSh+W73YzJUNgY3H5Y1GU7QSjL4KoHhd+Z53071aVRl6Vuim7FvxHFOrBgNc41ELAytJ+WIjAQ96WMPDO4DYk1IwLDC/bysUsOMeQwsBcrAXo9wFy30ir7z6CeB0KDvMebPutwkYhjbgJifYalvUtLSl9wc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f3nh6/RQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757029716;
	bh=zoNjw3x/D4DHxguoOOmyMlEq4DSUrjPzmLS2pjcWL1g=;
	h=Date:From:To:Cc:Subject:From;
	b=f3nh6/RQS3+LG3L0F5+HayojCq0AP5eWR4JZvXrkoV0KbakD/hIxCFPI5xalr5HpK
	 a1r8AABe28lcw/amsOOU6Ks3r4Dw/roBL36JpcvG+Uhm1dFziGAPXiAQVc4v03pPHY
	 t9iaNzVWu4UlTxudiDSv/VW9tdo2SbD2PIExxBZEENibvmZOXu7AW8opyo51YO8o2l
	 jHaBxJOiSVY6R2xBcydOqYFUqVtbSofFgWQNQCi1UZNbi4tEadHK/INlKej8ega7QH
	 OtDD/7R8uMve3Ho6vQYIDwGIi04UfJ8PEJ8+LLeg70GHojkRI1NUQSxUWw/MI/H634
	 IF29SolKpiBYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHx4z5Knxz4wB1;
	Fri,  5 Sep 2025 09:48:35 +1000 (AEST)
Date: Fri, 5 Sep 2025 09:48:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>, Askar Safin <safinaskar@zohomail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20250905094834.46d58f55@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5F.qNVNU0evQfspE.7JQrP.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5F.qNVNU0evQfspE.7JQrP.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namespace.c

between commits:

  807602d8cfc8 ("vfs: output mount_too_revealing() errors to fscontext")
  1e5f0fb41fcc ("vfs: fs/namespace.c: remove ms_flags argument from do_remo=
unt")

from the vfs_brauner tree and commits:

  5423426a79dd ("switch do_new_mount_fc() to fc_mount()")
  308a022f41bd ("do_new_mount_fc(): use __free() to deal with dropping mnt =
on failure")
  ead5706f63cd ("do_{loopback,change_type,remount,reconfigure_mnt}(): const=
ify struct path argument")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/namespace.c
index 92980f758fd4,aeeb33bf3e7b..000000000000
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@@ -3298,7 -3310,7 +3319,7 @@@ static int do_reconfigure_mnt(const str
   * If you've mounted a non-root directory somewhere and want to do remount
   * on it - tough luck.
   */
- static int do_remount(struct path *path, int sb_flags,
 -static int do_remount(const struct path *path, int ms_flags, int sb_flags,
++static int do_remount(const struct path *path, int sb_flags,
  		      int mnt_flags, void *data)
  {
  	int err;
@@@ -3738,30 -3720,20 +3729,22 @@@ static int do_new_mount_fc(struct fs_co
  	if (IS_ERR(mnt))
  		return PTR_ERR(mnt);
 =20
+ 	sb =3D fc->root->d_sb;
+ 	error =3D security_sb_kern_mount(sb);
+ 	if (unlikely(error))
+ 		return error;
+=20
 -	if (unlikely(mount_too_revealing(sb, &mnt_flags)))
++	if (unlikely(mount_too_revealing(sb, &mnt_flags))) {
++		errorfcp(fc, "VFS", "Mount too revealing");
+ 		return -EPERM;
++	}
+=20
  	mnt_warn_timestamp_expiry(mountpoint, mnt);
 =20
- 	error =3D lock_mount(mountpoint, &mp);
- 	if (!error) {
- 		error =3D do_add_mount(real_mount(mnt), mp.mp,
- 				     mountpoint, mnt_flags);
- 		unlock_mount(&mp);
- 	}
- 	if (error < 0)
- 		mntput(mnt);
+ 	LOCK_MOUNT(mp, mountpoint);
+ 	error =3D do_add_mount(real_mount(mnt), &mp, mnt_flags);
+ 	if (!error)
+ 		retain_and_null_ptr(mnt); // consumed on success
  	return error;
  }
 =20

--Sig_/5F.qNVNU0evQfspE.7JQrP.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi6JVIACgkQAVBC80lX
0GwruQf/bwnaUu0QRZlyyfB1RzMfcUpPAoH1fazxGPiMpUj9Q3DRp4+TFdVErVuS
9b405dKK/Z7anAuSViRAqzj10Lw7kLehbtma/Eq3ywI+fo6TQ5TXIYIMJ1ShhIIo
Uk5+FNQazmMG+yyy6f3GT154RlPNGdqvUR0tUiStuQhSKhuo3kOieYn76CQw3FTS
ogMzeiEiUNaz6R8ClBSXBd3YZdBl/z5gYAaJO8gm7dJuiuuGF4WbuyzdvQfCqoj4
muWvnrVB57Flfz5WIxLdkuxjx5CwLNXNxLQ7WzKkiNrLA9whTCmvRAfLUe4Aqits
uRvvqp98Orv3V12tbi/EKGZbnWPIlw==
=yX/g
-----END PGP SIGNATURE-----

--Sig_/5F.qNVNU0evQfspE.7JQrP.--

