Return-Path: <linux-next+bounces-4886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5269E6F73
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 14:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 748BA16C24A
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 13:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97551714DF;
	Fri,  6 Dec 2024 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcXGDMwv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ADC5464A;
	Fri,  6 Dec 2024 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733492770; cv=none; b=S0Lvab1GQHxfFAPD56QOdaOoqqNCgrmB2thtLlrXNlgoIC8m+GoNuAvD+PW4EavLyLQKh6n3Kk1R/gLwnOpeTLdjhZSlhs3xaIcjQskSqCy7lsW+ORMzue97B6p8HpXnf04XPG8ptYAQOg5AFhanrWdCImi5xoBPhdX88p1ZwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733492770; c=relaxed/simple;
	bh=mSa88YqWyNOTets1sSaXRXWWyLgBT29LuhbzK+z79TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcT/TWomsH/W3TMkUq0TEssLxtBUGofcOwsupKTXjuEW2b1QM8FuaJliyb1xjNOhcFgDGTsZOfUlKHf7xcCdm1oZc+L5AJH8XBB8YHKFSV3p6s3nHyflan/cdygSAbGIiXcvkBgJ2uD8gDwDo/rpsk1YSggAapAtBH6jcCfNRS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcXGDMwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A62EC4CED1;
	Fri,  6 Dec 2024 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733492769;
	bh=mSa88YqWyNOTets1sSaXRXWWyLgBT29LuhbzK+z79TY=;
	h=Date:From:To:Cc:Subject:From;
	b=DcXGDMwvNfANNzw9+c4gSK9b3MrTVz9BlGKOFcGbeEY/YHwXJruh9ADiNCOcRaITN
	 gzTwJHJPgV6GCc22yrUz4ysUI+QftkXOiiqMof62Vr95wH5upGxgs18CpdYV3iSf6w
	 n/uo5Q7DInjYzHeLryb1RKiNETfLHub4poky1wJMVT2/oJiiIYZwcGMlZSAOp31LVY
	 11ccGPH4gCcJDiZ8nWgLWuIavbnzgmDq9ULTuK2jEbInJ/nW2vMYUquqIvjKtv3naN
	 tMtWkabmEHwLXir1Ui/24KKI5gGIUiYVJZCsAbrVj4kUFYAfhSVlrXNg+KAx9IwrwV
	 xtEJSfmCxdXBg==
Date: Fri, 6 Dec 2024 13:46:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the extcon tree with the origin tree
Message-ID: <Z1MAHZOgRInwoyZi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghxgXAGyqZuv/mnX"
Content-Disposition: inline


--ghxgXAGyqZuv/mnX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the extcon tree got a conflict in:

  drivers/extcon/extcon-usbc-cros-ec.c

between commit:

  e70140ba0d2b1 ("Get rid of 'remove_new' relic from platform driver struct=
")

=66rom the origin tree and commit:

  a5bca5c3931ba ("extcon: Switch back to struct platform_driver::remove()")

=66rom the extcon tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(no diff, used Linus' version.)

--ghxgXAGyqZuv/mnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTAB0ACgkQJNaLcl1U
h9CjvAf9EQR2MLDtO4rzno0hHRB9MDfv4xei6EDRfvUrLtc3cqq2kignUygZVKAv
p26oJ1LvewbwpOPVdHm6sDaI+/C7YpervR+aJ/E3YBqI7hqFX/6/W+ajmqNduPla
f+B+jC6L5uI6yo33QB/zAETypuatt9JxsCHV3GBM0SpqhqWqoJQxcQQuNMbqNpkC
vF79zOiP8UDMY1o9WSdm9P/1q0gQMcZkzZ0b+DUINP8iR5mryk5Jwndq1CFJkjIL
PO+5iwohNk07mrgCO/nK3anZXVUuCp3rJSFv71aYK52QK3RgsmECzaUqzmDPN16J
vz/yTs4XURTtjKFb8TLQoNDtY8Pp/Q==
=bZUW
-----END PGP SIGNATURE-----

--ghxgXAGyqZuv/mnX--

