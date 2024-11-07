Return-Path: <linux-next+bounces-4648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 539789BFDEA
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 06:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18DB2284590
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 05:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3431925A6;
	Thu,  7 Nov 2024 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pdzSwEeB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4001373;
	Thu,  7 Nov 2024 05:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959183; cv=none; b=hzLb93AzUTlByp3wHqJiEiGbuaDH8q/ura2kUKC2Djt45t9dtWUHg+CSIPiKURnyUAlgefIlSn3cSXkgN3Or9aIPLISNW7fKu3EfLmtNf9GDCiUjzXU/njQhBGZLpmd1lrv50aEDgwgoWiUCmBTLgKP6F887LoHhe7cIYgESAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959183; c=relaxed/simple;
	bh=3gVsYa5o1RR9TW/ssHuewXxeNa9OXJrmNpNyWsJoafU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JEH0eQN1s2TT33gxVvE3cPzpNG/SiQSCOin0V8GH7OWspB+j+7RwjzXN3sftbhS7160y7yChpdOHOf+Jdyr6B/e29tQjUVpOsojNWed2W916qklnwYN/jERT9b+QaH1sIDXT/uwlmXsPskqHWQ6tVaHZ52C0Ex2jyTspJgFafqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pdzSwEeB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730959174;
	bh=im7kK2GUGTddb6uaUh9r3kMzjLr0O462UiQsQZM1fF8=;
	h=Date:From:To:Cc:Subject:From;
	b=pdzSwEeBCd/cSkXxiBc6CL8+kAA7Hk21wNGFT1ASFhOrNc/Z5L38BKkaB75ZfZtjk
	 oMN8ftuzrOp3fjgFOQhvAHdBbxMtY4AMYSpsLr1gWB5EssId1kmTrbuBNRTeL6iYAW
	 hRnvTaE+fLIy+m6V0u0r4CAuSHSaAj1tXGjmh9+dHSX/tXA3ADwyRKWsulD86ueCIq
	 kzhZZMAPFy0aPqj/KThibGBudIGUCb35Q6L7PIeePV7DCsllTP0X7+O9yipZ9tbanP
	 HUv1kcplrcqp2BX7ZbBWVX/m6QryEhXtmnMCcCENJtFe8GypgptEXQXx5ricpGqcDh
	 iWJrrbBq8tizA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkWcN3j9Jz4wxf;
	Thu,  7 Nov 2024 16:59:31 +1100 (AEDT)
Date: Thu, 7 Nov 2024 16:59:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Byoungtae Cho <bt.cho@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>,
 Taewan Kim <trunixs.kim@samsung.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>
Subject: linux-next: manual merge of the watchdog tree with the samsung-krzk
 tree
Message-ID: <20241107165933.3e8b5af5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+0fLBGM_F3N5gQ9oR1b.suH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+0fLBGM_F3N5gQ9oR1b.suH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the watchdog tree got a conflict in:

  arch/arm64/boot/dts/exynos/exynosautov920.dtsi

between commit:

  ef1c2a54cbc7 ("arm64: dts: exynosautov920: add peric1, misc and hsi0/1 cl=
ock DT nodes")

from the samsung-krzk tree and commit:

  3595a523d043 ("arm64: dts: exynosautov920: add watchdog DT node")

from the watchdog tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e,2b3e8debda3d..000000000000
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@@ -172,17 -172,26 +172,37 @@@
  			reg =3D <0x10000000 0x24>;
  		};
 =20
 +		cmu_misc: clock-controller@10020000 {
 +			compatible =3D "samsung,exynosautov920-cmu-misc";
 +			reg =3D <0x10020000 0x8000>;
 +			#clock-cells =3D <1>;
 +
 +			clocks =3D <&xtcxo>,
 +				 <&cmu_top DOUT_CLKCMU_MISC_NOC>;
 +			clock-names =3D "oscclk",
 +				      "noc";
 +		};
 +
+ 		watchdog_cl0: watchdog@10060000 {
+ 			compatible =3D "samsung,exynosautov920-wdt";
+ 			reg =3D <0x10060000 0x100>;
+ 			interrupts =3D <GIC_SPI 953 IRQ_TYPE_LEVEL_HIGH>;
+ 			clocks =3D <&xtcxo>, <&xtcxo>;
+ 			clock-names =3D "watchdog", "watchdog_src";
+ 			samsung,syscon-phandle =3D <&pmu_system_controller>;
+ 			samsung,cluster-index =3D <0>;
+ 		};
+=20
+ 		watchdog_cl1: watchdog@10070000 {
+ 			compatible =3D "samsung,exynosautov920-wdt";
+ 			reg =3D <0x10070000 0x100>;
+ 			interrupts =3D <GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>;
+ 			clocks =3D <&xtcxo>, <&xtcxo>;
+ 			clock-names =3D "watchdog", "watchdog_src";
+ 			samsung,syscon-phandle =3D <&pmu_system_controller>;
+ 			samsung,cluster-index =3D <1>;
+ 		};
+=20
  		gic: interrupt-controller@10400000 {
  			compatible =3D "arm,gic-v3";
  			#interrupt-cells =3D <3>;

--Sig_/+0fLBGM_F3N5gQ9oR1b.suH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsV0UACgkQAVBC80lX
0GypPwgAhEr3GuUnqdTN1ajzSkTQAoHYn/QbcUIX8aWuQQsvHOq55/m3cftuSq90
9FDVDcQ07zZB5sY6UnsdtMn8TBExeKUzseRJ9Fztanp6+8zlQzCMN33dTgxqqw2r
8pFLV7UYiqhUBWQRVGjlmcVA27Ra5wq3Uyq8nz9DAg10R0GA2qqFN1EVtbB3zkit
A4rHlgu4tW5J3ONIbpTdICEBK/HmDigddwbcCEzEDGr8sRSQq7Ss4oZd8SiQtguF
4pqAZN7XzpsYvZVeEDm6qGBsR3zqFkPosOxJz3Zzr7KEoH9VuPweAnYluvI3WODT
EKf0HZYjC84ul84z+UB26kcdSVOXkA==
=oqE/
-----END PGP SIGNATURE-----

--Sig_/+0fLBGM_F3N5gQ9oR1b.suH--

