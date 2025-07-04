Return-Path: <linux-next+bounces-7365-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7DAF9313
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 14:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68F69544047
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 12:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868E22D640B;
	Fri,  4 Jul 2025 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mALiwNSq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47228C2DE;
	Fri,  4 Jul 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633282; cv=none; b=nsj1dDQf9804gg6uW9Wv4l/poeDosj08maY+mbkDd6HRJMoTDKJGYtb2GyaCH8xTM9cvIkasL0Gh+ZuY51dZj+jkIoroQ/m4JVJfKgGtfrjGGQB8dIoNVz/kH5L32A+DXkCUVHKkdzPoJudeWMTUN75fwz8tszHGvze37CJcRIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633282; c=relaxed/simple;
	bh=Lmq9cmXGUx71IDmJg1Vxj7KBXlBI/PY+lV1MKrvd0Os=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mrzNHVjLMLcCX6oxTiXOMFwBKwcpZ/BMVHNLc6zLWemxji6ivrxWl2KZ76GmOKYxoli8BPQWVcWkBHKNO3KzMcYXLZUZcr9B5vFy8BehEAYEdgy6V5ZFmwZ5YwWMhNMyvgp9+CGyRl8kgcoCusApLYbAb9yWzEYeaZEZU1NxcP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mALiwNSq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751633245;
	bh=Lmq9cmXGUx71IDmJg1Vxj7KBXlBI/PY+lV1MKrvd0Os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mALiwNSqOOsmrCO0weJhLzLMTvzRNnsUBUI3PEizhQIdP66b/ZSmbZjB3T84fipsb
	 Ct2aGQoUV3++z0TEdEU09OSKfnqKv3Gi+4/G7emouAC25dSPZExL7lcFqBqWLj5lQt
	 nvyfoPmN/gzAdCEsamSKidIgzOgwBTExnRhLDzipkHAoWlVQ7fzX/y32gKu/BmWbr5
	 xYBFahvivd/SSybdOUIWcEscOZbzoZpwiGpKi+I3O8CkPBFCsMuZfbnfRiq4YPlgPk
	 hUNLUc3LO0RlrJ4O3x5JTAD3H2hbZTSCWFIzO6hp+3WXt2xReK97oUfQ0UFLG4rC7q
	 ErkDxAz+bQyEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYYLh6qm1z4wxx;
	Fri,  4 Jul 2025 22:47:24 +1000 (AEST)
Date: Fri, 4 Jul 2025 22:47:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Lee Jones <lee@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the input
 tree
Message-ID: <20250704224753.45391b67@canb.auug.org.au>
In-Reply-To: <CAMRc=Md7Znq6Lww3-i+sRW1LZMD78s7vnVYnDwVKQsjn7OMhvg@mail.gmail.com>
References: <20250704185641.430ae617@canb.auug.org.au>
	<CAMRc=Md7Znq6Lww3-i+sRW1LZMD78s7vnVYnDwVKQsjn7OMhvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w6Xoq8YlvtL0=UnqzONdv.=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w6Xoq8YlvtL0=UnqzONdv.=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Fri, 4 Jul 2025 11:00:49 +0200 Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Ah, I pulled a tag from Lee's MFD tree containing 3bdbd0858df6
> ("Input: adp5589: remove the driver") but I don't have 43a8440f3969
> ("Input: adp5589 - use new GPIO line value setter callbacks") from
> Dmitry's tree. Dmitry: is it too late to get an immutable branch with
> these changes? Or otherwise you can drop 43a8440f3969 from your 6.17
> branch.

It really not a big problem, Linus can be told about this when he
merges the trees ...

--=20
Cheers,
Stephen Rothwell

--Sig_/w6Xoq8YlvtL0=UnqzONdv.=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnzXkACgkQAVBC80lX
0GxWmwgAnfmwUWHXvY4FzaApVfk5JjvECTEQ0l+9LEFzTmS3ZQfYx+xCPyD3RBHU
KOS4TU4UqkxolSm1eKpUpyhn628tUcsYNFqFxFUA0l68gOoNN9a5jaBvUZY0aJ9n
gsYZhwC2x2LmFSYNsVHpfe457AW9iSV7UeHVfJrqA2GxVNwkrmOPCciFca7kQJwR
7RXVbX1m37StZm8xzfSkdbvsEBiKPna70d2TM/wfa6RBO/5VUHD9j1K7v9tmLYWJ
fL/BWNEIHC+Nl2xsiTl73Jtv9YS+xsjr/IGJCi+6xmuNjdfFQ/Fa2VQ9jlIhqoN4
UPrCwDGS4WKpnoc/seswYYStE0lIrQ==
=tafw
-----END PGP SIGNATURE-----

--Sig_/w6Xoq8YlvtL0=UnqzONdv.=--

