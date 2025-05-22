Return-Path: <linux-next+bounces-6897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F097AAC01CF
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 03:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3829A3B17AD
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 01:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BA6182B7;
	Thu, 22 May 2025 01:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tU5rMh1W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4C3770B;
	Thu, 22 May 2025 01:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747878130; cv=none; b=mnZkTjmUdJz/ZYlAOXoJPn3jJqs+MEsk4FvpaTmu7WWh3jDJm41MXrx2Rp3bLV7M4Vxx8x+PDJROh/f50zjnVzgr8Bx2JlWGJFTF6qh4hlLTf5Ec0CcNoh9MYNEIjcE65l0U/vz5mZn9WZAr+9HNojr5H+BhhkbfKi/Sy0YQHzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747878130; c=relaxed/simple;
	bh=k2p+6/vJev4kXN59xBJn0j7DrpevzlCVAxzaXlzPugM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMiyZj28d0DKX6gppTjv+yKZ4CZq+4tJYZaHQlXrWXAFuWkkEcL7vdh2I1QURQKGqjnvXAPdZK0OnngUCnfD9rKvkm8mWLfo0H58o7YhCYOj+nqQAY6y15yJaN8Q8s6Ht4UU/gVVoF2Zyq69XVo7bjGIJCb8B765GIsVkmt8ddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tU5rMh1W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747878126;
	bh=nQrRu32B0JAav7NQUY9wwzCb25Wff8sr+TTCsc03jnY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tU5rMh1WUdYLWG5zxhkkpHVoPv+wF6CP16tgf5/43ZRTcaEoF52fOc1ezC417DZ5Z
	 5tXr31pN9qbvFQ0wYdzN6sSRESWr/M4mz6cnBlJWl0d3+460CtibaNFJQvwxOtOa/T
	 lyr9vcTJZx5cln+NzT0vER3tkdmUKDmifv2qwscjoxigfjGu5FVs5tULFmRdi9sBnS
	 xLm/rdI8AlFJ66O7/e1bsZXAH+B+Cb63k+ln2EPrOX3YijEMqLVngg6yLNAMdsqP2T
	 W9VgT1TgGAfA7scDrXGhLPR3eFBI8FsBjy/x8XufFU+SW8zJ59IRU+7KPDHKqDVA3v
	 aU57JBzEoS1Og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rct09tHz4x8Z;
	Thu, 22 May 2025 11:42:05 +1000 (AEST)
Date: Thu, 22 May 2025 11:42:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: duplicate patches in the samsung-krzk tree
Message-ID: <20250522114205.35511096@canb.auug.org.au>
In-Reply-To: <20250522113227.7593f675@canb.auug.org.au>
References: <20250522113227.7593f675@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FlZnicdvLD.AwBI7bx/j1lu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FlZnicdvLD.AwBI7bx/j1lu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc arm-soc]

On Thu, 22 May 2025 11:32:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   286e6e8787df ("ARM: s3c: stop including gpio.h")
>   e0d7c81b15e8 ("ARM: dts: samsung: sp5v210-aries: Align wifi node name w=
ith bindings")
>   e83a135a2b2f ("arm64: defconfig: enable ACPM protocol and Exynos mailbo=
x")

--=20
Cheers,
Stephen Rothwell

--Sig_/FlZnicdvLD.AwBI7bx/j1lu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgugO0ACgkQAVBC80lX
0GxIRQf/cTupFaYMhEfRpXqGhnpDVIV3Ytt7xKAOZ5623fZ14M4abbUj7tSrtwip
fQIv04ZmQsk8bhR3J7xgheiVSyAOPkkm/Fw/G0SSKEQNJgBHzPhK/xtjAsFqfTDk
CChdSsvUyEI/szITaAZSO53wgA76Nr9iVLjkbmMWWsUF/ZHoWu1c2OmqhCZEIH0V
TQ9BHe3Xxj+mrW3y81C3L3zZ/6EhYP7t92X5ELXJtmG4/1BaqZuJnuBojp5lQ1KR
3joIXjqHwV7xaQfhz5h4LKl29XURFSidFISHvGywRGW5WblcOpi+ADG2pdkFVc8p
RIDy0tJh0F2ESqxO3X7NuJezjYqNzg==
=7KXb
-----END PGP SIGNATURE-----

--Sig_/FlZnicdvLD.AwBI7bx/j1lu--

