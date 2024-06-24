Return-Path: <linux-next+bounces-2647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63891557A
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 19:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDDEC28106C
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 17:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C92A13A894;
	Mon, 24 Jun 2024 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQfotBts"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0349FC08;
	Mon, 24 Jun 2024 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719250562; cv=none; b=qQP1b/EylTS7s/Fft90kRKn+3pwnz4oAZMdUL2TiPjeN4ZjsDpSYg6UY04QKGF7SVmv6QyhtwB2DSMIt7eMst9ay3UYM7pIGgQXziRF5IOhO3iYSpM+UTQSs+UVzdUdEsd2g/mw5SiPO2wOwntj3ZWPrz0bzXZ60qo0PgjxsApo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719250562; c=relaxed/simple;
	bh=hX0XdvDFbU0k0AnReR7dKbWS27w49ADdt2eSefvggcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B48gMuoSulGZmAnuPzVEvl/3w1OkurUJnuvz8jQhhXfZacUZAWU+C1QQoxRaTjtYJmte+NLcWw2fY74Y1frFlqOsvzDfahtVcba7XgxUnXheX2vaZR3N5bBPypyRZa4sklAZ94ddoNgNeBk85ql6UrZYcew//N5NL/8XZTdtiYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQfotBts; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EB0C2BBFC;
	Mon, 24 Jun 2024 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719250561;
	bh=hX0XdvDFbU0k0AnReR7dKbWS27w49ADdt2eSefvggcQ=;
	h=Date:From:To:Cc:Subject:From;
	b=qQfotBtsoCKcawvWJX49vMgN4+PlZToxrOjgk6xIuGasPXfchmKElBS83LenrfJtX
	 AId+IFtPUdjcv3LyPQA0O7ZEr7PXz/ZlB2jFlh4vT3Z3Ajpn+2Mr3Jp2goJrmb7mHA
	 eVc6kQqBhqCvlLNolra48gTEyBzXaJfKZ/gmvOuTQRDgGjnsRSvBoYksru3v8o0SEt
	 DIoAoX5fgHjHGrj9zYH7W7/JTFi/XsdiIGK4Els/5X155BowV/y09YDaLX74DKz/DM
	 kumVmsAqW5b93AV2/vKIE6Rq2XE+nYEg6sngt5McKbsRMC1KD8PpspyqtT15qTz0/w
	 Xq6rbgp+FTPFg==
Date: Mon, 24 Jun 2024 18:35:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: linux-next: manual merge of the driver-core tree with the reset tree
Message-ID: <Znmufb9L78FCoSSS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GJugohMgk3C+vYLN"
Content-Disposition: inline


--GJugohMgk3C+vYLN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/reset/reset-meson-audio-arb.c

between commit:

  0e8b3bca280a7 ("reset: meson-audio-arb: Use devm_clk_get_enabled()")

=66rom the reset tree and commit:

  b99e9c096148f ("reset: meson-audio-arb: Convert to platform remove callba=
ck returning void")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/reset/reset-meson-audio-arb.c
index 894ad9d37a665,8740f5f6abf80..0000000000000
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c

--GJugohMgk3C+vYLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5rnwACgkQJNaLcl1U
h9BqvAf+N+QFDTGcix7Fx0GDZJAEXLzVeLejo+SM2MugdPCxN56XGKZtQ+99h9lV
Ryz0k7m/XCNxfME/gOt3slNh7lNIjPQDn9FIZW1TyYoMftE0p916LdA5bcFcNLLS
9vTJH8L3QFg1G6iSEJmI4mEvt8v5P3IN843X3f8+tNgO8dubELgnFtl3oUoqQSC4
KtqIpgqLOtD4zxl2X8sle9jOjImz/ZsquNNZKnIBRDk6HpAkND/bYuVycpcD3O3a
UBxBVJIfP4aJ84mWee7YQBASN+tii+EJZu8tD52ErErBXEiY3yulsvI3Mjeea/4s
vYXFAZ+tSCnHlwxT0ZMKt255Fdrk4g==
=6y0T
-----END PGP SIGNATURE-----

--GJugohMgk3C+vYLN--

