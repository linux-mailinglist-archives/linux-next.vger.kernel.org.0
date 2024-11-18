Return-Path: <linux-next+bounces-4805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDD89D1AFE
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 23:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9323DB21166
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 22:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889BF1E5711;
	Mon, 18 Nov 2024 22:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="geCQMTcq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD935158DAC;
	Mon, 18 Nov 2024 22:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731968207; cv=none; b=LHNnjxctXMBe6PkERUOfFQnUGmbpsFj0QsykUKHBHX6W6M/Rg3v+lB6S8T5VKD45a+vL4oHHrzTsT95Qx9ltGFf7Gw/ooMJ0llrnmbwvYs8mvZyQ+iR9hxQLE6ZKZBtCcqW5J/fmsedkYIvhGo5/2Xk4S8v7FHsR5TE1hj85IRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731968207; c=relaxed/simple;
	bh=EzPpcOTQFNeHFA1obe3HvBAvPzz42yRBtFd9GRiJwSU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTu57BQHrcIBP9hvAcopwvC36+5jSDytUTui8YUc1XBU+HvBbxkcp05pJlIVdeMPtVCQJc289pG+K8+TWHm55SflTjSGOxFeNwvnB/wBLmZCR6F2y6/eEGySW2v21E8tYPZi6SCFjPyleVm233FVuX0ERmvOjgpH1xl8YoP5ETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=geCQMTcq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731968197;
	bh=vY7LRjT373NVXOmT9Jz0uUdmdGpVOfj8aJRMwjuzs9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=geCQMTcq7qi5sivrew/2A87DTEztF6xbXpYHIt97peqcCkc1PWNZm1GreLVaI+aWC
	 T/DdqHjGL1Bp2oVGZjMOk3N/5sIJWeOkINEkVd19U3jJtiWRf7u8b5bMZf+w02vygZ
	 xUTKWqKLtWztDVhCw0uRpE2gKKwP4L9Jxzw4jVGkuVlO/lKMcmXWWImP9TLz89twuW
	 gLo0ZZ/wZdpMRe5iHrlPYH8VsZfvJKNTse2NZDfdHR05iLMhhcaKieWp+YyZVy6yD7
	 Ln+64naKLD9fuAz/zWSpEvfWKZk72/gNaoXd21ptF+7hFyg/MmmoiBh3vY9SI5L1ew
	 RaiyFo3TaaFdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xshmj1b8dz4x33;
	Tue, 19 Nov 2024 09:16:37 +1100 (AEDT)
Date: Tue, 19 Nov 2024 09:16:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>,
 Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20241119091639.2216ae57@canb.auug.org.au>
In-Reply-To: <20241016085129.3954241d@canb.auug.org.au>
References: <20241016085129.3954241d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/np4oKuvmNuRF.NFrWGH.o.p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/np4oKuvmNuRF.NFrWGH.o.p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Oct 2024 08:51:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/btrfs/file.c
>=20
> between commit:
>=20
>   377781e9e6f8 ("btrfs: drop unused parameter iov_iter from btrfs_write_c=
heck()")
>=20
> from the btrfs tree and commit:
>=20
>   e2e801d6e625 ("btrfs: convert to multigrain timestamps")
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
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/btrfs/file.c
> index 033f85ea8c9d,e5384ceb8acf..000000000000
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@@ -1124,27 -1120,7 +1124,7 @@@ void btrfs_check_nocow_unlock(struct bt
>   	btrfs_drew_write_unlock(&inode->root->snapshot_lock);
>   }
>  =20
> - static void update_time_for_write(struct inode *inode)
> - {
> - 	struct timespec64 now, ts;
> -=20
> - 	if (IS_NOCMTIME(inode))
> - 		return;
> -=20
> - 	now =3D current_time(inode);
> - 	ts =3D inode_get_mtime(inode);
> - 	if (!timespec64_equal(&ts, &now))
> - 		inode_set_mtime_to_ts(inode, now);
> -=20
> - 	ts =3D inode_get_ctime(inode);
> - 	if (!timespec64_equal(&ts, &now))
> - 		inode_set_ctime_to_ts(inode, now);
> -=20
> - 	if (IS_I_VERSION(inode))
> - 		inode_inc_iversion(inode);
> - }
> -=20
>  -int btrfs_write_check(struct kiocb *iocb, struct iov_iter *from, size_t=
 count)
>  +int btrfs_write_check(struct kiocb *iocb, size_t count)
>   {
>   	struct file *file =3D iocb->ki_filp;
>   	struct inode *inode =3D file_inode(file);

This is now a conflict between the btrfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/np4oKuvmNuRF.NFrWGH.o.p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc7vMcACgkQAVBC80lX
0Gw3FggAno4JmFUvWw4dE8DyYnmf2HI6NQqxW+GMz1xJJdUklzfcZRSdWaa3ZmJb
ciuyBwOYp2ed/+L1VEeG9Um+hrG2SL7Zo3jjbVTwn89dOxeNKFhEJyhcvaLPEQLE
D5Hxk+XQg+Ob4GczbTigg6o20P06Y46l/LxUTUEyhYMYOFqCLdaRvdaZH6BLq30s
K8DN0T6RF36GgKyg4POH2RrmtxUJrdMygJPW4gMWWSSZaz6k87VYHqhcpGCbyWau
PHdpaMGsDGzXwv14aouhS8+TMJvBKD1/H4Ar48B98ZIdKBhXr8atuIhfBxinHhkq
pN3LnREP4bS+QDTNF4ko3y4/CxcQtA==
=2b8Q
-----END PGP SIGNATURE-----

--Sig_/np4oKuvmNuRF.NFrWGH.o.p--

