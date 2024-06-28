Return-Path: <linux-next+bounces-2709-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810991C548
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 19:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6935D1C2347C
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 17:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E438C155389;
	Fri, 28 Jun 2024 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4ibRtrm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9891B645;
	Fri, 28 Jun 2024 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597584; cv=none; b=jUc8JpLRWmzssR70w+e+W9SqHSb0amzfUzOFEP+so0Ahq0khmUboGikO2555QYQLMvDs6zmHs+MaU1wJ30/i7sTENkPTtHT9j09zn/RMVwsz0+vBlLEcplVIdbnL5nEEBPRgDVViQuM61Lb1UBypXcMzrhIhi56+I2OvMIXNw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597584; c=relaxed/simple;
	bh=2R8ouVI8Pggrc3fH1l3HrpgQ4mKXIH6/L3sR4C5buHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9oO8DJ7N3SWl8CxWo2QJzV4A/YW79LStEIRjfb0kL5gebWse0/0lg2sCE1ZMjigm0S2vM0M/j0O3ifUPHYd9tfAm8lpN/YIYN1icciQvTD/yRLQWBOHdipKzA0GlbIW6XdJJjTYrpfcG1sl6JtbKcBbztPc/wk0dzYXoPMxvJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4ibRtrm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3186C116B1;
	Fri, 28 Jun 2024 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719597584;
	bh=2R8ouVI8Pggrc3fH1l3HrpgQ4mKXIH6/L3sR4C5buHQ=;
	h=Date:From:To:Cc:Subject:From;
	b=V4ibRtrmCtU1WnGnziL6HuE20UQ1P/S9Uy6JEptf2IF9tQKqhJkDz8Zq8NGZYW3Vl
	 uCpRtSMAPQk84pa7p72uDqmAg4dZOE10ORaA41euL4pIrjLV9bKV7Efel4sV2ek8TW
	 jabDIAHB5CDOp2wV4mp5MDhUqMB7JfHTvQnPiTit0gPycuO7EAocOV3qxJlhInEl4U
	 CkiuHVC8wTuAcmoXwAboTqaAGg5vWxvEjoH31fV3skLLsRQUU+1P8+5o5yRdUihin9
	 9hVzHxIwNGlsSnckG/qwXQ0Y+GmfmbNUpJwIeQf8D7nvjmwvufvOoXVZ9vZ6nQ+YTP
	 V+vtdPDJEu3GA==
Date: Fri, 28 Jun 2024 18:59:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Prasad Singamsetty <prasad.singamsetty@oracle.com>
Subject: linux-next: manual merge of the block tree with the vfs-brauner tree
Message-ID: <Zn76C70F9QB_Z0bw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFtvVvlITWZV7OjV"
Content-Disposition: inline


--UFtvVvlITWZV7OjV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/stat.c

between commit:

  0ef625bba6fb2 ("vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)")

=66rom the vfs-brauner tree and commit:

  0f9ca80fa4f96 ("fs: Add initial atomic write support info to statx")
  9abcfbd235f59 ("block: Add atomic write support for statx")

=66rom the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/stat.c
index 6f65b3456cadb,bd0698dfd7b36..0000000000000
--- a/fs/stat.c
+++ b/fs/stat.c
@@@ -214,43 -245,6 +245,45 @@@ int getname_statx_lookup_flags(int flag
  	return lookup_flags;
  }
 =20
 +static int vfs_statx_path(struct path *path, int flags, struct kstat *sta=
t,
 +			  u32 request_mask)
 +{
 +	int error =3D vfs_getattr(path, stat, request_mask, flags);
++	struct inode *backing_inode;
 +
 +	if (request_mask & STATX_MNT_ID_UNIQUE) {
 +		stat->mnt_id =3D real_mount(path->mnt)->mnt_id_unique;
 +		stat->result_mask |=3D STATX_MNT_ID_UNIQUE;
 +	} else {
 +		stat->mnt_id =3D real_mount(path->mnt)->mnt_id;
 +		stat->result_mask |=3D STATX_MNT_ID;
 +	}
 +
 +	if (path_mounted(path))
 +		stat->attributes |=3D STATX_ATTR_MOUNT_ROOT;
 +	stat->attributes_mask |=3D STATX_ATTR_MOUNT_ROOT;
 +
- 	/* Handle STATX_DIOALIGN for block devices. */
- 	if (request_mask & STATX_DIOALIGN) {
- 		struct inode *inode =3D d_backing_inode(path->dentry);
-=20
- 		if (S_ISBLK(inode->i_mode))
- 			bdev_statx_dioalign(inode, stat);
- 	}
++	/*
++	 * If this is a block device inode, override the filesystem
++	 * attributes with the block device specific parameters that need to be
++	 * obtained from the bdev backing inode.
++	 */
++	backing_inode =3D d_backing_inode(path->dentry);
++	if (S_ISBLK(backing_inode->i_mode))
++		bdev_statx(backing_inode, stat, request_mask);
 +
 +	return error;
 +}
 +
 +static int vfs_statx_fd(int fd, int flags, struct kstat *stat,
 +			  u32 request_mask)
 +{
 +	CLASS(fd_raw, f)(fd);
 +	if (!f.file)
 +		return -EBADF;
 +	return vfs_statx_path(&f.file->f_path, flags, stat, request_mask);
 +}
 +
  /**
   * vfs_statx - Get basic and extra attributes by filename
   * @dfd: A file descriptor representing the base dir for a relative filen=
ame

--UFtvVvlITWZV7OjV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ++gsACgkQJNaLcl1U
h9BXlAf/RCundUFyfRJUHJaSqc0ABvooZWdLK/WwqB2FJxNGmcT+PvUZg+akPtV1
Op3BfiKQ+y+u7gogNsZQczUw/LPSwTt2CpTfq0wWwRTrSJsYMyEFCEPR75E9Y2Wl
4i/WYT3svi7YQnXSPbXCWL7SvZK1mG/TJ9/aJKGTAqmdqsXkU5i1gTShEU1T8Jr3
PxkA6QbX94lnRqLfms0DaC+HIeMYhY5d9peFs5OFqq2t9AbiasAtyoAc1p+fpHD2
Y0zIztl+5V92nSo+9291ypmo9LHlRjtcyylKCyp6nrMqERgFEm9vY8UpuKEUqbqD
4p2dDLKdkE8qpq6ZmRlCU4imVtAv/g==
=cbyp
-----END PGP SIGNATURE-----

--UFtvVvlITWZV7OjV--

