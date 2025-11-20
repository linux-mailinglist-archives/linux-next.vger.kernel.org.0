Return-Path: <linux-next+bounces-9118-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E3C76666
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 22:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2B57346CC8
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 21:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5918030B501;
	Thu, 20 Nov 2025 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J0UzNTtO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF63081C5;
	Thu, 20 Nov 2025 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763674938; cv=none; b=j9KDEvMfUBmv/gaCr46KiNqTzQc04erRkuQQKRq9q/dczQ1T4RmtV4IaNz6oUbtjIwboiah3v5pK3rnaneHoBmXgRizicHrjTpw7RoEItLVjsVpx6/yPEF77+4lkJGmHS0r/QTVdwNbMqqQUqR2UkX3C+xA6qobwNGI8ogCjoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763674938; c=relaxed/simple;
	bh=ZdbkOTCXUDMKJP1z7WdKlho64x+EpIeW4VI+k/zyB7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lTwngRNWzIOld6QFH68GVViH9kBXjx6RmUca3+KaVdcYBXWjCq5qyqqDaQavSkF2hPLhpuAidu7zkpETUSZYr2VFYbfyyjXydRq/waUBr0NQrWtYhIZ5OWPn5lsEMeMvKW3FD/L1NVsDtzUklRocOxtFn/Wr0TAAoiQXiWJSP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J0UzNTtO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763674932;
	bh=rvVAICVmpmFB4br5kDPEcV8KTjT3Z7UkhgBQ7mTYzpE=;
	h=Date:From:To:Cc:Subject:From;
	b=J0UzNTtOktQGNz+PXW2Re/7odXIfUH51QoDaldS1Ma55NPJcf6iB0/+e4wXiffFH7
	 eYOJG2yyuSPtMhoJdRmVLOoF5A63q/OsCTMMc3A9pxE487bBBlJ4WWoVITkKzYlmdi
	 p6LO7CgJs6Cu6LchCXhCGuxkq02WstSdizLojSopKh1nRROMOIuP3/K2hyn3fddAI/
	 1pjV9ixc6YzIBHg6PQ2FFziCmn2Yrbt3XTkSmCZmj7ULg4TNxh50+Z10mNiWF4GYY8
	 +yyLLuJS6T28lUbgaDVVRXCzq2SZ4wPGNKe9KTVdIwlVcK30/Rclai5+cltcCM0M5N
	 mNdkB8fzjUrXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCBdc37Cqz4wM8;
	Fri, 21 Nov 2025 08:42:12 +1100 (AEDT)
Date: Fri, 21 Nov 2025 08:42:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20251121084211.7accff09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vg.HhIsQrm3Nv5XgLd=lD0z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vg.HhIsQrm3Nv5XgLd=lD0z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/debugfs/inode.c

between commit:

  8b45b9a88233 ("debugfs: rename end_creating() to debugfs_end_creating()")

from the vfs-brauner tree and commits:

  ebb54484c3df ("convert debugfs")
  0703b36e4e1c ("debugfs: remove duplicate checks in callers of start_creat=
ing()")

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

diff --cc fs/debugfs/inode.c
index 532bd7c46baf,25a554331ac4..000000000000
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@@ -403,18 -403,17 +403,17 @@@ static struct dentry *debugfs_start_cre
  	return dentry;
  }
 =20
 -static struct dentry *failed_creating(struct dentry *dentry)
 +static struct dentry *debugfs_failed_creating(struct dentry *dentry)
  {
- 	inode_unlock(d_inode(dentry->d_parent));
- 	dput(dentry);
+ 	simple_done_creating(dentry);
  	simple_release_fs(&debugfs_mount, &debugfs_mount_count);
  	return ERR_PTR(-ENOMEM);
  }
 =20
 -static struct dentry *end_creating(struct dentry *dentry)
 +static struct dentry *debugfs_end_creating(struct dentry *dentry)
  {
- 	inode_unlock(d_inode(dentry->d_parent));
- 	return dentry;
+ 	simple_done_creating(dentry);
+ 	return dentry; // borrowed
  }
 =20
  static struct dentry *__debugfs_create_file(const char *name, umode_t mod=
e,
@@@ -456,9 -450,9 +450,9 @@@
  	DEBUGFS_I(inode)->raw =3D real_fops;
  	DEBUGFS_I(inode)->aux =3D (void *)aux;
 =20
- 	d_instantiate(dentry, inode);
+ 	d_make_persistent(dentry, inode);
  	fsnotify_create(d_inode(dentry->d_parent), dentry);
 -	return end_creating(dentry);
 +	return debugfs_end_creating(dentry);
  }
 =20
  struct dentry *debugfs_create_file_full(const char *name, umode_t mode,
@@@ -602,10 -591,10 +591,10 @@@ struct dentry *debugfs_create_dir(cons
 =20
  	/* directory inodes start off with i_nlink =3D=3D 2 (for "." entry) */
  	inc_nlink(inode);
- 	d_instantiate(dentry, inode);
+ 	d_make_persistent(dentry, inode);
  	inc_nlink(d_inode(dentry->d_parent));
  	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 -	return end_creating(dentry);
 +	return debugfs_end_creating(dentry);
  }
  EXPORT_SYMBOL_GPL(debugfs_create_dir);
 =20
@@@ -649,10 -633,10 +633,10 @@@ struct dentry *debugfs_create_automount
  	DEBUGFS_I(inode)->automount =3D f;
  	/* directory inodes start off with i_nlink =3D=3D 2 (for "." entry) */
  	inc_nlink(inode);
- 	d_instantiate(dentry, inode);
+ 	d_make_persistent(dentry, inode);
  	inc_nlink(d_inode(dentry->d_parent));
  	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
 -	return end_creating(dentry);
 +	return debugfs_end_creating(dentry);
  }
  EXPORT_SYMBOL(debugfs_create_automount);
 =20
@@@ -704,8 -688,8 +688,8 @@@ struct dentry *debugfs_create_symlink(c
  	inode->i_mode =3D S_IFLNK | S_IRWXUGO;
  	inode->i_op =3D &debugfs_symlink_inode_operations;
  	inode->i_link =3D link;
- 	d_instantiate(dentry, inode);
+ 	d_make_persistent(dentry, inode);
 -	return end_creating(dentry);
 +	return debugfs_end_creating(dentry);
  }
  EXPORT_SYMBOL_GPL(debugfs_create_symlink);
 =20

--Sig_/vg.HhIsQrm3Nv5XgLd=lD0z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfizMACgkQAVBC80lX
0GzaIwf/SJRqe4xXVu0CV+p2KlTjM7OVvV6rVs9seGiUSHa8ZJffWhPsOKLGeSxm
aEsLsrYESTPcyB8+Gs2TSlP4qHC+RB8xpi5qH4oDcFJqUZ3DVlHVD5FKAkMaKTVS
aFJx6VRhQ1Awanzkx2pWMpcV9xwLtE7ZPPGoctyZ+ihpuKMxU1FSoUovjvfoegXG
0IfsLwKGZrsTdMzO6s4ci94ZOCf1RJKR7XZLkpUU5NsyhJkjOKM2VP3+6senbz0L
0Tu72eq6Rx4dboAywIEUP8m9V+8YJy2rAse/RLy/y11MF+j9KjOH/zkzZd8qASFj
5VqOpMcOqGX+ORyL04RrHNjGFKdiCA==
=b2Xb
-----END PGP SIGNATURE-----

--Sig_/vg.HhIsQrm3Nv5XgLd=lD0z--

