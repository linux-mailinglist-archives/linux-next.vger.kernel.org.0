Return-Path: <linux-next+bounces-4869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D319E2C85
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305D428417A
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE542040BB;
	Tue,  3 Dec 2024 19:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFt2vLXx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2341EE039;
	Tue,  3 Dec 2024 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733255880; cv=none; b=lS4pFVlLfofVFih+yyNsNKhNzeeFdruSDzY1NqS4l7xi/4y6WppcHgwiQZQ2DWZLdzGV+vOLpzYeVL6FZTK3ZUph4i8HWEWyj5hK8GE6C8Ag/O3h1fnZaEldDY922FI905s5BspSJ8T00v4duBYMOkciCEje+56E9TH/VJDq0P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733255880; c=relaxed/simple;
	bh=SK78w0Rl9WD3OnfNjypBp4Bp599Yq2lSFf2smMGqxhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoDSSAt5rBaEGRRy3K2Y6gbLZ2zncYXz7nQdVRM/UZITQ1YuBXw5HUtZipHEPKzlN/2doFg94wQl+EZi/8oRetkUMCuM5NiD9noNMoFC+Ooeeulmhne7w+W+m0LcwdZUpgMB6hCi6u7lLBRLPViQTiuAuyyGmLHLd3LXlC/QKEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFt2vLXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E1CC4CECF;
	Tue,  3 Dec 2024 19:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733255879;
	bh=SK78w0Rl9WD3OnfNjypBp4Bp599Yq2lSFf2smMGqxhg=;
	h=Date:From:To:Cc:Subject:From;
	b=HFt2vLXxoApCgtvLgjNMDuN6VR9dfPm/I7Sz0LD5crp/ovm5PAzOn3z86Vsq4dR4V
	 zEpb6mrqqGUmlKOtoJb3NfYNJl1dZZaOmmMTT9VpVI0RA4ZfK2k0xuQ1d+nyqb7fHG
	 v6or+6LR1zRKl0god0tHTbN8p5XrA2G3Ap2Um0cYHTcRub81pb448vmNwgO9lp86Mc
	 6b4w969yY5e4+aaKzUWkDr6i9ghczb3H/e3fVCuuax2dN3uprlMh/WnsWRZ8WkHpCA
	 xkDWCIwTp233jwrsN4p2xvLzrZTaa6dDppBuE/+HVqeQXcTiOm/56iC1cy+AmZXbXd
	 a9iPRoMe9zLig==
Date: Tue, 3 Dec 2024 19:57:54 +0000
From: Mark Brown <broonie@kernel.org>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the net-next tree with the origin tree
Message-ID: <Z09iwtgMaBZ8d4QY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OvwrEfEnsLb5Nfr6"
Content-Disposition: inline


--OvwrEfEnsLb5Nfr6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

   drivers/ptp/ptp_dte.c
   drivers/ptp/ptp_ines.c

between commit:

  e70140ba0d2b1 ("Get rid of 'remove_new' relic from platform driver struct=
")

=66rom the origin tree and commit:

  b32913a5609a3 ("ptp: Switch back to struct platform_driver::remove()")

=66rom the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(no diff, used Linus' version)

--OvwrEfEnsLb5Nfr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPYsEACgkQJNaLcl1U
h9ATlAf7BlOXwOWpcMW9sRLgOvZKdQ6QiefO4uwjXZwholw3ccuGEBMRCTqJLHxn
rCgibYaqB7t9ZbTdoTFtdj3wNyBTWGt/V1DeK7g0ysvADYkibP4PnbkOG2oxe54S
oKdkC/iRfAZAnRXUj+NG+EYK2KP5VUvv82XJi1xsH3jdb5q7kndZcvwB8tD9BCIC
omoqzc1y7542xXSxYueKFpYSnXcCOYyICvAcZmEYgBN0Y30dGZUebWwYyCut8qAi
pMnOyVwzj+kxcmmSxWzw74iIxcdxYtVqgkLYTMsRGmCGe4RebwXw1/corUW1MX2T
FQm9y0GSUh2qhyPnynjwir9odX2/Og==
=6Fak
-----END PGP SIGNATURE-----

--OvwrEfEnsLb5Nfr6--

