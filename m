Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00E31875C4
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 23:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732838AbgCPWsl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 18:48:41 -0400
Received: from ozlabs.org ([203.11.71.1]:35275 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732837AbgCPWsl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 18:48:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hBKy6d9vz9sNg;
        Tue, 17 Mar 2020 09:48:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584398919;
        bh=7R1vF2L5HQ/2lAhDfjx1Mr2bVwvkLoa1bb8nn1tmw4M=;
        h=Date:From:To:Cc:Subject:From;
        b=lK56xoYj0kQXXiqHbcpDhnn/BVbEKmn7MePIqrLC5x8dt8J/PTodmoF38phZ3fRNG
         Hw+jpmAdp0UrpMXukoFU6xUHq+qtVfHim0RPpdH/ZIPqYSRBsBbTKrb2uIfwI/IvgL
         BKV1XPCo8vFad/AR0M2nn8ClH3iVSpXFxCNgpVscSXjFD1y6u5KbjLtuJQq6SRr6k8
         Hfhu97i73zNjJMwJf0p+YCFeHI5jWKcWl+rOEa+s4XMjnCbDdk9fz4QshEwLsVep38
         KT2s363UW06rGAB+XLar82yT+VXu+QQ7i7xqlK2h+uMAEMZuFRarZ7WrhcJx7s97Wh
         JfTPuOfUp5JBQ==
Date:   Tue, 17 Mar 2020 09:48:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Shawn Guo <shawnguo@kernel.org>, Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: linux-next: manual merge of the renesas tree with the imx-mxs and
 qcom trees
Message-ID: <20200317094833.07a520bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C/qlNtvxLkhzbwYptzmBCJn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C/qlNtvxLkhzbwYptzmBCJn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the renesas tree got a conflict in:

  arch/arm64/configs/defconfig

between commits:

  3fbd82f9af29 ("arm64: defconfig: run through savedefconfig for ordering")
  60f84e65da59 ("arm64: defconfig: Enable NXP flexcan driver")
  d0a9e6319257 ("arm64: defconfig: Enable Truly NT35597 WQXGA panel")

from the imx-mxs and qcom trees and commit:

  bf9e333ec0d5 ("arm64: defconfig: Enable additional support for Renesas pl=
atforms")

from the renesas tree.

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
index ff4bee8c3158,49053323323f..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -164,7 -162,8 +164,9 @@@ CONFIG_QRTR_SMD=3D
  CONFIG_QRTR_TUN=3Dm
  CONFIG_BPF_JIT=3Dy
  CONFIG_CAN=3Dm
 +CONFIG_CAN_FLEXCAN=3Dm
+ CONFIG_CAN_RCAR=3Dm
+ CONFIG_CAN_RCAR_CANFD=3Dm
  CONFIG_BT=3Dm
  CONFIG_BT_HIDP=3Dm
  # CONFIG_BT_HS is not set
@@@ -568,11 -535,13 +575,14 @@@ CONFIG_V4L_MEM2MEM_DRIVERS=3D
  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=3Dm
  CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
+ CONFIG_VIDEO_RENESAS_FDP1=3Dm
  CONFIG_VIDEO_RENESAS_FCP=3Dm
  CONFIG_VIDEO_RENESAS_VSP1=3Dm
+ CONFIG_SDR_PLATFORM_DRIVERS=3Dy
+ CONFIG_VIDEO_RCAR_DRIF=3Dm
  CONFIG_DRM=3Dm
  CONFIG_DRM_I2C_NXP_TDA998X=3Dm
 +CONFIG_DRM_MALI_DISPLAY=3Dm
  CONFIG_DRM_NOUVEAU=3Dm
  CONFIG_DRM_EXYNOS=3Dm
  CONFIG_DRM_EXYNOS5433_DECON=3Dy
@@@ -588,17 -557,21 +598,23 @@@ CONFIG_ROCKCHIP_DW_HDMI=3D
  CONFIG_ROCKCHIP_DW_MIPI_DSI=3Dy
  CONFIG_ROCKCHIP_INNO_HDMI=3Dy
  CONFIG_DRM_RCAR_DU=3Dm
+ CONFIG_DRM_RCAR_DW_HDMI=3Dm
  CONFIG_DRM_SUN4I=3Dm
 +CONFIG_DRM_SUN6I_DSI=3Dm
  CONFIG_DRM_SUN8I_DW_HDMI=3Dm
  CONFIG_DRM_SUN8I_MIXER=3Dm
  CONFIG_DRM_MSM=3Dm
  CONFIG_DRM_TEGRA=3Dm
+ CONFIG_DRM_PANEL_LVDS=3Dm
  CONFIG_DRM_PANEL_SIMPLE=3Dm
 +CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=3Dm
+ CONFIG_DRM_DUMB_VGA_DAC=3Dm
  CONFIG_DRM_SII902X=3Dm
+ CONFIG_DRM_THINE_THC63LVD1024=3Dm
  CONFIG_DRM_TI_SN65DSI86=3Dm
  CONFIG_DRM_I2C_ADV7511=3Dm
+ CONFIG_DRM_DW_HDMI_AHB_AUDIO=3Dm
+ CONFIG_DRM_DW_HDMI_CEC=3Dm
  CONFIG_DRM_VC4=3Dm
  CONFIG_DRM_ETNAVIV=3Dm
  CONFIG_DRM_HISI_HIBMC=3Dm
@@@ -759,7 -728,9 +776,8 @@@ CONFIG_COMMON_CLK_RK808=3D
  CONFIG_COMMON_CLK_SCPI=3Dy
  CONFIG_COMMON_CLK_CS2000_CP=3Dy
  CONFIG_COMMON_CLK_S2MPS11=3Dy
 -CONFIG_CLK_QORIQ=3Dy
  CONFIG_COMMON_CLK_PWM=3Dy
+ CONFIG_COMMON_CLK_VC5=3Dy
  CONFIG_CLK_RASPBERRYPI=3Dm
  CONFIG_CLK_IMX8MM=3Dy
  CONFIG_CLK_IMX8MN=3Dy
@@@ -843,8 -808,10 +861,9 @@@ CONFIG_ARCH_K3_J721E_SOC=3D
  CONFIG_TI_SCI_PM_DOMAINS=3Dy
  CONFIG_EXTCON_USB_GPIO=3Dy
  CONFIG_EXTCON_USBC_CROS_EC=3Dy
 -CONFIG_MEMORY=3Dy
  CONFIG_IIO=3Dy
  CONFIG_EXYNOS_ADC=3Dy
+ CONFIG_MAX9611=3Dm
  CONFIG_QCOM_SPMI_ADC5=3Dm
  CONFIG_ROCKCHIP_SARADC=3Dm
  CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dm
@@@ -938,12 -900,12 +957,13 @@@ CONFIG_NLS_ISO8859_1=3D
  CONFIG_SECURITY=3Dy
  CONFIG_CRYPTO_ECHAINIV=3Dy
  CONFIG_CRYPTO_ANSI_CPRNG=3Dy
 +CONFIG_CRYPTO_USER_API_RNG=3Dm
  CONFIG_CRYPTO_DEV_SUN8I_CE=3Dm
  CONFIG_CRYPTO_DEV_FSL_CAAM=3Dm
 -CONFIG_CRYPTO_DEV_HISI_ZIP=3Dm
 -CONFIG_CRYPTO_USER_API_RNG=3Dm
 +CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=3Dm
  CONFIG_CRYPTO_DEV_QCOM_RNG=3Dm
 +CONFIG_CRYPTO_DEV_HISI_ZIP=3Dm
+ CONFIG_CRYPTO_DEV_CCREE=3Dm
  CONFIG_CMA_SIZE_MBYTES=3D32
  CONFIG_PRINTK_TIME=3Dy
  CONFIG_DEBUG_INFO=3Dy

--Sig_/C/qlNtvxLkhzbwYptzmBCJn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5wAkEACgkQAVBC80lX
0GxDygf9FVX0pM5JpU8+cKOnnWh4Mt7HDm98ht56BaBxBmEtNgV403biSU+cI5dx
s5TJ7HRWlL5zLdig2QKAPmS8YH0uXM2EAmsXZ0S2djsSDuyYyaRTT5Zo5Wmgg+SO
/98/gc3/YpEw6HFp8D/lZ+u9Dz6vXeuEocR2TGD29uMUVuzV52/wRwNrpuMyKRgN
riYbFubt9QjFgTQptlInZcamIwXcgJYRejAQRljqyHe0mxvS0Evv5mcsLQOyeYnz
udaS7WNBDNuuCoxYOVXrWkhnGRZZW+vtHXm19c/gt/QuKcDMisMsam//8WEACb31
nbn0t6HeuSMB5/j12BzT8yE9MrSFbw==
=SlW7
-----END PGP SIGNATURE-----

--Sig_/C/qlNtvxLkhzbwYptzmBCJn--
