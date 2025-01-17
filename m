Return-Path: <linux-next+bounces-5241-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6589DA14834
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 03:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15DC188F18D
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 02:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598A41E04B9;
	Fri, 17 Jan 2025 02:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="goFSNp/G"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BD1096F;
	Fri, 17 Jan 2025 02:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737080616; cv=none; b=taljcqmNQit5+0JR5X6x9xDH4vBdE4/LorxW7SHJjlylngc0Pw9sDPRGSHFPd+p+KWdjUU1aZrdJ/kdRji2OugYujel1zVmHWrEQFHvti0LUQ4E8gB2YHLQnPStnLtoKfXUP/7ByMc9fToVNOJDSuTBUfcYA2GaNjQeLnZJf4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737080616; c=relaxed/simple;
	bh=FPh4sTSJSLZXdMj31z4UsOXhFd0F55HSsCyvd4EmTKE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KE3HJVvB4E6RyWIPDLVgoaEJwhiUzULJGiiS/Cw2lVQynTHLhtkh/q35tGZywQ9ZlgzRk92g88w0UyxHvJkEaDGJS9wH5271iUwhyLW1I8fW2n2HJwGEmjvDkNT1ov2hmLheuNx8D20EkAt+YfZGCBKJQPWunxKrv/saZGeJTmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=goFSNp/G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737080600;
	bh=7QMOGmp9dttxt5V/GHcUWihe6LgiDVQvwYo8JGvjuZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=goFSNp/GzQ9MRdnv7vnPph9z+uFYEq/a4BaVMX3ob8jRZwKJAhCd+0RDI9TLQeMRV
	 gCmPm2uAJ7QnJ6ux34CBaBdVFw2HdutAM7jHCV5wwl9K91DZiHp7UoGKkoLOXRm2dq
	 i7Xum3f9KcEB/Sog/PRkSw36uDEaZay1pzHHWJ+zV37ky3kdHnRQTR1Lv2vznkqL25
	 BO0AB3RZEtbcvSlPkzfyaNwtynaH4dGb9mSE6TjUxhTI669VhVjWazYJfv1phQFDVU
	 eIZZciAtk4qHQJPoqsvK55Pj3/n+syVa6na7ehKGH3yGEkPokwjD3qA3HfLPLYL+EX
	 EDtejmkg5Fqjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YZ3S773CWz4xQZ;
	Fri, 17 Jan 2025 13:23:19 +1100 (AEDT)
Date: Fri, 17 Jan 2025 13:23:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20250117132326.71696151@canb.auug.org.au>
In-Reply-To: <20250116132010.4948547d@canb.auug.org.au>
References: <20250116132010.4948547d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ykhteWV1XPsV6xad_W3YPJn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ykhteWV1XPsV6xad_W3YPJn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 16 Jan 2025 13:20:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Caused by commit
>=20
>   042087247835 ("mtd: spinand: Create distinct fast and slow read from ca=
che variants")
>=20
> I have used the nand tree from next-20250115 for today.

I applied the suggested patch for today (instead of using the older
nand tree).

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build tested

--=20
Cheers,
Stephen Rothwell

--Sig_/ykhteWV1XPsV6xad_W3YPJn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJvx4ACgkQAVBC80lX
0GykxAf/YvchnxfeYIgegoh92molqtGDGTIlFwuCMQ0rkt27OQWWaaCdiUKMKAoL
w2FUF6Tutl6bio38NEEm5CRxwc5d5jKK6VUbgCI5Y4UXDCSohQwslxNXD71RzyU7
kjTA9RrZfuxvhNfQl/1B4CgiW9nB7Xdsxw/D9kEV/MR7ijjMxZG7rcukjQG9E+fP
sijTzX9efDM2IA3ufmYSyCcpY9kx4ttuwWvY+qXEch2r4LHGKhrMmJJ6dAGZGLgY
8JhxXWh9qJaJR7s/KJBxxMvz5M5tsIpkw2Eq4YlbYKcyh6yMjME0g8CgKxtNKct/
P47UnQzKc8sZAQ37uujom87nTm2FGw==
=K6wt
-----END PGP SIGNATURE-----

--Sig_/ykhteWV1XPsV6xad_W3YPJn--

