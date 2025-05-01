Return-Path: <linux-next+bounces-6494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2EAA6669
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 00:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED221BC50D5
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 22:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCADC253351;
	Thu,  1 May 2025 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kM7YWd1j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B5419F12D;
	Thu,  1 May 2025 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140020; cv=none; b=bXDnW1AxXI5kwODRcPeEpk5iSLLXSAarvPnMeQSv9kH8ew2GvFo4rz3t/7M8tGSPkE+bElmNyGaLif+dsi4CufNBxTSLSObhvb8OcdrIFtYhtorOzpZh/NDsAhRTNG7hfDizGJx7LlJkCK0N4R4BK3220utxoLI4pXEcLwndy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140020; c=relaxed/simple;
	bh=LzpyyA9nvJ9KfgxcnFn2gIppzdEF/Hh1NEPWOMyIHEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aelyaTKYWKs3xOTLCO/2aCKTEJJ+HWJlrxLLqUr/URZQ4nqiQstW9Nl6SOUdaHWeNOv0MTDXY/wTefioL/BddxLyDyYn65QKi3Bq71GItcRfikfudvS7cBtRBw67mya3b63Osvv/3J4daTSeK3O3o1T2PGlq9l7cPIzuMJuLSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kM7YWd1j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746140013;
	bh=yKt6ttpV4oy7zty/L39csJcuo6k1Taa5k2LUEtFks4o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kM7YWd1jykwTAE8+F/+uAm/u95etcv+QRtTXxcEvipYIo0KpyC5+KHAqyFtCEHvs9
	 GxGP1LJdKHTFWP9plZSwryASW+nkYqy8qrL9+ugvJ/231Hqr0md2C6CVk/XUVhYIn7
	 WVNtdDF5UeJ1OlHFk4kZWrg/VJrhzJD8o3C5Ld2BydpyHBFZupiZDpun2nUdmSoWc5
	 GdS29Y1ctPU+nM4UnI0jrXU9jz6BAoc78RK9WDcwKyBx4ROHgCS2YLpJvQeK9mDIED
	 wYuJJC83xfb+YN1i2BZnm92AbIU2xByI+oMsUdqyy5fLg+PSJRwbEB+0Wg5Kue382h
	 uu7rSdUgVekOA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZpTqb5pmlz4x2g;
	Fri,  2 May 2025 08:53:29 +1000 (AEST)
Date: Fri, 2 May 2025 08:53:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <skhan@linuxfoundation.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: linux-next: Addition of the nolibc tree
Message-ID: <20250502085327.2e5be3f8@canb.auug.org.au>
In-Reply-To: <6d906909-99ae-4934-901b-983ad7d3cbda@t-8ch.de>
References: <6d906909-99ae-4934-901b-983ad7d3cbda@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eJNUadBoRgNz=uMn8j/5u4=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eJNUadBoRgNz=uMn8j/5u4=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, 1 May 2025 18:30:14 +0200 Thomas Wei=C3=9Fschuh <linux@weissschuh.n=
et> wrote:
>
> Hi Stephen,
>=20
> could you add the nolibc tree to linux-next?
> git://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git#for=
-next
>=20
> It replaces the nolibc tree from Shuah.
> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git#n=
olibc

Done from today.  I have kept the same contacts.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/eJNUadBoRgNz=uMn8j/5u4=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgT+2cACgkQAVBC80lX
0Gy5iQgAkYtioycNfPW/4x6p8PCtefFSjMMykJXpZt5M+kBkvoEJ0HjpBDRhHjo5
bszbMFnOC9mo6YNJb3Gwid4FdHSryiKBfN6vt/OGKPKgj8Fu9fj8Tts7/hsyvKSu
UdLUU4X7eLtofTdcaYwEUkJ8QnjEUzWZ9hUHqmFygGF7iTA9BskTnnIx/HzMJWmC
3pjTVB5KT4qtNLcCsjypapr9Vke1SkhT0A66QyEiWoOO6sRSRiTp3iJJ5R/MLH2a
7yjZ9DsNF7DrjSlhWHGc3D4c1kna6xf0xEcOsiMXhRju9Xq7zlZgVtg17IEMtCmB
sD0mru5+t4QqL1jdTdoLOJChjAfGRg==
=EWzO
-----END PGP SIGNATURE-----

--Sig_/eJNUadBoRgNz=uMn8j/5u4=--

