Return-Path: <linux-next+bounces-7854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E333B1ACD2
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 05:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A8F16ED85
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 03:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556FE1DF968;
	Tue,  5 Aug 2025 03:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hNMa6cLJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13601C75E2;
	Tue,  5 Aug 2025 03:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754365145; cv=none; b=EkRNvqZ+QgKVOHNWd/i8ws0Zco7ysnXVorCRlsafRmuUZu5e9sePoH5J6lr4o4vA01gFtrqtMqQue1H6WK8dx+3W7EQJOxRHCnwRn4TiUPfebZwVpP3gdRYCXXm1YoxETjSLitL1DsN/qFh1uX2Gn+Ah/pLqFdRK/kYeQSmzZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754365145; c=relaxed/simple;
	bh=b5Jg+cEcdwDUNX52KywbMLGIQAqx+HKo6toNnXcqP8A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7/5mzCBiHoS50RN9SZiGVCQg6TCajYK1T3UwfHVNgMsOIDGlNzZbTWI3ZoG76MRCSfUT575eyPcdFYU1gB8ZqRynRdfAuakxqOrY5VraM06XJA6ZAXjkRejAirjwObFanScQvInCNpEMJye2ifQmi7EnuOQGr/JrR8L7koGb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hNMa6cLJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754365141;
	bh=qSWlJviXZBBojO4F4Ny9HAuGX/qDtaMZRVlYXA3TfOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hNMa6cLJgpBD8Xc0vg9/1t+nq8hUxCZKIba9JcvpodtSbt3rwRKz4U676voMbNeQp
	 7Ms7+Tm5knDtnjEZjuJLv1zASclNLPCh7y+Hls/CHvF/Ot+6IIFrsHB0CRtl6dBAIr
	 HV6sqOvjRxgGybBiSTXIZfIILqKtnXnIb2YiiU/jER2wCy1y0ISEzpRZ/MwLsWnYQR
	 tPdha+fr10+jXhnsh0fzRYCfTI2no2sfW5YUBFtfmm4r6LUCAFn4TE7G7lO+9FuRSp
	 YLHm+YOjuq1X5aoadMU7EmQmu0i3X4fyjElUp82MCwITmeUEMisjHKmluNNEKSGmmt
	 ssKCc1m/bsDgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwzg90m5Hz4wbY;
	Tue,  5 Aug 2025 13:39:01 +1000 (AEST)
Date: Tue, 5 Aug 2025 13:39:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Message-ID: <20250805133900.336fd3d9@canb.auug.org.au>
In-Reply-To: <20250729113548.4ad9ba1c@canb.auug.org.au>
References: <20250724115409.030d0d08@canb.auug.org.au>
	<20250724100314.GW11056@google.com>
	<20250729113548.4ad9ba1c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5kyHna56rk6Dldv94.DMuWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5kyHna56rk6Dldv94.DMuWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 Jul 2025 11:35:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 24 Jul 2025 11:03:14 +0100 Lee Jones <lee@kernel.org> wrote:
> >
> > On Thu, 24 Jul 2025, Stephen Rothwell wrote:
> >  =20
> > > After merging the mfd tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:
> > >=20
> > > WARNING: unmet direct dependencies detected for MFD_AT91_USART
> > >   Depends on [n]: HAS_IOMEM [=3Dy] && (ARCH_MICROCHIP || COMPILE_TEST=
 [=3Dn])
> > >   Selected by [y]:
> > >   - SERIAL_ATMEL [=3Dy] && TTY [=3Dy] && HAS_IOMEM [=3Dy] && COMMON_C=
LK [=3Dy] && (ARCH_AT91 [=3Dy] || ARCH_LAN969X || COMPILE_TEST [=3Dn])
> > >=20
> > > Probably introduced by commit
> > >=20
> > >   ef37a1e24857 ("mfd: at91-usart: Make it selectable for ARCH_MICROCH=
IP")   =20
> >=20
> > Thanks Stephen.
> >=20
> > I have reverted this now. =20
>=20
> I am still (again?) getting this warning ...

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/5kyHna56rk6Dldv94.DMuWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiRfNQACgkQAVBC80lX
0GwWtgf+M31SjjFESDt2gNtREgPCpj7M0FmfLCr7lXMnqhb8Ct0K2uWo1iiESnjJ
dDLjLmaVGofkLldZtd2OXB9DQzqpcyOErKMfYSdrZ6bc1sCq+zN4CXYlqs2OhbBk
R1HBAjIeGIdmsF+Pp2VUrR+bDvGvw5h9oMpv97wsxSWdbVTuNg3Tf2c95p/zxGwP
QzF5xNP9KoGrueIebbAm0iOXIja5U5N1D9B+01C8d7ApXzDuO1jCzR2BOBp52Nvf
6WBi+Mut6jVJQAXH2K4LH60gDK+4UcYZ6CYGaheaP1GEcGw3tHeWxNcRHb0v2PQH
NHMuiXW/wA/suyzzXVPsNpgfjWk7ew==
=1aHI
-----END PGP SIGNATURE-----

--Sig_/5kyHna56rk6Dldv94.DMuWZ--

