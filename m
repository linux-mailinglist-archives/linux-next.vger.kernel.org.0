Return-Path: <linux-next+bounces-2176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A08BC5AE
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 04:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3965B281412
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 02:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61DA2B9B8;
	Mon,  6 May 2024 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W6P4vJlo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE956FB2;
	Mon,  6 May 2024 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714961593; cv=none; b=C/UK5tyMJZIAsQXVY+jXVvbhijcps7iORSH0PBls5NU/qylUSuI7m0ho4XbXTKzSAwl4jsJwhj51SGxAEj20iw79tRe2d9AapXEv5EevOMzDznGiWNcJbmws77wxZ7x0oVRhcvSJ8JGMXE7iUhz7TndGBkRjDkMz/2dqrHnma2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714961593; c=relaxed/simple;
	bh=P2ZDPOsvwMiHyzE/e0jgjzdQS4D+Zxr41wThrhcEfiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HpYggtck6duHA7MRCqdG4BpfMcRGVqim5gdUR0DCEBLS0N4PNjjOdjfnR4//YsOLh9NwQBliD/YmWccC88runiJUfeJb65JbrVbhW23l9L2S+e9pE5B/IIa7Q6u3HRmUnkpDQGaOxXVSuTIpEhs5PyIVntV0XfzixAr3P8q0ouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W6P4vJlo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714961589;
	bh=U/wKS8kuZN5ZR7SBfpXo64JVypetPuGJIhbj2XDSNt4=;
	h=Date:From:To:Cc:Subject:From;
	b=W6P4vJlonGkO2Jypwi3vyvMpelEDfKr7GI3OMq5JdWdIjFvyKHES8cvOnq0WjL22N
	 w47T2Kp63QWwA+UvzvF5xsGAsvYDE+R1TZNk9iJjCLgspeCA72J1aQ5qVTBNwOCcD6
	 k3LZDziApgWBJZ+WagG/3mQ+xHLYi8oE+yJeCx+m+IuF2F6AOemUFaOJsTCGt+s3YQ
	 mGBf1KCrvlOShbv8+sr78DoAjoLOaRUyBAzTRYuu3MI8mYCHso5H+V6Rws7CK4q8cZ
	 cmUyVYffXyqt4u6iirzK0qMOhjDlsfpteU9mIx9+pdtAl/xCRbaiEg7rW9pJQ0g/Ve
	 Jq94jJFdTF+Zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXlLX6fMlz4x1H;
	Mon,  6 May 2024 12:13:08 +1000 (AEST)
Date: Mon, 6 May 2024 12:13:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-msm tree with the kbuild tree
Message-ID: <20240506121308.09de6f33@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rKlP7nQpnY_B6VZOoCGjD3g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rKlP7nQpnY_B6VZOoCGjD3g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/Makefile

between commit:

  7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for source=
 directory")

from the kbuild tree and commit:

  0fddd045f88e ("drm/msm: generate headers on the fly")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/Makefile
index b8cc007fc1b9,c861de58286c..000000000000
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@@ -1,10 -1,11 +1,11 @@@
  # SPDX-License-Identifier: GPL-2.0
 -ccflags-y :=3D -I $(srctree)/$(src)
 +ccflags-y :=3D -I $(src)
+ ccflags-y +=3D -I $(obj)/generated
 -ccflags-y +=3D -I $(srctree)/$(src)/disp/dpu1
 -ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(srctree)/$(src)/dsi
 -ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(srctree)/$(src)/dp
 +ccflags-y +=3D -I $(src)/disp/dpu1
 +ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(src)/dsi
 +ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(src)/dp
 =20
- msm-y :=3D \
+ adreno-y :=3D \
  	adreno/adreno_device.o \
  	adreno/adreno_gpu.o \
  	adreno/a2xx_gpu.o \

--Sig_/rKlP7nQpnY_B6VZOoCGjD3g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4PLQACgkQAVBC80lX
0Gwncwf/RsPVt/ra49kzVFxmTm3yjd3W4Ag0ZanEWo1LMeOge/9rsgT4SKNo7xlt
si6Tu4i+yA+coCkitwsZl0e4Kkb09OfGTT7ORR9WHwll3bMPdPj6pL0RoMJNROgA
qUpqBN2xsM7gfGX1jhcZ+oV56xPeklfBvidFRWu/Atc2QP1D69SD2/BfHyZqSgBl
2dZ4ajr6HSIo49FC6M8Cv3Bs71PAIS/s8SNh9ZTqW7shXyf1+8Xc04MtvVr+qS/f
IQA+TdPedseOLjkh9dB3X++WqeAroM5Op4RwMAH+BcJ7RX2Bx/hskyLwF4Pj4YuK
i1ejTyUzJ/Nnays7OPxv/86ILeeL9g==
=uwbM
-----END PGP SIGNATURE-----

--Sig_/rKlP7nQpnY_B6VZOoCGjD3g--

