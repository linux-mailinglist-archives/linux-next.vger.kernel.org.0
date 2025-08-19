Return-Path: <linux-next+bounces-8021-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C867B2D04B
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 01:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E660C3B4C3F
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 23:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2752288E3;
	Tue, 19 Aug 2025 23:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gCSTcdm9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095DA217F27;
	Tue, 19 Aug 2025 23:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646974; cv=none; b=R7T4pX7W+Ct6x4AgJC92BNrEYHMIA2QZZbkglAjDf9XdwmSXuH5kipMv7qS9h1xs+EbynaKw3PLlyecjB70Jq9VqHakZeQmdnT1MKB0Mwz4FOATjxaQ6AGMFaaAmm2WFiFKf5KkgKtYkSVSmf0vKcEdnHBFImr/0h9U/tk6igqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646974; c=relaxed/simple;
	bh=XQfJx3HU5HRjma084GkjHPhEPwwAj/UOfDzJM8XEuuY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqpI7q9wn2ZbGEvSpihLVnE4jPjFlrsoD8JmG+kFx1lknkoUiIAImMxro87k+IreCi1MdkM6ed0x6Moo/hZIAq60bj4nOhc8zS01xGwuXYW8ZX2bInkvFrWc6kgeSON1MMFqf/WLoiNqUR3fcW6asBUUw0V4/+u0c77nsmRRKBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gCSTcdm9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755646960;
	bh=RwzrZPtnNpBkxo9pNOOeFKEasl6xXyZEsJp8YOffYBY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gCSTcdm9/ms2tHkEH7iMjnWkTsmPMJ5RzcujVs5Gu/b4+8I4yK2Aj1YVjVs0g/sdq
	 E61SOXcPYX8/ML3yExrHM+XP35bIZRSpwieXUOGTQ8kDS3s4E6kXMOl0pi+qDjg6Ho
	 mKVmqQVz465fFPJfZ32IGFC+F9t2QXtsQ8wDyhtzTTLIoLIzKTJPbFK1YPzgPlK+0C
	 mXLCSz5VCsQuQuTWWarnCj1xFzLiTwGMarHDkHpMtCtkor/iO2g5Q/ls23LzlTjaJB
	 TTOYs8kx0o2DCPYIbcFBPGuru6tTEwt3Rn3t4O+lrXiUXhoXY09D33x0g+5zfymz/C
	 aaIOj8wbcdNOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c65jX3B0Tz4w2R;
	Wed, 20 Aug 2025 09:42:40 +1000 (AEST)
Date: Wed, 20 Aug 2025 09:42:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250820094239.30dea649@canb.auug.org.au>
In-Reply-To: <20250818090559.3643eabd@canb.auug.org.au>
References: <20250818090559.3643eabd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Buwr2NOf1FH1QZFJuf81BV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0Buwr2NOf1FH1QZFJuf81BV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Aug 2025 09:05:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> fs/iomap/direct-io.c: In function 'iomap_dio_zero':
> fs/iomap/direct-io.c:281:36: error: implicit declaration of function 'lar=
gest_zero_folio'; did you mean 'is_zero_folio'? [-Wimplicit-function-declar=
ation]
>   281 |         struct folio *zero_folio =3D largest_zero_folio();
>       |                                    ^~~~~~~~~~~~~~~~~~
>       |                                    is_zero_folio
>=20
> Caused by commit
>=20
>   5589673e8d8d ("iomap: use largest_zero_folio() in iomap_dio_zero()")
>=20
> I have used the vfs-brauner tree from next-20250815 for today.

I am still getting this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/0Buwr2NOf1FH1QZFJuf81BV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmilC+8ACgkQAVBC80lX
0Gxd/Af/XW/95q3kvzXYADX0pDLqz5dCgiy7hYNgaN/B4oif7hzvF1vWcxeQCkzw
ku3n94VlotpRb+0f5gjtQYTnT9I7hkStu/xSkKBf62O0mTdmdwahYC0KOLUH/b6l
+Y3GhyG9HaaMMsGTmuaT31e2v5stHtTpOMwnFsH+zQMzHWP/Y5PHDzO/4No+5ImE
Nym9SpmT4Z9xV7If7Nd72RuLBuf2MhRO7YuopCbmGx6/Lf8DrnbCWepJXHya/pxA
o+gKhEIY+KTxOSzUdgxmaLiue9caTBgmCe500WRLCaCbdwz/SDefSmFyQs6Cki3E
QxRNqxwRVA8kt3KjJHp7smcHnGfDHA==
=nWNI
-----END PGP SIGNATURE-----

--Sig_/0Buwr2NOf1FH1QZFJuf81BV--

