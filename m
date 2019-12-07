Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3B89115A70
	for <lists+linux-next@lfdr.de>; Sat,  7 Dec 2019 01:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfLGAzr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Dec 2019 19:55:47 -0500
Received: from ozlabs.org ([203.11.71.1]:40719 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726371AbfLGAzq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Dec 2019 19:55:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47V9xC5569z9sPh;
        Sat,  7 Dec 2019 11:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575680144;
        bh=fIM+c7NF11gHkrBg2Z6w8EPAhYQU9tXCQkPx+qL/hNE=;
        h=Date:From:To:Cc:Subject:From;
        b=egLBvtiesCCHPpFYl9hXads8FuSJPJDJgXwiMaDiCZqf7ctt+UL45etrOFcluE/Ke
         GYSETySbpZGg+ui5jk2yleOE552uPOYuAk8eKHRomZWG4P+KCKDujrdsz7ZBVWLWed
         f6Rg6iJV958HaJo+WOAmdGxdzmxWrDNFSpMf9entZwtCvFlMCyoIKJY08u/rBA/Hd7
         pUEni+JO8WJhVXCmJitmnkUaUVo34iEv3KZmrNQ6voKv/JYLRLREzx+PM7BiLrgm4A
         EEIcevH54D8PXFfBIuknYnK0mmURDxjHIJsoPq6JbJM2ca/S/VYnocwStoftuu//w8
         ioog9tMC2M7Jw==
Date:   Sat, 7 Dec 2019 11:55:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: linux-next: manual merge of the qcom tree with Linus' tree
Message-ID: <20191207115540.0b3cd670@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IbnW.ulPLbU42pZ+AzF1//6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IbnW.ulPLbU42pZ+AzF1//6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  f693ff65c36e ("arm64: defconfig: re-run savedefconfig")

from Linus' tree and commits:

  b32576da47af ("arm64: defconfig: Enable Qualcomm remoteproc dependencies")
  ca1561a3d8e4 ("arm64: defconfig: Enable Qualcomm pseudo rng")

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

diff --cc arch/arm64/configs/defconfig
index 6a83ba2aea3e,0de751801c98..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -387,10 -392,12 +389,12 @@@ CONFIG_SPI_MESON_SPIFC=3D
  CONFIG_SPI_ORION=3Dy
  CONFIG_SPI_PL022=3Dy
  CONFIG_SPI_ROCKCHIP=3Dy
+ CONFIG_SPI_QCOM_QSPI=3Dm
  CONFIG_SPI_QUP=3Dy
+ CONFIG_SPI_QCOM_GENI=3Dm
  CONFIG_SPI_S3C64XX=3Dy
 -CONFIG_SPI_SPIDEV=3Dm
  CONFIG_SPI_SUN6I=3Dy
 +CONFIG_SPI_SPIDEV=3Dm
  CONFIG_SPMI=3Dy
  CONFIG_PINCTRL_SINGLE=3Dy
  CONFIG_PINCTRL_MAX77620=3Dy
@@@ -728,15 -738,19 +734,19 @@@ CONFIG_RPMSG_QCOM_GLINK_SMEM=3D
  CONFIG_RPMSG_QCOM_SMD=3Dy
  CONFIG_RASPBERRYPI_POWER=3Dy
  CONFIG_IMX_SCU_SOC=3Dy
+ CONFIG_QCOM_AOSS_QMP=3Dy
 -CONFIG_QCOM_COMMAND_DB=3Dy
  CONFIG_QCOM_GENI_SE=3Dy
  CONFIG_QCOM_GLINK_SSR=3Dm
+ CONFIG_QCOM_RMTFS_MEM=3Dm
  CONFIG_QCOM_RPMH=3Dy
+ CONFIG_QCOM_RPMHPD=3Dy
  CONFIG_QCOM_SMEM=3Dy
  CONFIG_QCOM_SMD_RPM=3Dy
  CONFIG_QCOM_SMP2P=3Dy
  CONFIG_QCOM_SMSM=3Dy
+ CONFIG_QCOM_SOCINFO=3Dm
  CONFIG_ARCH_R8A774A1=3Dy
 +CONFIG_ARCH_R8A774B1=3Dy
  CONFIG_ARCH_R8A774C0=3Dy
  CONFIG_ARCH_R8A7795=3Dy
  CONFIG_ARCH_R8A7796=3Dy
@@@ -844,8 -860,9 +856,10 @@@ CONFIG_NLS_ISO8859_1=3D
  CONFIG_SECURITY=3Dy
  CONFIG_CRYPTO_ECHAINIV=3Dy
  CONFIG_CRYPTO_ANSI_CPRNG=3Dy
 +CONFIG_CRYPTO_DEV_SUN8I_CE=3Dm
 +CONFIG_CRYPTO_DEV_HISI_ZIP=3Dm
+ CONFIG_CRYPTO_USER_API_RNG=3Dm
+ CONFIG_CRYPTO_DEV_QCOM_RNG=3Dm
 -CONFIG_DMA_CMA=3Dy
  CONFIG_CMA_SIZE_MBYTES=3D32
  CONFIG_PRINTK_TIME=3Dy
  CONFIG_DEBUG_INFO=3Dy

--Sig_/IbnW.ulPLbU42pZ+AzF1//6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3q+IwACgkQAVBC80lX
0GyC6gf+Lji27RR8PFixADSDL+kP1Mz0Owlfa+zMrBpiTlLdSoXYcFPM3dhpXGj6
ZjYt/JssTR15BmyT34rW2EDA3mq8yT8pRVnr6fyVmcV2G5o0vOewIWhafIdT4LQh
CsxUP205CmZ8aqsLTD+A/S05Ekh1VQO2hLrfvIgVGcRdBdWBEQvSsCLBrAkmtFK+
z9TubeCoDB0/RcK4bkwqVCVg3Ycj1utQaYlHN98FQobyDsOvQkq7WpkvKaizY+Ba
oyWmvwOI2sPAGY6g5+jAAmN3Ik6g/wab6KRLcXvIIcZIE1F7wvoaG0tRdt3E6T14
tIYGIx+sEoaBzUaouhqPqeh4AMwHLA==
=89Md
-----END PGP SIGNATURE-----

--Sig_/IbnW.ulPLbU42pZ+AzF1//6--
