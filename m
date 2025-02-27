Return-Path: <linux-next+bounces-5600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F5A48CE9
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 00:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBFCD16CADB
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 23:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578E62C6A3;
	Thu, 27 Feb 2025 23:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bFIMfB1p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652C276D13;
	Thu, 27 Feb 2025 23:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740699982; cv=none; b=gHtRY5Zo2dQH4s46k0UnA6MBW5vbMW8SPUWAWvF1ltzdRTH1Es4eMp7CVCPG23nbX6Xo+hfjfQeRERfw4iwxZUF+IMFD6A+fRaTmM7MC4eKzKP+89SYoFM4iRAwQBUYhDFPuCtCRLrOntMSGywcSsjlzfSx73yo9XR8KXElAhkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740699982; c=relaxed/simple;
	bh=A8aWzERgkK6+/SbpZ6efpPO2wc+31A/h9JgJ5cKgDJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nKCI72Emv0B7LiwoGBlsFPn3EAZzFyuTeqVgSTd9sX4AkIP9M2GIMIxMp76qCy6+2kpnWgb8iyocRYl4Y3q41kAmchzMSVaynVWWIXBMX64CulDZX4GD4eLVTuYNbBRzuHeDvYDGCxZGmaHb+j6zBubDeA3E9QjynDwTX1cvUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bFIMfB1p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740699977;
	bh=uN8ood9dhi8H+zbHYOG8ZZKn5COnzm0CCTBwHngguqc=;
	h=Date:From:To:Cc:Subject:From;
	b=bFIMfB1pkph0q/GIWfIny6lG7psjvp96KHxMPFrY7xszwVi0daHAQQO4iHJxt4TE9
	 /Jjj+ia6qZEP2jza2XdUJX+CuSec2hD0ZJupOVXZFsKWGU4yheUBBLKtxZfsqlIjnL
	 x6WbdDjfXmzkkXdgH922WGDrRo5HAmHxRoxb+MY5wypIK57VDEgca5LDlgfNKTXFbQ
	 qX1mvPg6Bfcz9xdsc5OfJJEHH7FbdvZkqL4KgZJTjCxLHZrp9RRX/vKpWlaOyYczJG
	 /FBoQC55V4gYZIVDzCIPkVx9cHTmziuoZpWCfMHmCMTJn3A/22ajaAvm1V9Hmp4/A1
	 zsyv+nqx4veaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3nzW3gYyz4wbx;
	Fri, 28 Feb 2025 10:46:15 +1100 (AEDT)
Date: Fri, 28 Feb 2025 10:46:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi
 <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matt Johnston
 <matt@codeconstruct.com.au>, Miklos Szeredi <mszeredi@redhat.com>,
 NeilBrown <neilb@suse.de>
Subject: linux-next: manual merge of the vfs-brauner tree with the fuse tree
Message-ID: <20250228104614.7e115517@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PD2Q6+U.=Gmlu3FsiA.ljcy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PD2Q6+U.=Gmlu3FsiA.ljcy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/fuse/dir.c

between commits:

  712c587442f3 ("fuse: Return EPERM rather than ENOSYS from link()")
  150b838b03e8 ("fuse: optmize missing FUSE_LINK support")

from the fuse tree and commit:

  bac12649d4e5 ("fuse: return correct dentry for ->mkdir")

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

diff --cc fs/fuse/dir.c
index 83c56ce6ad20,516de1ae24dd..000000000000
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@@ -1134,19 -1137,13 +1140,19 @@@ static int fuse_link(struct dentry *ent
  	args.in_args[0].value =3D &inarg;
  	args.in_args[1].size =3D newent->d_name.len + 1;
  	args.in_args[1].value =3D newent->d_name.name;
- 	err =3D create_new_entry(&invalid_mnt_idmap, fm, &args, newdir, newent, =
inode->i_mode);
- 	if (!err)
+ 	de =3D create_new_entry(&invalid_mnt_idmap, fm, &args, newdir, newent, i=
node->i_mode);
+ 	if (!IS_ERR(de))
  		fuse_update_ctime_in_cache(inode);
- 	else if (err =3D=3D -EINTR)
+ 	else if (PTR_ERR(de) =3D=3D -EINTR)
  		fuse_invalidate_attr(inode);
 =20
- 	if (err =3D=3D -ENOSYS)
++	if (PTR_ERR(de) =3D=3D -ENOSYS)
 +		fm->fc->no_link =3D 1;
 +out:
 +	if (fm->fc->no_link)
 +		return -EPERM;
 +
- 	return err;
+ 	return PTR_ERR(de);
  }
 =20
  static void fuse_fillattr(struct mnt_idmap *idmap, struct inode *inode,

--Sig_/PD2Q6+U.=Gmlu3FsiA.ljcy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfA+UYACgkQAVBC80lX
0GwMzAf+P9VbYpIu5lAaD7E0Ut25WulvhhU6L80TScMEjOLLgAa5adH1oO0n4G0/
Lh1z49MR2q292VxUu/9jpRWraKXx1hu5f5dOCaQCVGxKmXyxWR+DU+8cAs3Gh69/
I8dpstS/H1ft2i9PiitcLzvgjsy+yK3ZUqdjKxJNXunZIUlOmu0LehBbZE4FSrF2
qYcvaGT+0CuNKN6bn2qBfRrdPcfLL6ugmzTBnvM2Msi1KzyoM5O1CIRIb0GqQrTD
EHeE1bAogT2hEYnlOoDzz3tAYxG34FyxsQs8id0gMzVToZSWM01NCZcLcUSi+wQV
pwSHPta+e9G3TS+2HseXMQrz9mHeSg==
=j2Ij
-----END PGP SIGNATURE-----

--Sig_/PD2Q6+U.=Gmlu3FsiA.ljcy--

