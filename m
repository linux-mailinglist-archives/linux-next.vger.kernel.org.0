Return-Path: <linux-next+bounces-3022-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2A931E34
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 02:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF8F282A43
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 00:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B811E1876;
	Tue, 16 Jul 2024 00:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ytt3NNLD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152917F7;
	Tue, 16 Jul 2024 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721091504; cv=none; b=Baj/sMSjpz/HiIHkBZGJ9DaVlvmj6vqhuO/feLFZiyqJTT70bZ93E+tMrhYl1L0MsAKb+vG6KGF3iHcX0V5B4K/hlv9gT46hl4xi1n9HNtUXcJoQcZ+fqW6mumEhCc8i2BN6o6pFtDPU74uwWrmjxodd1IClcTD5WoJlThsEwkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721091504; c=relaxed/simple;
	bh=mZWafBkOw1E3DFBP11k33323DzGxODmyAUnJuloCuZk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YyfvG+yRPAUwhYBRZkHic4PGXof0mXymadu0B7/YkHVzr+RFOugV7sg4nFYQQ+NlM1W3UBsTCw/gWP5JOaJPwCrn0knGNBzqFmMJD9i8gv5p0WE3nL/YFaamF2blxCjgJ+uGyMVzG4uZVDnXny28rBsT2UZD0Of1u+XUJd9ZBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ytt3NNLD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721091499;
	bh=YW6SVvLGC382A1pg1wvXRYmrvH68wauPrtI3gelmCn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ytt3NNLDOXV4ANwpbIWof9PE+6XfSBLmQp3CJeL/8A642eGN/V//j7dBTNJ8A9Xxo
	 q2r1UpV0EHUvmEtDI1NkgY3EEi4DokRahii+EbclNgQGzLtJPAXIHDa34gNlWyLB4G
	 10y+fE+6rj1z2l/+fsUyIMqLHuoaFIqNAcutna84XCDD8/JpDPx2WA6JtjjDeD8AHu
	 ei/fW6Oj4F/+7usu3VM6OeDJdj/DQRhuRgrCcssBZ6Gr/SFnWH11HN2dYEfWAW/UDK
	 FMXD2FcvnBqDLOE3JxKGVHBs9WBRsK9OxCSKVUiq2qKyz5CJL2UdNo+sM1wlJAT4Fo
	 M3JOKn9mUpNQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNLKR2gfHz4wc3;
	Tue, 16 Jul 2024 10:58:19 +1000 (AEST)
Date: Tue, 16 Jul 2024 10:58:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.com>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Filipe Manana <fdmanana@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20240716105818.03558dae@canb.auug.org.au>
In-Reply-To: <ZnFyeNLLrEcX5_g0@sirena.org.uk>
References: <ZnFyeNLLrEcX5_g0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BhsuFU2eRxBq/l/FS5GcHN8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BhsuFU2eRxBq/l/FS5GcHN8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 18 Jun 2024 12:41:44 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/btrfs/inode.c
>=20
> between commit:
>=20
>   adaac2633c9ad ("btrfs: remove super block argument from btrfs_iget_lock=
ed()")
>=20
> from the btrfs tree and commit:
>=20
>   b49558e8ce3dc ("btrfs: use iget5_locked_rcu")
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
> diff --cc fs/btrfs/inode.c
> index 89e58647d08de,cbb2c92b6c084..0000000000000
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@@ -5582,7 -5587,7 +5582,7 @@@ static struct inode *btrfs_iget_locked(
>   	args.ino =3D ino;
>   	args.root =3D root;
>  =20
> - 	inode =3D iget5_locked(root->fs_info->sb, hashval, btrfs_find_actor,
>  -	inode =3D iget5_locked_rcu(s, hashval, btrfs_find_actor,
> ++	inode =3D iget5_locked_rcu(root->fs_info->sb, hashval, btrfs_find_acto=
r,
>   			     btrfs_init_locked_inode,
>   			     (void *)&args);
>   	return inode;

This is now a coflict between the btrfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BhsuFU2eRxBq/l/FS5GcHN8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaVxaoACgkQAVBC80lX
0Gx4RwgAn4IPLlN12vgPZXl2YDHou5JEtr8MB78A35PTMlRwWkeKt/3MpUKNcOMF
xZPLZol+L1QYr2Ymt7af1H4ZOqny+jnH/ZqfFzGpsAkmEtUjV9SSqYwqKhkkyjyN
2hWfxgREuqZvUm+TFm1jB2Dutm01WGdvrwXP+rP+pylDAt0dsb84TK5XLlQfZEII
DnuIFjVFlPQo6Fg50AvtrfNzovRQNy2ZY8VlPwXcWEmA5oNaJOtilLp/c/Vf9aie
rL0MMrrFCDqloeYrbg2poY9LEpogr9U02d1XobwIl1/62qQZMKy6zjLkfVVjJeNw
dptiGIIY+6NZ+y9Pncx4qQZJY3oHIQ==
=7vtu
-----END PGP SIGNATURE-----

--Sig_/BhsuFU2eRxBq/l/FS5GcHN8--

