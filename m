Return-Path: <linux-next+bounces-2821-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9A92520D
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 06:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13D7A1C23377
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 04:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6AB4965F;
	Wed,  3 Jul 2024 04:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b8jKCQ4Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62B8BA2D;
	Wed,  3 Jul 2024 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719980379; cv=none; b=Ld5Hco0MPZHNgdGEhfBA/YTRp710Kumu8d8W8rlsRZ0ME8pbyh9GCYtA0kAgwAapiLPS7MFROxffzUjP2pRzL8aNL2/q58eDNa9cqCh3aO/NYhQ8OjKPVE0JSgcrnu9C3DzKgq1uxV4JKAN4F6CU5dIzMfSkdgU8xwHxwL0Qkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719980379; c=relaxed/simple;
	bh=20ZuX0judSc+BaDq5v2IZLQAn7nMVNSsXBjp6fVHD5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p4PbtlOLPFUkUTQIeCPU+EZn8aiGzuyRADg0eVoBcXkaUFWaZr7gqdSb6a3PJJI3BNHYoLygN4efAy4RPZykvEok17mco51zxNbTzADv+u77jb/gFOd4gxkoUnHGWSYCZ5xIjAFNTggVWrWiX2bSKIneThzWkxmrxnW9d8/8kug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b8jKCQ4Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719980373;
	bh=gYH1q2C2t5oF7TpkdAWWauH5U+b0niw7/owZDAAH2h4=;
	h=Date:From:To:Cc:Subject:From;
	b=b8jKCQ4Qj4NelEnPjfNiQJIrlP1qeiwCN/bhwr0CMtY7txp5MVGlJ1wMLY+vNPbMV
	 VXKmlF7H5dX73Wu6cgsJ9piaD0qLG/VHcHtauwzny03KraWa6OWVs17UCjzydwAtoK
	 9tpjr/AykWeIuLDg0svrTqxWhR4s7DmQyB+ZX6G1lJZ/KR+unV4v8vOCfNoU46LYNb
	 sOqBbVNUSU1eJ+KoB1yBJqyttXP23YNrDhdlI6aYGE1NRClSIWbt38E+j+rU6Jxcls
	 y8MALhqqklHeqkwy+3g7BBBvQhBnBSS5fXqnbdcwjkD7PoSbafJTLXcq3vmyvK0tg7
	 iLMnDJOYtI3fw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDRPc60Slz4wc1;
	Wed,  3 Jul 2024 14:19:32 +1000 (AEST)
Date: Wed, 3 Jul 2024 14:19:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Subject: linux-next: manual merge of the phy-next tree with the samsung-krzk
 tree
Message-ID: <20240703141932.47e51748@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CoM4KYEr_Pu0_WKx0t6EDH6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CoM4KYEr_Pu0_WKx0t6EDH6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  include/linux/soc/samsung/exynos-regs-pmu.h

between commit:

  85863cee8ce0 ("soc: samsung: exynos-pmu: add support for PMU_ALIVE non at=
omic registers")

from the samsung-krzk tree and commit:

  32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (=
HS & SS)")

from the phy-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/soc/samsung/exynos-regs-pmu.h
index f411c176536d,6765160eaab2..000000000000
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@@ -657,8 -657,8 +657,12 @@@
  #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
  #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 =20
 +/* For Tensor GS101 */
 +#define GS101_SYSIP_DAT0					(0x810)
 +#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
 +
+ /* For GS101 */
+ #define GS101_PHY_CTRL_USB20					0x3eb0
+ #define GS101_PHY_CTRL_USBDP					0x3eb4
+=20
  #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */

--Sig_/CoM4KYEr_Pu0_WKx0t6EDH6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaE0VQACgkQAVBC80lX
0GzMYwf/VD6ZV3ECZh7o9YP6+Hu61hp0IaCXPlCkT8Vw8mgDrgzEbOYMMocfgZJM
CgoIR/40XwUGNog3QBtHkNXxirbEK7a4GTtKtrFQAad7ZmWKE8A/g599vv2Eb0ae
bdHVpeBurN0OkpkmJWI7AZDYEAN/5CHqElV+oljdiN6Lytn7tcmjAGYxxjNUiR6h
sf75V+FyLx74OA8Z9VSUIS7O7mEcw2cdHZIOfTDiuWiJNjv5yxK+sGF1dWrVbJ/w
wd/FNTM9TZVNe3qGDADC4yFI2Rre6UtlPcYPW7tjSJse+oPGYYg7SixGiZjxvu6m
dGUR3LxsRJh/kmNydbyInl1pz4KIoQ==
=VjBH
-----END PGP SIGNATURE-----

--Sig_/CoM4KYEr_Pu0_WKx0t6EDH6--

