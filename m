Return-Path: <linux-next+bounces-9238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6D1C8CA51
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 03:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ABC2B4E1E47
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 02:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D14246333;
	Thu, 27 Nov 2025 02:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hC1PtJYN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21B6243958;
	Thu, 27 Nov 2025 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209670; cv=none; b=K/qQBuHX9dieYxitWTo0pHm+rhoTUEH3fua7Xh1k/tzeLoxAh5r51q+yY5Hv2RI/WPUIhW57zRG9irUJfFoMEoit45D/QKcwEKd6QOB5Uwm98w9hhE/MnppqrZyJHT1PuzRM3CWntWeSQpqzFwjOWq3N58i4RYGs+T4H2yMFEng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209670; c=relaxed/simple;
	bh=EHXBG7kw5A/wL3sTJh84hEhrCNoR87eg3tGJ6+c/hkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WisshFdrphMnGqeXGEkBcyK4RBtbdTA24j/0O0RG0Ycu7TbI8l7gLdqZzM/g16tB/i4nW+Q3ElLY/JRwnX3g/mYW41TmRXVhJAafeNf8Yit+VXvQq6le/ufjtJGL7kNIYcZeVK8+An4W5m7F0wvQ23/QFZ4+NnioWpqdVOnbHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hC1PtJYN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764209666;
	bh=jPMAa5qQaGH2eKLMsGCIXGyNRGhCGXLdXY66b8DS3/s=;
	h=Date:From:To:Cc:Subject:From;
	b=hC1PtJYN7WXjm9ZyXBSAVvrA78tmgMwm2bYYn9EjjzwRt5S6jmWhCQyjjE0c1Pkgb
	 uOG4VL4RSTouqeJuXaG4T8h8zDCZE1353EJxYJU1bPbIniFFffl7+PufatZxKJAM2y
	 hbQjQC3zaR0YFtKnwd8UlUPk2SlLmW3IJynivZapCOj1tbN1l9eqho9hIUyuzDMZ5I
	 Sek8A4II5Y0wuOM3/0KYuOD9d+KpjYWyeBpifJCQ7UTm2lMRSGC0My53JvV9NaPESu
	 1q3FmiE1f9FxloPKfCMoGIql4RHMlhjw8aZHpyZrelDIdngjHwCHds8Xc9xEPndmsF
	 l7b9/WraEaY/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dH0Ny0Ds5z4w1j;
	Thu, 27 Nov 2025 13:14:26 +1100 (AEDT)
Date: Thu, 27 Nov 2025 13:14:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20251127131425.4b5b6644@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dHjDQbzcGyBvajn9aAxXyig";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dHjDQbzcGyBvajn9aAxXyig
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/uapi/linux/media/amlogic/c3-isp-config.h:199 #define c3_is=
p_params_block_header v4l2_isp_params_block_header; error: Cannot parse str=
uct or union!

Introduced by commit

  45662082855c ("media: uapi: Convert Amlogic C3 to V4L2 extensible params")

--=20
Cheers,
Stephen Rothwell

--Sig_/dHjDQbzcGyBvajn9aAxXyig
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkntAEACgkQAVBC80lX
0GzMqgf+P66rh1e5JC9IVegh95RHCvCKJXj7u2MDFI6U2iVhQthjp/NY+923dLzw
qkNtM6HT9Sjeq1Kiu6sr8HyL1bie58emts/roKMP7sDCJb/NGzaXNJyR08XUvcDG
FQxJwIe08vbHCSrgQG0tU8S+e8QUvDuaSSi4hQ88ZDkxImvEORidjrnoXsiXOkGZ
GlrXz1SwmlzPg+yg08Eykx2X5Ir7ZfsaokVEVbkN08f7Ix4kVB1mF3Q5TC0lbmdW
2U12I3Gy/CSgVx7vqKPEF/bjhedT+w+xnJ7xfx6+wg9BcdM/+dOv/l/oO1un1buF
DbSVwKheFEcj8Alx4Ou+8lYHYKAM8g==
=64R7
-----END PGP SIGNATURE-----

--Sig_/dHjDQbzcGyBvajn9aAxXyig--

