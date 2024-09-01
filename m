Return-Path: <linux-next+bounces-3522-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFC8967CBF
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 01:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D111F216B8
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2024 23:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432CB78C60;
	Sun,  1 Sep 2024 23:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eYwTVVU5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6311C36;
	Sun,  1 Sep 2024 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725233648; cv=none; b=mX4PRtKzvi/aGUgQ53AkgzD569G2Ov0IxyFhtdAu+hd0pxSbYk5aP1UDZvLp/ulh1S0r8ir5ej1b28a+uvunjomwMc/XD+8PAnGd3bBOhs+6ejk/qv5cKLp0xZJQUtosQa596VBC6c99hieWIZGFs+nFKfGcXPqGjAt26u8HTYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725233648; c=relaxed/simple;
	bh=uFm77d8A5Ycn0lEjQFpWt1p3B7z8UidcBW0fVcc4MRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BRSjSEck7G2DaWI2xGZV7ykE/LDVQinOiSWxbqvgOaBJylgjIb9ig7UvV7plq7kLZpfJM2JN5bsCj7Lr5l/eJfyidbN+ihb6zQRPTZyWHzrnVsJ4xCsBfCTMTuiAdpn4zt7MFZi+Q9twIda1fH6Qsb+ebqx05GDYUNUfbrGRRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eYwTVVU5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725233643;
	bh=9TobitMH5ql+6OWkLM4eE8LYSzzM3QH5JtT16J3f7ns=;
	h=Date:From:To:Cc:Subject:From;
	b=eYwTVVU5fgR6CVLLeq26usaaWI26m3uOiokofD+xiQI7Q40zg+C+pkJnK2Ne2H+Zo
	 RxFxLdNEZjgiUBwfXAfrCB0gDzF7ZpCAcivxztZZwKZPil6XYyZqLWsGGktiKlJVId
	 oKe7RaDLQ/ET4ipvWPMz3ovXMOeUbqvnIkUHotqkt+RraN/6U0qK8MsCGhf2iw7a7F
	 CSkfDHoq0Q0bEgR3DG9zm/W8Y2MMKqU4gIoVIflCNZbUX+1HsBMjQ3LY56jdRf1fT5
	 CXGqoUgfaxSmhhiYyAdHHgQ9orfY3cxCaUorjFpEfVxAr7nDW3V66CtAoyYNMJKh2l
	 KLCYA9PxswfCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxpB25FmPz4w2L;
	Mon,  2 Sep 2024 09:34:02 +1000 (AEST)
Date: Mon, 2 Sep 2024 09:34:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>, Alexander
 Mikhalitsyn <alexander@mihalicyn.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>, yangyun
 <yangyun50@huawei.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the fuse tree
Message-ID: <20240902093402.2916922d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eSrYCYxMSPfbC=T6bpQfjRK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eSrYCYxMSPfbC=T6bpQfjRK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  fs/fuse/inode.c
  include/uapi/linux/fuse.h

between commit:

  5fb9c98e9d8d ("fuse: add support for no forget requests")

from the fuse tree and commits:

  d2c5937035e5 ("fs/fuse: add FUSE_OWNER_UID_GID_EXT extension")
  9aace2eda1bd ("fs/fuse: allow idmapped mounts")

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

diff --cc fs/fuse/inode.c
index ef9c35c6210b,b840189ac8be..000000000000
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@@ -1347,8 -1343,14 +1347,16 @@@ static void process_init_reply(struct f
  			}
  			if (flags & FUSE_NO_EXPORT_SUPPORT)
  				fm->sb->s_export_op =3D &fuse_export_fid_operations;
 +			if (flags & FUSE_NO_FORGET)
 +				fc->no_forget =3D 1;
+ 			if (flags & FUSE_OWNER_UID_GID_EXT)
+ 				fc->owner_uid_gid_ext =3D 1;
+ 			if (flags & FUSE_ALLOW_IDMAP) {
+ 				if (fc->owner_uid_gid_ext && fc->default_permissions)
+ 					fm->sb->s_iflags &=3D ~SB_I_NOIDMAP;
+ 				else
+ 					ok =3D false;
+ 			}
  		} else {
  			ra_pages =3D fc->max_read / PAGE_SIZE;
  			fc->no_lock =3D 1;
@@@ -1396,7 -1398,8 +1404,8 @@@ void fuse_send_init(struct fuse_mount *
  		FUSE_HANDLE_KILLPRIV_V2 | FUSE_SETXATTR_EXT | FUSE_INIT_EXT |
  		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
  		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
- 		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_NO_FORGET;
 -		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_OWNER_UID_GID_EXT |
 -		FUSE_ALLOW_IDMAP;
++		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_NO_FORGET |
++		FUSE_OWNER_UID_GID_EXT | FUSE_ALLOW_IDMAP;
  #ifdef CONFIG_FUSE_DAX
  	if (fm->fc->dax)
  		flags |=3D FUSE_MAP_ALIGNMENT;
diff --cc include/uapi/linux/fuse.h
index d7be14947152,b23e8247ce43..000000000000
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@@ -217,7 -217,11 +217,12 @@@
   *  - add backing_id to fuse_open_out, add FOPEN_PASSTHROUGH open flag
   *  - add FUSE_NO_EXPORT_SUPPORT init flag
   *  - add FUSE_NOTIFY_RESEND, add FUSE_HAS_RESEND init flag
 + *  - add FUSE_NO_FORGET init flag
+  *
+  *  7.41
+  *  - add FUSE_EXT_OWNER_UID_GID
+  *  - add FUSE_OWNER_UID_GID_EXT
+  *  - add FUSE_ALLOW_IDMAP
   */
 =20
  #ifndef _LINUX_FUSE_H
@@@ -422,7 -426,9 +427,10 @@@ struct fuse_file_lock=20
   * FUSE_NO_EXPORT_SUPPORT: explicitly disable export support
   * FUSE_HAS_RESEND: kernel supports resending pending requests, and the h=
igh bit
   *		    of the request ID indicates resend requests
 + * FUSE_NO_FORGET: 	disable forget requests
+  * FUSE_OWNER_UID_GID_EXT: add inode owner UID/GID info to create, mkdir,
+  *			   symlink and mknod
+  * FUSE_ALLOW_IDMAP: allow creation of idmapped mounts
   */
  #define FUSE_ASYNC_READ		(1 << 0)
  #define FUSE_POSIX_LOCKS	(1 << 1)

--Sig_/eSrYCYxMSPfbC=T6bpQfjRK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbU+eoACgkQAVBC80lX
0GxOlgf+IY9WcNw5I4iM9knS+2SOIGO5vDlIrMX+Hn20sSJfNt4WniJBkxRevejG
4HGtlWPOrUGiZmW6vM4+TP8iQpqUFteRGSW1CmooKR6nP+JQlTQCoa13Iub9Qk58
onwX2akuxaSpQZ1ejTbLGoFO4dhEG9ew7ZIBJE7CUOPADwWt4Vratb6X9U4R2XyF
s8WQmQ5rx444/I9CVFlRnO8foLmLWqvtD8iQGjFGQODcqfsmyvW/FsyrKVElyYhl
3daD56fvJJ+HBf6aBHVlScAbBKB2J/Jd0n0+92V+hUfS+oYd5hFg5iYIqwZlpqml
ENIXPE58x05t8n6cfjjbEjmJfHwpeA==
=NKIi
-----END PGP SIGNATURE-----

--Sig_/eSrYCYxMSPfbC=T6bpQfjRK--

