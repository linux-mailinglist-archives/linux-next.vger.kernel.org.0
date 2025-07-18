Return-Path: <linux-next+bounces-7638-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C813B0ABFB
	for <lists+linux-next@lfdr.de>; Sat, 19 Jul 2025 00:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA2D87A3D22
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 22:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31F622126D;
	Fri, 18 Jul 2025 22:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oJ4QEcw8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F212211460;
	Fri, 18 Jul 2025 22:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752876543; cv=none; b=uiIPTkoIYu1lWYMFQTKnRqmnxlVzcezcP+ZN41aLxvQOJVfPZHERq3ZBzz0DNGJxhvNsYK+aCxU8R/3vnbnru+E6/nakT2xif6e2eKUg62eSdjRWJ9NCy12Lu/vVgdnix9Bcmr5JTL5SbnDc4/I6dBhI6OIDxwCyEKLP+BPJROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752876543; c=relaxed/simple;
	bh=DxpaXYd0x2WTnenk/a/Q9cGK0IY2RfScwM25UrFk94w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxOFGcs1SrGw+xYkJUNX+zvMCHE8avc6zZCwd380ckYJirrN00CZ+7ZARNRCAAG2Lv5W97fy5TXtNLjTcHHiCWMkZGfkDYCgH4XDeA95DOovRCiHmYOgpO7ahemYu6+nfeimVu/TwIOhHlpftZWM/1PxpevLUEp0W780LHfzcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oJ4QEcw8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752876402;
	bh=DxpaXYd0x2WTnenk/a/Q9cGK0IY2RfScwM25UrFk94w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oJ4QEcw8Q1RqPSrGD/T36nzYcrIEgoQYHkomHnRiq4Itkhs/tVjGkH2Y6aiVm44di
	 /v2+/BTXRi+TAtc6ncjCNx+foQW0rpu0+UK+WdTiHJQjOG5gKD3JvzIforahZx38sB
	 XUq1bd3ycs7Y/HeqNqOrmz7XqdJ9xbQlqEWDN1bVVYk7JjUfw0RVOfAg2iRv8IdrfT
	 wqFAqqgwFjeTznGbB+6LdJrX6LmnOuPWLlBzWarbQODzehXNxPs8jnjkgfLJytKxSf
	 U8H6R4ZgoxMRofxtMfZlNmtpNL1sgTK6zrryo3KI5pXNY2PeFq+p5QfpCLd4590wwN
	 pkhVeDpO2Tyuw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bkP5Y5dhYz4xQZ;
	Sat, 19 Jul 2025 08:06:41 +1000 (AEST)
Date: Sat, 19 Jul 2025 08:08:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Will McVicker
 <willmcvicker@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the clockevents tree
Message-ID: <20250719080853.583fc406@canb.auug.org.au>
In-Reply-To: <CAKnoXLynCY8dAe8k+ttTVpN2U49_-DyQFU7t1BRk-x74tfJ78Q@mail.gmail.com>
References: <20250716160809.30045a56@canb.auug.org.au>
	<CAKnoXLynCY8dAe8k+ttTVpN2U49_-DyQFU7t1BRk-x74tfJ78Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Id1.TseJi6WIsko6gx.zF93";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Id1.TseJi6WIsko6gx.zF93
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, 16 Jul 2025 11:26:15 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>

> Right. Shall I fold the fix with the commit ?

That would be up to you.

--=20
Cheers,
Stephen Rothwell

--Sig_/Id1.TseJi6WIsko6gx.zF93
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6xfUACgkQAVBC80lX
0Gy9UQf8CLMshvs3eszT971rQV7WXp4s+d5Cb5OEf14o7m9oOczKlKhpEyRScLu3
N3HbTX9cfTeyUUwz8CwgzVxhB9uA6Hgour6wJGYeXzSmKNYM6BygfFkaQ/o/Mjvp
6ADWsfwSU96nQRymHP1hpQkotA54AfY9z6dGGoUR5G+XaxICPr2CYA232h/RJo4x
gpWp7b8QEFSTQZb3SwekGHgz4+qvMvZOTGuFoaLnrBwnMAXsmFCY/WsNksCKGJRZ
OYfMN+7hpitNofubODP3AcNgi0k+bA2M4Uq1v6PkwJD94ZtijKQ/sJYjgJoZd+dH
rkWzm0OYKJMYB1+2uhk7LPBYamyqKQ==
=voVw
-----END PGP SIGNATURE-----

--Sig_/Id1.TseJi6WIsko6gx.zF93--

