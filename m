Return-Path: <linux-next+bounces-7906-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 177E0B21B3C
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 05:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF196216C6
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 03:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C2E19E83C;
	Tue, 12 Aug 2025 03:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MIJLHOit"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61371946DF;
	Tue, 12 Aug 2025 03:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967697; cv=none; b=Miv/vfGJAEFu/h11Hs9UYEw36iiBt5DDT0X8PE9z4JxSnwL7ilX+1yjqa8w+SAPQUQ0ss5hkajVtxiG00v+QGxL0FYuffOsKg8gCpFNVNfSS3jtOVG4j4npV6GA4PcDUC2X+WtLa/I2Si6a0cVGeoiu5cyD6I5FcItddonQdSpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967697; c=relaxed/simple;
	bh=DU1zdGbeQJ/d5cgbUObAYxms8t9eChfcU6gQ6uHUDtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tkB4HQc9VgVv/BcHPL3YCNBAIo1QC6e3xYeHaB+Dj1NHZBLhoytaWFNbVWiV0zxQiuMNq7df0akhJsL9WKA5qtuT/wmyraDubLtJEgT2KeSvdwsdYs57CNZUWF7YLYNVYXQDPxEa7g/tIZcbcRPg/oyiVjk9l7qNMTAyUv6SnhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MIJLHOit; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754967685;
	bh=UbyDXgVR2fBm66dYP6vu8P9kH6wcxaDF0cudUM+pQ+k=;
	h=Date:From:To:Cc:Subject:From;
	b=MIJLHOitylZrQ70XHjxdlgkrz4W3B60D3mJEOq7FJgxb0An3plmPESdaLTXMzI5hK
	 4VGoDPkSnpWMUlh0M8dHbofvP5OCG0EsWB/1ecePmzGk1CxNxMACfAu+5UTwqy4Me6
	 zMAbRAiagdzjJLWXslfECe2Cd1vESPz5UNBKMD0O7vTY5m01BKIalbFeo0sBDAUE+Y
	 3gueYMF71PQdfNZOs1mmLsMG4ZOB9Vpo6OtMvxlfBtW5PXw3wG448pRqDx5r4DIjzY
	 RuGUbiX38DdfaM9YEw0qL15CnIzLlXdj72/Cztv5Jlw3Vnw1XOLAtlnBpHtdlGA1Iz
	 WOwNQRtt1ZOJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1GVY2CpXz4xf5;
	Tue, 12 Aug 2025 13:01:25 +1000 (AEST)
Date: Tue, 12 Aug 2025 13:01:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge the pwm tree with Linus' tree
Message-ID: <20250812130029.2a06ca7c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VVTRkzdJ.FEivUpY5uX07oo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VVTRkzdJ.FEivUpY5uX07oo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pwm/core.c: In function '__pwmchip_add':
drivers/pwm/core.c:2514:26: error: 'struct gpio_chip' has no member named '=
set_rv'
 2514 |                         .set_rv =3D pwm_gpio_set,
      |                          ^~~~~~
drivers/pwm/core.c:2514:35: error: initialization of 'int (*)(struct gpio_c=
hip *, unsigned int)' from incompatible pointer type 'int (*)(struct gpio_c=
hip *, unsigned int,  int)' [-Wincompatible-pointer-types]
 2514 |                         .set_rv =3D pwm_gpio_set,
      |                                   ^~~~~~~~~~~~
drivers/pwm/core.c:2514:35: note: (near initialization for '(anonymous).dir=
ection_input')

Caused by commit

  1c84bb7fc0ad ("pwm: Provide a gpio device for waveform drivers")

interacting with commit

  d9d87d90cc0b ("treewide: rename GPIO set callbacks back to their original=
 names")

from Linus' tree.

I have applied this merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Aug 2025 12:38:34 +1000
Subject: [PATCH] fix up for "pwm: Provide a gpio device for waveform driver=
s"

interacting with commit

  d9d87d90cc0b ("treewide: rename GPIO set callbacks back to their original=
 names")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pwm/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index b05186b9569e..ec4112e6209a 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -2511,7 +2511,7 @@ int __pwmchip_add(struct pwm_chip *chip, struct modul=
e *owner)
 			.request =3D pwm_gpio_request,
 			.free =3D pwm_gpio_free,
 			.get_direction =3D pwm_gpio_get_direction,
-			.set_rv =3D pwm_gpio_set,
+			.set =3D pwm_gpio_set,
 			.base =3D -1,
 			.ngpio =3D chip->npwm,
 			.can_sleep =3D true,
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/VVTRkzdJ.FEivUpY5uX07oo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiarncACgkQAVBC80lX
0GwKpgf9HBoKEGhuO1OaTDPUrjJ4rxdFIj8XcwvOWIfDHv4qH71CUOgV0tFKk3n0
RAJHBCbwWlGO8PDrboacVgpLtqTbGneDXzVtQzdEYVA+2bV2j+kMX24JcZJdRm69
5GxlMpCYv6xnuqJcsDmT3fjRamlc9WGL6J2qrS6/haWTNERt7m6HQ+6JuAk9QW9n
LomyxK6sGK/QqV9xcvBg7E2XBXdcDRue7nm1lxuoPSGe37bPtX7c4spXhPAJRytw
rVnnryIsvksVvy40G0JZfcWqQOgGha1YAtkJyNV//C/IY066BzyLqazNXuKr2YRc
QBT66gnMfocUq4VVKa8YQ1eLbWgL2w==
=xqOR
-----END PGP SIGNATURE-----

--Sig_/VVTRkzdJ.FEivUpY5uX07oo--

