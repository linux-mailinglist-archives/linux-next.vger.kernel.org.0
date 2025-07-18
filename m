Return-Path: <linux-next+bounces-7627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72307B09E79
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075D11C419E8
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D561F1302;
	Fri, 18 Jul 2025 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q4DL7C65"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464C10A1E;
	Fri, 18 Jul 2025 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752829008; cv=none; b=cI2XzJan5DzgNm4EOGorxKdN1p1vkjKkBJRJHPH3icod65qaERQZtG7sKtvQytNbzowOoND7WcA0muSKNoDRDbb+YCUWfUwLUnpnwxA0+lGK5D39SwIq20i1GiXSjpV3N7KDTn8qvoMwKjEcP/Ap6mu0Tw7PryuM5Hier9Gth2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752829008; c=relaxed/simple;
	bh=tA751oUn0QCmzGYuUMd4G3yz2atQVheo7Oq7M7dpNwk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9MJVpQhBf8z8Z7ikhADzk1zLjnvLyJVI6ndQHP/Mp1RcYXPuR3lDJ6bqqq3SgupvUyKzDhb/k91UGH/Po1MQtHBiVabHXimBGAgayjZnToVZfoV5E5FWXx9lWXH0DgvroaqrGnsjrRimDB4OgoXaG1KjH8jhrwdVWdf1YHjU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q4DL7C65; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752828874;
	bh=sSu1rK0EwPxo96HAdz1xd+xYWqUDA7zI0vpuwA14i/E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q4DL7C65SRH8gE1slBw35tvQ2s5UeCgdvqvISUAKRMs9tiXvkkD+/VbJ89nFHHIQ+
	 z+2oMMbMAcO1UMFCpwsbIsXXzGoC/s6J6pvjR/uHrlw9xGHpzWGhhnaKi7xuhGDmB5
	 WF7oScyYQDn7RJKcBwIpkLePEbcUuO15YqFFfy8dwvLTCvi/gYklNFT+C6WU+Y/Tz2
	 /oIZUvx3iCk+VHqyERLCb+QZ2e2KmKW4toHg11Y5HTfQZrOVpgJrYiQNTqxqHoDaGn
	 bvYnZoD5Rg0CGTENfv7yj7ZnvIu8u5RtwZIe82z2TQV2DeQWiku7sDLs0GrNKt+cnO
	 yTK4fnP1jMM+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk3WX6mBCz4x5Z;
	Fri, 18 Jul 2025 18:54:32 +1000 (AEST)
Date: Fri, 18 Jul 2025 18:56:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: John Garry <john.g.garry@oracle.com>
Cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: linux-next: manual merge of the device-mapper tree with the
 block tree
Message-ID: <20250718185642.0f2454c3@canb.auug.org.au>
In-Reply-To: <e08722e5-d5b8-41d5-92a2-f985a875c24b@oracle.com>
References: <20250718151045.2c5bfe6b@canb.auug.org.au>
	<e08722e5-d5b8-41d5-92a2-f985a875c24b@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2ZKS9r5fyrSuLX3=G_5SSEk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2ZKS9r5fyrSuLX3=G_5SSEk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi John,

On Fri, 18 Jul 2025 09:26:57 +0100 John Garry <john.g.garry@oracle.com> wro=
te:
>
> I think that this is the proper merge resolution:
>=20
> static void stripe_io_hints(struct dm_target *ti,
>      struct queue_limits *limits)
> {
> 	struct stripe_c *sc =3D ti->private;
> 	unsigned int io_min, io_opt;
>=20
> 	if (!check_shl_overflow(sc->chunk_size, SECTOR_SHIFT, &io_min) && !check=
_mul_overflow(io_min, sc->stripes, &io_opt)) {
> 		limits->io_min =3D io_min;
> 		limits->io_opt =3D io_opt;
> 	}
> 	limits->chunk_sectors =3D sc->chunk_size;
> }
>=20
>=20
> For purpose of atomic writes, we should always set chunk_sectors.

OK, I have changed my resolution to that starting from Monday.

> BTW, I tried to apply the conflicting patches from the block tree on -nex=
t from 17 July, and I was getting strange behaviour:
>=20
> # vgcreate vg00 /dev/sda /dev/sdb /dev/sdc /dev/sdd
>   WARNING: Unknown logical_block_size for device /dev/sda.
>   WARNING: Unknown logical_block_size for device /dev/sdb.
>   WARNING: Unknown logical_block_size for device /dev/sdc.
>   WARNING: Unknown logical_block_size for device /dev/sdd.
>   Physical volume "/dev/sda" successfully created.
>   Physical volume "/dev/sdb" successfully created.
>   Physical volume "/dev/sdc" successfully created.
>   Physical volume "/dev/sdd" successfully created.
>   Volume group "vg00" successfully created
> #
>=20
> I had no such problem on Jens' block for-6.17 tree.

I have no idea what caused that, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/2ZKS9r5fyrSuLX3=G_5SSEk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6DEoACgkQAVBC80lX
0GwQ1Af/RMr1BzAkjy0r848TWxaB05nzwAMM49gWAsb6OqfIdFyT4f27Jvu3FIpT
CPvWm+IQ1eIFlRghJ+hlTvy0Hg8dslBRIps+GQPOAQky3Plm88tOG3lzoE72ZiFB
DbSqcuD+Sni4P9UYBZWtzbrd9Ee/US6WpCSliRgvgHSajTU4tiNNvftcfpTVs8W4
UpOTZIw9w8Wvlrrjf/aYUUsEv+dMYN4K0mkJRW5ZrnUHHzdog4NSGp0XXBVkV8Ub
aAmEPH+qGD2yT1OjGdOvsfTR0bUxoc1pIb3KxEIxbn9xFT5ryB4RCEYX+d7mbFgg
CYilRMx8PvnoORwfxQ67GAS89Dxy0A==
=oFB0
-----END PGP SIGNATURE-----

--Sig_/2ZKS9r5fyrSuLX3=G_5SSEk--

