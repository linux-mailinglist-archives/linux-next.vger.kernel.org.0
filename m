Return-Path: <linux-next+bounces-7873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F320B1E09A
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 04:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D4005808FC
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 02:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5180185E7F;
	Fri,  8 Aug 2025 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nBMomf/n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7169F129A78;
	Fri,  8 Aug 2025 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754619624; cv=none; b=QPRRikj99vL2cxsqJ2RHaGDvfWOBzA2DSl1xHewBsZ00LeQeP9fyLISUKde8C1JOgsrAIO1dPbTRZzJOFw03yRJSqBo5dhey7ryDOm6gxIL8N0VVttveHNktuHp8t6ehawl7VFjzSM2mU6DP5i9rEQWkQTsLGZtnr4cTTGWLlFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754619624; c=relaxed/simple;
	bh=lXpFI/ffFdpcHmBto6FwMCqY+7ACR/oazUivTVoroE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h7OntQXMAuGMfC67ZpSWDZ/mLsgoNVAbCN+gixB05NHsJuFyx8l/gzxxb4HnKpXimgb6SGjzzn1FwcqIbAnVijKd8S+ZSDEDw7dSZeo19T0gMWJmTvYVfgsMWurqYKMTXbFfz2xuECrueDzRv/CAHSsG4507tLNYDaDTZHtVfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nBMomf/n; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754619616;
	bh=3MpDAPW+ItdLitP9FsZLiKMmMSZR21m3qy431x/Ag3Q=;
	h=Date:From:To:Cc:Subject:From;
	b=nBMomf/n8dCykj5bhrvdZNgCip3J9t/KLK5/qPerOZ7B2pEm3mvqHJ3/tNA9S2pnH
	 esYBkHRb+bm6ihBj99q8I46nzOZnWFV1RBhSyMeMsGMjmzqYkEgG8r+B/QQ/66r65F
	 x5ALqJaPXm7eAWn0msZCRIg7PmDVeX6F6aj7VorPUM/uu1vMJWDweEI+tHLkj1PYMZ
	 Do+EPZN5ahQrXcF4dEMzDge1lQxyVGq4KWizZ9kcV+bQ3iOgpe9AWvwEJU5ahhdzdW
	 f3FJkEBuoZB3+/SUp+wtRU5SY1dHy2jsOlI89ul80a5Fyc6voERDGP/Q3DlIl4yOh2
	 XEk1b6U26Mvjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bynmw1wcQz4wbd;
	Fri,  8 Aug 2025 12:20:16 +1000 (AEST)
Date: Fri, 8 Aug 2025 12:20:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 arm-soc-fixes tree
Message-ID: <20250808122015.5bcf9b74@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rVsEOeK/njgez5tiE7gNRxS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rVsEOeK/njgez5tiE7gNRxS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  arch/arm/mach-s3c/gpio-samsung.c

between commit:

  3dca3d51b933 ("ARM: s3c/gpio: complete the conversion to new GPIO value s=
etters")

from the arm-soc-fixes tree and commit:

  d9d87d90cc0b ("treewide: rename GPIO set callbacks back to their original=
 names")

from the gpio-brgl tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rVsEOeK/njgez5tiE7gNRxS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiVXt8ACgkQAVBC80lX
0GySgwf/XD43Ih/TYW5mB1ihS0o7jrkJsFUtW526JtlAkBM2iLTeOxZZZLgyGGS+
35Kr/MZKfqNL6pTVc3D7wrac5z9XAME6KoDmQGKsHg651hSJt//IrpP4/9V4q5T1
QuqZouVsCWOVp3UqwDuk/VSOoCwHKZ1rqLn33m8R2bY2gNZ1zUMm2MzHFiAgaZpD
f+toMyGbyc8AerK/9+7v0kz0IoRKpR8eooTPJ+onn/V0NU6A3ohDWV3H7qAZ2d9G
n2apuet+5V/MA6Dlv1YMwpPzrIKirImjMnXE5U1U0/Vpqo6YgUfnGuC0AXXc0Bdj
ENLCnnf+UXLX5ufPZs1be3lrByxTqw==
=sLib
-----END PGP SIGNATURE-----

--Sig_/rVsEOeK/njgez5tiE7gNRxS--

