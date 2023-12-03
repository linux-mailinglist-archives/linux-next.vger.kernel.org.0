Return-Path: <linux-next+bounces-196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE48028E5
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 00:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69440280C9C
	for <lists+linux-next@lfdr.de>; Sun,  3 Dec 2023 23:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CF719465;
	Sun,  3 Dec 2023 23:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nY3bL1hH"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FE0D3;
	Sun,  3 Dec 2023 15:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701644640;
	bh=RA2TwRrP0Ly0mWirQ4+Do/8V1dx1Wtq90aM3EiRJMFM=;
	h=Date:From:To:Cc:Subject:From;
	b=nY3bL1hHbmLdabHCALg6/YpLn2XGtn2D+axxgZVK7noFTovSeu/02mKxSoMn/spHj
	 y2Pm5OOQCQAo+moFRNqX2pvn5u3lG99aa6R0LPY/Xy5/CXdClGzgc9euIna00VSuIU
	 9S1NZqKaL/+uXSniFXawV99uFEmyg0IJQPr2uXbnsDsrxhdRYRS5rgpecnLT6vEQxU
	 dG/f42KMhrrU8nEI0yZMoi5hMPf5sBsfqHx1oeNsBDzN0JgU4MjfbldGUluwsY2O9Y
	 qYsakgnln16QxBj5h7Hj/3As7u1VaddNEZv5yUQ0zXe6X37H03+tEDtKtd7xGEMO1X
	 78fRDYEGlnOMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sk2RL3sXCz4wdC;
	Mon,  4 Dec 2023 10:03:58 +1100 (AEDT)
Date: Mon, 4 Dec 2023 10:03:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Gross <agross@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
 <andersson@kernel.org>, Dominik Kobinski <dominikkobinski314@gmail.com>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Jack Matthews
 <jm5112356@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>, Rayyan Ansari
 <rayyan@ansari.sh>
Subject: linux-next: manual merge of the qcom tree with the arm-soc tree
Message-ID: <20231204100355.0fb43204@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tcmXDN8Gr_q+.xQhDB9Zt9X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tcmXDN8Gr_q+.xQhDB9Zt9X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm/boot/dts/qcom/Makefile

between commits:

  00400a98b2c3 ("ARM: dts: qcom: add device tree for Nokia Lumia 735")
  8677233e5913 ("ARM: dts: qcom: add device tree for Nokia Lumia 830")

from the arm-soc tree and commit:

  be0061dcbac1 ("ARM: dts: qcom: Add support for HTC One Mini 2")

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

diff --cc arch/arm/boot/dts/qcom/Makefile
index a3d293e40820,c13dddd3c683..000000000000
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@@ -32,8 -29,7 +32,9 @@@ dtb-$(CONFIG_ARCH_QCOM) +=3D=20
  	qcom-msm8916-samsung-e7.dtb \
  	qcom-msm8916-samsung-grandmax.dtb \
  	qcom-msm8916-samsung-serranove.dtb \
+ 	qcom-msm8926-htc-memul.dtb \
 +	qcom-msm8926-microsoft-superman-lte.dtb \
 +	qcom-msm8926-microsoft-tesla.dtb \
  	qcom-msm8960-cdp.dtb \
  	qcom-msm8960-samsung-expressatt.dtb \
  	qcom-msm8974-lge-nexus5-hammerhead.dtb \

--Sig_/tcmXDN8Gr_q+.xQhDB9Zt9X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVtCVsACgkQAVBC80lX
0GziYgf/Xl9qd3VvY9UNtETBuXewIBHp+YXvPvfG8mKNgGSCkhNN4InXQd6cJd0K
aTkCFOH+DYlXjNuvxIQ5hbcqkQhYLaRGcxC+67Mn9HxTWXUeGJbYHCYkQ0tfZ2zu
dQNPUMOW5F3M1n9mM9Hr8lC1HiYeri3eCGC2VKM5PcEV3eXWkBHiSSh/WUU1lB6C
BR4jOboPz7z0vCUU/CwO7mAu3Q6PT40vbya1gC/gMIy61YwRSfNqF7S7Ji1EI9yw
xKhREGBhxki8myDA4slpGVkQvcEM2DMdi16m3O7UyKw1LXA0Y7DY2L49s8F+5Byw
tjoDFjWj/4D5d1ZnCh4GiZqh22r/8g==
=bkM3
-----END PGP SIGNATURE-----

--Sig_/tcmXDN8Gr_q+.xQhDB9Zt9X--

