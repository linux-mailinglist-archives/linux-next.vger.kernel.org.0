Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA5BF87033
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 05:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405086AbfHIDcD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 23:32:03 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39761 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727611AbfHIDcD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 23:32:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464W4w3RBgz9sNp;
        Fri,  9 Aug 2019 13:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565321520;
        bh=FocQMBvNvfw5IWp12PZsnaC2LQim+IwvLn+rpiJYj3s=;
        h=Date:From:To:Cc:Subject:From;
        b=K0UeOKGl46LgisLeTBNEvcs5hQa4Q0r7QXDhBsf9wSekBP82TbFThf4E3i61zgN3J
         8ez/u1d7RF3ET1UXjTjvmCUC85AXKLhNK59XS5lctlO7hsvRWaBTAPwra4Yh3b/IZf
         KzedOLHPjobjkiFdQmfKqxyBZFI5NzAfChqjVVaCTBtyg5OrcgcKuRXQhtgzZwsypw
         DyPWnW/POt0Wascde1F01vQm9lDNa+gkWBnSPob1Mn/SW4VHOrB4fSJ3pp7CDG/8bk
         JkfPKDTDtOzvhquCSCypluro4mWjHiDet3oaUemtiOJv9675WuCfNfs1ehHhl1DmyM
         zwnfXzAEh0DfA==
Date:   Fri, 9 Aug 2019 13:31:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rander Wang <rander.wang@linux.intel.com>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Zhu Yingjiang <yingjiang.zhu@linux.intel.com>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <20190809133159.4d117905@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0JiSw1+i+YyIB3ko=ddiD9R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0JiSw1+i+YyIB3ko=ddiD9R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/sof/intel/hda-dsp.c

between commit:

  19abfefd4c76 ("ALSA: hda: Direct MMIO accesses")

from the sound tree and commits:

  fd15f2f5e272 ("ASoC: SOF: Intel: hda: Enable jack detection")
  d06973515f95 ("ASoC: SOF: Intel: hda: use SOF defined init chip in resume=
")

from the sound-asoc tree.

I fixed it up (I used the latter version and added the following merge
fix patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 9 Aug 2019 13:28:00 +1000
Subject: [PATCH] ASoc: SOF: Intel: hda: merge fix up for "ALSA: hda: Direct=
 MMIO accesses"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/sof/intel/hda-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index a7fee403cb90..bc41028a7a01 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -254,7 +254,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bo=
ol full_reset)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* Reset stream-to-link mapping */
 	list_for_each_entry(hlink, &bus->hlink_list, list)
-		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
+		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 #endif
=20
 	bus->chip_init =3D true;
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/0JiSw1+i+YyIB3ko=ddiD9R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1M6S8ACgkQAVBC80lX
0GxhoQf9H6Lhqd/QZE9zKwKCfyToi8DOw4ZpoDhNobsuYUGk+M+nLbUVgPvhqjif
TIPYVs2swkyjU9puoQ7gCjubP06QmKH+5W336xrVAxGTxA7QKbq/vjDsLPiWiQuE
Ud6B4TBWY8N/0WyYK63+MUm77qm4Iw53ZPWtAqB0ui1agc6E/sf0NkRUyi3CLCRA
UYW29idwApsPRRQ+qvTW0FEHy0RygAqtsF3ZwRRqvu/ov08m21Ux5ewdKUrprE0u
LRE9bKT1ifu/S7y5C805f0TB8jgs07j/LPKqenV54qcvUwXYwtmSAum/19Plh1bL
+EWzBbyj87EQKbs9Or+Wpq9fUwr4rQ==
=cxc4
-----END PGP SIGNATURE-----

--Sig_/0JiSw1+i+YyIB3ko=ddiD9R--
