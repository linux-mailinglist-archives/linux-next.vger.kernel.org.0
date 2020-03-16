Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D52031875B6
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 23:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732835AbgCPWb4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 18:31:56 -0400
Received: from ozlabs.org ([203.11.71.1]:33075 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732785AbgCPWb4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 18:31:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48h9yd0vR7z9sPF;
        Tue, 17 Mar 2020 09:31:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584397913;
        bh=LGX3AdqZzyzLOEua6P7UOCgahPZcme0H+kHaEsv/suU=;
        h=Date:From:To:Cc:Subject:From;
        b=FrdMwbYxtxXUW1vLuTgkCPpGAx/ErMuldSbxm/IYGbRowhLq25z3ud+F465zjm3i4
         lwHttDaoli9v4xidjGEzSVcoA1TXeWgRfdjwIFMd3aHvHcDMW0goe0Xw0NK2VmqnD0
         LypsB2sou1xqAi4pZ/Eew7THKe4ap2HgZ+BYMGHPkIgpdJcBpHhSxakS0kQDYVhKMJ
         iYdmp1pZQHW09Es3FBkfk1yMNUFCQGClENsEwRg/utt97KqjYt3bQhACY6G88+NVVY
         z9ZYidNaZbl31DcK+kPZhek5IR0p5s7b6hA8gZ75OGzkxLPC95NExnryjgS0KJli3e
         uv2qFFfdXZP6A==
Date:   Tue, 17 Mar 2020 09:31:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: linux-next: manual merge of the qcom tree with the imx-mxs tree
Message-ID: <20200317093151.2b2aa227@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L2hIOezLj76HDzJTGDnB4=H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L2hIOezLj76HDzJTGDnB4=H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  97c1ed02f765 ("arm64: defconfig: Enable PHY devices used on QorIQ boards")

from the imx-mxs tree and commit:

  1788e7a93207 ("arm64: defconfig: Enable Qualcomm SDM845 audio configs")

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
index 8a7e1bea71ba,d74d237498d8..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -792,12 -763,13 +803,14 @@@ CONFIG_QCOM_SYSMON=3D
  CONFIG_RPMSG_QCOM_GLINK_RPM=3Dy
  CONFIG_RPMSG_QCOM_GLINK_SMEM=3Dm
  CONFIG_RPMSG_QCOM_SMD=3Dy
+ CONFIG_SOUNDWIRE=3Dm
+ CONFIG_SOUNDWIRE_QCOM=3Dm
  CONFIG_OWL_PM_DOMAINS=3Dy
  CONFIG_RASPBERRYPI_POWER=3Dy
 +CONFIG_FSL_DPAA=3Dy
 +CONFIG_FSL_MC_DPIO=3Dy
  CONFIG_IMX_SCU_SOC=3Dy
  CONFIG_QCOM_AOSS_QMP=3Dy
 -CONFIG_QCOM_COMMAND_DB=3Dy
  CONFIG_QCOM_GENI_SE=3Dy
  CONFIG_QCOM_GLINK_SSR=3Dm
  CONFIG_QCOM_RMTFS_MEM=3Dm
@@@ -892,7 -866,9 +906,10 @@@ CONFIG_FPGA_REGION=3D
  CONFIG_OF_FPGA_REGION=3Dm
  CONFIG_TEE=3Dy
  CONFIG_OPTEE=3Dy
 +CONFIG_MUX_MMIO=3Dy
+ CONFIG_SLIMBUS=3Dm
+ CONFIG_SLIM_QCOM_CTRL=3Dm
+ CONFIG_SLIM_QCOM_NGD_CTRL=3Dm
  CONFIG_EXT2_FS=3Dy
  CONFIG_EXT3_FS=3Dy
  CONFIG_EXT4_FS_POSIX_ACL=3Dy

--Sig_/L2hIOezLj76HDzJTGDnB4=H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5v/lcACgkQAVBC80lX
0GzcbAf/bfFuHKR4oxSEMoJggkJXxVeCNCQ8wSp+O3ue4mam0RtwlAH6LEVJXAbi
Q9q6P/L72L0SM1KDKLOv/1+704dmo6R6aAkuh3jwCR4h8BgyTWLrYfWkeEnEN+Bl
HgXftgVdxsopQuSkRmIPjgMp0obJXkPDBT4S8kRV+zJ2lVpY79pc7NcPS6MJ297s
Y15xL1X5jgtvGrQJvJrZBmjXHp3RlymZAjRxVQyDbbmXbbH8bCWIdNWGynjknm6S
+EGZ5C8fkAce2tmtn006ieB2nWasK1cO03r4J6f2Tf2Qbd3ieFUselCWVxvo0IvQ
w9drF5HZ10lmJMWPtl3K0b8TbKUk4Q==
=HW+C
-----END PGP SIGNATURE-----

--Sig_/L2hIOezLj76HDzJTGDnB4=H--
