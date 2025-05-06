Return-Path: <linux-next+bounces-6549-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17533AAC46D
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 14:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 365513A839C
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 12:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446E18F5E;
	Tue,  6 May 2025 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rBA3Vvkv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24C1FCCEB
	for <linux-next@vger.kernel.org>; Tue,  6 May 2025 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746535343; cv=none; b=iM0AToeEbBGddw01usA0OhAXXMmWsrYcfBUo2GcetboELccDha0ecGjefLMnsUfjIOncfLMlJ2aResWzSOLpmD6xT6rTvtxE66SNKNBAIOJYW7w1bO/B/DwEHiEJ9on7KoHNCy2F33nW7fCKgEveUklwyylpGu+YOHVNGTj0++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746535343; c=relaxed/simple;
	bh=V9c5PjirHU1bJ0JIizs5C5zcvBL3JWfdd/nRAu2BRvc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DEUdOb9afn+vyu8xjNQSleV4PJh9RN/K12tyc4KJcLwuMx7aSzlOP6IDssIxtQfR2h4N8NUkbEzaOC1qF3z2JzaoB5aAgX6s+QhYrKQRM54UkHncm2LiBEMGwFlGgZL7vPUSyJwKsUDS0YN7h0g4rxqWKR8tiTTlor00a8+2EUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rBA3Vvkv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746535338;
	bh=PeZ+1saheVQS7AzDgQYa33+W2acjgMIzHvTGTPvXewY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rBA3Vvkv5A+77ApEtOJE7PT8pine8/ckq5kUm+Z7Fm+36zFImyfXxtaTTY7YtvMDd
	 JRv3qBybzCPmB3ym7n0q1YO7VKqz2Cj3uC0/sWvVy/LF2n/ecrTVkS2yhy/AUaCjhA
	 TjY2R7wQGYONAkoGqWvURiZZIVBolQcrK/wgE7YUn/w+UmB2QxEkNfvk7YFPAeQGog
	 z9TswQ30Hi7V2LNelT5t4yVEPHpIMWdmSfQmQrAf5H2/x8eP0oQFMJfI13P3pQi5r1
	 bCfl2er0UH6rQ7TyRBVx5JXXsFjxiwCK8GwwKU5h7L7QU47kzVa1aVODXuBRCkUFZK
	 Qo7iVLcvXvtMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsJ215yDBz4wbf;
	Tue,  6 May 2025 22:42:17 +1000 (AEST)
Date: Tue, 6 May 2025 22:42:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Inochi Amaoto
 <inochiama@gmail.com>, sophgo@lists.linux.dev
Subject: Re: Please add two new branches for sophgo/linux.git
Message-ID: <20250506224216.3befd4fb@canb.auug.org.au>
In-Reply-To: <MA0P287MB22625A31223E095B44640B43FE892@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB22625A31223E095B44640B43FE892@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dDYBQbqoIJX25WZEMccckt5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dDYBQbqoIJX25WZEMccckt5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chen,

On Tue, 6 May 2025 11:36:52 +0800 Chen Wang <unicorn_wang@outlook.com> wrot=
e:
>
> We already have two branches for-next & fixes included in linux-next
> for collecting DTS related patches for exiting tree:
> https://github.com/sophgo/linux.git.
>=20
> Now I want to include two new branches in the linux-next to collect
> drivers/soc related patches.
>=20
> branch for soc master: soc-for-next
>=20
> branch for soc pending-fixes: soc-fixes
>=20
> The patches in these braches will be sent to Arnd Bergmann and
> soc@kernel.org.

Added from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/dDYBQbqoIJX25WZEMccckt5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgaA6kACgkQAVBC80lX
0GyI7gf/XQk2h4OrGyHGD8iCuLoNqYmysOk9p0gBNyLmG6qMwc7XFaxT3qjyiRyU
IMg8RIbAqKmWNIm28JvnYOEtzWpOPianKJUztrxus7IpKDGiRr3eBjqDQs9+Ft66
aWZKtyBpKknSQvnuFnNQYZ0eSV3qpjXQUxSujD2otWf4ipPbUKjNwp/4K/vV8xeP
Nvhc6N346a4/aBsLn7363QYU9hmz9qEQ5IRmbikJ2d/AsT9Wpv7r6qeXlhwkMm93
xKlxahukj6zOMmKDaSMex+vD91V8SgQfFrijcNEyXMmA31KM2FfmxZkWA5qkJ3vx
JxbICbXw8qUMpN6oT2s7TIdBhn3e3g==
=irkb
-----END PGP SIGNATURE-----

--Sig_/dDYBQbqoIJX25WZEMccckt5--

