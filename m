Return-Path: <linux-next+bounces-3880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E686D97A934
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 00:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6122284F73
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 22:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549A026286;
	Mon, 16 Sep 2024 22:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WKBMHyJD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B571494C9;
	Mon, 16 Sep 2024 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726525504; cv=none; b=QXRT9Etr97jdb+Vztd3ar6ikutxxL389SZsgtbQ/OMJEhRgJZR6RNg8ya+NXeYyNnNXde7JGlvezKvQCs4kcSymADojT3+cp1y9XIUyM9J0Pj2q4PJ5AvDgTgWf7m6PX69gUvcIjuITY42giDboIAP6ZeE7Ajvu+ajp61TFTbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726525504; c=relaxed/simple;
	bh=fjeKevU5pVM24mh9eZCoCtILAo2Dy7dBXlxve85iv/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6Ls96vgVUA4ZXL3LOKJSvz+2KGviuXwXjNh43vtWvfDrewhPzpmD4IeuE0T+zcOX/bwtQAWpvByOQoFCbqr5/Zym7fCbJLVMwEDIHS9JS6WPhHsVCOSyYLkCa9vWkJe7vjy7OJ/JSLT6BHbE6eY/tF6tMk84ZDagKhJPJ3tGe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WKBMHyJD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726525500;
	bh=MVpY8XWmhiWfAP8CkLE+kDPP7vyEKdkO0Ne/L+Z0adg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WKBMHyJDV9bJZWsqMOP9Ly7xk6rQmQcSFNCC4q4eQ3FRKAoWoYlOCTbrT9EgQmrxu
	 kZxAx4q7O7XbX3JugFTR+WV7o9olylmff55/IaZddCGCc3URFN6XXB4PvGIkjDEBSG
	 duYPUeLa1pYXJ0JOXZ6pHS541kOt4IgvssIp+I8jzkBmP3KjVaCCCtfyPThJqYNpLF
	 w3Vho2WD1cuql6UfsH3/Ufu4CItDqtpqgHsnKWkVz0ZUWLQ7WkSy8i4Nxo5nItiZhN
	 ZVeadq0oyMQspaDudLSesBmZ0QC8pxr4mYlHkwzhGg3JAve+FxduIVR2ySMvtiRngj
	 lYFrS0cXmxU1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6zxR6cGTz4x8f;
	Tue, 17 Sep 2024 08:24:59 +1000 (AEST)
Date: Tue, 17 Sep 2024 08:24:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Chao Yu <chao@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the f2fs
 tree
Message-ID: <20240917082459.0f9f3dee@canb.auug.org.au>
In-Reply-To: <20240905101845.0a47926a@canb.auug.org.au>
References: <20240902092405.7c26e742@canb.auug.org.au>
	<20240905101845.0a47926a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TKjPBJxhctQ5tJv3svup2+z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TKjPBJxhctQ5tJv3svup2+z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 5 Sep 2024 10:18:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 2 Sep 2024 09:24:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the vfs-brauner tree got a conflict in:
> >=20
> >   fs/f2fs/data.c
> >=20
> > between commits:
> >=20
> >   f13c7184e62e ("f2fs: convert f2fs_write_begin() to use folio")
> >   357dd8479f8b ("f2fs: convert f2fs_write_end() to use folio")
> > (and maybe others)
> >=20
> > from the f2fs tree and commits:
> >=20
> >   a0f858d450ce ("f2fs: Convert f2fs_write_end() to use a folio")
> >   dfd2e81d37e1 ("f2fs: Convert f2fs_write_begin() to use a folio")
> >   a225800f322a ("fs: Convert aops->write_end to take a folio")
> >   1da86618bdce ("fs: Convert aops->write_begin to take a folio")
> >=20
> > from the vfs-brauner tree.
> >=20
> > This was too much for me to fix up, so I just used the f2fs tree from
> > next-20240830 for today.  Please discuss this and fix things up. =20
>=20
> I took another shot at this and *I think* I figured it out - see below
> and I have also attached the final version of this file.  Please check
> and advise.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/f2fs/data.c
> index c6d688208f8b,5dfa0207ad8f..000000000000
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@@ -3626,17 -3617,16 +3627,16 @@@ repeat
>  =20
>   	/* TODO: cluster can be compressed due to race with .writepage */
>  =20
> - 	*pagep =3D page;
> - 	folio =3D page_folio(page);
> + 	*foliop =3D folio;
>  =20
>   	if (f2fs_is_atomic_file(inode))
>  -		err =3D prepare_atomic_write_begin(sbi, &folio->page, pos, len,
>  +		err =3D prepare_atomic_write_begin(sbi, folio, pos, len,
>   					&blkaddr, &need_balance, &use_cow);
>   	else
>  -		err =3D prepare_write_begin(sbi, &folio->page, pos, len,
>  +		err =3D prepare_write_begin(sbi, folio, pos, len,
>   					&blkaddr, &need_balance);
>   	if (err)
> - 		goto fail;
> + 		goto put_folio;
>  =20
>   	if (need_balance && !IS_NOQUOTA(inode) &&
>   			has_not_enough_free_secs(sbi, 0, 0)) {
> @@@ -3668,13 -3659,13 +3669,13 @@@
>   		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
>   				DATA_GENERIC_ENHANCE_READ)) {
>   			err =3D -EFSCORRUPTED;
> - 			goto fail;
> + 			goto put_folio;
>   		}
>   		err =3D f2fs_submit_page_read(use_cow ?
>  -				F2FS_I(inode)->cow_inode : inode, &folio->page,
>  -				blkaddr, 0, true);
>  +				F2FS_I(inode)->cow_inode : inode,
>  +				folio, blkaddr, 0, true);
>   		if (err)
> - 			goto fail;
> + 			goto put_folio;
>  =20
>   		folio_lock(folio);
>   		if (unlikely(folio->mapping !=3D mapping)) {

This is now a conflict between the f2fs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TKjPBJxhctQ5tJv3svup2+z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbosDsACgkQAVBC80lX
0GzmIgf+PhBIg6LxBk9SBQ5GDGjk24qUqgUFqIYdOzR2ertfw5XAQCobqH/a74Tb
Bdmflalmso12xnLLLjHyvKv2WXNCta1Us8gdsX55G/G2c44ZQEX9DmVvUCw87C4H
VKwMq/VibmzLyGjzVESRY6jCpjwf8OwSny4c9VyDLh8qa2thGFz4YNACVVew156i
s7leEG555cSAVlHJpuAPMTuPU6g+iAI8xvSNnr8p/ASFFa7QCFNiSW//9Y5zCg8s
5gZTdq6FgxE+RVyHPP+naU1MQwXc3E/E4r5fpzGzZvhv7Q4imhsYSSGPSmKm7uIW
Kq9BtcKIxBa4A17P7JGzTCAMTep8EQ==
=2zQ9
-----END PGP SIGNATURE-----

--Sig_/TKjPBJxhctQ5tJv3svup2+z--

