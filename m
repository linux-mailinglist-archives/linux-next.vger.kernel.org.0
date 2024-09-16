Return-Path: <linux-next+bounces-3879-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331197A929
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 00:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A26051F28526
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 22:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5551E15B552;
	Mon, 16 Sep 2024 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Jsb/ygdv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAD25258;
	Mon, 16 Sep 2024 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726525419; cv=none; b=cK6disc3EPqNQa1ZE/loRnp8B6LA40yYzRYnfr6tlPrkQgMknU/DWMCKq050gj6KYbvtykAnT+B3yoQ+DthU/HTUsbB0GEVuHFCn6EoJddItSuxf6h3d30C48piwJ9yfGH6CbqAx7yVbf2PeKMhViN7vQFX4fpPKrm7kwd9OOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726525419; c=relaxed/simple;
	bh=9yz5dKQyGfhBd5Dy/ESL4Jt4i0/KCk9LZQpPzFusdkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHAvU+Ea3UhVtWA1bULwNN8nh8AbKhQzt/QfpCfgLvnkhYlbxcqFNX7G4iDdgkr5yUsf6fMMB80cZfdiZk4qr2NVq8BFUAUVgjy0Zzb7GXkmAxEON5foF8tZa0Dr3P1hbJ0xYiY8dnhGYxOa4WulRKdSNP9eUMFbleYT8+7w6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Jsb/ygdv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726525414;
	bh=FetEh3ZHcXfZCeiPFgERsUcX4BKfnU2vIYcBK4Zswcw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jsb/ygdv/pgbkusNQnDld3SoTQ5YneOsff140S7Cz91MtKktD3zuZ2E+pM1MtIxFC
	 xU+0oOK4f3xZtLb1FtxjPYLQA7X6klXrbHqSfXaTgF9b2mtdgIaLbWG5bXuhySbzEy
	 eSOJjcWsAtGJ0byQyeXN1pNGOdRKvPynWX+zQZ5cdoWeE3nxS2fJSLpHYWJ0BgS87A
	 1zeXqLSTL4ajf+/vC0rMMiJlEcxWf5O3Rb2+qYT2rkJldaaBlnvIqqMEnZeUizpIPh
	 Exhsed1qYx5YuskOyajueq+mgcUS5PMatHWTQo0iij7JgZxmNA7x5Op/Mp1oQngEXP
	 cwq0I/+GfXDsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6zvn3LrHz4x9G;
	Tue, 17 Sep 2024 08:23:33 +1000 (AEST)
Date: Tue, 17 Sep 2024 08:23:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Shida Zhang <zhangshida@kylinos.cn>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <20240917082332.00461c61@canb.auug.org.au>
In-Reply-To: <20240904091532.4b0dee26@canb.auug.org.au>
References: <20240904091532.4b0dee26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FVKe=rFg2u_2tFrcTsXDTcO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FVKe=rFg2u_2tFrcTsXDTcO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 4 Sep 2024 09:15:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the vfs-brauner tree got conflicts in:
>=20
>   fs/ext4/inline.c
>   fs/ext4/inode.c
>=20
> between commits:
>=20
>   a256c25ef1b1 ("ext4: hoist ext4_block_write_begin and replace the __blo=
ck_write_begin")
>   64f2355d7f8a ("ext4: fix a potential assertion failure due to improperl=
y dirtied buffer")
>=20
> from the ext4 tree and commit:
>=20
>   9f04609f74ec ("buffer: Convert __block_write_begin() to take a folio")
>=20
> from the vfs-brauner tree.
>=20
> I fixed it up (I used the former) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the ext4 tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/FVKe=rFg2u_2tFrcTsXDTcO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbor+QACgkQAVBC80lX
0GwKmgf9HIkruZfQj1hL5pV8X9/kkva+PpVFUA77/SIv3wZPtsRAAtRsZdttV727
AqIwFV9bDYV12YCyJ47RvkS1SW5ylmhPhgaNxmhUacb0k40vcQX1lgGrhH3JhWCb
Mzwyr+rieXquSuSE3UmdPauPHcUlSWBPASEFyAZnEZKwlTUSLKg9l6n70dcE4HFp
u7mq2eJPiyrVUIhoouuBsxJKLGqr0ifg765rzR8wU8yG64qespB0u8ZjxCHDZR3b
g1Bal6MnoQjmWi8ZN9GDd48UvamCRnAIykoAufDObyaqPJwBP9bCadvGxCwASPu0
HgAcdn+xGyyelChULIMTX0aD5XmO8Q==
=KSid
-----END PGP SIGNATURE-----

--Sig_/FVKe=rFg2u_2tFrcTsXDTcO--

