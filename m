Return-Path: <linux-next+bounces-3782-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151CC976391
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 09:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8521FB21DE2
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 07:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F3E18E34A;
	Thu, 12 Sep 2024 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EqcnRPnw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97A1552E1;
	Thu, 12 Sep 2024 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127707; cv=none; b=R3Q3Wu5qkCBG10JCzcalxKIdGEB43RH7uXiHxRVhr3N9oZFKrZdusuMRS49puO4X/khUFpDE8/Ifwu7TOS3nZclvOA8HXY34envH+e8so6U1uR5JcspsIme57sbdGNGs1jRki1Zu520F3iFrrLpORONhGHCu0IOY9N+VKol5CoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127707; c=relaxed/simple;
	bh=d4ZjZcDFs0o4PEWxZ+LOmu7N2ldJb3avJf/pClXKkhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VhGJUAMGzTPgkddzuc74EDWHbNj0WZBJtWMB8AMOl3ClwS92YSjo5Jcmg5CzkysWyAAQ5dRZUsnqhUfprVLyJIHIVgofJFKvgjD41BWi+YsHqX59wBYf1YyI5QOxj3PZ8PQZhmAtU54UaovfZSGjOx9CERaZjLo2Li3dEMTju3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EqcnRPnw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726127702;
	bh=zjHxZVqZOWcrDP7grFwYDsOpfB2qzj9ymqd2+By9LYM=;
	h=Date:From:To:Cc:Subject:From;
	b=EqcnRPnwQtXzM2GNxRAMHnrmlVeTU7KwD//eBGbmLFc3+mXOqr1q5Z6lx80T6RJNG
	 LGAMYecahAo/EWB4XuC/QfvFXP7LzhDnB2bMb/ipe0ngDWlvwNYuh0MdONRAsaJwFV
	 Omqg4mq5fF1T/JlmUYd2K2tIQQN/36LVZdqyk1Aik51t4ASLPBjbb180gRwBzdUqvB
	 MHETTrOZ+U69lSpxlMcrHOcbfdiSLJd8GjlVnUu5cKG43NkhHMY8BXjzc2zbJLbApR
	 FXHYLgrQyEFMRfK6nvm0soWZ6Z+UjFjD9UIgh8sR93jB0BBsnP+3OVKqBsbyK4/QLD
	 Jl4FIBcmfeHaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X48qV1yjxz4x0K;
	Thu, 12 Sep 2024 17:55:02 +1000 (AEST)
Date: Thu, 12 Sep 2024 17:55:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: linux-next: manual merge of the pinctrl tree with the arm-soc tree
Message-ID: <20240912175501.02f057f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K36+epsehf746sxFjfPckvw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K36+epsehf746sxFjfPckvw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  drivers/pinctrl/Makefile

between commit:

  d1661439f5a3 ("pinctrl: add a Cirrus ep93xx SoC pin controller")

from the arm-soc tree and commit:

  41795aa1f56a ("pinctrl: eyeq5: add platform driver")

from the pinctrl tree.

I fixed it up (see below - I also sorted the entries) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pinctrl/Makefile
index f28602d95424,3c2355150961..000000000000
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@@ -22,8 -22,8 +22,9 @@@ obj-$(CONFIG_PINCTRL_CY8C95X0)	+=3D pinct
  obj-$(CONFIG_PINCTRL_DA850_PUPD) +=3D pinctrl-da850-pupd.o
  obj-$(CONFIG_PINCTRL_DA9062)	+=3D pinctrl-da9062.o
  obj-$(CONFIG_PINCTRL_DIGICOLOR)	+=3D pinctrl-digicolor.o
- obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   +=3D pinctrl-equilibrium.o
 +obj-$(CONFIG_PINCTRL_EP93XX)	+=3D pinctrl-ep93xx.o
+ obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   +=3D pinctrl-equilibrium.o
+ obj-$(CONFIG_PINCTRL_EYEQ5)	+=3D pinctrl-eyeq5.o
  obj-$(CONFIG_PINCTRL_GEMINI)	+=3D pinctrl-gemini.o
  obj-$(CONFIG_PINCTRL_INGENIC)	+=3D pinctrl-ingenic.o
  obj-$(CONFIG_PINCTRL_K210)	+=3D pinctrl-k210.o

--Sig_/K36+epsehf746sxFjfPckvw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbinlUACgkQAVBC80lX
0GwM+Qf8DOwYvL1rRBx7zF1ulYtg55kInxm3Yn6PMerpJWND0bHM5xVdYVsFi0+c
0gT3yqoFlIc8PJ1x6WQGNMZjV4hn/ewxFxZQVUMguyxv4pFYRVopEsd9440jGWDf
oqxRLnGN1eee0QGj+3Jebi5eHt1QjL+1RZ6nC0/OeUgjUfPqJMfU+toiSNcrcAro
LCtgkw/5QXQewF0L9ZMbuRDxjtPXWm39TzhNiBFcc9V6se34XNhX7IoUWs3J6ScH
6irJ86yKqZnho/zvWzD+fDS7wHTWuspmmwQQw1e9xbDkg2M74BFq0MRzptdTVfVi
Fd8GcSt8l4lN/0N1Ouv9TYxtRq80vQ==
=I6bg
-----END PGP SIGNATURE-----

--Sig_/K36+epsehf746sxFjfPckvw--

