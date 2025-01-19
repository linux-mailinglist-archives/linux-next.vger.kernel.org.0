Return-Path: <linux-next+bounces-5253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB47A1648A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 00:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCDD1884C77
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 23:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D301DF975;
	Sun, 19 Jan 2025 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tOSHZ3R6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA918184;
	Sun, 19 Jan 2025 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737330078; cv=none; b=JIkSQ9qNlnekHKBk5IHJccOT63RLWQu/B70GZB7qirzA7zOswLsrKCA5ltKf86qgQMFYECBI249HLZ1NYngd488KuDYiIhoy/+W30rIq3HOJQETbIxE3XB0Or7x1tHOjD71SNZPcmRXEddLGhCul4bDu+vXIt/DZwrlcvTGLg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737330078; c=relaxed/simple;
	bh=QMWR15uXEksyrCrmDc3BcMDwuTHLLhJc//BBIT67OV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OnnOApcYjSvYYWReZOJNzKXHFXpCG98IoYOhQzx488d6qZq1tGnndze8OciYfFNQA097wmnHj9MNLqMR0zb1x6NxvqHphENkwKoryfP2qmBR/niJ5FWDyWBskoye5bhE10Pz6GwNHQ/HzbeGuY2apWsjyR/q8VBbxunUteeBg7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tOSHZ3R6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737330061;
	bh=vJdI3KFmqVV/tvIVuFQXAqtkmjYy4I4su+qNtJp/VN0=;
	h=Date:From:To:Cc:Subject:From;
	b=tOSHZ3R6q8gfXLQikOBmCuzLYGUBXw21NWEj94LflcfLht3GWUkhstOC7DuEyTf9D
	 /3GtezcHAXcclxPI5UrYhJJ6oukowQCznXN9oYMCSuiaNLp359Tw4qTdcF0Epz1LY2
	 cjBW0mJY4Eawet9yplL9MFT0+/0UmBQv7+bC6W9/3mT4t41KuewApFHY94EEXAKGNN
	 Ka4BBR95diZpTHLPIY6Ou+Nle2EQ2FpH4mnENaSBAG+I67POpdQANOcU9E3GqJq3pk
	 t2LiVFuUibLcVFO1LEPJkm8LaEaskLmao+EYHQSwEDRZVyVOZPtMcuN2j0HO7kihYt
	 F8C78VTCGF3QQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YbqjT4GDtz4x1V;
	Mon, 20 Jan 2025 10:41:00 +1100 (AEDT)
Date: Mon, 20 Jan 2025 10:41:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20250120104106.0d3e036a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y_7.tQvzGq0yh/.60WFM_VZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y_7.tQvzGq0yh/.60WFM_VZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/afs/dir.c

between commit:

  6dd80936618c ("afs: Use netfslib for directories")

from the vfs-brauner tree and commit:

  8281b27ee7ec ("afs_d_revalidate(): use stable name and parent inode passe=
d by caller")

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

diff --cc fs/afs/dir.c
index a843c36fc471,c6ee6257d4c6..000000000000
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@@ -597,8 -607,8 +598,8 @@@ static bool afs_lookup_one_filldir(stru
   * Do a lookup of a single name in a directory
   * - just returns the FID the dentry name maps to if found
   */
- static int afs_do_lookup_one(struct inode *dir, struct dentry *dentry,
+ static int afs_do_lookup_one(struct inode *dir, const struct qstr *name,
 -			     struct afs_fid *fid, struct key *key,
 +			     struct afs_fid *fid,
  			     afs_dataversion_t *_dir_version)
  {
  	struct afs_super_info *as =3D dir->i_sb->s_fs_info;
@@@ -609,10 -619,10 +610,10 @@@
  	};
  	int ret;
 =20
- 	_enter("{%lu},%p{%pd},", dir->i_ino, dentry, dentry);
+ 	_enter("{%lu},{%s},", dir->i_ino, name->name);
 =20
  	/* search the directory */
 -	ret =3D afs_dir_iterate(dir, &cookie.ctx, key, _dir_version);
 +	ret =3D afs_dir_iterate(dir, &cookie.ctx, NULL, _dir_version);
  	if (ret < 0) {
  		_leave(" =3D %d [iter]", ret);
  		return ret;
@@@ -1127,7 -1142,7 +1114,7 @@@ static int afs_d_revalidate(struct inod
  	afs_stat_v(dir, n_reval);
 =20
  	/* search the directory for this vnode */
- 	ret =3D afs_do_lookup_one(&dir->netfs.inode, dentry, &fid, &dir_version);
 -	ret =3D afs_do_lookup_one(&dir->netfs.inode, name, &fid, key, &dir_versi=
on);
++	ret =3D afs_do_lookup_one(&dir->netfs.inode, name, &fid, &dir_version);
  	switch (ret) {
  	case 0:
  		/* the filename maps to something */

--Sig_/Y_7.tQvzGq0yh/.60WFM_VZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeNjZIACgkQAVBC80lX
0Gyn4gf/UqDgZwEysZx3JbruGDdlFpVfxFaQxf4ypMli13HAjl0CXGUjhFooGTU8
74eHmekxvUa+x6WkIqySvzLwReLxOvrj1T4AWJSI4ftG38jDO3qsF4xY+ygacmIr
5Mga+WqNHJ+1y91V4xDGzcfTad4tV3BIrP/x0SShfT0olHaZzXAPvRNWZiPtDcQv
iwqIs7iZQVf4a21/WmjtugQLbqxczMtJJ1Gz4eZoGyKp1486w4Qh4y6QT9XIlEHb
4TGjhSPmed4yxamYGnEfKJ8iHuj++5khtBg/5xNave5k4nKGrqOKDwIpTw7oEMF9
l3qNbpSYfikAfMZKPdPZXY78P7WEBQ==
=6NMm
-----END PGP SIGNATURE-----

--Sig_/Y_7.tQvzGq0yh/.60WFM_VZ--

