Return-Path: <linux-next+bounces-3878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7EA97A925
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 00:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5494284EFF
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 22:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CD815C131;
	Mon, 16 Sep 2024 22:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GduExZPv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E115C123;
	Mon, 16 Sep 2024 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726525353; cv=none; b=bI1hUUXOstCxz0qU8RyXU3BVItCz8MShyF5B/xVHz1/dSDBl82tcsmMPnfkoDBqEJ9/UAlSGgQ1K6U1Y/V3niimWflcz2py9gG2UOKTCkHi0fHxIujVObZxeDyukDX49P/BvVoeC29yIx2pMKkNivR+gNFgDBsKkd6Y+n6nZQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726525353; c=relaxed/simple;
	bh=88z1pS1SBfOoYvatR7vnx9K7BaMboS9eXDT1yrNhV8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLg8fc55IyKVdvCe6BUTz+kLHrdaUykKKkIRhi++4FwMKbqhidDIyENEZqL4OO+CWchEyvEXgL7SCjCerX677TTw6SxQmDe7QEdbV6L2FYFGKr0v8lP68UzeAVAG6vofoUXN8dUfyhMC5T3aj1BGeiXjxXU9YrF5ICbCCbsYVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GduExZPv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726525341;
	bh=xYLt5HCNuQUCe7iyAXz68X57BxYyGkUeHM1y1wJa034=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GduExZPvuKUTCnDnYDv6+7mxZwX0AS+pmOPGaC8ePA89JTlAVWMczLwzcp8bj/DAX
	 d+zG6O0IpbFmQMRo2poR3Zbj7skTmuyMTScfV32pppdd5Ku6RIvFEf9GI6leNAHwfP
	 SF5PaySybrulqQy2Dgb0oCv9F8HI0wcbAWRTKOqPHwHzR2yHgIGUfr72PNjfgfF1wr
	 ZOwngr0OQ1Mg8JfFZXYBw/eL0y/ToEQszALbMXV8QQ7DORSZdpmsqwxbUMW1sDYQQ5
	 3gKXCyGdeH/qe4NiQ+DHUjGfKjptUj01b+Oy+M49o5Gy5Rgd9eNTKq0eGGvV3oZuW/
	 KFCR3rzdSty2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6ztN5P48z4x9G;
	Tue, 17 Sep 2024 08:22:20 +1000 (AEST)
Date: Tue, 17 Sep 2024 08:22:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Dongliang Cui
 <dongliang.cui@unisoc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Yuezhang Mo <Yuezhang.Mo@sony.com>, Zhiguo Niu
 <zhiguo.niu@unisoc.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat
 tree
Message-ID: <20240917082219.736ce016@canb.auug.org.au>
In-Reply-To: <20240812081046.369bbba5@canb.auug.org.au>
References: <20240812081046.369bbba5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nUyiXBz_m.Q+fN3GG+Olily";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nUyiXBz_m.Q+fN3GG+Olily
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Aug 2024 08:10:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/exfat/inode.c
>=20
> between commits:
>=20
>   3e491faa7648 ("exfat: do not fallback to buffered write")
>   98ad7b9012b5 ("exfat: Implement sops->shutdown and ioctl")
>=20
> from the exfat tree and commits:
>=20
>   a225800f322a ("fs: Convert aops->write_end to take a folio")
>   1da86618bdce ("fs: Convert aops->write_begin to take a folio")
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
> diff --cc fs/exfat/inode.c
> index 7d43a0942911,05f0e07b01d0..000000000000
> --- a/fs/exfat/inode.c
> +++ b/fs/exfat/inode.c
> @@@ -428,11 -452,7 +428,10 @@@ static int exfat_write_begin(struct fil
>   {
>   	int ret;
>  =20
>  +	if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
>  +		return -EIO;
>  +
> - 	*pagep =3D NULL;
> - 	ret =3D block_write_begin(mapping, pos, len, pagep, exfat_get_block);
> + 	ret =3D block_write_begin(mapping, pos, len, foliop, exfat_get_block);
>  =20
>   	if (ret < 0)
>   		exfat_write_failed(mapping, pos+len);
> @@@ -448,7 -468,15 +447,7 @@@ static int exfat_write_end(struct file=20
>   	struct exfat_inode_info *ei =3D EXFAT_I(inode);
>   	int err;
>  =20
> - 	err =3D generic_write_end(file, mapping, pos, len, copied, pagep, fsda=
ta);
> + 	err =3D generic_write_end(file, mapping, pos, len, copied, folio, fsda=
ta);
>  -
>  -	if (ei->i_size_aligned < i_size_read(inode)) {
>  -		exfat_fs_error(inode->i_sb,
>  -			"invalid size(size(%llu) > aligned(%llu)\n",
>  -			i_size_read(inode), ei->i_size_aligned);
>  -		return -EIO;
>  -	}
>  -
>   	if (err < len)
>   		exfat_write_failed(mapping, pos+len);
>  =20

This is now a conflict between the exfat tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nUyiXBz_m.Q+fN3GG+Olily
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbor5sACgkQAVBC80lX
0Gy4WQf/YhhEKohR1ztog2q9r94G8eEo8/M/VT3SM5BshrN95AP5ivSHy/Le+0Wh
lWGeloERnxYJt18wsfPlUWIU0kiW6YLWo9Nk3jYmFx8S7ot3Ws2/e/kNvtsnGN46
59LzhgszgUqNV/8UcbL94Fwh8rs+diIyzO1MPT4pCzX26y5k2JOHJmfsYguKIwjb
psfdYNaesLqtnqKVMs65np98Wo5j7y1zxxj2CpRmXhbnrmAV4Sx8AvdXgItxTkDd
lDENqdoXi9IP6M/KFqh0Husz8GyaPwQ7/OL6UoH3Emi4YZz8cpeQ5BuSJMdaCO1W
9rx88Ls65aAbLj50xirXUrjFbYb1Lg==
=hN7c
-----END PGP SIGNATURE-----

--Sig_/nUyiXBz_m.Q+fN3GG+Olily--

