Return-Path: <linux-next+bounces-4847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5B9D9630
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2024 12:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD383281604
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2024 11:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362B4139D07;
	Tue, 26 Nov 2024 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqUCm+4T"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE431CDA04;
	Tue, 26 Nov 2024 11:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732620241; cv=none; b=kS/bRAJFdgvCEwAly+TftP6FfkOqwGHNfyXa99Od7oEgzDitrF/qhe0+u4dICocrFk0YYn7eeGOxmNz/GtroWEl+5gzhWX2lcxqzp7/ag8isavmOUUUxLoiRhTNUmlXiyEjB11b9pVNwoDRdSDjkGBjrm8dTO3pQeSjHlOfUyjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732620241; c=relaxed/simple;
	bh=NG4Fme6WrdHPchD+F/QXIvlANZyM9NXZWA8t1UaOAjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9BjAw+nLoMha87OAtzCA0+8ofvTKp1WyvAKBDJm1koDGUhutJEVe9gomvktePHKDv88wUjSF35ZuXgm38Of6i/I8E38xUTW9Ld2KFnZ/tm1zyMdGV+cwVPLyrZldmJQvD8XfGv7kf2eKWhVmO9Chv8hKLUUmJ/m5LjFJqjxePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqUCm+4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C86C4CECF;
	Tue, 26 Nov 2024 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732620240;
	bh=NG4Fme6WrdHPchD+F/QXIvlANZyM9NXZWA8t1UaOAjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqUCm+4TlH64jqWW5iqtpjIKF6HqNuNXURbfKBPEFWd0GeoiyhBmzeMFPJ3WJCqfm
	 B2jhXn8lwWKIr1IYxZjm39YgpH2TD0nI9zc5hXbKqeVuvf56Biom9dKfoXAuNJdguO
	 H1VTclMj6cUZVmF/qWBatZDctcNcHQDmZPVb3UoQR6iuMPYLOGDdDy4xtGhI9koDJn
	 zSrl8MAf10hjsaEGyeJNkUiRjti5hOhkgrpxTcTg7c/3Vpd/Srwm0695dCUFSerEJw
	 idUrdZSheUUuZu6w6gK4h+oxtVuol8+1Y7kLz+hut0dE3kHeCrIQEPFCeQzTfG0nC7
	 vIB+2qwAI4Gkw==
Date: Tue, 26 Nov 2024 11:23:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the spi-fixes
 tree
Message-ID: <eead71a4-c3a4-4a93-b784-db0f2d9df680@sirena.org.uk>
References: <20241126074525.6131a32b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8sc0u67vun+wZ30s"
Content-Disposition: inline
In-Reply-To: <20241126074525.6131a32b@canb.auug.org.au>
X-Cookie: Have a taco.


--8sc0u67vun+wZ30s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 07:45:25AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   1c6f3eb4f394 ("spi: atmel-quadspi: Fix register name in verbose logging=
 function")
>=20
> is missing a Signed-off-by from its author.

That's a git bug, the mail had a signoff but git corrupted it on the way
in.

--8sc0u67vun+wZ30s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdFr8wACgkQJNaLcl1U
h9BT8Qf8Ct55RTan5X6waWSVWAaA/8uwrUESUzrG/L+Zg8Jpsv3M7DkRs6WMpII2
fKuOLzT0KqM6PxEm05uQnzXUTl57WQQ23yec8XRTXhlTApKFL/XPS9MJZBWU2xDW
rH/n9OPAgO2VMYlbAD+dFM++VcrLOuHnLo9JGQ9+YKPvCixtaoRjusswpcnB+DgI
Oxs0+pgXL8aA95xPAsFSDu2bA7yPi7QLMkzMO0a3oRkHrZtlBT8VTXQG7/niurdJ
4TIKa5nrNvQJ7D9OD09TW6tpEXkmVGaX8Xh5lGSzqecgpWUTGN1T9Cm92VfSlRaU
VrjyiyLOcY7D8Z6b6ZJ5+fdQnyo5yQ==
=kvMg
-----END PGP SIGNATURE-----

--8sc0u67vun+wZ30s--

