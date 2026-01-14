Return-Path: <linux-next+bounces-9657-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE28D1CC2E
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 08:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00CD83003F66
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 07:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9B6322B84;
	Wed, 14 Jan 2026 07:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TW26+zYn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE8352C25
	for <linux-next@vger.kernel.org>; Wed, 14 Jan 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374235; cv=none; b=QL3HlRJi8mfIoiGKHsV20HPltxWXPyipKVJ9s5gr2gNaDrlCAOB9C3HJsz/k5a9uqCpOKHlcZJovcR8BsYjZvuWa0HXH+eG9W/AiVU2YoyDqg7a0RjVs8L3uOcwiRla4TLAfP2KCfBPGX0lybynnVqbwjwJPT9/ZqHqjbeecn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374235; c=relaxed/simple;
	bh=GJD0MgvUUq31GaDowtDSxMlCwhKGo7bY29Yinnc1pO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn/te9WG8tlWU/s6pZg08nDMOC5Yig+WyMEoNqobOcfjbuRBylZWv+6eqBaf9uM5RgZy6XRVl92SBWRClrfv0CyL3hXEnrWty1l+ze5oHnNhFRQqEdVoZfBRbKUcEGZC3U0f8u1fdya9Lt3POLfkBrB1uYqxsr70BwN4kIftFdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TW26+zYn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RRsh
	gWN5hv3lRddUcZ9sjAIMFX94tB6W2sWmqJFUMhs=; b=TW26+zYngBKsrn0KkZCj
	3i95RUc5BQ7iELmH/1JS1hX4j6WAFWXMAIhj5PlfgO1FXnWwOCoMiHYya7F4VVFH
	S8+TInQrzwTo+qjVHgKjhql/twj2CmHWwb7eNPMLGN6d4fvBURcPHezGsuNS5yft
	B3Xov3KVBPeG1qTcucEt+oPxMGLaOIaAa++qzh3BzYE6mLtA1Q28WLCXKNiq1LDk
	1uEShGpU45FseCdpceHUcSkBstMNuI6/QZlBK+4cxSRhHdSdSbTZ3USOYa8VjOxy
	O+75pqdkTk4Uz8MSRQj6qRfSc5w8c1KTe2LqYQ3AkoRwJtz9IJpnF9lEBJ1A2gOQ
	Ag==
Received: (qmail 2021435 invoked from network); 14 Jan 2026 08:03:45 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 08:03:45 +0100
X-UD-Smtp-Session: l3s3148p1@kFeKtVNIkoEujnsM
Date: Wed, 14 Jan 2026 08:03:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the i2c-host tree
Message-ID: <aWc_0VWJPi1cUOTM@ninjato>
References: <20260114124328.2a986593@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lNZePlxd4UllSh9x"
Content-Disposition: inline
In-Reply-To: <20260114124328.2a986593@canb.auug.org.au>


--lNZePlxd4UllSh9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This is commit
>=20
>   4fc8450a3495 ("dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i=
2c")
>=20
> in the i2c tree.

Sorry, my fault, I overlooked them in Andi's tree. Dropped it now.


--lNZePlxd4UllSh9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlnP9EACgkQFA3kzBSg
KbZC2xAAh/zCP7sxUO0G+9uLgA7AfSpQL/mkG9nGqMEszmnqnyedrrXRB7PZOGDV
PHfokIDttnU2FM0g579z5PK+/xs2jwYLufR0MzI26yMaFx3IbLzrjD2TicPhzx5Y
oMjmF9d0w50EcUWs7XLNeODmSMfhFPhTPbGPSoKPAxj1c1/VPkfDi40IsQ9S3pb9
LgeI0m7init0HHLaIz5fpngqN9gwpkn5/h1LzMKqZz8L01LUxhA9YJAB8DjB2YVh
MVCMGiWcUyApp10gb7a3trftM+qtaV02UVMJJR8qsk24Ey6z3aKhA7gUAJKdc2ZW
BbzaIzzt1zh6duSx1dzGSSEQXcpzmZlvYqQ67xipQcxs11EvFLz546BTeogV5ijx
L66Fyx3SAMMQGdsoMMJSlEVhDRGvCOHzMvh3L8p2q0So0WiqPQxmPXCLUs0TEcnQ
fFANdpmQPOhv/tqxbl9U7Cz9Jl2ahditEekmRnAz2Guba6eUCFddsX0IC/TfxVPO
ML24+7egLuN0n9St52cdvnoVJt2mblWzYACWQMWWoTLjVn6OLy0dSGNnPXfxOIkb
rHmiFSvBcS3UrTHV+SHmokCSidVTTzTP5AWpoFJWprtfumUCUcepeZi/g1vx3p33
grMifyl6KAlcwBBo3YjsddgMvT1DNWFM1CFo61Mm2e6EC7JMqgg=
=s4jb
-----END PGP SIGNATURE-----

--lNZePlxd4UllSh9x--

