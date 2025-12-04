Return-Path: <linux-next+bounces-9337-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C998CA59DD
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16D3430CE551
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECD8335066;
	Thu,  4 Dec 2025 22:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c52PaKJB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286DB314B6C;
	Thu,  4 Dec 2025 22:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764886916; cv=none; b=oISiUV/paMhi9FS9szB1kY5PcrXBQMXa+ZJ/fPu9t3tLuEURKXxj7Pj+xC/G42SeKafmzRGNxxys7hAK/Rf41++X3kDs3OvvEHEqIGhAhnM0SxhUuMzSZ9/ymo8FKo1EaVugKQKuWdIGQUwTXH0Dry9IFCHFaHiFNVpTdk0dCI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764886916; c=relaxed/simple;
	bh=Uk7omdUSOrcwPKB7N3drEIfrIHV/mYT4pJwsF2dyNJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=URI4YpU+bn2ubz9PnyrUjVjG7TuVRZY39WM3ZL0/FNLhzOokxLbRWtQQZBsOv++LYkituiZCbITC8ia3FEoZsXaBy1UVSUJH7VEFABoYN63P+DGNX8NTMjFPniEnKAK7NJ3x6O7TZUO/tKD5h+oVjGxCe2eCz/bqfR5iFx1K3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c52PaKJB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764886910;
	bh=j385GMlxMdbWt8U2bf4D9SBQ/E64HfK3IZeS9P0flqU=;
	h=Date:From:To:Cc:Subject:From;
	b=c52PaKJBM2+pW5tNHp3EPubeL+vOxsVlhrYvnKecq2faJPnBtUL7rhWu3fTxejX5Q
	 sE2DnUn4VlHYLkLwO4nrQ2vpKLUFMaXkLCs563HQHbIjG7fa7KCenMLEUis/R4Sler
	 6FT9mm4gXZ94ogUIk1M/PB3ke6EeB+31sSVe/J8D46CHN1O2YPfEz98Co1uZU/mwch
	 UL0qgIqDvSkwfuP7TswnjGJMduZoI63QkceU9N9CbgGf88KqMMN/4UwfJhZ8FhALqm
	 ljAtQbB/fmJRfjZabhBZVfU9XyR7Cw6q9pPnexdCAwqxKR6iwvWI0w59wQhLM3aucb
	 Z/OdNc7PyUOpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMprt5NGvz4w9T;
	Fri, 05 Dec 2025 09:21:50 +1100 (AEDT)
Date: Fri, 5 Dec 2025 09:21:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the block tree
Message-ID: <20251205092150.0e64adb3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8buUAJSXI6XZ.IvazK/5jMH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8buUAJSXI6XZ.IvazK/5jMH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  d3132d5a1720 ("nvmet-fc: use pr_* print macros instead of dev_*")
  facf78e89270 ("nvmet-fcloop: remove unused lsdir member.")
  d4a3dc77e6d6 ("nvmet-fcloop: check all request and response have been pro=
cessed")
  92ee1738dd50 ("nvme-fc: check all request and response have been processe=
d")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/8buUAJSXI6XZ.IvazK/5jMH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyCX4ACgkQAVBC80lX
0Gzp1gf+IlL5fR8UwfYVB8YeB6yqCLX3avYd96zuC33fykEvadezd7lBkKh+IfgQ
QIQHUlXtCkWlmx6qo8s+p285J6AeXbNDyqUQ765Is77o8gG7DxtsnGv3z4mOgT0c
0kq96BQmmzpSz+M4pIlZkMfSfZbeBRd2A1IoqRnQfg2CULCtog/wj6h9CNeNZuA8
jOdm5OunqJEpUm1qTgUDaUM+VlKgJ2tLOI412pvFaxCIaunQiTgAfP5ty2jt3TJW
hOmPRQx0AHIj2Kc6InpqEGz7OFHT+5O9FcDYoA+tyXwvx3QUXdDszN4CKHJGTGs0
EmvvJbgQsgb3L+eP4TGBJFJ7/RuboA==
=z+sW
-----END PGP SIGNATURE-----

--Sig_/8buUAJSXI6XZ.IvazK/5jMH--

