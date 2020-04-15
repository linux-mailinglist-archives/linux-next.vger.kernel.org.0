Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3071A90CE
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 04:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392895AbgDOCPa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 22:15:30 -0400
Received: from ozlabs.org ([203.11.71.1]:44089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387984AbgDOCP0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 22:15:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4925Y71G2Vz9sSM;
        Wed, 15 Apr 2020 12:15:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586916925;
        bh=GwSJW9qwj3VQE9O/y6ASuL4ZsieXgmyfhkDAyg2RkAk=;
        h=Date:From:To:Cc:Subject:From;
        b=l+uunWU9SSUUDyiYdZlKPCCnSDV2E5J3t+nlXpnsKaOqU8uR96eiu0o8lnu0j3acO
         yTZdiqZK3rFr+JzyMjC7cyIIqiP1a2qfiS852NYOqullGpcd++DLU0i9zDoKSNJHqm
         WQRBi+Zn5UZ5Is/BQtdKx5FTgu6xClM8g0V+Xbch/RXPCDjHxXLs5ncsfyWqxLAj/n
         NbGbBkNcKNtLI1qtlOwyTkDKU43MPXl4FnZSo2UCwxz4b3P+6cSfdZM6HydKCfyOV7
         YECSZWMuDvTSHmBMYdT66o7ZeYjXBv9CgMXM94uWekCc2L/gDPZ+BcMMgVIxO0YEqJ
         4Nj5sWRbbEAjg==
Date:   Wed, 15 Apr 2020 12:15:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hui Wang <hui.wang@canonical.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: build failures after merge of the sound-asoc tree
Message-ID: <20200415121521.3e40b591@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uPk4X/ZD9LzKl7nBfW8dLg_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uPk4X/ZD9LzKl7nBfW8dLg_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

sound/soc/intel/boards/skl_hda_dsp_generic.c: In function 'skl_set_hda_code=
c_autosuspend_delay':
sound/soc/intel/boards/skl_hda_dsp_generic.c:178:37: error: 'struct snd_soc=
_pcm_runtime' has no member named 'codec_dai'
  178 |  struct snd_soc_dai *codec_dai =3D rtd->codec_dai;
      |                                     ^~
drivers/soundwire/intel.c: In function 'sdw_stream_setup':
drivers/soundwire/intel.c:672:39: error: 'struct snd_soc_pcm_runtime' has n=
o member named 'codec_dais'
  672 |   ret =3D snd_soc_dai_set_sdw_stream(rtd->codec_dais[i], sdw_stream,
      |                                       ^~
In file included from include/linux/device.h:15,
                 from include/linux/acpi.h:15,
                 from drivers/soundwire/intel.c:8:
drivers/soundwire/intel.c:676:8: error: 'struct snd_soc_pcm_runtime' has no=
 member named 'codec_dais'
  676 |     rtd->codec_dais[i]->name);
      |        ^~
include/linux/dev_printk.h:104:32: note: in definition of macro 'dev_err'
  104 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                ^~~~~~~~~~~

Caused by commit

  1729025b04b9 ("ASoC: soc-core: remove cpu_dai/codec_dai/cpu_dais/codec_da=
is")

interacting with commit

  3a24f135e6cc ("ASoC: intel/skl/hda - set autosuspend timeout for hda code=
cs")

(which should have been fixed up in commit

  df3e71c42f05 ("Merge series "ASoC: Intel: machine drivers update for 5.8"=
 from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:")

or before like other references)

and interacting with commit

  5e7484d01928 ("soundwire: intel: add sdw_stream_setup helper for .startup=
 callback")

from Linus' tree.

I have used the sound-asoc tree from next-20200414 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uPk4X/ZD9LzKl7nBfW8dLg_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WbjkACgkQAVBC80lX
0GxG/wf/R3uNPjiFOwxvKw9s6xEweBqSUlfUsSkZcnja/+3R6Nc6zjmQPdMOx61Y
1FIA02wEWtuZCfVUdIMODOjPDjGXmhVj+OHS0NKKICmPy4HSx0Fgo3drFFO0mAI0
7Z7+SaSXwn6/QkDl6wld9qLBWMLfJQlUeq39Ibkq446Ge8hZflYZcGfi+w5d55q8
MTCKuYIOg0RCSqVj0mLOOA9rbSFcre9La7C49YsId3LBSugL5Ru+KtRFkdPyujGH
KuE+w1RuPYvKehEEPd8fE4CuFf6c21RZJpXkNTTqqMHIL74uWKFWkSWev4KpKkwN
G7XkFJB6weMeE9RKQipfT1HzvxZ6Ww==
=3H2+
-----END PGP SIGNATURE-----

--Sig_/uPk4X/ZD9LzKl7nBfW8dLg_--
