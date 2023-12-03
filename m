Return-Path: <linux-next+bounces-197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BB8028E8
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 00:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9338B1C20433
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 23:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF101A5A4;
	Sun,  3 Dec 2023 23:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Jqg5t6Yz"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED939D3;
	Sun,  3 Dec 2023 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701644930;
	bh=+cPhwPJpcFNZb6c+xA04ocJR/AeqowdM77bWLN+NPh8=;
	h=Date:From:To:Cc:Subject:From;
	b=Jqg5t6YzxoqQY6tdAy4DysDZoN4FMgwjDCla6ifOr5TpuRqnTveN4yhtbihldr3Vu
	 jdQh4qJw99MbrnwcjLOSA4GHlXWvbrZRuRcp+pFCFTUXSrbwaJuVykQ7pNMEIOkw9M
	 kCaHBVhZO39xEaDWkLyy3rqUm7g74RiDadJH9gwFNU2vy2QaUE5SQadll3uFHErcVy
	 tTGFSx4qlPnXDLZOQBfGZihs5wnOfzmD0/68KDMj4LUc7ROGMwxpyTOVxBbXNLaTtW
	 lqbmHUV9oj2oYgE1kz9njSujvkRqQx2IBfy1xVrduC4PSlEeqfvyx+EwwsEn0R/xCx
	 tEHPwWMeS+3GA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sk2Xx5HRgz4wdF;
	Mon,  4 Dec 2023 10:08:49 +1100 (AEDT)
Date: Mon, 4 Dec 2023 10:08:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
 <andersson@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>, Matti
 =?UTF-8?B?TGVodGltw6RraQ==?= <matti.lehtimaki@gmail.com>
Subject: linux-next: manual merge of the qcom tree with the arm-soc tree
Message-ID: <20231204100848.141cfd29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mr99CGmXgA.EJQSAJWq/VDg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Mr99CGmXgA.EJQSAJWq/VDg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi

between commit:

  4960e06d386e ("ARM: dts: qcom: msm8974: sort nodes by reg")

from the arm-soc tree and commit:

  95053f6bc8ff ("ARM: dts: qcom: msm8974: Add watchdog node")

from the qcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 76006c3c4af2,f7d7e5d70f30..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@@ -346,12 -346,14 +346,20 @@@
  			reg =3D <0xf9011000 0x1000>;
  		};
 =20
 +		saw_l2: power-controller@f9012000 {
 +			compatible =3D "qcom,saw2";
 +			reg =3D <0xf9012000 0x1000>;
 +			regulator;
 +		};
 +
+ 		watchdog@f9017000 {
+ 			compatible =3D "qcom,apss-wdt-msm8974", "qcom,kpss-wdt";
+ 			reg =3D <0xf9017000 0x1000>;
+ 			interrupts =3D <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
+ 				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+ 			clocks =3D <&sleep_clk>;
+ 		};
+=20
  		timer@f9020000 {
  			#address-cells =3D <1>;
  			#size-cells =3D <1>;

--Sig_/Mr99CGmXgA.EJQSAJWq/VDg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVtCoEACgkQAVBC80lX
0GxynAf/a9gewMQ9Sp49Ya67OJ9B3BBWzmhgWXcKOGTHa5cUzF2/0Bakg19+Qqh1
BhtWsO0iRe+hAMVkeNYC+S3wUTqpJ7BsguUkblqCLYAnJDQqEuRFjDJnH3slqfVB
dlpqzS5SPTN7hvRQzYstcU1WlsXeHO/hIoAThFCsJwkTLTmFV6M7RKc8iDue74Mp
MFStQJ5qvqwpg5Tt7OUxZe8mcoTBQuDMbmeXCcK+QMwBmv+SPN/rWdtqz8YxcpKZ
n9stTNAy93cKfJE3JNo2mvZRdrL/YXxHwjAYhXsejxVGH+SwZJ+wDfomB0QZhyel
WEL92f4eqndvXuo72GJBmA/8sZdqAA==
=6Sdq
-----END PGP SIGNATURE-----

--Sig_/Mr99CGmXgA.EJQSAJWq/VDg--

