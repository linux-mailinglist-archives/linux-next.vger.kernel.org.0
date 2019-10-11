Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5D6D34C5
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 02:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfJKABy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 20:01:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37103 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbfJKABy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Oct 2019 20:01:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46q7RL3vrMz9sN1;
        Fri, 11 Oct 2019 11:01:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570752110;
        bh=38vzsVFI5xzkgI38W8nW6OJtVISVgzasXSjnJyIfAg0=;
        h=Date:From:To:Cc:Subject:From;
        b=UL53j2wid34l2rxx1ztAjiJeTVNNoQHvZEsEBuFRqevmfuhGniIscB5gt0FoBJaYv
         p/tZE35CJ2VFaeV5Xh8cHWECtH/AAak9aPcEX/RuitT2r5HLGDmres5Bmn4AEhgx4g
         5uHsS6N9dWj3gpIEb59ZyzRhFbAECGSvperOJ8TZ1GdSGi/GLfd27gloituAW/2/I5
         l6esv5JZuhu4sR8EENY3vtxDsVox2bnjp35s43aiZweYKtm52Pal3wsLyvNlawByCE
         MLzx+5pzmJk7uSRbmWcyzHgFFkxzrM/9Inep/CutWpPphPT2TD99ylskGh9tgf9Wnn
         o+q/0mUDe325g==
Date:   Fri, 11 Oct 2019 11:01:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20191011110149.79d529c4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rWKCCKo8_vod0EYAebCOJ+G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rWKCCKo8_vod0EYAebCOJ+G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/sound/sof/dai-imx.h:11,
                 from <command-line>:
include/sound/sof/header.h:125:2: error: unknown type name 'uint32_t'
  125 |  uint32_t size;   /**< size of structure */
      |  ^~~~~~~~
include/sound/sof/header.h:136:2: error: unknown type name 'uint32_t'
  136 |  uint32_t size;   /**< size of structure */
      |  ^~~~~~~~
include/sound/sof/header.h:137:2: error: unknown type name 'uint32_t'
  137 |  uint32_t cmd;   /**< SOF_IPC_GLB_ + cmd */
      |  ^~~~~~~~
include/sound/sof/header.h:146:2: error: unknown type name 'int32_t'
  146 |  int32_t error;   /**< negative error numbers */
      |  ^~~~~~~
include/sound/sof/header.h:160:2: error: unknown type name 'uint32_t'
  160 |  uint32_t count;  /**< count of 0 means end of compound sequence */
      |  ^~~~~~~~
include/sound/sof/header.h:167:2: error: unknown type name 'uint32_t'
  167 |  uint32_t arch;  /* Identifier of architecture */
      |  ^~~~~~~~
include/sound/sof/header.h:168:2: error: unknown type name 'uint32_t'
  168 |  uint32_t totalsize; /* Total size of oops message */
      |  ^~~~~~~~
include/sound/sof/header.h:175:2: error: unknown type name 'uint32_t'
  175 |  uint32_t configidhi; /* ConfigID hi 32bits */
      |  ^~~~~~~~
include/sound/sof/header.h:176:2: error: unknown type name 'uint32_t'
  176 |  uint32_t configidlo; /* ConfigID lo 32bits */
      |  ^~~~~~~~
include/sound/sof/header.h:177:2: error: unknown type name 'uint32_t'
  177 |  uint32_t numaregs; /* Special regs num */
      |  ^~~~~~~~
include/sound/sof/header.h:178:2: error: unknown type name 'uint32_t'
  178 |  uint32_t stackoffset; /* Offset to stack pointer from beginning of
      |  ^~~~~~~~
include/sound/sof/header.h:181:2: error: unknown type name 'uint32_t'
  181 |  uint32_t stackptr; /* Stack ptr */
      |  ^~~~~~~~
In file included from <command-line>:
include/sound/sof/dai-imx.h:18:2: error: unknown type name 'uint16_t'
   18 |  uint16_t reserved1;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:19:2: error: unknown type name 'uint16_t'
   19 |  uint16_t mclk_id;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:20:2: error: unknown type name 'uint32_t'
   20 |  uint32_t mclk_direction;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:22:2: error: unknown type name 'uint32_t'
   22 |  uint32_t mclk_rate; /* MCLK frequency in Hz */
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:23:2: error: unknown type name 'uint32_t'
   23 |  uint32_t fsync_rate; /* FSYNC frequency in Hz */
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:24:2: error: unknown type name 'uint32_t'
   24 |  uint32_t bclk_rate; /* BCLK frequency in Hz */
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:27:2: error: unknown type name 'uint32_t'
   27 |  uint32_t tdm_slots;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:28:2: error: unknown type name 'uint32_t'
   28 |  uint32_t rx_slots;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:29:2: error: unknown type name 'uint32_t'
   29 |  uint32_t tx_slots;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:30:2: error: unknown type name 'uint16_t'
   30 |  uint16_t tdm_slot_width;
      |  ^~~~~~~~
include/sound/sof/dai-imx.h:31:2: error: unknown type name 'uint16_t'
   31 |  uint16_t reserved2; /* alignment */
      |  ^~~~~~~~

Caused by commit

  b4be427683cf ("ASoC: SOF: imx: Describe ESAI parameters to be sent to DSP=
")

I added the following fix for today (include/sound/sof/header.h
probably should have something similar):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Oct 2019 10:56:46 +1100
Subject: [PATCH] ASOC: SOF: dai-imx.h needs linux/types.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/sound/sof/dai-imx.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sof/dai-imx.h b/include/sound/sof/dai-imx.h
index e02fb0b0fae1..31ccb87a8273 100644
--- a/include/sound/sof/dai-imx.h
+++ b/include/sound/sof/dai-imx.h
@@ -8,6 +8,7 @@
 #ifndef __INCLUDE_SOUND_SOF_DAI_IMX_H__
 #define __INCLUDE_SOUND_SOF_DAI_IMX_H__
=20
+#include <linux/types.h>
 #include <sound/sof/header.h>
=20
 /* ESAI Configuration Request - SOF_IPC_DAI_ESAI_CONFIG */
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/rWKCCKo8_vod0EYAebCOJ+G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2fxm0ACgkQAVBC80lX
0GyhjwgAjhcqhDcuW17FjF6v+sBuuMv6K2ZbMOmEc/oKCVSeD8vGdAekzP+qwz47
DZOaX2OEht1JSLv0Ya45nRSKhjvUOaAdW4g8F2k3eSgyaNVPGs4yj/hoQTiZB9OL
uCEAd5gNMLQ2k9HQvjMwPW8KlQkIcX7d5hQEY4uDuu8MOjPAGOpTfixqFO9w+cuH
M68njQ6lwRYRUM4CDNf6bKBhyhmNzV5iI3gdnUjkglBpiP1uGxBatdGbx0/pPihL
M9ue5TrfWz5iqpkbBabfFrDNfegImri2qwVI6y833qVjpihBUGx6e79o/gcfg6D5
vcqTG40pdYiJqGQ0i7hgWEOV7mRiDQ==
=iHuX
-----END PGP SIGNATURE-----

--Sig_/rWKCCKo8_vod0EYAebCOJ+G--
