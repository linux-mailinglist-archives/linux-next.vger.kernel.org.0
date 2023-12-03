Return-Path: <linux-next+bounces-199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA0F8028FE
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 00:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 338C5B207BD
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 23:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE8D11733;
	Sun,  3 Dec 2023 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vz9BTVvS"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775BFD7;
	Sun,  3 Dec 2023 15:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701646209;
	bh=sGtCm9VN4sBJw73BJlfV7lvCeumu4M9l0AWBz20SXSA=;
	h=Date:From:To:Cc:Subject:From;
	b=Vz9BTVvSQpt0QZpgOvdHKX6FXIC5TKMV5Manp5qYAvikxvfPV3+OfkTPncfOE+YtQ
	 eLt7u93xOMHj1tXen7CVFIzVaQg5M2UjSEwUAJHonGd9jxOUxalIqeuFmZCGiH/f4u
	 XgDpZMVeBaN2MTmF4WiC2YireGEIppQHjJ8omGaJl4wnBPWWOrYrHPoQBywVnb9JNJ
	 hUJHaLi9aOdFI/zjD9F5Ijk1XqKpIBmk55U2vxdh2oQN64sRtQATQcylHb+COeTLUB
	 rhOuIuJEP27HlIrhDa5mcAyT3eS8rWyOMjcFjejRTlG7o/x9oLBC4rAjSmvdZkX6Te
	 ycGaFf71IWNKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sk31X5TF1z4xKZ;
	Mon,  4 Dec 2023 10:30:08 +1100 (AEDT)
Date: Mon, 4 Dec 2023 10:30:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dominik Kobinski
 <dominikkobinski314@gmail.com>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, Jack Matthews <jm5112356@gmail.com>, Rayyan
 Ansari <rayyan@ansari.sh>, ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <20231204103008.7c9d1e68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YgWZP9Mi5FY/KMGKVKrDfmf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YgWZP9Mi5FY/KMGKVKrDfmf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey=
.dts:11:
arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi:12:10: fatal erro=
r: qcom-pm8226.dtsi: No such file or directory
   12 | #include "qcom-pm8226.dtsi"
      |          ^~~~~~~~~~~~~~~~~~
In file included from arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superma=
n-lte.dts:11:
arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi:12:10: fatal erro=
r: qcom-pm8226.dtsi: No such file or directory
   12 | #include "qcom-pm8226.dtsi"
      |          ^~~~~~~~~~~~~~~~~~
arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts:9:10: fatal error: qcom-p=
m8226.dtsi: No such file or directory
    9 | #include "qcom-pm8226.dtsi"
      |          ^~~~~~~~~~~~~~~~~~
In file included from arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepea=
ce.dts:11:
arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi:12:10: fatal erro=
r: qcom-pm8226.dtsi: No such file or directory
   12 | #include "qcom-pm8226.dtsi"
      |          ^~~~~~~~~~~~~~~~~~
In file included from arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneype=
nny.dts:11:
arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi:12:10: fatal erro=
r: qcom-pm8226.dtsi: No such file or directory
   12 | #include "qcom-pm8226.dtsi"
      |          ^~~~~~~~~~~~~~~~~~
In file included from arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.d=
ts:11:
arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi:12:10: fatal erro=
r: qcom-pm8226.dtsi: No such file or directory
   12 | #include "qcom-pm8226.dtsi"
      |          ^~~~~~~~~~~~~~~~~~

Caused by commit

  455a4c46e023 ("ARM: dts: qcom: strip prefix from PMIC files")

interacting with commits

  244281556a11 ("ARM: dts: qcom: add common dt for MSM8x26 Lumias along wit=
h Nokia Lumia 630")

from the arm-soc tree.

Since I have reverted the gcom tree for another build failure today,
I will fix this up tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/YgWZP9Mi5FY/KMGKVKrDfmf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVtD4AACgkQAVBC80lX
0GwlbAf/QwWe3qadpb5U9ukiozzp7WOqfOT3y3EsTQfje4TlCYyluOLYqb89bb+8
0GGsxeBYr4l1VCXVsh4Mx2jqeKC8mkfml+p+yRUUxKGzHpT0aA8EEZQl9+/1Yk5t
pDJWafvs3Z+5NgRHEE0jlf6dZkqmYaETAdypY1zc7vQVehxYZ2tzdejb+OwMBVJB
qoIlSoWYKpHnspBizrdt80LVw/lk8ylZ5LTaze/sjV+rIPEp1eTuDA9cA2lDW1VK
kYdgyHxJHjDm+jU9o7I5CLW+czrjrvBdocfgAYEk0oTLUhmykwtA3nAjTv/Lv1kZ
XgHnyiVm5v2Lamx02n6FYDCG37wDsg==
=y+Qt
-----END PGP SIGNATURE-----

--Sig_/YgWZP9Mi5FY/KMGKVKrDfmf--

