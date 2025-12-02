Return-Path: <linux-next+bounces-9309-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD5C9D4CA
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 00:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF58234B2FF
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 23:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCB42F746C;
	Tue,  2 Dec 2025 23:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nBEFgjAT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D642BE658;
	Tue,  2 Dec 2025 23:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717082; cv=none; b=laj8lo7peg6zDXayy0B6CjKR/OBSzJuQx9Jntlar4x/ZOg8BeapoFLcHJkk+BKcXMwit/n3eVrRItwNf20L/CjCTSGQ1Va/istdpFFmBWz7mfnEAR1S3vGhUzDt4Yx4cVc6IXdHB7kGdYnrM99BJoIS1JiMAadS97ogRzwLls8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717082; c=relaxed/simple;
	bh=c5QRDzEemrLw6Sv3EuYLv5PtkTp1tkyQij1kZp+5GdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I56UocCfdq9CvJT1QU01Wua8GTe8z5Gs2JVm4g8xUcptxB5Yg+YpdEiAvw3mFRrvv4vHRB8ANLmLXC3+1rsLnZ29aow9MrEGJ8wbLgHohqbi+Z9yo941mw0bkfFoPqvjA/3Q5DHmK5QIDBLusfuLIBHh+PkPBihurB84MAvZ4sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nBEFgjAT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764717071;
	bh=/DT9EJGQANA2arIhZBrlXFGpiqDayRZUNXZc+llPmFQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nBEFgjATv0Fl6pWJMMTtEu3pTeqiS8NxtZ0NwT6C2vqhrYgjYmp72JJotBPx6MgT/
	 zWXZIHNAe+fYsukWjZpLe9xUOMF35wgcOb6mBy5JA0Xb4e29Y3l1rMaNXcE82BR8ZO
	 XrLEWMW7fuTBYIiA2BtpJAE8HpC3QpAY5pgdL1o6dbh+2FvRs00Nz7pWlbpb/UnLyq
	 6U9ruzI4iMlMbN2SG57YVdLhazJV3T6Ql5kds7kmnLBSt1HqdYMOekjlRLKYzJuS/I
	 GI9XRI8BZ33E5cSfca7dk2juvmaMem2B4vOHU4cb49ZUSavPi931D2DcENvmtwwF3c
	 q96R5EchOc4dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dLc2j71KWz4wDR;
	Wed, 03 Dec 2025 10:11:09 +1100 (AEDT)
Date: Wed, 3 Dec 2025 10:11:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, NeilBrown <neil@brown.name>, NeilBrown
 <neilb@ownmail.net>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the nfsd
 tree
Message-ID: <20251203101108.02f419d7@canb.auug.org.au>
In-Reply-To: <20251117073452.2c9b0190@canb.auug.org.au>
References: <20251117073452.2c9b0190@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WE/yn8gB_VhKax2KUhSnl7O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WE/yn8gB_VhKax2KUhSnl7O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Nov 2025 07:34:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/nfsd/nfs4recover.c
>=20
> between commit:
>=20
>   8a25e05a98ab ("nfsd: move name lookup out of nfsd4_list_rec_dir()")
>=20
> from the nfsd tree and commit:
>=20
>   4fa76319cd0c ("vfs: allow rmdir to wait for delegation break on parent")
>=20
> from the vfs-brauner tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc fs/nfsd/nfs4recover.c
> index b1005abcb903,1f031e5af5b2..000000000000
> --- a/fs/nfsd/nfs4recover.c
> +++ b/fs/nfsd/nfs4recover.c
> @@@ -201,18 -210,17 +199,16 @@@ nfsd4_create_clid_dir(struct nfs4_clien
>   		 * In the 4.0 case, we should never get here; but we may
>   		 * as well be forgiving and just succeed silently.
>   		 */
> - 		goto out_put;
> - 	dentry =3D vfs_mkdir(&nop_mnt_idmap, d_inode(dir), dentry, S_IRWXU);
> + 		goto out_end;
> + 	dentry =3D vfs_mkdir(&nop_mnt_idmap, d_inode(dir), dentry, S_IRWXU, NU=
LL);
>   	if (IS_ERR(dentry))
>   		status =3D PTR_ERR(dentry);
> - out_put:
> - 	if (!status)
> - 		dput(dentry);
> - out_unlock:
> - 	inode_unlock(d_inode(dir));
> + out_end:
> + 	end_creating(dentry);
> + out:
>   	if (status =3D=3D 0) {
>   		if (nn->in_grace)
>  -			__nfsd4_create_reclaim_record_grace(clp, dname,
>  -					HEXDIR_LEN, nn);
>  +			__nfsd4_create_reclaim_record_grace(clp, dname, nn);
>   		vfs_fsync(nn->rec_file, 0);
>   	} else {
>   		printk(KERN_ERR "NFSD: failed to write recovery record"
> @@@ -406,17 -415,10 +394,17 @@@ purge_old(struct dentry *parent, char *
>   	if (nfs4_has_reclaimed_state(name, nn))
>   		goto out_free;
>  =20
>  -	status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child, NULL);
>  -	if (status)
>  -		printk("failed to remove client recovery directory %pd\n",
>  -				child);
>  +	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
>  +	child =3D lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
>  +	if (!IS_ERR(child)) {
> - 		status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
> ++		status =3D vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child, NULL);
>  +		if (status)
>  +			printk("failed to remove client recovery directory %pd\n",
>  +			       child);
>  +		dput(child);
>  +	}
>  +	inode_unlock(d_inode(parent));
>  +
>   out_free:
>   	kfree(name.data);
>   out:

This is now a conflict between the nfsd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WE/yn8gB_VhKax2KUhSnl7O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkvcgwACgkQAVBC80lX
0Gyg2AgApMjgVOiCGtgXYxuBAsuDjOjWv9noM7oFOe6Bd1jKHG4r7yyCIcq9mwf/
vdivUdFNSHuHc/j6pW++Wk4KYsL9kKisxqykjL98396xI6GAcB7qtnaG6pjYNv70
esZUt0apqVQFIOhCptonw8deUTwT2Soc+Hi1sm0OngjHW4kDOPDOrQ1tSj10eKaW
0rrFiA+l+osOG0b/AYRL9C3w3jw5BKo/RI/hIOQjOshFBf+QncBc3Ct3iAJW2g+i
satf2ncOtrWlIrD4PUNO9i3+w+jF85zmotADhJe869FGlQFBAOAVOhmq3wB5As/a
yekIgD/5mSybuDgjt3g9gHm2N8IOIQ==
=Qpq4
-----END PGP SIGNATURE-----

--Sig_/WE/yn8gB_VhKax2KUhSnl7O--

