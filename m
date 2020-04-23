Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A04A1B5475
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 07:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgDWFzp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 01:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725867AbgDWFzp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 01:55:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59E5C03C1AB;
        Wed, 22 Apr 2020 22:55:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49763d2KYbz9sSX;
        Thu, 23 Apr 2020 15:55:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587621341;
        bh=slE228bClNFBb83vj8nkcvqe88aB0x2HgjApDnwqDoU=;
        h=Date:From:To:Cc:Subject:From;
        b=Ul6jLq0DC9C1EL9+E+ndxnkCq2sQ0st7NiprWGMl8brdrxeg9dbkYOjOrj9/zOSJ1
         zmvfCr9PovcpS5bmKBcum9vIrz3rFAWcY33KeiVHHwGZF0p5dU1RM6GQ3afkoKqyIk
         Zpd23r+VB0/TZpGje1kuFQAqCzGVA1OLH0HtETbnyf0NwLnODaAhe/6QlxqVqO/LY8
         zEAOSI6nNK5ZPg/DiCNwjJaV6NTjNwxl7F4FNhu4OslDFVGu6v2AN3/R4lOTN/r5ZC
         p1rnQ3nLK4d1UiwfsVOZ3Bz08Pet/XdOZlJ00E07JHbNZAACHEunCGIt2nbC2EVBWu
         5frrln34uBU1Q==
Date:   Thu, 23 Apr 2020 15:55:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20200423155539.4492a0cc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bl+rCNpls8skX6+7ip7ufDf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bl+rCNpls8skX6+7ip7ufDf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: sound/soc/sof/imx/imx8.o: in function `.imx8_run':
imx8.c:(.text.imx8_run+0x40): undefined reference to `.imx_sc_misc_set_cont=
rol'
ld: imx8.c:(.text.imx8_run+0xac): undefined reference to `.imx_sc_pm_cpu_st=
art'
ld: sound/soc/sof/imx/imx8.o: in function `.imx8x_run':
imx8.c:(.text.imx8x_run+0x40): undefined reference to `.imx_sc_misc_set_con=
trol'
ld: imx8.c:(.text.imx8x_run+0xa8): undefined reference to `.imx_sc_misc_set=
_control'
ld: imx8.c:(.text.imx8x_run+0x108): undefined reference to `.imx_sc_misc_se=
t_control'
ld: imx8.c:(.text.imx8x_run+0x168): undefined reference to `.imx_sc_misc_se=
t_control'
ld: imx8.c:(.text.imx8x_run+0x1cc): undefined reference to `.imx_sc_pm_cpu_=
start'
ld: sound/soc/sof/imx/imx8.o: in function `.imx8_probe':
imx8.c:(.text.imx8_probe+0x2c8): undefined reference to `.imx_scu_get_handl=
e'

Presumably caused by (one of) commits

  fe17e6cdc0fe ("ASoC: SOF: imx8: Fix randbuild error")
  cb0312f61c3e ("ASoC: SOF: imx: fix undefined reference issue")

I just removed the COMPILE_TEST from SND_SOC_SOF_IMX_TOPLEVEL for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/bl+rCNpls8skX6+7ip7ufDf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6hLdsACgkQAVBC80lX
0GwlDAf9Hc41iMLQhH/rt1Gh5f5yR2JT/gyNDU8+wX+1Ybwb1YjVSRswQHM+8GPA
EddyYrSs6QlI8VI1TZtLEJ4y4cIh5yL3AUbu5oYEby+mMZPk893Ywp6hEgw8F5ua
FT25sQ9CzBccpvzFkj3PZ8fMPfVa/wc3igXCcO1vvHQLDYD2RJoRve+qaucTmreF
IMce/S9ovjIVVC+tdBWGT+PNuvwOBQP5FeRCGmNWzNr9JxrFXzbF0deIJUUC2cE7
vnJWxo434D5Nr50UM/60gzvxouAGMCuU21tyWbywOXkO8RrTBp1wxR3VSj0CFVWz
a/eRsQqYdejCsT+4Kr7RRIMvmWOzww==
=r0bR
-----END PGP SIGNATURE-----

--Sig_/bl+rCNpls8skX6+7ip7ufDf--
