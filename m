Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BDDD84BE
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 02:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389881AbfJPAWR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 20:22:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387839AbfJPAWR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Oct 2019 20:22:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46tCfW6rWQz9sPJ;
        Wed, 16 Oct 2019 11:22:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571185334;
        bh=fICVJGuNS3bs+KiWjPO5lU2cScptU1yWcytJuD4e3jM=;
        h=Date:From:To:Cc:Subject:From;
        b=QD0lc7HXYcvqED72HzmtPQmlz9qHGn8KzxyzRF+2HqZHiobpwEywt9Fp1eG0j7/Oq
         H9C6GQRugZDTQLxv6rAuYHk1ySuUS/NxA4fZZmnGnJZk73/EuE+4QqeBCBhTp+o3+7
         FcSjTcsja8dZ3FlhtRENOwL/qPaFMRAsqbWnCw90qDRoJPKvJqnYGVTyKm/I5Rb3FX
         fO4bfC+GP1/JcexG2LF3QXwooWsF9K4hGyZozXM+PIviaKcKpOTLSMMpcLybKjoiqJ
         iTqNBtfxyvscYGpUUFCdmpCqeGPa16K//5P78zUHVxOVVKpz70A0xjn/K1gETOMOyh
         dj++ekFbDcqKg==
Date:   Wed, 16 Oct 2019 11:22:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huang Rui <ray.huang@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191016112207.1ade14af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b45Yv514vY6HvJhcejDLP60";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b45Yv514vY6HvJhcejDLP60
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c:23:10: fatal error: drm/drmP.h: No =
such file or directory
   23 | #include <drm/drmP.h>
      |          ^~~~~~~~~~~~

Caused by commit

  4e98f871bcff ("drm: delete drmP.h + drm_os_linux.h")

interacting with commit

  8b8c294c5d37 ("drm/amdgpu: add function to check tmz capability (v4)")

from the amdgpu tree.

I applied the following merge fix patch for today (which should also
apply to the amdgpu tree).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Oct 2019 11:17:32 +1100
Subject: [PATCH] drm/amdgpu: fix up for amdgpu_tmz.c and removal of drm/drm=
P.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_tmz.c
index 14a55003dd81..823527a0fa47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_tmz.c
@@ -20,7 +20,10 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
=20
-#include <drm/drmP.h>
+#include <linux/device.h>
+
+#include <drm/amd_asic_type.h>
+
 #include "amdgpu.h"
 #include "amdgpu_tmz.h"
=20
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/b45Yv514vY6HvJhcejDLP60
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2mYq8ACgkQAVBC80lX
0GzbvAgAjVrdaS3BxJgL/ZhI6W5Dl4/de02drOW58MW77Z9y4KLI+Uo+Cr2Ewx67
vAszj64+9rKq7M9IDbtmAmf3GFEC+YdrUFawA6uQwCsywLgmPy+7SLk2N4WMBAYX
Grc35svjMzCgMRDZB9ZFqRxp5ik2i+loP3yc23ZL0DEs0aYb+Ybg3LCggjmZ/uRu
ePZjdDp3qzEIhMNl6roeLyrgF7IPeUVuKhsIVlCGnfbGTDJSvawuvTcChgmAtfDg
S1LMtTmdPW1nPkaY/6IAe+WgN4GplhE1j7neo/gH2iH0FmmZfz1Z/HZ0wDuVtEfb
TFaOm1Akog2c1oS+Kmbisy7Nwld/TA==
=f+bE
-----END PGP SIGNATURE-----

--Sig_/b45Yv514vY6HvJhcejDLP60--
