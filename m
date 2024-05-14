Return-Path: <linux-next+bounces-2289-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4418C4ADF
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 03:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE2D1F22D1B
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5DCEDC;
	Tue, 14 May 2024 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k4lm4Ut8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30231370;
	Tue, 14 May 2024 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650142; cv=none; b=vFqwIE8paGRw1wk3a6P6ua7JiYZm+FvvgN8378LtgbG2opopEcFLFYcuBTWaUhw2V4i68YYZ3gt46HrhE4c2lkF6GNpxShjF/bb9gucfJ7voBXpMpVNw/CdeoRfUsaKYZLvpP3aQqlWp0esl/6/rRaEbz85BndFi7SMaRNpc9ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650142; c=relaxed/simple;
	bh=FOL71Xabq/vswO/Q+sHEgqz5VcjmnGi1kjNcnlo3LsM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evUDpcpJ5lA/LJKG26xjeFy1dE1nOTWdrRvLH8eZf9kG1ctPIMsoHPXNWyIURqr7zqYDumN6E0Z86WM8IMnTd8OO/AV29cenlFA9y7t3ScHtEQWFnzL3bWuEzypmL8PANtuoJf/gWpaLI8C1nH+GHHQ6DTwAYAAyo3q1/7gvaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k4lm4Ut8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715650137;
	bh=st+/9WgJfo/9nDAt8vuMrZRqtVjulmTEfAtB1gF7N14=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k4lm4Ut8kjvlMWTYDWhxs6bG90EImn2MKnzNCWMLTrAWeSKsP36IE/5tQexMd+L0J
	 TVLLERM+f1hOMiGnZqNQhp9Aa+sqVrPbRq4j2WtL5PXschKR7z8ALnl4+H+gf2Daxg
	 QrkeSzX5DdAL5k2iOffTopqvTtl7HJHtqrZFA1PAV7e9JEhbcnS7zD5rimGEI32tSn
	 chdf3l9MweGgmHYlH3Ofo38auOW1glCnJItntA4CrRFJF8iUgzHEgbMswkzusHDqNt
	 8IZaP2I/eoyEPPMu17h9SsxZPSa3dr6l/yGFjt3/iF2uUWuM5IAEKv/dVYBi7P7kaP
	 /fym3IAvGmVLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vddzs4B4Pz4wb0;
	Tue, 14 May 2024 11:28:57 +1000 (AEST)
Date: Tue, 14 May 2024 11:28:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <20240514112856.5fec87d3@canb.auug.org.au>
In-Reply-To: <20240508103436.589bb440@canb.auug.org.au>
References: <20240508103436.589bb440@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/81GH6iVN8EzdCBJsC=fSqFz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/81GH6iVN8EzdCBJsC=fSqFz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 May 2024 10:34:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>=20
>   fs/ext4/file.c
>=20
> between commit:
>=20
>   a0c7cce824a5 ("ext4: set FMODE_CAN_ODIRECT instead of a dummy direct_IO=
 method")
>=20
> from the ext4 tree and commit:
>=20
>   210a03c9d51a ("fs: claw back a few FMODE_* bits")
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
> diff --cc fs/ext4/file.c
> index 77529c655f95,28c51b0cc4db..000000000000
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@@ -884,8 -885,7 +884,7 @@@ static int ext4_file_open(struct inode=20
>   			return ret;
>   	}
>  =20
> - 	filp->f_mode |=3D FMODE_NOWAIT | FMODE_BUF_RASYNC |
> - 			FMODE_DIO_PARALLEL_WRITE | FMODE_CAN_ODIRECT;
>  -	filp->f_mode |=3D FMODE_NOWAIT;
> ++	filp->f_mode |=3D FMODE_NOWAIT | FMODE_CAN_ODIRECT;
>   	return dquot_file_open(inode, filp);
>   }
>  =20

This is now a conflict between the ext4 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/81GH6iVN8EzdCBJsC=fSqFz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCvlgACgkQAVBC80lX
0GwgYAf/e6WpR68KaADRKpQivlWR+AYHNN/AiTzNHGe0bHRcTMJqweJH0gTUPfyz
sbMdSlI5J01sWpOor3X/DeaEeGgSYdgOVzzznJMwGa8VrnXEaZNFuKFP2aIhCNtq
w3l9ETQH4McB0RkL3uLwSIB06bDRYENdwzfwkPLWTzYBZplQWKHWRi52qBi1BfPp
ErjwZM3SiXOkGZp0t+s2DMIdslo079cN9y5FS44OzaUAz/Oo9mt/5ZYIyRBgSdxm
GlXGfXemxIvdf7IdETxvgZ3H5T6ojxYTGEfw3l53fMNENwd77NlW+6L/4BjaAMQU
6Cxgt6E1sHzbGhlp/nROqWN7TwHd1A==
=7BY0
-----END PGP SIGNATURE-----

--Sig_/81GH6iVN8EzdCBJsC=fSqFz--

