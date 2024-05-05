Return-Path: <linux-next+bounces-2170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4578BC4BF
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 01:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF341C20934
	for <lists+linux-next@lfdr.de>; Sun,  5 May 2024 23:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F524140370;
	Sun,  5 May 2024 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LIaLm5zk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB913FD67;
	Sun,  5 May 2024 23:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714953189; cv=none; b=UNN+1MVAYJ0A6guln8qA6lhByNzjqcLNL5cqyrdTlTdAqQ70y99p2+MevT1uWq5kd0KgOB/31wNZHfMM8AWNKcPmbD4EwQSKSM6IUH7RwLGU67QrkEi0xunOII0qgL6HqxxhSuiZ6y8fuyPwwI8RVUElGnBDrxm9CioFcAzOJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714953189; c=relaxed/simple;
	bh=Hc8tFWnoc9haj1TH+ghLpBTIHnFIHBg42fm/S98A7io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rcmj9l5XEc57rcE57gtf/1kIm2QXc3QOaSOiU94s0pGGoWGLnVGyMju7UiAKbMOzjmkK2+RFxY6/RjaU9O1mSL5Aq2nCdQPLSJY+nORT/FwXhQre443GmkGE+jc91Wul4ps3L1LIuSVRY21kVIDQISGYBxTN/3bkB6DrBaBZSwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LIaLm5zk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714953181;
	bh=6yUJR7AAGUeHB9v2TV0rbifF9X1hRcIjXWGqnly0myY=;
	h=Date:From:To:Cc:Subject:From;
	b=LIaLm5zkJoqEVlAakMoOgPwbND7Lv6rYI6wBiCw3M5agxEoPaL06Xwqmag3Z+aHTx
	 +RVzVNoOkHlE2OF44LuVJ0lGZ1+X6Z3K4p07OC4yQLbFPFjcYfnUymc2SDWwDWXx5g
	 4DMjrgrfMa8hlEOnff2RDZABLX6qI/9DfX3jouSXXXxJoOPHsoKXxM0EQ27/BJiO40
	 20qt0fq9NkpW0DBVNWq6AafAZkkpFUET036gdY2u/dUCD1opRfN//BKzLoFDdD9Jbz
	 0LWZry+WBRW6Obai6nTYSehZA/Ji+gP62DZMH58SioosFZJ0m31S/L+cvSMl7yOKki
	 EMYZZ8n1r1zdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXhDr5pPgz4wcp;
	Mon,  6 May 2024 09:53:00 +1000 (AEST)
Date: Mon, 6 May 2024 09:52:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Eric Sandeen <sandeen@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Steven Rostedt (Google)"
 <rostedt@goodmis.org>
Subject: linux-next: manual merge of the vfs-brauner tree with Linus' tree
Message-ID: <20240506095258.05b5deae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oqfwJB6Ro3fv9/O4cMIegu+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oqfwJB6Ro3fv9/O4cMIegu+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/tracefs/inode.c

between commit:

  baa23a8d4360 ("tracefs: Reset permissions on remount if permissions are o=
ptions")

from Linus' tree and commit:

  78ff64081949 ("vfs: Convert tracefs to use the new mount API")

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

diff --cc fs/tracefs/inode.c
index 417c840e6403,abd0b477e287..000000000000
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@@ -362,9 -295,6 +345,8 @@@ static int tracefs_apply_options(struc
  {
  	struct tracefs_fs_info *fsi =3D sb->s_fs_info;
  	struct inode *inode =3D d_inode(sb->s_root);
- 	struct tracefs_mount_opts *opts =3D &fsi->mount_opts;
 +	struct tracefs_inode *ti;
 +	bool update_uid, update_gid;
  	umode_t tmp_mode;
 =20
  	/*
@@@ -378,31 -308,12 +360,31 @@@
  		WRITE_ONCE(inode->i_mode, tmp_mode);
  	}
 =20
- 	if (!remount || opts->opts & BIT(Opt_uid))
- 		inode->i_uid =3D opts->uid;
+ 	if (!remount || fsi->opts & BIT(Opt_uid))
+ 		inode->i_uid =3D fsi->uid;
 =20
- 	if (!remount || opts->opts & BIT(Opt_gid))
- 		inode->i_gid =3D opts->gid;
+ 	if (!remount || fsi->opts & BIT(Opt_gid))
+ 		inode->i_gid =3D fsi->gid;
 =20
- 	if (remount && (opts->opts & BIT(Opt_uid) || opts->opts & BIT(Opt_gid)))=
 {
++	if (remount && (fsi->opts & BIT(Opt_uid) || fsi->opts & BIT(Opt_gid))) {
 +
- 		update_uid =3D opts->opts & BIT(Opt_uid);
- 		update_gid =3D opts->opts & BIT(Opt_gid);
++		update_uid =3D fsi->opts & BIT(Opt_uid);
++		update_gid =3D fsi->opts & BIT(Opt_gid);
 +
 +		rcu_read_lock();
 +		list_for_each_entry_rcu(ti, &tracefs_inodes, list) {
 +			if (update_uid)
 +				ti->flags &=3D ~TRACEFS_UID_PERM_SET;
 +
 +			if (update_gid)
 +				ti->flags &=3D ~TRACEFS_GID_PERM_SET;
 +
 +			if (ti->flags & TRACEFS_EVENT_INODE)
 +				eventfs_remount(ti, update_uid, update_gid);
 +		}
 +		rcu_read_unlock();
 +	}
 +
  	return 0;
  }
 =20

--Sig_/oqfwJB6Ro3fv9/O4cMIegu+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4G9oACgkQAVBC80lX
0GwgkAf9FK4OKm10Z3vAIhdFRrbm3wpdxd9lVGz3PFKBoozyzXNk7NPaaoDMiZTb
fkpVmRE/BCuO2A2wfYlCcx52nq0iAgVh8enxgJYmbu8H0LPwOQWkIsLY3/LGSqfA
fT6fbZo1Fc5bcf1d9yPf2RXGkHtdVHcySuq6TpNhzvMBYG+Wta+E1EmJOs1OI3//
zbRJuTC8MniDm0hbln4wMpIvalVDCOrE5UNj1wu0Fyr4x6KYS+QnnyEuPXAGf2fy
0DLzIjSf8rFxZRpOLsDMForUOJ6exdpVvxpyVEr2VF+gl5Z+YpO63Gdsk5gkls+t
omoK4EJw1+/SuCEcWyBx/0/qCiZ8HA==
=Y3bs
-----END PGP SIGNATURE-----

--Sig_/oqfwJB6Ro3fv9/O4cMIegu+--

