Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1CDDB9A9
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 00:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403959AbfJQWVR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 18:21:17 -0400
Received: from ozlabs.org ([203.11.71.1]:57779 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388926AbfJQWVR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Oct 2019 18:21:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vNt20NFPz9sP3;
        Fri, 18 Oct 2019 09:21:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571350874;
        bh=+xNI/izo+oEF7ZVHXnsd65aDt7mIJZA3YoA5Ho3A6nY=;
        h=Date:From:To:Cc:Subject:From;
        b=f1f/EC99WEbF1GMsbzUtUyOEdS+UFfEGinjVVnKu30uAmJw5HJUs45vU+V98Wria0
         yr6TRVF7syL26LB84sPIJwBc82BwWO3YqgFzNIip7QG52I0Pbfks1H4QK/cJCaXxHt
         QZvbamKt0EQRkF822EwfsXKMu7avatGVAPgDVfNoPgQNv8aBolCXUpLNGJr+5qumbY
         NroGgjVLZGEZmBUDQz2UWGg2m7kMy8+38a4enYVVm5TW9H6rjZMTe4Q514MwwRrdt0
         6ZpfOsqheQT+g9UynCp8KtxKxorcnzwB3KMcdL7yZtfFS89bXAq6kiPwQabTt42D+W
         waPmLcraEYxIw==
Date:   Fri, 18 Oct 2019 09:20:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: linux-next: manual merge of the clk tree with the imx-mxs tree
Message-ID: <20191018092056.53500e75@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0ZbPSUm+R+oFM9TfRuR9Ok0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0ZbPSUm+R+oFM9TfRuR9Ok0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  drivers/clk/imx/clk-imx8mn.c

between commit:

  0ae4fbc63c31 ("clk: imx8mn: Use common 1443X/1416X PLL clock structure")

from the imx-mxs tree and commit:

  727e12cde9f6 ("clk: imx: imx8mn: drop unused pll enum")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/clk/imx/clk-imx8mn.c
index 7a5590b967d5,ccd05321f043..000000000000
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@@ -25,20 -25,75 +25,6 @@@ static u32 share_count_disp
  static u32 share_count_pdm;
  static u32 share_count_nand;
 =20
- enum {
- 	ARM_PLL,
- 	GPU_PLL,
- 	VPU_PLL,
- 	SYS_PLL1,
- 	SYS_PLL2,
- 	SYS_PLL3,
- 	DRAM_PLL,
- 	AUDIO_PLL1,
- 	AUDIO_PLL2,
- 	VIDEO_PLL2,
- 	NR_PLLS,
 -static const struct imx_pll14xx_rate_table imx8mn_pll1416x_tbl[] =3D {
 -	PLL_1416X_RATE(1800000000U, 225, 3, 0),
 -	PLL_1416X_RATE(1600000000U, 200, 3, 0),
 -	PLL_1416X_RATE(1500000000U, 375, 3, 1),
 -	PLL_1416X_RATE(1400000000U, 350, 3, 1),
 -	PLL_1416X_RATE(1200000000U, 300, 3, 1),
 -	PLL_1416X_RATE(1000000000U, 250, 3, 1),
 -	PLL_1416X_RATE(800000000U,  200, 3, 1),
 -	PLL_1416X_RATE(750000000U,  250, 2, 2),
 -	PLL_1416X_RATE(700000000U,  350, 3, 2),
 -	PLL_1416X_RATE(600000000U,  300, 3, 2),
 -};
 -
 -static const struct imx_pll14xx_rate_table imx8mn_audiopll_tbl[] =3D {
 -	PLL_1443X_RATE(393216000U, 262, 2, 3, 9437),
 -	PLL_1443X_RATE(361267200U, 361, 3, 3, 17511),
 -};
 -
 -static const struct imx_pll14xx_rate_table imx8mn_videopll_tbl[] =3D {
 -	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
 -	PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
 -};
 -
 -static const struct imx_pll14xx_rate_table imx8mn_drampll_tbl[] =3D {
 -	PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_audio_pll =3D {
 -		.type =3D PLL_1443X,
 -		.rate_table =3D imx8mn_audiopll_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_audiopll_tbl),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_video_pll =3D {
 -		.type =3D PLL_1443X,
 -		.rate_table =3D imx8mn_videopll_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_videopll_tbl),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_dram_pll =3D {
 -		.type =3D PLL_1443X,
 -		.rate_table =3D imx8mn_drampll_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_drampll_tbl),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_arm_pll =3D {
 -		.type =3D PLL_1416X,
 -		.rate_table =3D imx8mn_pll1416x_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_pll1416x_tbl),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_gpu_pll =3D {
 -		.type =3D PLL_1416X,
 -		.rate_table =3D imx8mn_pll1416x_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_pll1416x_tbl),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_vpu_pll =3D {
 -		.type =3D PLL_1416X,
 -		.rate_table =3D imx8mn_pll1416x_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_pll1416x_tbl),
 -};
 -
 -static struct imx_pll14xx_clk imx8mn_sys_pll =3D {
 -		.type =3D PLL_1416X,
 -		.rate_table =3D imx8mn_pll1416x_tbl,
 -		.rate_count =3D ARRAY_SIZE(imx8mn_pll1416x_tbl),
--};
--
  static const char * const pll_ref_sels[] =3D { "osc_24m", "dummy", "dummy=
", "dummy", };
  static const char * const audio_pll1_bypass_sels[] =3D {"audio_pll1", "au=
dio_pll1_ref_sel", };
  static const char * const audio_pll2_bypass_sels[] =3D {"audio_pll2", "au=
dio_pll2_ref_sel", };

--Sig_/0ZbPSUm+R+oFM9TfRuR9Ok0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2o6UgACgkQAVBC80lX
0Gw0Pgf9Gys26CCFsELgvNekrkEmnRC4e92+uxqyHzLtKBtZ3R6BrTVb7APIuwU2
OE7YNRgbQhhk9pWcg5ON5uNU3FSorXnU3Z2dqod9vMsUz3UF20Sgn8Lry8NhCwC6
pOpNnbBRpsEtVG0evT0eYrf6sgE6Fb8oMcpZanxy27POW/q1OABPP5OzWE4agMGo
7ObO0PtcEzqnX20Kfx9JQLcy7P9S+VG0hUIjRU5Urkt2jBkapbpgfdVxVKqH8j/T
cqAHmb9D+H3qMPiBVY2kNCC0rK7MryNv/fdH+UKXdF5ldm2jArabpfpTu2QmDDRl
c3qu0Ux4fS76yGh90YUBOAXvIhqkIA==
=UMPV
-----END PGP SIGNATURE-----

--Sig_/0ZbPSUm+R+oFM9TfRuR9Ok0--
