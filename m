Return-Path: <linux-next+bounces-8251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22414B50FAF
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 09:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61A4118827CB
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 07:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC57730BF60;
	Wed, 10 Sep 2025 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WKMLLn4a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCE12D3A77;
	Wed, 10 Sep 2025 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489990; cv=none; b=lVhYCaL5+hWgmydtBxHto38+wItUKYWwDNWzU51cH/hpIyBk1j8hPsSCDCJypx4GIMeHNG/Aul3EkT1WXs6zIecVdGHXpz9AkfdMoVAdYflReLOxud4s9Im6PbgLbYciW9Ri42evHLWzAaqXxsD6qpWyoKUyh1fYtgr+HozvwK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489990; c=relaxed/simple;
	bh=GlL9SxBrvEmkrdlyzWYn/sI4QM42saQpv8yBemlzIPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UO7o9LoJ4i4AnPEpUFmdagO1Qd9yTVvgnAAn4OzfcnbHATK4QtK3GzKwe12pQQyudmsGFl6asor98mMlv8a9DMpyAmZdybIVM1sBCaSxmhuF3rgUmxfHQALJvsNlW333H7RvmJsMfQPesArO7jWYadw9RSmFCvwuPCRChiKPW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WKMLLn4a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757489986;
	bh=x3Dz7xGOAKp69Am1OxtztE5KmivLDQU8MkO5G+s0i3c=;
	h=Date:From:To:Cc:Subject:From;
	b=WKMLLn4aNdKlKmdP0JebJfZ3vdOI04sJ5elM5rJfLX+Izgas1U1glQvE39OznyBDK
	 F+efTOBro6fj+UaNK6hKSjCYSNFT6iuLVBM0b6kT9deducmDTs5zUe6RjUxuALtTGA
	 3BwcP5qx1Jpd3GI/Zzx0vo9DDjx2JaiUlnv1vVDVEbnZS9aYn0X7fDDjSfkaYFlO60
	 LJujL+BNE8gTW1D0DcsJIndnVkmnEM6fDAiA3/1NWyCm6Ky6V+HDS8I4ITvoJckwAB
	 RNIXoFYmUIsjD5t4z/t8tRrU6AfHm+AHgWjTrYVHQ8CyaNWZeM0v3n3GDJCSE5kFVK
	 v4MNHR36+dKKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMCJK6kS9z4wB8;
	Wed, 10 Sep 2025 17:39:45 +1000 (AEST)
Date: Wed, 10 Sep 2025 17:39:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Message-ID: <20250910173945.3aa7245a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mdaHWC7.pmVBd8AoRGLEU/K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mdaHWC7.pmVBd8AoRGLEU/K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS e=
ndpoint")
  605af91e90b0 ("media: qcom: camss: unconditionally set async notifier of =
subdevices")
  17ad461622f4 ("media: qcom: camss: remove .link_entities callback")
  aefd4d698e47 ("media: qcom: camss: Enumerate resources for QCS8300")
  42914692e800 ("media: qcom: camss: enable vfe 690 for qcs8300")
  950f3d308f8b ("media: qcom: camss: enable csid 690 for qcs8300")
  9ca5d17f5e2e ("media: qcom: camss: Add CSIPHY support for QCS8300")
  6adf001b6779 ("media: qcom: camss: Add qcs8300 compatible")
  634a2958fae3 ("media: dt-bindings: Add qcom,qcs8300-camss compatible")
  b478527cce8a ("media: qcom: camss: Enumerate resources for lemans(sa8775p=
)")
  e7b59e1d06fb ("media: qcom: camss: Add support for VFE 690")
  ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
  7803b63a1640 ("media: qcom: camss: Add support for CSIPHY (v1.3.0)")
  5f4ba689e7f3 ("media: qcom: camss: Add qcom,sa8775p-camss compatible")
  8dd22e90331d ("media: dt-bindings: Add qcom,sa8775p-camss compatible")
  a3dce6e3c85f ("media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-ge=
n3.c")
  0d6d5f49e0fc ("media: qcom: camss: Rename camss-csid-780.c to camss-csid-=
gen3.c")
  9e89149a19ed ("media: qcom: camss: add support for QCM2290 camss")
  ce63fbdf849f ("media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1=
 init sequence")
  f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
  acf8d084699e ("media: qcom: camss: Add support for TFE (Spectra 340)")
  cba308979b01 ("dt-bindings: media: Add qcom,qcm2290-camss")
  57429b0fddfe ("media: iris: Fix firmware reference leak and unmap memory =
after load")
  dbd57932f8d0 ("media: iris: Add support for SM8750 (VPU v3.5)")
  1f01a49816a5 ("media: iris: Split power on per variants")
  2fbb823a0744 ("media: iris: Call correct power off callback in cleanup pa=
th")
  93fad55aa996 ("media: iris: vpu3x: Add MNoC low power handshake during ha=
rdware power-off")
  fde38008fc4f ("media: iris: fix module removal if firmware download faile=
d")
  6d3926a237b6 ("dt-bindings: media: qcom,sm8550-iris: Do not reference leg=
acy venus properties")
  49b5feb5214d ("dt-bindings: media: qcom,sm8550-iris: Add SM8750 video cod=
ec")
  088ee3df91ba ("dt-bindings: media: qcom,sm8550-iris: Add X1E80100 compati=
ble")
  1b2263ef3292 ("MAINTAINERS: Update Vikash Garodia's email address")
  246fdc42df9b ("mailmap: update Dikshita Agarwal's email addresses")
  907cef174cd8 ("dt-bindings: media: qcom,sm8550-iris: Update Dikshita Agar=
wal's email address")
  e1684530b163 ("MAINTAINERS: update Dikshita Agarwal's email addresses")
  bfdfbdf469b4 ("MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry")
  c0baf70955e7 ("media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper")
  5bf86863ddfe ("media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper")
  75b5888a8935 ("media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper")
  d2fa1134a48b ("media: i2c: ov8856: Use V4L2 legacy sensor clock helper")
  f2cc0ccab90f ("media: i2c: ov8856: Replace client->dev usage")
  0e14d99c4dbe ("media: i2c: ov5695: Use V4L2 legacy sensor clock helper")
  0f1e46fc82e5 ("media: i2c: ov5645: Use V4L2 legacy sensor clock helper")
  cd7a9b578356 ("media: i2c: ov2685: Use V4L2 legacy sensor clock helper")
  dc1dadf63d45 ("media: i2c: ov02a10: Use V4L2 legacy sensor clock helper")
  f8f4914ed030 ("media: i2c: ov02a10: Replace client->dev usage")
  44fec2c00d8c ("media: i2c: imx290: Use V4L2 legacy sensor clock helper")
  c5b1a92c5bfa ("media: i2c: imx258: Use V4L2 legacy sensor clock helper")
  4b23f780a353 ("media: i2c: imx258: Replace client->dev usage")
  d2d7488bf53d ("media: i2c: gc08a3: Use V4L2 legacy sensor clock helper")
  30dbc5316736 ("media: i2c: gc05a2: Use V4L2 legacy sensor clock helper")
  fdee212433d2 ("media: i2c: et8ek8: Use V4L2 legacy sensor clock helper")
  cf7ea1d6e563 ("media: i2c: et8ek8: Drop support for per-mode external clo=
ck frequency")
  dd235b07b65e ("media: v4l2-common: Add legacy camera sensor clock helper")
  bfa626306cf7 ("media: i2c: ov9734: Use V4L2 sensor clock helper")
  9f16195e4567 ("media: i2c: ov9734: Replace client->dev usage")
  5b428a40a63d ("media: i2c: ov7251: Use V4L2 sensor clock helper")
  063f5989718c ("media: i2c: ov5693: Use V4L2 sensor clock helper")
  c8ab1727624a ("media: i2c: ov5675: Use V4L2 sensor clock helper")
  381045e43b73 ("media: i2c: ov5675: Replace client->dev usage")
  2fc0898408b1 ("media: i2c: ov5670: Use V4L2 sensor clock helper")
  be3971e218b9 ("media: i2c: ov5670: Replace client->dev usage")
  f994b6e7e580 ("media: i2c: ov4689: Use V4L2 sensor clock helper")
  853bd2ec1196 ("media: i2c: ov2740: Use V4L2 sensor clock helper")
  fdba8eba02b6 ("media: i2c: ov2740: Replace client->dev usage")
  964ae05b0d69 ("media: i2c: ov13b10: Use V4L2 sensor clock helper")
  42bab2cb292d ("media: i2c: ov13b10: Replace client->dev usage")
  9df442485b13 ("media: i2c: ov13858: Use V4L2 sensor clock helper")
  8853d26bfd04 ("media: i2c: ov13858: Replace client->dev usage")
  5dee9af9c859 ("media: i2c: ov08x40: Use V4L2 sensor clock helper")
  5ff996ee54ad ("media: i2c: ov08x40: Replace client->dev usage")
  1e921b267eb7 ("media: i2c: ov08d10: Use V4L2 sensor clock helper")
  4e2b34c36ce1 ("media: i2c: ov08d10: Replace client->dev usage")
  70dbc965b419 ("media: i2c: ov02e10: Use V4L2 sensor clock helper")
  d1f4dbef9c95 ("media: i2c: ov02e10: Replace client->dev usage")
  baa59320ee73 ("media: i2c: ov02c10: Use V4L2 sensor clock helper")
  963b07259fba ("media: i2c: ov02c10: Replace client->dev usage")
  60d1c3a2b9ba ("media: i2c: og01a1b: Use V4L2 sensor clock helper")
  4d58f671944a ("media: i2c: og01a1b: Replace client->dev usage")
  eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock helper")
  49c6ac166cf7 ("media: i2c: imx355: Replace client->dev usage")
  047119e3cd63 ("media: i2c: imx319: Use V4L2 sensor clock helper")
  df2942622abf ("media: i2c: imx319: Replace client->dev usage")
  cff416364c33 ("media: i2c: imx208: Use V4L2 sensor clock helper")
  5fa4f8665f05 ("media: i2c: imx208: Replace client->dev usage")
  2753de70d7d5 ("media: i2c: hi847: Use V4L2 sensor clock helper")
  f499f2bf6257 ("media: i2c: hi847: Replace client->dev usage")
  c674a3890638 ("media: i2c: hi556: Use V4L2 sensor clock helper")
  dfd2fb5b73c2 ("media: i2c: hi556: Replace client->dev usage")
  73d31c7626ef ("media: i2c: ov6650: Drop unused driver")
  f14eb6a9aa13 ("media: i2c: mt9v111: Do not set clock rate manually")
  b4dd3bbd2eeb ("media: i2c: mt9v032: Drop support for platform data")
  0f8d0da42c2d ("media: i2c: mt9v032: Replace client->dev usage")
  55e3c86887dd ("media: i2c: mt9v022: Drop unused mt9v022.h header")
  4e181beb68a6 ("dt-bindings: media: imx274: Make clocks property required")
  ea501438dcd3 ("dt-bindings: media: imx258: Make clocks property required")
  c7d54dba555a ("dt-bindings: media: et8ek8: Deprecate clock-frequency prop=
erty")
  aa1826696a55 ("dt-bindings: media: Deprecate clock-frequency property for=
 camera sensors")
  fa9e6df636fb ("media: i2c: add ov2735 image sensor driver")
  773bb3066e6d ("dt-bindings: media: i2c: Add ov2735 sensor")
  25bf2e1925c9 ("media: i2c: Add OmniVision OG0VE1B camera sensor")
  9acb06945fab ("dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sen=
sor")
  fd7cb868e309 ("media: i2c: Add OmniVision OV6211 image sensor driver")
  9364790e91fb ("dt-bindings: media: i2c: Add OmniVision OV6211 image senso=
r")
  c7df6f339af9 ("media: ov08x40: Fix the horizontal flip control")
  bfbd5aa5347f ("media: i2c: og01a1b: Specify monochrome media bus format i=
nstead of Bayer")
  bfdcfd008b37 ("media: ov02e10: Remove Jingjing's e-mail address")
  80ae11c1a524 ("media: ti: j721e-csi2rx: Fix NULL vs IS_ERR() bug in ti_cs=
i2rx_request_max_ppc()")
  a1dcf9a069f7 ("media: stm32-dcmi: use int type to store negative error co=
des")
  27296c1f0027 ("media: raspberrypi: use int type to store negative error c=
odes")
  bacd71314544 ("media: i2c: mt9v111: fix incorrect type for ret")
  da8f23e35916 ("media: ov8865: move mode_configure out of state_configure")
  075710b670d9 ("media: i2c: mt9p031: fix mbus code initialization")
  4010eef01deb ("media: staging: ipu7: Don't include linux/version.h")
  6a79e9c91e9e ("media: mc: Clear minor number reservation at unregistratio=
n time")
  fc2aaf2d93a6 ("media: venus: core: Add qcm2290 DT compatible and resource=
 data")
  a9551290ef3b ("media: venus: core: Sort dt_match alphabetically.")
  7998681eb7f4 ("media: venus: hfi_plat_v4: Add capabilities for the 4XX li=
te core")
  ba4fdff92011 ("media: venus: Add framework support for AR50_LITE video co=
re")
  85c853b70436 ("media: venus: Define minimum valid firmware version")
  93f213b444a4 ("media: venus: firmware: Use correct reset sequence for IRI=
S2")
  c329055587ee ("media: dt-bindings: venus: Add qcm2290 dt schema")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/mdaHWC7.pmVBd8AoRGLEU/K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjBK0EACgkQAVBC80lX
0Gy7Ywf/UVKDgJkuNaUsaFliqqi4tINf98CQ3UuGyCm4AJaNyUji6t8J3O4fS6zQ
mSl6/ovYb+dNhNhTb+iXPwMwM7eoWNRrIL/Gu0mTr/UNn3ErEdE/jTAkLcLtFZxX
TAMtHD1jSq5XqZ5/ph+j+dLJzmfcBz/kVKdPRgLaVQZdOE9nrCdwRHWOV8RyGg7a
9Oq1dOrOR2WuVb5hqmmMIqAHeiuGCr93JXWDvbWQtBN5AxDr0Ydj8zY7FVnVuVts
ELPpbMUbhqRTiSq+SzWDGuEqEi2V5XDix3iegswyoo67aSIHMwXQayWk4ymvO6ur
gtZ/8lRdxLVUFmCb6Xc0/8jl9uOkkQ==
=FiDa
-----END PGP SIGNATURE-----

--Sig_/mdaHWC7.pmVBd8AoRGLEU/K--

