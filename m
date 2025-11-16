Return-Path: <linux-next+bounces-9024-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B813C61C59
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 21:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5A414E299D
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 20:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E486F1DC985;
	Sun, 16 Nov 2025 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LdXx1zZo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F2A2940D;
	Sun, 16 Nov 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763325299; cv=none; b=udvpdsENkUa9+QL+VXAhB+tbA/Y/+BC6KZgaIfMD8E6GMjGj0S2Ue2y8x2RU88ASkKNFGp2g4O0TcW2azfOJqntP2Xtmt4r3CYr67y8vFThxcfq4sIeRAYluRXD3lsHrEm3sZkcgVFqW0e0n9YYKPiFCnkjMqqsyp9xBzAOttfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763325299; c=relaxed/simple;
	bh=MU0wL0MSWutteg/5UM2/9P3B6cyGdfuVzj+mL9uoI3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R7auj2D6JF797nUs6t3oGIMH3Z9go5+vB/ag0V+Oi0TGe91h6PN/x6ulr/Ld388XP7kp2qPPZA6WUjtZGAjfSAYykKSAdWJOmcmTBvX3Rea1lwlWSlv4KmRuNI+VzAMhAb2abf74OeGV9S8s1BESChZNMuf026vgzvduKMcBoZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LdXx1zZo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763325294;
	bh=0h8DVmUymBb125bSljpAZZ5zJCULv6CGcj2mUqoylJA=;
	h=Date:From:To:Cc:Subject:From;
	b=LdXx1zZoMKIEae0XFbTA8WdnjOnonlTShYepHAA3IQQ4uOE2ukR63PAsy4FkJUra1
	 zdgONX/yAzdrCI3+79Ur20lkQ2vb3zsWhk22yKIDa7yzyO4M7z8+jZkOtQw+jFVCYi
	 4TkNcv3k6EcsiY/VKxKR2Rk5UeMqTGomOMl5Q6QYiaWQN7U7DmrtG27gaYnJSfSizT
	 s04XA/OmpcUIZeG+Gu9i3hCwoz8HavzhSnROGGz/kiEucOMUza4mjaZ9f0Xp9C9ytG
	 2C37zv9TjdeNq7kbWzkffApb0o4PdOfMsQPgJkmY06QLWM5DfmDZlY/xU9/2cndVaf
	 bul6eqmDuaQHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8jKn02v6z4w9Z;
	Mon, 17 Nov 2025 07:34:52 +1100 (AEDT)
Date: Mon, 17 Nov 2025 07:34:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Chuck Lever
 <chuck.lever@oracle.com>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, NeilBrown <neil@brown.name>, NeilBrown
 <neilb@ownmail.net>
Subject: linux-next: manual merge of the vfs-brauner tree with the nfsd tree
Message-ID: <20251117073452.2c9b0190@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E46ofUilFL+Dp9VaaPG025a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E46ofUilFL+Dp9VaaPG025a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/nfsd/nfs4recover.c

between commit:

  8a25e05a98ab ("nfsd: move name lookup out of nfsd4_list_rec_dir()")

from the nfsd tree and commit:

  4fa76319cd0c ("vfs: allow rmdir to wait for delegation break on parent")

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

diff --cc fs/nfsd/nfs4recover.c
index b1005abcb903,1f031e5af5b2..000000000000
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@@ -201,18 -210,17 +199,16 @@@ nfsd4_create_clid_dir(struct nfs4_clien
  		 * In the 4.0 case, we should never get here; but we may
  		 * as well be forgiving and just succeed silently.
  		 */
- 		goto out_put;
- 	dentry =3D vfs_mkdir(&nop_mnt_idmap, d_inode(dir), dentry, S_IRWXU);
+ 		goto out_end;
+ 	dentry =3D vfs_mkdir(&nop_mnt_idmap, d_inode(dir), dentry, S_IRWXU, NULL=
);
  	if (IS_ERR(dentry))
  		status =3D PTR_ERR(dentry);
- out_put:
- 	if (!status)
- 		dput(dentry);
- out_unlock:
- 	inode_unlock(d_inode(dir));
+ out_end:
+ 	end_creating(dentry);
+ out:
  	if (status =3D=3D 0) {
  		if (nn->in_grace)
 -			__nfsd4_create_reclaim_record_grace(clp, dname,
 -					HEXDIR_LEN, nn);
 +			__nfsd4_create_reclaim_record_grace(clp, dname, nn);
  		vfs_fsync(nn->rec_file, 0);
  	} else {
  		printk(KERN_ERR "NFSD: failed to write recovery record"
@@@ -406,17 -415,10 +394,17 @@@ purge_old(struct dentry *parent, char *
  	if (nfs4_has_reclaimed_state(name, nn))
  		goto out_free;
 =20
 -	status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child, NULL);
 -	if (status)
 -		printk("failed to remove client recovery directory %pd\n",
 -				child);
 +	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
 +	child =3D lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
 +	if (!IS_ERR(child)) {
- 		status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
++		status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child, NULL);
 +		if (status)
 +			printk("failed to remove client recovery directory %pd\n",
 +			       child);
 +		dput(child);
 +	}
 +	inode_unlock(d_inode(parent));
 +
  out_free:
  	kfree(name.data);
  out:

--Sig_/E46ofUilFL+Dp9VaaPG025a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkaNWwACgkQAVBC80lX
0GwH2wf/T0beDlnNCzvFzRs0qJpDFq8fWP5V285ET68tdJxT4loLJ77tha+gin+T
HrH3Nv/Ja9xMUKp5wu6XhmxvCyV9x1lnm0c20GOlupu6oVxPLML6MVL2RlPdIpsl
Th9r3nbECWxl6l4Jli9xrFmec4V6MYLvaZPjIaDuO2iNLoNlH6HG/8ndUil8oH0z
7TuYSq6/Sofj39UNO0UNAcsLR1T8F6CngZdoBk8AOeFiiaBgWuCxtKRSTWYBti0z
U8+Q/UNkFU1nxiBVdcc/NpMiQqFB39YZ2DRyHM2D+ahlo7oCEVJNg1/V9tgWFiST
SZyXYir66km8VNZBx22T9FVSnwYS8w==
=DmCf
-----END PGP SIGNATURE-----

--Sig_/E46ofUilFL+Dp9VaaPG025a--

