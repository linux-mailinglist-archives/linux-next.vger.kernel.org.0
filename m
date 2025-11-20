Return-Path: <linux-next+bounces-9119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB118C766A7
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 22:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 06F29295C6
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 21:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2844836C5B8;
	Thu, 20 Nov 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WmNFZQa4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2E36C0D3;
	Thu, 20 Nov 2025 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675279; cv=none; b=DSTX9zWrte4fINGUN5DuJqmnXq+Aece2VhyORdinkLDsJTeNJT4HpN8idsShGPWdU5ZgRtXh/qWeu8HI6+dI3sLWhtO3iszsObSZAJJuMMaVb36LUs7AxmROIhQ9DKzag1eRCfblKmXyuWR+MzBfP2b7tfh1n3r4k5BbQBFOw8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675279; c=relaxed/simple;
	bh=EdyoArGttsOazSxDtyEJcEfcUIpCxZvRxOZ8Grs0eLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tU/+aec1DGWLz0OLPSToOKzyu+Awp0FKWaE8wmy++/rrIlAUrk0NX2b0p5cAU4VdORjXR8uE6JBMvX/VeuAmbFdqd4qVSc2gIpCaD4QMhGM1HOLG1ryrCi1QHguYz7popG4pVwOQn84+5bmhUITr4wK9w2bOGIEMP7krKW1R4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WmNFZQa4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763675274;
	bh=pwxFYRd/+QoYcKp5JgIcdwnEu1hejZQFaSgB7uz9P/Y=;
	h=Date:From:To:Cc:Subject:From;
	b=WmNFZQa4s5EhMyW3JoCkc7ziunRYQHYEHGyCm5LEXL23KaF04auUKDSeI7ecPsfos
	 TXkfPm3M00BL1cbHpraMAvMKcSH4MLvfNuGlSLv1S4muuTWcFF2n8fXqWXc/gTCRJW
	 mzgrUOUzWKKtU2/8nZJj8jNAqNUR3obHvRPk1dmZW7PHGye+Vu5L6hxKWlMDx6Ki+6
	 J5A8MapyC6KnZ7r+KewsZF3yqVGCPpOjbo8BhY1tCTlxqSHt6wPYbUrmkDFeH4xOLS
	 g/rYVDIrtsQRAvSF3qoEq5jElSUKWg61i+80Obhh2EHSjskDrFSeFIsuI+7X7TN9yt
	 MY57ytC9Y6qHQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCBmB0kwdz4wHJ;
	Fri, 21 Nov 2025 08:47:54 +1100 (AEDT)
Date: Fri, 21 Nov 2025 08:47:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20251121084753.585ab636@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j2Si/UCvI7h_k=.lN9IztJ.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j2Si/UCvI7h_k=.lN9IztJ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  security/apparmor/apparmorfs.c

between commit:

  7bb1eb45e43c ("VFS: introduce start_removing_dentry()")

from the vfs-brauner tree and commit:

  eb028c33451a ("d_make_discardable(): warn if given a non-persistent dentr=
y")

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

diff --cc security/apparmor/apparmorfs.c
index 9d08d103f142,9b9090d38ea2..000000000000
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@@ -355,17 -355,22 +355,22 @@@ static void aafs_remove(struct dentry *
  	if (!dentry || IS_ERR(dentry))
  		return;
 =20
 +	/* ->d_parent is stable as rename is not supported */
  	dir =3D d_inode(dentry->d_parent);
 -	inode_lock(dir);
 -	if (simple_positive(dentry)) {
 +	dentry =3D start_removing_dentry(dentry->d_parent, dentry);
 +	if (!IS_ERR(dentry) && simple_positive(dentry)) {
- 		if (d_is_dir(dentry))
- 			simple_rmdir(dir, dentry);
- 		else
- 			simple_unlink(dir, dentry);
+ 		if (d_is_dir(dentry)) {
+ 			if (!WARN_ON(!simple_empty(dentry))) {
+ 				__simple_rmdir(dir, dentry);
+ 				dput(dentry);
+ 			}
+ 		} else {
+ 			__simple_unlink(dir, dentry);
+ 			dput(dentry);
+ 		}
  		d_delete(dentry);
 -		dput(dentry);
  	}
 -	inode_unlock(dir);
 +	end_removing(dentry);
  	simple_release_fs(&aafs_mnt, &aafs_count);
  }
 =20

--Sig_/j2Si/UCvI7h_k=.lN9IztJ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfjIkACgkQAVBC80lX
0GwIXQf/TIEQQ60KDdnGCweaTW5byJP55MiJ6nPs7oc1Z81hYqACxtEsOyxB5Gla
YUVdfRSnuZfmKmM/SQKj06cMI9ITNgJPEqMe8pq8b3NK/4m0MoCt5ciyn5NrVKwM
L8yOVbFXgFh6gQcFt57tn8seZGnjUYnXlL/wvcVHHvwoqMQeEaSWRhtg5c0hfnA6
x4RyfiduonDckaj99bROaMAVf1KeeVWwJTC4Yf1dhhRTE6FH1Q07fCyeDfY4ejCf
mgmTE2snTKIYr3tAHPqYqWj4j3RbI/XUFyExdSnjY2uJQQLgvA88uDFn3cKJW/gb
RozpTcJX8xyvuXObea4AKPBHx8tbWg==
=CW9B
-----END PGP SIGNATURE-----

--Sig_/j2Si/UCvI7h_k=.lN9IztJ.--

