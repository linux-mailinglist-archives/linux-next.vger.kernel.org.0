Return-Path: <linux-next+bounces-5250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB318A163FA
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 22:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6242718850A9
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 21:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B371DF73E;
	Sun, 19 Jan 2025 21:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="og8rpUdp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA611885A1;
	Sun, 19 Jan 2025 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737320822; cv=none; b=AaTwnUt6nZm7gZOGZwma5S1V/6fJ2CyR2EkE6w7cJhMC1x8VJ3xJqLQluwJpnZYN3KwOmetsZ+1dJIK/HHLe9fUF/aJ/uChRGPOFm3ZtrHVcDFpKS1tNFvaYP/sVT3x2G+Yq1z4PjBlOkko1dY9TO91ZlUmu1GnR8lmAXiDr7KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737320822; c=relaxed/simple;
	bh=aff0dPx5DqFXQDpXp6atAXlaR9W5IIpkhAYJW34rutg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M7cBEI4ShgafE7HDRTcLkWeoGqhknVQx0IS8NOsRCgl40/4YZVaC9EJ6QS645kPyniv83UK/3oVYG2q9pCjC+Ad5stPe1S7zUY+8/vaZmx/mcL8nyBlT0FWZh4RpwSxdUcSkh4+xDDfZYipmNxUFUe0aH6HkEZnmcu/RpNz/Dqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=og8rpUdp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737320811;
	bh=SlEOOqHCkzfoEHrqKdM6ouo5NZ+fbrFoT9Az89znu+8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=og8rpUdp/SsKgD5eZgrHJoa49mG4rQR/aD+hblvSZsVVqh9bKBPN+0p5wJXMCwdzg
	 zbn0GAfAGzNtOd9vp6VAuOGwLsIxmrQmUhxyyTQ1f3cz7gzz3q40iaglJCxTTepR+y
	 LO02N0b5mZXO4FyDiYobJ1W3hGkHoTk1getF6aBN/xrq1hkjY78YM3OGb5SELwgxaL
	 o5zse8qrhfCrdUB+akDU9GFnvel1yfTrGzNb4+scWkb+R7X6MHJvvxDBpG2yWV/0sq
	 CqY/zoJbfl9wrLBWRBciJ9Kaia81y+PylrSnUnj4P6DdPmfmttygcs63NoUj0TvuUk
	 I3SVFskIjP/5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YbmHb1Pdwz4x5m;
	Mon, 20 Jan 2025 08:06:51 +1100 (AEDT)
Date: Mon, 20 Jan 2025 08:06:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250120080657.213b341c@canb.auug.org.au>
In-Reply-To: <20250116121632.43604bfd@canb.auug.org.au>
References: <20250116121632.43604bfd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FBpq5L2nvReYSyJ7VS3KZn5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FBpq5L2nvReYSyJ7VS3KZn5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 16 Jan 2025 12:16:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
>=20
>   a560758705a6 ("mm: shmem: Use signed int for version handling in casefo=
ld option")
>=20
> This is commit
>=20
>   99b24f3ad327 ("mm: shmem: use signed int for version handling in casefo=
ld option")
>=20
> in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

This latter commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FBpq5L2nvReYSyJ7VS3KZn5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeNaXEACgkQAVBC80lX
0Gw4sggAgFQQQXG8ieBf+9rBkUQ5B2GRzV0EVLGjmiquAcrhGTzHoRY7WHTvujNj
1m9O5Pbz9gy2QK7Y6A7FnfkEvmt+0iQpsA5LQGpkq4GFyleXh/ojUCmNfYYKgRz9
cHA3dHGlpZEb4TDLF0B0LesI4UvLxbqTyfCgjbBT7fYhX6vbaGTdGA18cWtTKreC
wkfkOXgvzgkO6yGPF/yYiS46BgvY8b5vQ+oQUZeLSNv6l+nLaQy3SVbBE9tKMkjG
DQjl8bQQiIqFFMD33SEqOLDHFiP8g4/0hSxdBfU5NL8xXEeMRFmlC56Lcej63Ihw
16t9mqZa9YD/Jr2Tz53d7yNsLO3HCg==
=+occ
-----END PGP SIGNATURE-----

--Sig_/FBpq5L2nvReYSyJ7VS3KZn5--

