Return-Path: <linux-next+bounces-6453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93680AA4458
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 09:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FCB39A7DDE
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 07:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581B920C472;
	Wed, 30 Apr 2025 07:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="flTpqSnR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73851D88D0;
	Wed, 30 Apr 2025 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999406; cv=none; b=QeIkG4S2Rdf6YzUIeJ/+H7FjMwhgxNUWcuCA1G9x43Rh1Q+PdrstqbXmKFGiyzD15OnyX/dSiCY/ELJ2be0Sm7RQw+fiCBWEHI01ToS75NxfJKCD6yFor9+yRRg3mYOlVF35YtqN2/tNo2qUYHMHkzjyPDNKPJYj+HrAJkvPPgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999406; c=relaxed/simple;
	bh=Dz4WM6B1OzDPxCzZZBeNoIWiDhlSQjhLkcy42dRUDvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CppnQMGVSlVF9S50YpHaSBRLp97ylHnqscAAdZrgpgiXd4AS/MfmlFzoyNylZcDyfI/W/bmyV+KbPD0oCd2frV63Q+iWoS6PIBIZOefDOm43P5a6sNY6LcUepxzjW2qV5eAeJCeftnrOVx44BCpWelVoceEAn7zEPE5BgCdTGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=flTpqSnR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745999402;
	bh=OIkKPvcxWJ32SNJCDJf/3c3oJK1SKG1+cxrIM9MVkro=;
	h=Date:From:To:Cc:Subject:From;
	b=flTpqSnRIuBF7C2YitM9C02e1yd/gqhHxH6GNeqFsKAYMZ/e0tvq83EZcpRD9c7dG
	 cZo2vDHl7klJDX4bIjtqFVgbHuRliYR6oB+rodPzx9A7HN9InclWOzsrL1yB7Mmf7+
	 IbWcPWTrk+h7HUw3runNY7lmq4FLaxYbH2GT7XY0FsxY3bXYKVADMZ3nVYC3cHAG7q
	 0L8e6OvOjtiETAiAshPs4Iq9Z4VvRzfy4+grlsZXNrcE/33uxbOZtpgF1EloS2FwFU
	 7s4nYWNDksy0DXeXJEZqfpPzyyKf3sz6GkMynJgd2X6zMK6n3exOwGDdpF6N7J3V3D
	 /PWOWrKIkmp3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnTqY4PBvz4w2Q;
	Wed, 30 Apr 2025 17:50:01 +1000 (AEST)
Date: Wed, 30 Apr 2025 17:50:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the pinctrl-samsung tree
Message-ID: <20250430175001.4d12e01f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WetCZXBVRUu2wYfylmODm.R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WetCZXBVRUu2wYfylmODm.R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pinctrl tree as a different commit
(but the same patch):

  0a5b9be31f78 ("pinctrl: samsung: use new GPIO line value setter callbacks=
")

This is commit

  9e4c444755b1 ("pinctrl: samsung: use new GPIO line value setter callbacks=
")

in the pinctrl tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WetCZXBVRUu2wYfylmODm.R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgR1ikACgkQAVBC80lX
0GxnkggAgGdrRmHJVQVIZIpGYKOVtTFzvtKWk+FC1igYczG4oVoyPnwwUK2vijHl
fvQ5/jyNcaVlzQjiKf6F52P/O3DSNLZw+FCB7+3+MrweNnm3MESCjGRdH1TKXIKM
ZNR2zxksrOxsNKDmGrPkyaY2ymCD7qrCMtgtWiOXc2cRcXStOabe9VLAeDWB73x7
U0fJiWjsAxEZrJ0vo1S9gsCylnlgm1AtmD26iuul9GLMmTO89lzOyXt6S7bdTssZ
CFQWwg+VCY8sluZ8ceaawo0NR19IZwqx4oB7eKBiLlO+Y9JbA4LckP/C5K9gGRt7
xl42g8Bq+t+nsXo+3EivsZ2Z9vO7mA==
=Ne2P
-----END PGP SIGNATURE-----

--Sig_/WetCZXBVRUu2wYfylmODm.R--

