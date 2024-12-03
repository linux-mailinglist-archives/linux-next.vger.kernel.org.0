Return-Path: <linux-next+bounces-4873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23EE9E2EE4
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 23:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77C2F2821F3
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 22:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905DD1DE4ED;
	Tue,  3 Dec 2024 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYKCDBYC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FEE1F4287;
	Tue,  3 Dec 2024 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733264138; cv=none; b=j+XkxsbiJ5JvOOKr9qKFOANbD8R+RCYmfcjf7zmQRaHS1EFISA69/6Rd0WhmJA+FPKjnZgwKSDzFdOXXVEJIBYFgr1vGvy6Hct7m4V+Yeaqho4lZ4Y4t0789Tre3t/Y7j+mMyOAUu/S0dhSGft1e2mlYMWCGvPAyV/Tzfs9Cg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733264138; c=relaxed/simple;
	bh=3sE36V4ydBt6WuhQB9Ej91v9qPw6dVRTOHmvA05Ud0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJzarllZzio7d956LNo9QZyhcOrAE815PGiD39CpjrkTI9d6tn+pcmsmssvEN3IlKSuje942kjMT4JPAdgJEjUwIsPd4E3TO9RXlriL5/PqtbFuZVEglQMAQPB3n9jL08iDGu1vtEQvFdaMn1Z8GTp0F9TTiYquz78ka34mGrzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYKCDBYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B672C4CEDC;
	Tue,  3 Dec 2024 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733264137;
	bh=3sE36V4ydBt6WuhQB9Ej91v9qPw6dVRTOHmvA05Ud0M=;
	h=Date:From:To:Cc:Subject:From;
	b=RYKCDBYCVYE3/0GOI9S2zNtqR/NxXf5R5RkLZXnnGILXMjKSxDUnUwpzMN1aCcTat
	 XyF+3EJK05tP02uILWMYoa4h+A8NufuA/y6sqM39+QOVIo316B/M1SHaJxPH3TkFe0
	 ixixKMhogw7EHu7fYijl2iOnI+Ff+ivFpasPm3DMa22bN6YOd++2tG2Kszkk/BOcu/
	 MyLkwGEEnCVRBieR/109BFLtvA4U18JWPb/JUFcZVsavYVLVIpHgN+zJvEIHO7dR5j
	 lJFZ8MIDylGb+FqqU8C5hO/rXbuksySWHcgdrmI5W70b7XF92AcwXegRI4dzDMjVX6
	 N9BbDJhNAar7Q==
Date: Tue, 3 Dec 2024 22:15:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: linux-next: manual merge of the watchdog tree with the origin tree
Message-ID: <Z0-DBdonevU5_cRK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/fruUK97YepmfZCC"
Content-Disposition: inline


--/fruUK97YepmfZCC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the watchdog tree got a conflict in:

  drivers/watchdog/sa1100_wdt.c

between commit:

  e70140ba0d2b1 ("Get rid of 'remove_new' relic from platform driver struct=
")

=66rom the origin tree and commit:

  562b0b03193b5 ("watchdog: Switch back to struct platform_driver::remove()=
")

=66rom the watchdog tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(no diff, used Linus' version)

--/fruUK97YepmfZCC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPgwQACgkQJNaLcl1U
h9Chdwf/UfhkhK+SFDOKq/fYwjyo6EqceY1zIRRYWbXs7YZUjJQfwuTeZ65CuqBu
r4Jkqm6k4eUiTBNiVnX9VOUROeSv49LBuBqGTmp6gaWQXOAuZqJp185BCu9jYmyS
NdP2I9a2mcJWMz6uJMgnOFwlXySo3h4gmxLt7WF17P8taT2G/UAN59tLp65bkN7h
/8Jm1wtxT61l/BVWVxco5NH0ypFT8wU27jz75tofLqNKMcCBiddtrM3c8mAgKirD
C5+90Smnk6RqiChbJtGDE8gnrSfhjdt7jePZHyEDUP128CCS9eCOTJachWfhVKsO
SCNZnIVhOXJ7gzztwnRG3IilCJikZA==
=uBC7
-----END PGP SIGNATURE-----

--/fruUK97YepmfZCC--

