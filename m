Return-Path: <linux-next+bounces-6990-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C8AC8CF5
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 13:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3CB518805D8
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 11:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E0E20B806;
	Fri, 30 May 2025 11:31:42 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C674A28;
	Fri, 30 May 2025 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748604702; cv=none; b=kXeX3q1Uq10+w0Ki826L/gGJ+wgq2YwMYz+N8L0a0AaAhilsJKz+YloF8f7N92exkQE0vFKrC1/j6vhfayYmAk0rMxK3NMPHRviRuKJWgemCQJAdp7GmBb/ZylknL2ageZLQ5N3eusUGBUnxKI7pQqP8w6qsrPR23CWMQjob4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748604702; c=relaxed/simple;
	bh=qaf8f9ewxo378on/BO/Sf+C8sTWzEsWAsALnixH+k5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2AZ1EkHpv9mZIosBXnpPD5Aoy5pgpJBE0bz2FjXCTWn6kGYDUS/Qs2vpzLaxD+o9HhTRXVy+GLiW9zvPe4yzHZbVzI8e9A2+/Y0QQ22CbCauxZHYatE6yKTwIfdcSNzichfOk6jCtTnUaEyIC2Vtlc9tb6rOlYlzY878ie22VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (p5486c22a.dip0.t-ipconnect.de [84.134.194.42])
	by pokefinder.org (Postfix) with UTF8SMTPSA id B6485A40DCA;
	Fri, 30 May 2025 13:24:47 +0200 (CEST)
Date: Fri, 30 May 2025 13:24:46 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Message-ID: <aDmVftkqLvR0SV3p@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250428104905.2b54643f@canb.auug.org.au>
 <20250428113052.38cf10da@canb.auug.org.au>
 <20250529124929.5217c6d9@canb.auug.org.au>
 <3352024.aeNJFYEL58@fw-rgant>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7n2pe9lU8hdBlJS7"
Content-Disposition: inline
In-Reply-To: <3352024.aeNJFYEL58@fw-rgant>


--7n2pe9lU8hdBlJS7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Below is the resolution I came up with.

Thank you for this...

> -       for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients)=
;=20
> reg_idx++) {

=2E.. but it was mangled, sadly. Can you resend it properly, please?


--7n2pe9lU8hdBlJS7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmg5lXsACgkQFA3kzBSg
KbZOLg/+IoAZEi1PQvcS03ku8ZPdJu27PYNGjSzHJ+hRLCUgefAnd08kWyl64Ivt
IHUkUxlRFl1wIpaJbImz3XgSS/K8HmwTffxcm0Jr2yL7Xn07rd7o+gVmUqPIQpck
ORqJWEy6gMYhsB0iUT9zj7nTRHkTphqfvoGhKTWJRLrFiWKuqPmxBfyq0+urXwC2
+FmoQ/GWA3sbf3iWUEebVjmfMTWIG3rN8kkVC9ttT/cOsuplHDpTLNOnkj9Z1Bqh
X6gO6hwF4megRAGEhPjU571i9R4Ae87HpOYDUpOdpVSaNCpZrgslOPpMp8/fp+U5
2nwx3KyPNnFOXMAoTgXMPvXnhEUCD4WooEqd8rmAiGaVruLAC6yg85JqHdq/3nsc
IV8kEN9qrF7R2fmA+7ykjDuxHSZe3d1NcsRhLOQ2gtoGeiRXbhOX/IKeR9xuGSr8
O8asvqnFTMfNAHyfd5ad04YNgo9Fe/kti2jsDxTKOoQyVncGNIxM6MFbk66whkIu
lh6L63lNwl32Tbt3Ovq7ZkfSUulh0HR9D5MVquSUkD/vjgGow3fCH2+RcqHJPJo8
r5aIONmA3nkarXzGyE9X1rou+grj69d4WBmuTE6/NgLg/T5ZBgu8LKi7vrsE2vOT
rmtBuAOTo2R0QxT66e0C6t1+jail2AiQWaYbJQF7LwaSaa1UZvI=
=SjAB
-----END PGP SIGNATURE-----

--7n2pe9lU8hdBlJS7--

