Return-Path: <linux-next+bounces-2291-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAA8C4AF5
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 03:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939F92820DF
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F77F17FF;
	Tue, 14 May 2024 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="stBYhUaO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D217C2;
	Tue, 14 May 2024 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650734; cv=none; b=Q7jshWjRMQ8CsWj8OvAPTrqWVhjF5wBQghM+vIXYmEx4xrht62s853KyUK3phtmSAg0NrZ9v65QG+JAqvDUMKG1PqvEQ9DSCXF+mpPzPnFzTgNJ05r9zuH41VIaJBcMzR3UA/uaS4tTaf0w/S4rvuumSM3gi7mn47W3RT8kIW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650734; c=relaxed/simple;
	bh=qkq9OZlByceZMk0R4nnSFwzfiVSa3o6wTPeJ9PcUIkM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URZu3PlQvTEDrdoROfM2sPLwBfgYMsf6lbeDdy2g6zEgVSdpr4OdMpiug7/YR1TOqGxT9AOY5vTKyv92f5iZzStiyf7tw/perf6U1UTdjI61xEPG4n9aDZX+lr14Wl+5Cb3/0obtrmJU9mIytaKYxVdWi5Evt1KwHsUQPXSVE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=stBYhUaO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715650730;
	bh=yW0KFZzH3WOehDzoxiYc+RgteFtnvhPhRLyief6qAog=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=stBYhUaOjF2rSNKvoRwql8DFUz62jjYhH9o3RejaqFmbbYI4Yu6e4GJ1qnQi+1eVo
	 2q7UixXi8qGdi+f/D62PPj1kxsFY7VhaFL4k0ztMe0Oc6ArS0r4k5oCFpoNzmS7+Lf
	 Ij2n8RfF7MaLbbbTDNl6oJn3YYq5VXTIpyoPsBUBU//SkXvTztkcUZQgDEwJo8IFJa
	 QHLye1Lj9bnUeognoJ3cClyp6PQtkunp61R1jFpK41E2R1UZW7I9Xlc7WGNUSdJYTQ
	 AoAFQta9fjX4TLA6ontaJokkkroeRgrz0ex4uqVq/hs8EZBE3oMVppsxEHBloBdkc4
	 CskaTyP4nsoyQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdfCD2wNmz4wb0;
	Tue, 14 May 2024 11:38:48 +1000 (AEST)
Date: Tue, 14 May 2024 11:38:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20240514113847.1b2d6226@canb.auug.org.au>
In-Reply-To: <20240503110001.336f3286@canb.auug.org.au>
References: <20240503110001.336f3286@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HT24MLNlFYeLxORu9whULkW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HT24MLNlFYeLxORu9whULkW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 May 2024 11:00:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/btrfs/disk-io.c
>=20
> between commits:
>=20
>   4a63bd0ffbd2 ("btrfs: convert super block writes to folio in wait_dev_s=
upers()")
>   545799bb1bb9 ("btrfs: count super block write errors in device instead =
of tracking folio error state")
>=20
> from the btrfs tree and commit:
>=20
>   db3102368e1b ("use ->bd_mapping instead of ->bd_inode->i_mapping")
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
> diff --cc fs/btrfs/disk-io.c
> index e8aca9f0e692,f10e894b0bf5..000000000000
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@@ -3739,9 -3738,10 +3739,9 @@@ static int write_dev_supers(struct btrf
>   			    struct btrfs_super_block *sb, int max_mirrors)
>   {
>   	struct btrfs_fs_info *fs_info =3D device->fs_info;
> - 	struct address_space *mapping =3D device->bdev->bd_inode->i_mapping;
> + 	struct address_space *mapping =3D device->bdev->bd_mapping;
>   	SHASH_DESC_ON_STACK(shash, fs_info->csum_shash);
>   	int i;
>  -	int errors =3D 0;
>   	int ret;
>   	u64 bytenr, bytenr_orig;
>  =20
> @@@ -3857,21 -3855,30 +3857,21 @@@ static int wait_dev_supers(struct btrfs
>   		    device->commit_total_bytes)
>   			break;
>  =20
> - 		folio =3D filemap_get_folio(device->bdev->bd_inode->i_mapping,
>  -		page =3D find_get_page(device->bdev->bd_mapping,
>  -				     bytenr >> PAGE_SHIFT);
>  -		if (!page) {
>  -			errors++;
>  -			if (i =3D=3D 0)
>  -				primary_failed =3D true;
> ++		folio =3D filemap_get_folio(device->bdev->bd_mapping,
>  +					  bytenr >> PAGE_SHIFT);
>  +		/* If the folio has been removed, then we know it completed. */
>  +		if (IS_ERR(folio))
>   			continue;
>  -		}
>  -		/* Page is submitted locked and unlocked once the IO completes */
>  -		wait_on_page_locked(page);
>  -		if (PageError(page)) {
>  -			errors++;
>  -			if (i =3D=3D 0)
>  -				primary_failed =3D true;
>  -		}
>  +		ASSERT(folio_order(folio) =3D=3D 0);
>  =20
>  -		/* Drop our reference */
>  -		put_page(page);
>  -
>  -		/* Drop the reference from the writing run */
>  -		put_page(page);
>  +		/* Folio will be unlocked once the write completes. */
>  +		folio_wait_locked(folio);
>  +		folio_put(folio);
>   	}
>  =20
>  -	/* log error, force error return */
>  +	errors +=3D atomic_read(&device->sb_write_errors);
>  +	if (errors >=3D BTRFS_SUPER_PRIMARY_WRITE_ERROR)
>  +		primary_failed =3D true;
>   	if (primary_failed) {
>   		btrfs_err(device->fs_info, "error writing primary super block to devi=
ce %llu",
>   			  device->devid);

This is now a conflict between the vfs tree and the btrfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HT24MLNlFYeLxORu9whULkW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCwKcACgkQAVBC80lX
0GwONAf+IJ2w/FMuz/Gg1Db+UBMUxkCPoqwN5BNTL6RTDvEwiCDa/p21wY06xsux
I/RxSE8sgOSk/9hKP1/9Q3/vLw84lQp3aooQnUJ3aXY9EjM4a737V0zNP2fmuXSy
3hdKoPNf95Sl9kuVEiDfC2WcAwZSZDbhl8E1vp4zl86PO5aBX9qlKt1Cf1OJnQDL
dRHnMc2FuYTM0IbQoAK6lQKUqH6o6BvRVNZnrTeeReVRRrNYkKNqov/mZj2ZhMPV
g5kcR/MQPZghto3uRFUQOS80MUOmr0LumW9n54O76uitZ5lR3w3IO0eRrBTSmB7V
OySqXLYom6DtqrG8CJBLq/QoH9xVjA==
=S3Dc
-----END PGP SIGNATURE-----

--Sig_/HT24MLNlFYeLxORu9whULkW--

