Return-Path: <linux-next+bounces-7383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F124AFBEB1
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 01:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1287A7A1F90
	for <lists+linux-next@lfdr.de>; Mon,  7 Jul 2025 23:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE14E218ABD;
	Mon,  7 Jul 2025 23:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C087OCbs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894F4C6E;
	Mon,  7 Jul 2025 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751931531; cv=none; b=gEJf4tRBigUd6+IWMbedLdMuHrgEuOICQiKGXV1W/EKyr4/Oad59OxfO6PQ6g+nN7M/QeZ1uCBGOpoIvWUYMGVReeGbRGJa6l8FS/WFLVh1D9FdPAMXbXbJ+2JmJG1i1L+vep+1Qsw33cbHgryqOTMkvMORrazSturEl0ztT7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751931531; c=relaxed/simple;
	bh=AeE0K+x5Lp0MTbLj9eEiDKpuCIijI2YhrHrWce7+rLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c03DpS28aGAInY3F/rh+azvdgBiaSoHR77RGQQq3cnp6+OXc0GtupYkawgVpWNkRdotJMHN8TmCOrAxRwKFMe7Gu5NwN4aWH7mK9xdpOqMfsnji5Y3pqIuuKgyxxfKiLyAYzjyw0wp+gPxdVyFkkPrDmRfU2me3DIhHJkLgm/BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C087OCbs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751931464;
	bh=o2cM1R+7zHNwO198SUxVNQvHMFD4Ef7N3dgKdZleYCA=;
	h=Date:From:To:Cc:Subject:From;
	b=C087OCbsx0DIuFDhs8TbVvt95MkB6ScLxJFV5Lri/+mqG9+AVZ9fisFU7+eom4A6r
	 n6gOkTYFUDU/jcN1vNFl17BqsbQUKObdTchtnTIwYGXIs50gHXKO2s38KCZtrSpXnj
	 E8XcRRgLpq+dVVmRI5fqU3HpKGWGpghHI1PLquINxDWMFn8pwlkbxLoUzA/vGnKu7O
	 Wws7oOViO6XxPAARZHzxCXAU2dZMsj/JoDUpFoIjEU803DGPwzG13X77tBS2vavi/s
	 qtKLeSBYRapgWyZqoNZdev0BWXWSNuycwU89bQJqFVZpzjaqJM0olUiA8DHweRhi2t
	 617JCJiSll+Mw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbgdh2CNmz4wd0;
	Tue,  8 Jul 2025 09:37:42 +1000 (AEST)
Date: Tue, 8 Jul 2025 09:38:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20250708093837.52e3a89d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dlMwW0BFinU8=zpR3fXz1yz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dlMwW0BFinU8=zpR3fXz1yz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/fhandle.c

between commit:

  1c5484395f9f ("fhandle: reflow get_path_anchor()")

from the vfs-brauner tree and commit:

  8ae91ad6499b ("fold fs_struct->{lock,seq} into a seqlock")

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

diff --cc fs/fhandle.c
index b1363ead6c5e,e2f8e788d33a..000000000000
--- a/fs/fhandle.c
+++ b/fs/fhandle.c
@@@ -176,24 -178,9 +176,20 @@@ static int get_path_anchor(int fd, stru
  			return -EBADF;
  		*root =3D fd_file(f)->f_path;
  		path_get(root);
 +		return 0;
  	}
 =20
 -	return 0;
 +	if (fd =3D=3D AT_FDCWD) {
- 		struct fs_struct *fs =3D current->fs;
- 		spin_lock(&fs->lock);
- 		*root =3D fs->pwd;
- 		path_get(root);
- 		spin_unlock(&fs->lock);
++		get_fs_pwd(current->fs, root);
 +		return 0;
 +	}
 +
 +	if (fd =3D=3D FD_PIDFS_ROOT) {
 +		pidfs_get_root(root);
 +		return 0;
 +	}
 +
 +	return -EBADF;
  }
 =20
  static int vfs_dentry_acceptable(void *context, struct dentry *dentry)

--Sig_/dlMwW0BFinU8=zpR3fXz1yz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhsWn0ACgkQAVBC80lX
0GwqPgf/T6daPjufvA8/a1uqmAADlFMZ/LiDEIkzcmVddHJsW6lbOlPrg/6RntM4
zyYUnVSr+ouJepHHSVUe9BDL7AUeX8wQQtf3LjhcGmWL+JdB80KbSxU7WAbeH6yE
qt+gXUJArQefCOwLGTsittzGueVKye8j57Rd4rd8qINqH9tLN+BIpKuYI7Ucn9Nv
osZlpnaWx8azok/8t1guhoC/vNtLRXY7KT4iAGAc1IttNA5Vm0gJbOKvNnbtNc2y
cSmmJL/TjZDYMDaJlsnsmrJz5xGg98zef1TGzzp9rq1O3ecvVKmZVgIdqnRQuiWX
Y4KRif4nk3Ywr+YTbHWNs7Ecby5H7Q==
=o6R4
-----END PGP SIGNATURE-----

--Sig_/dlMwW0BFinU8=zpR3fXz1yz--

