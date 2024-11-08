Return-Path: <linux-next+bounces-4702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CE9C1693
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 07:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CB05B233D0
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 06:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C581CF7B1;
	Fri,  8 Nov 2024 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BZgrPTJ9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714011CF5F4;
	Fri,  8 Nov 2024 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731048438; cv=none; b=dVt5Vz9CdGhWNC29YvZzzlQwk590SwwnQ38ZP078rkelnwrMdiE/5cE2Wfi6klStNh6xYHObYw7wnnuD+gDW53oZhEP6nx/+E7kyJc2oj1zfx3TtNJDnHA4WUWfjBVR0v/7F7CJmP9ejRCjHQ2bJN/3fvm2tCC9VpFRQsrDN/XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731048438; c=relaxed/simple;
	bh=5ZS+JsiII+2DlvXp828/B1DEFuNBmONBNG45jnM7gMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bnTwRieTyDQJW0jaBVm+m6nYIhPl/AtKsSwtXaeskqNRBaXBX8og0lDD2rThsJzhZCPeOao7Pak2cULAx37JjsTBHT0nt5xmQn4TK9yOlJE/GQqzvXlrwHwCrAsCVtbLc0NZIo0+9mpbmH3g/CmOt1urrx4KsTtalUTeMmNdPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BZgrPTJ9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731048426;
	bh=yNeOaUh/VXhLEhx1euOqJoZDr4xeJ4uKpsMh2qP/g0I=;
	h=Date:From:To:Cc:Subject:From;
	b=BZgrPTJ9ApEpsCwnTEDIGO+dHaCwG9SAuYBc+GZD7lKcZS5bX1AKsguy0K47o5/J1
	 c+La3GkqU4xt5vGFoebZmGkk+ghSb0NoX5ru8JyN6GZD15xS1CWTMC+AayNj+Z+9sa
	 bAKVGDHrBwQVmRqti6ECH4BNTteIaPXVEc9Z1imRkbeXbVr2W796MfoneFS9KR2uIr
	 hbzF/DXO3wn0h42nu9fpRpj2/3SkIsvYMlM3b9bLRztOpvw5mxzxzU1Qu6HblmS13D
	 tmhyxdhKQrz+NPSBBrduwqPCT3uJ7Xu29o5BbY7hwvgtDgHX6ReIBlmvfnUQMJJmzQ
	 q8Nao0cLgTNbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xl8cn2PPrz4wy9;
	Fri,  8 Nov 2024 17:47:05 +1100 (AEDT)
Date: Fri, 8 Nov 2024 17:47:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20241108174706.595bc36c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s3k2Iql7I9OJG+c/8OvVH/f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s3k2Iql7I9OJG+c/8OvVH/f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: unmet direct dependencies detected for SND_SOC_ACPI_INTEL_MATCH
  Depends on [n]: SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=3Dy] && (SND_SOC_=
INTEL_SST_TOPLEVEL [=3Dy] || SND_SOC_SOF_INTEL_TOPLEVEL [=3Dy]) && ACPI
  Selected by [y]:
  - SND_SOC_SOF_INTEL_COMMON [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SO=
C [=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_INTEL_TOPLEVEL [=3Dy]

Possibly introduced by commit

  b6bd3f3b6357 ("ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend=
 on ACPI")

--=20
Cheers,
Stephen Rothwell

--Sig_/s3k2Iql7I9OJG+c/8OvVH/f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcts+oACgkQAVBC80lX
0Gx3EAf8D+jFam25jZnPmVzqFt54BChfGeIASTBrY7Cai1eWbvR08sdknV8Wq/IB
lo7FETehOwF4BuqCdTzc63Ae2i1+6GtThhpNbfPCn/umeCvj6tt8pAyvNA2weE4r
LUeju/ISQnJwcg6T7bL1n8CKFGb4CoV7GFJlMxzHiQfy5QR3xKaA/UXN2MfQCMTk
xOza0Uesv5kwuhip+KWOSZi0PI1qv06grFp2GkMuV5r5u39TB/2ipoEsq8JC+e1T
dTPGqgaPYB6AzNT/DoIf8wt96JnaxwcwDJorSeGtm1XJVUNQFmflpw27qZbhpWvi
7Vx+HItu/hHONNeCYXUZXz2P4A3Icg==
=OobU
-----END PGP SIGNATURE-----

--Sig_/s3k2Iql7I9OJG+c/8OvVH/f--

