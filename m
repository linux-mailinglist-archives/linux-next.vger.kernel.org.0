Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C13183C6E
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 23:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgCLW2O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 18:28:14 -0400
Received: from ozlabs.org ([203.11.71.1]:35053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgCLW2O (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 18:28:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dk4B5czqz9sPF;
        Fri, 13 Mar 2020 09:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584052091;
        bh=63PdcdFvxOn7maIsNxv4gPOidzgydD7v9/ZPumiuoMM=;
        h=Date:From:To:Cc:Subject:From;
        b=XpmmFK/Oxw7VscPXVbd67VKM/yVOi/aZU3p9Abb+nFd4F1dXvxk6qsl7PiVK6FTxR
         mSITjul6a5oeEGwJkXTtIIdxxw6BDLUSLo9v1fwlGCGTYuGdWb5wfuPU/O1Y1y82O/
         TyMn4dhru1Ms5p/aifDgZqZF6Ot+x89u6cbfWOdotwcDMOfki/MfqWUj0XAMHh7U+P
         Iq5NmqWb/C/+H1S3br+PTbr+CBp/0NaLQjzJLjF+TDWVFoC29H5v3LIC5GwGFE0wKz
         1QwHgXKjsEsyIw3P9NTdtCvqbG3YmDfXQms8WE/jaLjsBPUtE7Qsnbu/gSszkEKPDQ
         eJBqBhSbZFqJQ==
Date:   Fri, 13 Mar 2020 09:28:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: linux-next: manual merge of the renesas tree with the qcom tree
Message-ID: <20200313092807.0a3383fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SW69qZ2xMjwdUh.LvCNEsy_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SW69qZ2xMjwdUh.LvCNEsy_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the renesas tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  d0a9e6319257 ("arm64: defconfig: Enable Truly NT35597 WQXGA panel")

from the qcom tree and commit:

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
index b4f42c04f936,49053323323f..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -552,17 -557,21 +563,23 @@@ CONFIG_ROCKCHIP_DW_HDMI=3D
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

--Sig_/SW69qZ2xMjwdUh.LvCNEsy_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5qt3cACgkQAVBC80lX
0GwQpAf/ec1dVSAg5OX93J5VFJVu7RPjGKGi7XTA3IdMF/ga9h6y5tPUC/pfn4sb
Q58eKMDrmLxwu9ChptvXEVZm6UklJvXcYmazHQRxh4O1MzALtK8ni5uhDVLWypT2
QxJP8HUENObw7CKeRhSKzod43Vet9SwnKW9uGAryhE5hy2WkUcJeMJltAEjuvgRh
r2jZm6J2r4Jhs4/TVihKSAmoNucGLXUNjy3/eW3Q+BwtXLVQrzcNE0DnpjTjlQoL
iitZg/72+t6UrAofUx4bCt3qy6Gs1G0h/DVFpL+01kHXQGwcAhjkEggKddnBkNc8
A11CIt/CcPbxd4nQRsDLd3zpswlOnw==
=lZxv
-----END PGP SIGNATURE-----

--Sig_/SW69qZ2xMjwdUh.LvCNEsy_--
