Return-Path: <linux-next+bounces-2182-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683878BC718
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 07:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9932D1C210AE
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 05:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA4F45943;
	Mon,  6 May 2024 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q2F43vc/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8E3C489;
	Mon,  6 May 2024 05:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714974155; cv=none; b=TtD/JTvQZ2t/uv0aw5giP7sGbc/ZjvnDgB5xqMHXbovfXNt0p+1lmOv7oWulXTYE9FSlHBizzsmLr68fMSqkasq9blpLPvj/9w1fm0NaaCVAOUFvEY1ZNVlWyliYBWo97GnCZZzLGaDncRLhFJ35yIZCG88vNGugTFxDc+1Pvi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714974155; c=relaxed/simple;
	bh=FVxHa7DCbuAkEtRoVU3UZ9udcjFiVRaoFwKhQHst2EY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K0raQG6VCbytJbGv3wuN/9SFgOvTaKdHdiZkWStABPhWL27aXjGviTfTP/eyYdF5t7zCdAr05p08kHKOrjta8EqxB6n81LKffyhvf8d1d8G85tKh7riUiQGCHhyjSzKOz5M6eNtBO9WpZd1gFEV6z2S9CAkSNpQGfSdP6s0PWIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q2F43vc/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714974148;
	bh=TVGl1B/xb+oewirMuaud5XuiZSj3wsv5P0RHNSWXHd4=;
	h=Date:From:To:Cc:Subject:From;
	b=q2F43vc/3CfTzHrfGlNuOrJ9h+QrV2Kf0rW+CDhONcIGn2J00CaTz9VzoR3vpV+P7
	 HAu5aL5mlzPR5OvEjV0cDdYRGHenm+ca0XG21Lml5sySVZbzmhZk3IdJOnUcMM56qa
	 eZ1k5YGAHG7bW5vaHigX8QXsUd0foDEmeXzftxkzB1E9sE8MwhaI6Y2PxxuxkYYXqk
	 vw1sLAT0EXP1AaLJgJrIFrFmX7Hgh/3NfwkR0ueYayF48FnICjQG3z+jy7+BqHn2XC
	 xasLOoXAjPIgCPBr0uX9A04sUqjdUnXn0Q/DEaEPbYAVXKuK+j6CD8naPoFOjGafx9
	 2BYrQa34z2CDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXr033Rzyz4wcR;
	Mon,  6 May 2024 15:42:27 +1000 (AEST)
Date: Mon, 6 May 2024 15:42:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the nvmem tree
Message-ID: <20240506154226.5442be65@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6X_mtD5XWTMLuOP7lk1HOVX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6X_mtD5XWTMLuOP7lk1HOVX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the char-misc tree as different
commits (but the same patches):

  9e29a1dba59b ("nvmem: meson-mx-efuse: Remove nvmem_device from efuse stru=
ct")
  2ce7240c076f ("dt-bindings: nvmem: Add compatible for SC8280XP")
  af868167a709 ("dt-bindings: nvmem: qcom,spmi-sdam: update maintainer")
  e5630036dab1 ("dt-bindings: nvmem: Add compatible for sm8450, sm8550 and =
sm8650")
  04075398ec4f ("nvmem: lpc18xx_eeprom: Convert to platform remove callback=
 returning void")
  ea8f9ec2bbb7 ("nvmem: core: switch to use device_add_groups()")
  fbd0d725d4fa ("nvmem: sprd: fix module autoloading")
  fc7d05b8e427 ("nvmem: sc27xx: fix module autoloading")
  3575d48e5d2f ("nvmem: layouts: sl28vpd: drop driver owner initialization")
  995b22c48ed0 ("nvmem: layouts: onie-tlv: drop driver owner initialization=
")
  e428f11ae8fb ("nvmem: layouts: store owner from modules with nvmem_layout=
_driver_register()")

These are commits

  2a1ad6b75292 ("nvmem: meson-mx-efuse: Remove nvmem_device from efuse stru=
ct")
  a5888ae5b3c3 ("dt-bindings: nvmem: Add compatible for SC8280XP")
  dc5d4043510b ("dt-bindings: nvmem: qcom,spmi-sdam: update maintainer")
  e2c7d6e02382 ("dt-bindings: nvmem: Add compatible for sm8450, sm8550 and =
sm8650")
  693d2f629962 ("nvmem: lpc18xx_eeprom: Convert to platform remove callback=
 returning void")
  8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
  154c1ec943e3 ("nvmem: sprd: fix module autoloading")
  dc3d88ade857 ("nvmem: sc27xx: fix module autoloading")
  23fd602f2195 ("nvmem: layouts: sl28vpd: drop driver owner initialization")
  21833338eccb ("nvmem: layouts: onie-tlv: drop driver owner initialization=
")
  6d0ca4a2a7e2 ("nvmem: layouts: store owner from modules with nvmem_layout=
_driver_register()")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6X_mtD5XWTMLuOP7lk1HOVX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4bcIACgkQAVBC80lX
0GzQiQf/W9Wu7XyIY93fksQTn2crzZLV6Witm9M1FqqlzGu8bjccMUovDAVwhVYR
VLf3bRR4CDDVCCX0Px6AU4DOypVtrhWkk+bnugpHKABzOU9eMw1KXiRJMfPJ92hb
wsUKtXVLFz2OzsZwnRTVWzMf6jeiPwy6lvKh/k6k6E+kdVZOvCGS+xYfcmzsIfzT
SNSDNS6qWN7mcXE0aMDAk3CVeM+fFbHZCiVtgboxq/AWanH4E6wEVVyWJRVChLP/
dtgkkB+FAGbMdpChF0J8JXk2hTxpy9ZmK4ZDVukTVIk+2WMJ0osHWByIySZshSU0
zPn9x1GtnPJuxN7JVFQIEMYkR6J71Q==
=nIO2
-----END PGP SIGNATURE-----

--Sig_/6X_mtD5XWTMLuOP7lk1HOVX--

