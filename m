Return-Path: <linux-next+bounces-6091-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E3A75D39
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 00:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F40873A72C3
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 22:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9792A1AD3E1;
	Sun, 30 Mar 2025 22:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k6Owq24R"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CA8192D96;
	Sun, 30 Mar 2025 22:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743373705; cv=none; b=cehv3KG2iNEFJfn5hxVHnBukc85QHoDvshOzIeKwhsi79Jfhs7g3SdG3bkrrDiqz84Ciwylg5pBSJcK3Gt37CCv5UQN/gKk4jDAtBo+2zWf2rnfmQVrNThgAzKCyrI7M7zwsiN5r7I4+ICw0Y0nPIz8EkC7ctUNMDlP51XMZaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743373705; c=relaxed/simple;
	bh=RYS9MhzesrrUoPLXu2c6MwfIN30lM1bnS2nmVVnH3VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LduHFwmq6UDmZ6QBmZIJJ7L+tonybcYg8p0CFCmJQlE9UgoglpX0Cv3iwsDSMbZtqsGwuM0NysN9WEQFmrtuZXZY+I3Y60hCZN/qkgtxAj8vKZqjszO2rW/xqJuu86AHoKUZAZeBSGDtzO4e1LgmeOrbL3XbL+CPa7HH8FV8ops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k6Owq24R; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743373697;
	bh=0vaSGuv1ydIA+l5Om6KnRwKWgQa287SH/5RUtST2Duw=;
	h=Date:From:To:Cc:Subject:From;
	b=k6Owq24Rc2wjCIqDEXtd5blfED1JkuI68jr1LU/RzxS+ajmF3YLaC6yr6ZSclPw7+
	 McfdGEzUdzqeEPzSLvEOmnoBi5AwkLnrXqTKwzbERCUxgBuiVwNOX9RBstZB61ZM/s
	 WvwvL+ryg0yc/HmSHLxZ651a1x8UFAsOyV7SBnUJ20mWAHDDf6i2Gd0YydmtV3yi5D
	 orLsJaoMcESuV8bzG0RTWfMoRNzhPdLKqFRf8mZ5p/kfZk/SBnD3D4LT1ARIv1mptE
	 y3wm0EislDaUlbtEfuMXRN8IRYSESzuY9bAYyM3DQjOWwuWJHwLoCRNEiXrguDdP86
	 96EenVaPjCnyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQpnF2nhjz4x8b;
	Mon, 31 Mar 2025 09:28:17 +1100 (AEDT)
Date: Mon, 31 Mar 2025 09:28:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, NeilBrown <neilb@suse.de>
Subject: linux-next: manual merge of the bcachefs tree with Linus' tree
Message-ID: <20250331092816.778a7c83@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VIafB1Geyt1du50.uQaUA1w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VIafB1Geyt1du50.uQaUA1w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/fs-ioctl.c

between commit:

  1c3cb50b58c3 ("VFS: change kern_path_locked() and user_path_locked_at() t=
o never return negative dentry")

from Linus' tree and commit:

  707549600c4a ("bcachefs: bch2_ioctl_subvolume_destroy() fixes")

from the bcachefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/fs-ioctl.c
index f45054cee746,0273130f18dc..000000000000
--- a/fs/bcachefs/fs-ioctl.c
+++ b/fs/bcachefs/fs-ioctl.c
@@@ -537,10 -537,16 +537,12 @@@ static long bch2_ioctl_subvolume_destro
  		ret =3D -EXDEV;
  		goto err;
  	}
- 	ret =3D __bch2_unlink(dir, victim, true);
 -	if (!d_is_positive(victim)) {
 -		ret =3D -ENOENT;
 -		goto err;
 -	}
+=20
+ 	ret =3D   inode_permission(file_mnt_idmap(filp), d_inode(victim), MAY_WR=
ITE) ?:
+ 		__bch2_unlink(dir, victim, true);
  	if (!ret) {
  		fsnotify_rmdir(dir, victim);
- 		d_delete(victim);
+ 		d_invalidate(victim);
  	}
  err:
  	inode_unlock(dir);

--Sig_/VIafB1Geyt1du50.uQaUA1w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfpxYAACgkQAVBC80lX
0Gx7pQf/YT9vMtTpPYEuNNkrZAHfPTp5WNdhVHsNxhojrsEQZqiyQN8I0uC6joOS
hvRFMUp5zt2DznTLiiC51/MJrkJ3uJt4PSKusmmBAFkpXIKK8ic4zImrePSsgypO
1s5mX+F88x9+5oiFtGXMobmt4gScLdbU3FpRPth//bUQdmiqnYGI0+ymCCBEXef2
ojzOAzhC2rlQWpdUlSx8cd1IsXuDdXkayEU9asRn2PlaF0q+j7gZKkKHWKeNMSMl
yEyUdMOF5sWs+v+pAb1axdNb68ZcFaxoW6mLqhSp2Mx2ux28YB6SJ+8cOU8943wL
ICM/pATNXml2z9QIZTTTgiH/2wwLHw==
=1rwO
-----END PGP SIGNATURE-----

--Sig_/VIafB1Geyt1du50.uQaUA1w--

