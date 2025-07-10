Return-Path: <linux-next+bounces-7449-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC0AFF628
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 02:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D76E81C449A8
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 00:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E992B49620;
	Thu, 10 Jul 2025 00:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PnkOs6S7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DF539A;
	Thu, 10 Jul 2025 00:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752108594; cv=none; b=cePJwVr5ivOdXN3mNsdDDgbrBylg6jx421BTttOPy+727UIUPqYDOwx7jNfQulTBJh2jMzatO/0QbcyV7Gl1tWEji7ZoVF0qoK39LXFYZXVqCbJarQP1m9Gj7pw0//u7rHSmF/m/A3Lf/hqb5mBPnv96iGuFW/zwxm8sMxtNt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752108594; c=relaxed/simple;
	bh=w1Lm7RuwQ2b3672y6HGd4ioUbINjiPpc+FgeeH2sB5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W12PBUV1+Fno6EOp8CIx2B8tNRjUULm7Zs0gjmSIBQHZQYnvSUiTnOBUUl3B20RycC1VEdaBNgtcFMrP8YUu6fkSY0SzIxuLtmaY98j2ZbHnz4nscxbgSjCQt7SUQVizRXoRq9blIzEJNGKB6yqQkvz24DSuNEAUwSgl8GI6voE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PnkOs6S7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752108516;
	bh=RiDxJUEI3cQozMpjg0XcmiFtsopX8MDhyT68KVwx+o0=;
	h=Date:From:To:Cc:Subject:From;
	b=PnkOs6S7Yc3DBa3zPZcy+ISgVbWljWfDsDnQxLvl0HJQizamjPvSiC+DDhT2xA7Rv
	 nlqfIThnAx4oZ2TzHjgWc8J2ksiyaM98hkuP8/EwWCUl7mW7CJSaXf0s21csKjllTs
	 LqlbPMfo8jh8OZwurvM1JYpC7uFxr/Ry11tukfWklO+RvSMx2lclwaDHbM7MijN//I
	 ZbfP26/u82FSPDHb9b4TyPsBQGrlufRwco8aJPXL4hWm1ErYcyerStRyxT0bx5gM49
	 aSFGWDQmDMJAMQUo7tcigoxcw5okl9/6TQcNll6lxbb5S3VGVedHCDKvlq/cPB35d9
	 jkqS/tTD6eZ/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcx6X0MkLz4wy6;
	Thu, 10 Jul 2025 10:48:36 +1000 (AEST)
Date: Thu, 10 Jul 2025 10:49:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>,
 Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Bjorn Andersson
 <bjorn.andersson@oss.qualcomm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tegra tree with the qcom tree
Message-ID: <20250710104849.37e3e8cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pb/A5_ws5Xa+Pecj7LlFsyG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pb/A5_ws5Xa+Pecj7LlFsyG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  3871b51a6842 ("arm64: defconfig: Enable Qualcomm CPUCP mailbox driver")

from the qcom tree and commit:

  18c590e012d3 ("arm64: defconfig: Enable Tegra HSP and BPMP")

from the tegra tree.

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
index 42b33f998149,cf3856dfed22..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1457,7 -1445,7 +1458,8 @@@ CONFIG_PLATFORM_MHU=3D
  CONFIG_BCM2835_MBOX=3Dy
  CONFIG_QCOM_APCS_IPC=3Dy
  CONFIG_MTK_ADSP_MBOX=3Dm
 +CONFIG_QCOM_CPUCP_MBOX=3Dm
+ CONFIG_TEGRA_HSP_MBOX=3Dy
  CONFIG_QCOM_IPCC=3Dy
  CONFIG_ROCKCHIP_IOMMU=3Dy
  CONFIG_TEGRA_IOMMU_SMMU=3Dy

--Sig_/pb/A5_ws5Xa+Pecj7LlFsyG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvDh0ACgkQAVBC80lX
0GztNgf/dcQrHvvFPpK/tEjj1BrHnUZd+T7u8wB1FomSoXBpz084I0mIPltMlN/m
x454T3u+sCeIRO++34zqD6AozKcNGAxPxzN7EkP9YPICGQanLUFrZYm/77ylyU5G
GmnB4dDI37krZvWJxg2ke3wRwVQXsVWl9HuE38VzR6LI51V6hmK9T2WxXs5zNgzk
skjIBZ4wJ/dhp207CZUrGPVZnP3WDy2C8gun5d3C5O/gIx7F/4vM0aDhouWn7RAz
y4BEgkob51Oe45I+JIz1WsxdP2JohTfiZrzh76aqG0YaUBS7sDApNM6It5lx2gnb
LIgJfDIGu0lB7e+0x5QRika/QmsTCg==
=gnSw
-----END PGP SIGNATURE-----

--Sig_/pb/A5_ws5Xa+Pecj7LlFsyG--

