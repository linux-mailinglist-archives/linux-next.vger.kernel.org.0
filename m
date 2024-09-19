Return-Path: <linux-next+bounces-3920-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC797C250
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 02:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10F4CB21E0D
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 00:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653044A0C;
	Thu, 19 Sep 2024 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NL05RkvM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A866A50;
	Thu, 19 Sep 2024 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726704942; cv=none; b=bcx8XtOW2Oxohd3AfBs3jXzw85SuYevHekuyaH4mqkiMi3pAc0qq49W1icSsWcBQg5YhcsS5ebR3+3XMlUw278zShZvJH0p7nLLR+UcKz8ufujxj7iRmjNAWsmQ3sAQDKXgo6XEAmPtvcgVIBup7ImA8hgp5iwBVxrFQ4vOCtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726704942; c=relaxed/simple;
	bh=1TwAr0gzuinOWZHT0uNhgWW5GEzFqyaOuyKNjFHELCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5zPA3I4380kS4oig8vACVYO1fxsukroT2wM8sRml2PvefVqZAM5ehgBuL0uOo1JlzH5Ip/FFkPivadevI2y8byfNrdfZOoApcEevdwK3DrFxr0YwZcdvFrDYxwDydY+EmlirpvSx00xT0e0zE1vY5OlQAfXxhcQt+287LkE9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NL05RkvM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726704928;
	bh=BFVgApMaKTOrtZHUYX0Boyn1ewjgPbFCjjAY/d3MhZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NL05RkvMIVWApx8G/ayPP8BovtyXq/hxz+I4Z2LNZWlurEFgPI4cbDjffwa2MFyW2
	 VVzHOEfv5weNt17Qjjqh3skf9KX/6qBnQuTZM8EgEe9aNg5Sq96yuaSEHYrX8WeZ3J
	 Rrbz1aF6oSlMPbKmOMWklG7Xc4VowkcHAbw6+mFqlBw2BUCiL/tSp7sBcIXjk6mCj8
	 NZhLEqLM1pKPh167L9pFTvorTZOm4Q5ncWWzhmAdDCbSHCZdbOfNNJPQpuL1oQZFUR
	 amIvE3nmSO+CN4N8Xn5yQooO62QafpbP2P9tJ03xvltMmKjXbr5oqApwhwsacg8d9J
	 X3bSSnt6JL8RQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8GHx5WKxz4wd6;
	Thu, 19 Sep 2024 10:15:25 +1000 (AEST)
Date: Thu, 19 Sep 2024 10:15:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, ARM
 <linux-arm-kernel@lists.infradead.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the arm-soc
 tree
Message-ID: <20240919101524.55472e9d@canb.auug.org.au>
In-Reply-To: <20240912174842.57a43921@canb.auug.org.au>
References: <20240912174842.57a43921@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wpkKxK_+JU=H0yNt6NrwrdB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wpkKxK_+JU=H0yNt6NrwrdB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 12 Sep 2024 17:48:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>=20
>   arch/arm/mach-ep93xx/vision_ep9307.c
>=20
> between commit:
>=20
>   3e0bae7f35c9 ("ARM: ep93xx: delete all boardfiles")
>=20
> from the arm-soc tree and commits:
>=20
>   4b2b0a2ce815 ("gpiolib: legacy: Kill GPIOF_INIT_* definitions")
>   8c045ca534d0 ("gpiolib: legacy: Kill GPIOF_DIR_* definitions")
>=20
> from the gpio-brgl tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the arm-soc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/wpkKxK_+JU=H0yNt6NrwrdB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrbRwACgkQAVBC80lX
0Gz0+Af/efU2HyHLwfXJCSuZi4wM9SywUerZZNp4srgLkNgesZCI8vwOiryukN5D
CqcspSjAbcK7sM2eQt7U8p3y1IwUZeMh2/dSRoDDV3rqtbBnxJZxvKiYS4jy3F90
+XgMiz9gwTPJmWBvqjs0+vGVsLdke9vW04etTD2OXbOu8b1ZeQR8eqF+l7uGADvF
060b2mSgRX/gL/sTTOUSdg/24F4NfYLwmlKacq6WpVi3itAu8K8dzhme9PbUhGnF
SexdHrK6vF8uuCGNgNPH+XNW11Lb+gdqBhLHFbCQbLhiLmOBQhV5phIpM8ER3RhG
FST7FsygElXLu4IzzzsQ1lWqFG5+kA==
=u9gm
-----END PGP SIGNATURE-----

--Sig_/wpkKxK_+JU=H0yNt6NrwrdB--

