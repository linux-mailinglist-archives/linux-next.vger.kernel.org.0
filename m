Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAE4D84D9
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 02:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfJPAdK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 20:33:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56047 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727579AbfJPAdK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Oct 2019 20:33:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46tCv62Tr6z9sPJ;
        Wed, 16 Oct 2019 11:33:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571185987;
        bh=o+al7iWYbnXmxtWzz1gJLe+9e4eHYLYnN3U22RGXjis=;
        h=Date:From:To:Cc:Subject:From;
        b=kkLcwc7jwBmd3VO5w2NNaBh+3X+lUfNWby5CF2kUzmCHI/pdYrLg1B2lUqcq8/cFj
         yce8XL4sp+SkGM0ByTBwLEPKgrIZNXCTH4l3ILlyVNSVgxct8R+tFWofcwBaCJLGrN
         LgWThpehlH8ywdNxLklxo+5xtP7TnMO/fXa+aRWdjB6FmCMwC7Q18m1fTOWlzj6noY
         /MGkt3eQ4bahgOvDJihbDzveQMrbpqiLf4EEtliuHrT7eg1HFtMz02+1zwV84Tusm8
         htiBH7JBQWwGvVBk67uKC+La62zwPTixXrkcfysB3UHUCAtUURJPlN2HPhrxbGUXkt
         p5bEKlloiXyeg==
Date:   Wed, 16 Oct 2019 11:33:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Naveen M <naveen.m@intel.com>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <20191016113305.626f02e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KvzDIWHhinY.ali5uHqVKNp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KvzDIWHhinY.ali5uHqVKNp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/intel/boards/Kconfig

between commit:

  82e8d723e9e6 ("sound: Fix Kconfig indentation")

from the sound tree and commit:

  47cbea216281 ("ASoC: Intel: eve: Enable mclk and ssp sclk early")

from the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc sound/soc/intel/boards/Kconfig
index 882ff36a7c9c,5e0e7dbd1300..000000000000
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@@ -311,20 -311,21 +311,21 @@@ config SND_SOC_INTEL_KBL_RT5663_MAX9892
  	  If unsure select "N".
 =20
  config SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
 -        tristate "KBL with RT5663, RT5514 and MAX98927 in I2S Mode"
 +	tristate "KBL with RT5663, RT5514 and MAX98927 in I2S Mode"
  	depends on I2C && ACPI
  	depends on MFD_INTEL_LPSS || COMPILE_TEST
 -        depends on SPI
 -        select SND_SOC_RT5663
 -        select SND_SOC_RT5514
 -        select SND_SOC_RT5514_SPI
 -        select SND_SOC_MAX98927
 -        select SND_SOC_HDAC_HDMI
 +	depends on SPI
 +	select SND_SOC_RT5663
 +	select SND_SOC_RT5514
 +	select SND_SOC_RT5514_SPI
 +	select SND_SOC_MAX98927
 +	select SND_SOC_HDAC_HDMI
+ 	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
 -        help
 -          This adds support for ASoC Onboard Codec I2S machine driver. Th=
is will
 -          create an alsa sound card for RT5663 + RT5514 + MAX98927.
 -          Say Y or m if you have such a device. This is a recommended opt=
ion.
 -          If unsure select "N".
 +	help
 +	  This adds support for ASoC Onboard Codec I2S machine driver. This will
 +	  create an alsa sound card for RT5663 + RT5514 + MAX98927.
 +	  Say Y or m if you have such a device. This is a recommended option.
 +	  If unsure select "N".
 =20
  config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
  	tristate "KBL with DA7219 and MAX98357A in I2S Mode"

--Sig_/KvzDIWHhinY.ali5uHqVKNp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2mZUEACgkQAVBC80lX
0Gydngf/QmRZelcDQZVpCgjG855yiudnWq9zzBTbIQRqTFHJ5LxzJcfB1RJS6pPr
wL28tgXZGdB/6pQFgOCsVVd03A5Z0lVBWee9Szo+dnxOLXjdTsuSu1rW6Bk0UTuk
WQ9D6stNb0fhnWmLF/pMRb8mbTsOt+25AWPyDQGx7H7B8V1aLjtvyn2aqC1MXw8G
L2JFH4cx0AzEKav6dfeMy6LBxB9kAY9JsjIeOotB8sYTXcidZvSf/uCDxS/fk05L
oRmZrTxim9PyN6DZFWv2Bunjb8HbwF+mnNPPh46EDp+kctI1N8bb5X7DLwDPiK+k
zwCqKQ1EOPbeB/CDzTouH66qhXKHbg==
=HjCk
-----END PGP SIGNATURE-----

--Sig_/KvzDIWHhinY.ali5uHqVKNp--
