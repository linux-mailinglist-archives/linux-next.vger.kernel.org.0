Return-Path: <linux-next+bounces-2583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED5090CA9B
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 13:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1601F23978
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 11:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA3E1581E8;
	Tue, 18 Jun 2024 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUBu1mHq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC7B155A46;
	Tue, 18 Jun 2024 11:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710909; cv=none; b=rLEWEAEsFKaesDQfFKSIL111nwKegLrzRdmanmsewimzosB+mFJlQnlH7G6sDZQU+CXSCviyvwmadb8krPZEtlffym4nCGiW40CPC/jLYFqFyMiFDWa9OEgi3oWilLIJyEXHC7T1/3ykfkGSOt1htVTvAct420+orahhV6EJHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710909; c=relaxed/simple;
	bh=5LFOZBL74VuadUFLhOQql8yNTsCOeekeZ31KxfExPLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNocAGWAZffcNO/C8p1XdIFgqpCNWLrI+vDCHTuIF2vJhuYyk31XuKyH5oUxoeSwLY5DwgopjC98DeBO261DngKIttwRc4zXydkfpJBWgyPFA9nVZP+dXUGDtV6F5ttM5u05AUGfG6lqmUxAnasjBzRSOsEvxV62/FdqJbv9348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUBu1mHq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FD3C4AF48;
	Tue, 18 Jun 2024 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718710908;
	bh=5LFOZBL74VuadUFLhOQql8yNTsCOeekeZ31KxfExPLI=;
	h=Date:From:To:Cc:Subject:From;
	b=XUBu1mHqkoTeWfB4S8tz4MMHWNGaL+XLtLOF6h1ydK7QffhByJ44asu1CVLtq1+cv
	 NXzDCx/hsObaHoOA32/xp0HURtoqoTZpeDE183pDerR1ZDepbRSwqf1twFZH+F/Ipa
	 S34K/1/JI5HuWaER7AXeRw5PoqgXNjp9GIEDd3WmjbKhwkZmCeLmrlaArtY7j9+5EX
	 5OjJ5Bgd3Tak2kbDQEMcdK2ZwrwXz8O0vpG4ga8g9thsCBC/C8h37OlodBYnja5Ahy
	 QR/4esOOixvQ7rHv2KuWjCq8mrscYqb4NSKFI+8WAxufx/glx3L5C0oQFDTKT2juEY
	 5F4rV4I1YH8hg==
Date: Tue, 18 Jun 2024 12:41:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the btrfs tree
Message-ID: <ZnFyeNLLrEcX5_g0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MyyM/Ybbte8ajK3U"
Content-Disposition: inline


--MyyM/Ybbte8ajK3U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/btrfs/inode.c

between commit:

  adaac2633c9ad ("btrfs: remove super block argument from btrfs_iget_locked=
()")

=66rom the btrfs tree and commit:

  b49558e8ce3dc ("btrfs: use iget5_locked_rcu")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/btrfs/inode.c
index 89e58647d08de,cbb2c92b6c084..0000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -5582,7 -5587,7 +5582,7 @@@ static struct inode *btrfs_iget_locked(
  	args.ino =3D ino;
  	args.root =3D root;
 =20
- 	inode =3D iget5_locked(root->fs_info->sb, hashval, btrfs_find_actor,
 -	inode =3D iget5_locked_rcu(s, hashval, btrfs_find_actor,
++	inode =3D iget5_locked_rcu(root->fs_info->sb, hashval, btrfs_find_actor,
  			     btrfs_init_locked_inode,
  			     (void *)&args);
  	return inode;

--MyyM/Ybbte8ajK3U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxcncACgkQJNaLcl1U
h9B7mwf6Ai8p+Mn7fzmsdlFxYwDN1ZrQsqzBKfxyLisx3ug7uHVnNNUp/mVT8WiV
9jyBPnZc2+PzXD4u6yHT3KY3cGx3tDdu/gthZTVMd+UX8BkX30/oqwe9WDUIdX+7
TYsdSCeuVFIM4R65xw0hAyuagXhhxbo004B6Q+89lE0oyTDtrSkyFME8BDOg2AJZ
FBkVKdsVvJaQWZGAG35RABDqqB1kb4D/WrQpNQuW33q9zqGZlHNxg9cCr+votUrH
pn1EuhEF5pZxfx3uvJ8/erW/zYQlK91ltoXruXtLBrBck6grDFjFZ3iXU9RU1bKW
tB32dtEHyWxcArMtcCK2DQ22LliTqA==
=4b7d
-----END PGP SIGNATURE-----

--MyyM/Ybbte8ajK3U--

