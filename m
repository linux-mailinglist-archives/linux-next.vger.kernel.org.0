Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9E686FCA
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 04:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733140AbfHICzC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 22:55:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43489 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729503AbfHICzC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 22:55:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464VGC2vJhz9sND;
        Fri,  9 Aug 2019 12:54:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565319299;
        bh=N6x42FJqLLtf5AJTJ8N9Ouj0LI/pvxasYl0hdfaKxdw=;
        h=Date:From:To:Cc:Subject:From;
        b=fP6dn5ZwosFfv5RFrhyZUlWBC/cuaOg7VTE5SXlIbFtbSZ3M2N5lw+i8xKQw5h+kC
         tFvSBBdQWOCgQZUsIRURSLVp4UgCbwe8TvVx3thji5w4ghN/d/JhQTN0m4MVylwmUx
         UlmNOWci3rZxGzpmEZW6OsWNcnYzZ4RvN/uPKI/OA4YGlx+JhktxQY7oWx6VpRbmuW
         9LSjEeL4w0oSRL82iu776tXgksEqoTlxP0wOCnO91HBKSXMO+lKjPAJBZbzWw18dTi
         S59xAOD0P779B922uYLwDlCs1NTHhCPX3T7Ty+HAqGgABcXaMq3dQf6QuZo5Yb8X3m
         w1XcWZjvsl2Ow==
Date:   Fri, 9 Aug 2019 12:54:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20190809125458.6c7aaa6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S8foUJF8H+=wKJ0yGK/NO+X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S8foUJF8H+=wKJ0yGK/NO+X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

sound/hda/hdac_bus.c: In function 'snd_hdac_aligned_read':
sound/hda/hdac_bus.c:228:6: error: implicit declaration of function 'readl'=
; did you mean 'd_real'? [-Werror=3Dimplicit-function-declaration]
  v =3D readl(aligned_addr);
      ^~~~~
      d_real
sound/hda/hdac_bus.c: In function 'snd_hdac_aligned_write':
sound/hda/hdac_bus.c:244:2: error: implicit declaration of function 'writel=
' [-Werror=3Dimplicit-function-declaration]
  writel(v, aligned_addr);
  ^~~~~~

Caused by commit

  19abfefd4c76 ("ALSA: hda: Direct MMIO accesses")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 9 Aug 2019 12:50:25 +1000
Subject: [PATCH] ALSA: hda: readl/writel need linux/io.h

Fixes: 19abfefd4c76 ("ALSA: hda: Direct MMIO accesses")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/hda/hdac_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index dc2523ef7d98..cd25e2b3f7f2 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -4,6 +4,7 @@
  */
=20
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/export.h>
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/S8foUJF8H+=wKJ0yGK/NO+X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1M4IIACgkQAVBC80lX
0Gy2cAf/QU6iCDbKpCqx2f0EepphckuXKMSJU4qM+MdkhBZLSppQSFrQ5O0ce1MG
4OFFDSCXqT5Hsug/eGJlmInZPQ37JdU9wEuPNdZFs8nkEkJZfS2WSfuiZXbP6GAl
r+TvaCPvZ4SWMsPgY9WnNuMp+WBdBSrKH4ZHPyBQFZiWLOqHiIPf5JoavgiXeZmQ
m5r2Nf+741eDbG3bDwsrocRzELiYQSBmCwlLzOjN8wGQ42n2XXGnblrwKvpiJ3qw
oA6h7goZYdT3NlYT+mqSIctq9aqs7EmgYcnSUo8h5chQWT856CRrrIcWzIdTuNOf
gFBlygd5WZrgXL2/8S0us8E7EyLsfw==
=Nfo2
-----END PGP SIGNATURE-----

--Sig_/S8foUJF8H+=wKJ0yGK/NO+X--
