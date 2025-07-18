Return-Path: <linux-next+bounces-7614-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FDB09A29
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 05:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 645A77B108B
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 03:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1561A2643;
	Fri, 18 Jul 2025 03:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o9XZuOw2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B82E36F7;
	Fri, 18 Jul 2025 03:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752809232; cv=none; b=pQ0h1qy2gxPOrgwcDtykTLzxskw2vECd2oz/6IaElb4qHIPUVIN6rFpOP/MGD7rgti3UlPGgOfOxXU0qiceJKPKdqebKHbCZ6R4P4uIrwKMco30lH4anq/lwG8Wlp72RKpdxxvT15rSh0xsKTrV4eOcCg0frfNhmHw5DjFq2XBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752809232; c=relaxed/simple;
	bh=OuE8+GuXn88Cmn8qlc46+mY678JtOGJYdh4SdIcU/rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Km22uLkx2YAN8omzpQk5xKslbOtHEubhNOVoSSlkyBQtHFHg73OAEFb+9/CHu7hz5sOWRfp4EU4zA9mOeHOTDBLxTYqxbUJhXpRfQwB0WRJN1Td0cAiBknl7nA4qwAi/+mpv7AqsYotdeTy69GCaDZ9xHdMY0v+ueTgxO6v8d1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o9XZuOw2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752809097;
	bh=ENH2f/B28PrzijqHJPWIglQ0MM/RFeZATGfmRWB85oA=;
	h=Date:From:To:Cc:Subject:From;
	b=o9XZuOw2gPTz/AbB7H5wF1MBgA69AEZY+RbOr3vlqyHTf3tmon42avt0ljBqS2ABJ
	 1sgLRERwbRufstygrfHMhbytBlbn2vEuklqUtKrcHQJM97tEQuL397BP3jM45t1HDT
	 jEQadBxKJXq9w0YQVB92Bmlh/PHfcZQPPIgVrQ945tbQ4a5Qu0AstALMw+XTHoHZ8X
	 53cWbZPeT3Ne55vy/Apz3Lphdn3jnLDB/JYtgMWn8AyiaBhQWQUYh3rqyaMwcm/IsM
	 LwPOtX80Ui4YSoKlFZC/Di4hpnMj6nKQrH4NVhjhHgKAObIt5o/S8T7u0/Ue3l5RgC
	 Ic57W2xEzwETw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjwCD0LDBz4w2H;
	Fri, 18 Jul 2025 13:24:55 +1000 (AEST)
Date: Fri, 18 Jul 2025 13:27:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the pm tree
Message-ID: <20250718132702.3d15eb51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/20B2kj1xla6wSND/Tl8Ivt7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/20B2kj1xla6wSND/Tl8Ivt7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the jc_docs tree as a different commit
(but the same patch):

  efbc5b4ac98e ("Documentation: amd-pstate:fix minimum performance state la=
bel error")

This is commit

  4613bf5fd045 ("Documentation: amd-pstate:fix minimum performance state la=
bel error")

in the jc_docs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/20B2kj1xla6wSND/Tl8Ivt7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh5vwYACgkQAVBC80lX
0GxNYQf/WoQHcEXedoXxFnAsl17OniAdWYSX6w8wNcfq4QG/LbmEEh8bk3QI+8JU
9ia+aDpTC2Y81DTffj4Lm0qFWbILPYgDF/FuedXm0BqYKqO8dHEyDE7379eVtLcs
ARSZC2dIGf1a1M3XjIJTRcsrXBPgDoxb8fX8D9eYtG85s2eR59GlVifjlDcYm7Bj
MTDY/RloDqUww8Z5ZJVAih3NIqqbIGnfX+nHNbGIOG+Pxo9OE/5fhFKcPVZjmEH9
07cnXq+wWvyuFnJUEJKXbsehxAEUz+22/sYOlrOElH6b31BXe0AKBJYhAD3lQkb1
S0NGz3wLHmO7fSYPmkjqSrH4e26O9w==
=TVzD
-----END PGP SIGNATURE-----

--Sig_/20B2kj1xla6wSND/Tl8Ivt7--

