Return-Path: <linux-next+bounces-6810-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5A2AB98FB
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 11:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E9651BC5B19
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79D5230D0E;
	Fri, 16 May 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EMGj1zM+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B69921171C;
	Fri, 16 May 2025 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388086; cv=none; b=uLXWREvfkbgjys59UBhMp/lb1sU/BxIW58RoizqUDISQWl/jrt/FGqlOYVwDLridA3KNZeTBvUc+PSo93q32NEYU7Lxr+g2cljOFe9SN+KzKaLSJsqAykBpTaK4hAyunp2sWfkIGDXALNJ6T6pbCPyAMSxU7e+NxVOPKkgchyPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388086; c=relaxed/simple;
	bh=wg/GPJVdLPEC+gSEBaN1lU7J1t4soGADWVLMY+y+l3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lCXtjfSKzLnEyflDr0bDe/TMdyExagfKbjEIrGSbZjDTH6HfB2KrmVp0lZa4BoN+JiKNF7J1WJE0vCQHMSNEsri5vXHsM0+hitujeFoIMXJyXzd0H5PIyfHPM1DhKnOTkF2iOYdluxOPOXQP8tEcM13kkTFJ7y8j4U6k9SkuyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EMGj1zM+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747388077;
	bh=GsZzdzXbwpNssNiYOZ+UZVg+t7owYof120Ekr6TiPAY=;
	h=Date:From:To:Cc:Subject:From;
	b=EMGj1zM+NuykO3EYKAa5D+YnQ/ceh6bjOYs4Y2xkBrRSMFf5+hhTfc8XjD8ZaYwZC
	 3qbrj/UjA/lM37RjvhliKxNY3AELDOWcROH+HN5BPFnP2J7zrdGAN7IA3+DtFRkZOw
	 648mBIEJD9BXBBfNyEYcCcMpRvrAVIZ8wNdATaIsIegyy30eVsleilrGXeUFsKvJcY
	 oYxqphxyWWS/OXMF1YJmdXtnxDruj0xWWPwmSTSfrQDWuLNmZ6xidl5bf9nm6Ebmip
	 M4wj1uQthHsLcZ1mXbXiMilFOzrw7pSYYL+17Js8TdeRia2zQsuNP99AAsSFzeaLTr
	 /mcA1GeTawiIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzMNs36yQz4wcm;
	Fri, 16 May 2025 19:34:37 +1000 (AEST)
Date: Fri, 16 May 2025 19:34:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-intel tree
Message-ID: <20250516193436.09bdf8cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//hpPeofs0fieQui==85s0z/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//hpPeofs0fieQui==85s0z/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-intel tree, today's linux-next build (htmldocs)
failed like this:

Error: Cannot open file /home/sfr/next/next/drivers/gpio/gpiolib-acpi.c

Caused by commit

  babb541af627 ("gpiolib: acpi: Move quirks to a separate file")

I have to run

make KERNELDOC=3D$(pwd)/scripts/kernel-doc.pl htmldocs

as the newer Python version dies without a useful error :-(

--=20
Cheers,
Stephen Rothwell

--Sig_//hpPeofs0fieQui==85s0z/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgnBqwACgkQAVBC80lX
0Gxriwf/a0FzFSl6cWitS6CwzVEHuenVUltpcP0G9balLbo7JWb8NU4QZfq3PEDE
TSopAtjo/k/TCI9xX6cnK55SToTHgtUsrLqlOA9BKQHCaru8pkPIaRWXbhMV5t+Q
psPbYJKRpTAThu6RWueCphFyR5attqY2UQcRIpFvYZJnFEPXUO4J/HYqd3Irhg8N
7b9YwLyN1O8EnkZicNfWiAbsZ9bgMr+T106Y/Ze9ZBTemDFFYeZvEIZqBiU2d9N4
YvFZin9S4nRpsP1Xd/2GiSw1LREhpuF03T2ty2tiVqLUigrUlFMUxycvEFzNToxG
Y1LUVQOfFxMV/3JlxzQBFZhcqmx9nQ==
=S1Pu
-----END PGP SIGNATURE-----

--Sig_//hpPeofs0fieQui==85s0z/--

