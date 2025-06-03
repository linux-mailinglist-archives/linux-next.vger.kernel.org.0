Return-Path: <linux-next+bounces-7009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DCBACBE58
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 03:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7C543A45B2
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 01:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B9472616;
	Tue,  3 Jun 2025 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="npwiKQAX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02A8821;
	Tue,  3 Jun 2025 01:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915586; cv=none; b=qkxXQOdVU7oXOHfTBPToa/03R6P6CWb8pQhPOLlwo3zaAEgx2y9zEK2c1PK3vHkiuwT3+taYKTeBrN4vo2mh/ryyclM4Sn4rGX4Mxkx4ieSTZHQiDlQ+bzREhhzw2KQqqsaxWU0bUKY0u2o/Km4KA9slnpmjftXsGDRCuWLiKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915586; c=relaxed/simple;
	bh=hYRruDmtOjNIuVDQLtYfCEvEpP8qmXJ4rfczd3OA6H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lzRzdMyzE+pKGfTHotX8MjEZl9YenvlnVmEMsqWWHeKkszSe/ICYanusAaJsG78eVh2VHLedAqMpPtRTbOn8QdfCuRvUuEAl94hrzMRab/OpHriAiY01vh4Ixq9aEyGc4duNoKLeueDj0cXrwP+8kWFHzLNnbiZuTNL5IujjL3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=npwiKQAX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748915577;
	bh=3JdGYRjP2qSbaWnd4ZVnqvxDguVIobygpTLZVQDHTsk=;
	h=Date:From:To:Cc:Subject:From;
	b=npwiKQAX/+i2e2Qro10ml33ySajRYYKrul+6xzzNh6CVse/sJun05jLUzVQe+53p1
	 hMpM4iCnb4NlIjBot/dn8OCG+VyKbA6q7I4Mqvip2DmFsyvssrgofHZtea8/4QtcO8
	 5osKHzkZMMjsI8x0gEEZP7kSTK31bOvuGulFKC5K12rfjFYbHDFOwcAcNIC69G4xNe
	 TAIlUORFw3ec//AqwHSCsfx5SWIVlZZts0XPvP520+vSYAudsAbibr1BaA6GLqdTQn
	 rhQfG39+RfTE+QCgkiwohA8iT1/jB9XiWKCvSYbS00WtmjjvoYDm+3ieTSnbU2Y/u4
	 XMxehG5O9x2Jw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBDHr4GbRz4x8X;
	Tue,  3 Jun 2025 11:52:56 +1000 (AEST)
Date: Tue, 3 Jun 2025 11:52:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Dominik Haller
 <d.haller@phytec.de>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: linux-next: manual merge of the broadcom tree with Linus' tree
Message-ID: <20250603115255.5639c99b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V+iGUx+5DwQp3wvv5Wehax_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V+iGUx+5DwQp3wvv5Wehax_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the broadcom tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  8d8f28da8f90 ("arm64: defconfig: Enable TMP102 as module")

from Linus' tree and commit:

  10c68f40b86e ("arm64: defconfig: Enable RP1 misc/clock/gpio drivers")

from the broadcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 1e99db100607,ccf2f50673a3..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -706,7 -703,7 +707,8 @@@ CONFIG_SENSORS_RASPBERRYPI_HWMON=3D
  CONFIG_SENSORS_SL28CPLD=3Dm
  CONFIG_SENSORS_INA2XX=3Dm
  CONFIG_SENSORS_INA3221=3Dm
 +CONFIG_SENSORS_TMP102=3Dm
+ CONFIG_MISC_RP1=3Dm
  CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
  CONFIG_CPU_THERMAL=3Dy
  CONFIG_DEVFREQ_THERMAL=3Dy

--Sig_/V+iGUx+5DwQp3wvv5Wehax_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+VXcACgkQAVBC80lX
0Gzb1Af+IKE39mbMEuA/NenEQwJpnEkPbFlhIBULbrXCJFWiYkqdr7aOyQpod68Z
cn2Ljt3SUmwVf73rfCoq01JnxOFmC7wQwMvrEdF/iAtBJXz3T0h+rIdya6IIn5Po
LZs9SIohlXTlrjA+EgrHG9dxiuBrS0QhwowmWr/uQqHDv4zRA9Qd8UMuwzXo7l2P
3CkJ/kSvTyOfTosAZm0aK64Q7RSZvNI7qKEbj5wVF28ibnVP4mmkBHMDth/XwpgU
CeliH1pXKFbxrCjhDxkq97BKmTVOEvhnesCLnlEsKykQ/9l0TGFOHGSiAaT3q/Wj
rtbn8/zLGoBYduKoaHOBMFT8TUad4w==
=3zjv
-----END PGP SIGNATURE-----

--Sig_/V+iGUx+5DwQp3wvv5Wehax_--

