Return-Path: <linux-next+bounces-9592-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32082D06C42
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 02:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34D0330399A8
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 01:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4D521C9EA;
	Fri,  9 Jan 2026 01:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LBy5xdke"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81A4219FC;
	Fri,  9 Jan 2026 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767923177; cv=none; b=e+v2IWnif7sq4LDwSc+qF8qYKXrO/+8/Zm5WP7iPA+Pmbns1DF4xj6d3ANqyJf8ZPjaI5BhKxvA4hyK6mKO7Ms0apxmUDi49SEA7HD4B51MlRkCh3cS9yNAMPgAT4rHlgr4WjnoyN7+hiWhL4yNLwtbZ0LolBZiEWCLr77I+sFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767923177; c=relaxed/simple;
	bh=zfApJ+anwEsT0TtSdE2M5V+HGkv+VV6cdHaHOZbKHzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VZodNbr6y3sJVMEo3EkyspPgGfYo0u4tFC3OF04WymhCVM/DK54VTif9v1xA+1kv6NZhXakodyWCaaKWx9N9Zkc3+E6vwGq06kdEgzOLHmuITxBpvfek9Xk8pf1aGd417X2qRYxqfhhcIuW2z4zQYBb3obXr0Rh9mAfhiYIpdio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LBy5xdke; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767923160;
	bh=f/QRqfJWqdmBaN+ldql8Gb9vn1lKInkY1PDC7gZAaWE=;
	h=Date:From:To:Cc:Subject:From;
	b=LBy5xdkeja1oZW3U2jgmM3zL19fBJYq9LG73V5jWJRhcgH6IgSfkh04JzOdW6PrZ0
	 eDZvvNhXfvZMLQCUDz2aVADyj+8rhp6aILfkiOuHHn5/Zn6qAF4g/HnAp+jeLYmMS1
	 Pu6A+/4+5jiQ3zd+JFRBAPA3VcZzgW3572Zb5b37VDuoe9YgrNkzYfwExS4Ik4mBmb
	 3J6rjhIYScXLf/UF0/GM9+nQnArR19I5fQ2/gwq8pv7g8gYtJqlliquXSUDcIJPCn4
	 qb2I2glidN/Pd1agqMpMCL3rS1T6lsRDiCDVDenE1Xasnhviy5nZ5MXJGvbgi8tH94
	 hXmgc8za3GiJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dnPkH6jC1z4wMG;
	Fri, 09 Jan 2026 12:45:59 +1100 (AEDT)
Date: Fri, 9 Jan 2026 12:45:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20260109124558.25b0eebc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zi9qgwB=3mjcQ98k4ghuV13";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Zi9qgwB=3mjcQ98k4ghuV13
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-co=
re.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-lp5=
860-core.o
ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] =
undefined!
ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko=
] undefined!

Caused by commit

  51f7560294c9 ("leds: Add support for TI LP5860 LED driver chip")

I have used the led-lj tree from next-20160108 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zi9qgwB=3mjcQ98k4ghuV13
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlgXdcACgkQAVBC80lX
0GxKBQf/VE31mvqo/xgO/Y0KbFDzcTJo3itAEgVBi7++0SK02PwvzQwzWiQ0LvKn
mBph5jDXxP+rRx+A17B3Vve4JVHu4txE/SIREWSCTZ+3AqIv5Ok8DSFp6WDRWm1s
+OqFXdN39S/gD3AiS6p5+IidYXQVA/secugnSrE/Ih3tIb5QV+NrnvcZ0tsIMmDo
D26wcsbhVgnN9DiPldpJ2pZ9/BaCk1gz6IuJrfGKgXOw+apLEEtkZAzMKVL4e32Y
0X9NJ34v17By8uvxXoZojAzNM/y1DnBFF6Tc6YhE/zbUwBE86Eb5ItPXIaW58tbz
Lj+8WEvFJ92FSSl3mz49kgH3DwvaWA==
=NST2
-----END PGP SIGNATURE-----

--Sig_/Zi9qgwB=3mjcQ98k4ghuV13--

