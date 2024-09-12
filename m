Return-Path: <linux-next+bounces-3788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B911976728
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 13:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79C21F21D7C
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 11:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFD919F42B;
	Thu, 12 Sep 2024 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K35sx3Vh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9019F419;
	Thu, 12 Sep 2024 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726139269; cv=none; b=Ld5X3jUh+MUzQznc+4DsqJfSctOt/SzTEZPDKzUfNcfRehlCha3pv7qDNzZgYn+UwKf/oLwVgQ7k2EofLQSE46YSY245DYMDIRFQSCXkXvQ8YsZXBR2eZTcTVEQT9xtx4T5RdbeAkPY8gZVvulqZz/i2q/Hs3MaRfK6/Fp4sWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726139269; c=relaxed/simple;
	bh=uMm9K7FkVN1zTJRgHFB2LpcT5ciApExr305UqIDfoeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BopiBtOTJcsp4o/4FPQVHNNjRof+dJIlbUwTI8vAjSs5fZdJFpC37vMgae5F4D0lT6+yXA6O3VOEHPzXVYpQLe2sczPoApAP0FPEe+DwwXU0po96kZc6LG8CHvvbFZTIsSGk6ImNYqDJs/+JEqb/ZNnJnAsBeWgplJoIQYXN+Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K35sx3Vh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCB2C4CEC3;
	Thu, 12 Sep 2024 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726139268;
	bh=uMm9K7FkVN1zTJRgHFB2LpcT5ciApExr305UqIDfoeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K35sx3VhAxnmgoLQ9ASSfjJqUAByGUwyIzCNVhWoXQC9kq5Lt0EPUN7lFoYsziIRG
	 o+XH3xHPw6nFHDFfRsgdLX+gwnEAcs1iiT38fspnA4uZf5r2a3IZMD4lDcZts02mfA
	 izha8gxRhSRT3zMDUUgZoE1WaCMdkr+XdGUqPjw8Z6BCZVaLDSz1jgO+26fn4RcogR
	 QxUmLObAd34ywFaxCQ1OfQh2xl63igMT+scOkWBjxlfjZBbx0CZFiTLup5dih61nGJ
	 rUToUVvC3q98TbHUrbdPVNV1CNn3c2GUMgZJ1iBHBFI28r1P0xgz3oeA6ODQzZ1V8w
	 iXoNSYmddgqMw==
Date: Thu, 12 Sep 2024 12:07:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the sound-asoc tree
Message-ID: <6e5c1a20-2232-4a2d-9a0c-181d50a99ecb@sirena.org.uk>
References: <20240912144459.634e3e09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmUFAmnyecOFyjcw"
Content-Disposition: inline
In-Reply-To: <20240912144459.634e3e09@canb.auug.org.au>
X-Cookie: Happiness is the greatest good.


--kmUFAmnyecOFyjcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 02:44:59PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
>=20
>   7817eb1ad353 ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
>=20
> This is commit
>=20
>   cf700e558e1d ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
>=20
> from the arm-soc tree.

I wonder how that ended up in the arm-soc tree...  anyway, shouldn't
matter if it's the same.

--kmUFAmnyecOFyjcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbiy38ACgkQJNaLcl1U
h9B0sgf+P5aqeVy32Ar5U1dadRG1BDaht8bj9KjfmDeArJn74H/mpg0LSiYpnrVN
EQN+tpKXXqD3IKqZcgRm1c/wvXT3DVyLIdnqN65fz7+iuZHraKheWP7rrHhGlHOy
OraOrYkWiwyEnJNSENAPaoSDwIze3y3F015KzHFUzTAgjSy36xiaZOUkyIoFqs3D
1xXNqlY8OmOnnuUnPr7MM7XQq10XtZespIHQVLKJKv5QGe3FTpXibQd2B+AwM9lU
n/fYhJBLGpEelb1S8aB6Q+DeZZt/APmVWDECysh2cShpDi9gW1176/ft+0xOy454
VCTrZNzukQ8ybm9baGJ3rNavUkHIkw==
=mPZh
-----END PGP SIGNATURE-----

--kmUFAmnyecOFyjcw--

