Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C4F2524E9
	for <lists+linux-next@lfdr.de>; Wed, 26 Aug 2020 03:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgHZBLa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 21:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgHZBL2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 21:11:28 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65528C061756;
        Tue, 25 Aug 2020 17:55:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbnTw0RvFz9sTK;
        Wed, 26 Aug 2020 10:55:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598403348;
        bh=hoxKBsKE63D/fgihlpKl/FhX6INVTwC8nzDYLZcAU1Y=;
        h=Date:From:To:Cc:Subject:From;
        b=bpsFMPJ60MQtLACGbpOyZQnUtvSXtarJc1iumaQkKoENqgipOYxREylVeY6K+lCbN
         8bsaQ9ObuYAg511+ZVaVp+fsvejqUzNEXUvbfmK8iFXIh385ZKymYdzcq2IjiQkURG
         mv/LIEmqcvTL11ciwwJwY5DWOCRvqXlQVA1eSb8tprUOQYhApvm22W9ad5Shg9DKgu
         SqDa3RYgRVeVZGxWBxvHPwo/KrsYtDBEk52eOcAYhXBVvrFv3yOYRCchK/efMD6M9D
         2d+Nujeg0+iqwzMFCArfDYH0VKoSRyc39FZWZgveJNW1WaX+BvhFpRiMhZJrtbZ1zg
         Jcrsd9bdIsyAw==
Date:   Wed, 26 Aug 2020 10:55:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sidong Yang <realwakka@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200826105547.4f6ea26d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=t6fPzJwTXhrx0VBf9IFJv2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=t6fPzJwTXhrx0VBf9IFJv2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_display_read_client_mon=
itors_config':
include/drm/drm_modeset_lock.h:167:7: error: implicit declaration of functi=
on 'drm_drv_uses_atomic_modeset' [-Werror=3Dimplicit-function-declaration]
  167 |  if (!drm_drv_uses_atomic_modeset(dev))    \
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:187:2: note: in expansion of macro 'DRM_M=
ODESET_LOCK_ALL_BEGIN'
  187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPT=
IBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:189:35: error: macro "DRM_MODESET_LOCK_AL=
L_END" requires 3 arguments, but only 2 given
  189 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |                                   ^
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:194: note: macro "DRM_MODESET_LOCK_ALL_END" =
defined here
  194 | #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)    \
      |=20
drivers/gpu/drm/qxl/qxl_display.c:189:2: error: 'DRM_MODESET_LOCK_ALL_END' =
undeclared (first use in this function)
  189 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:189:2: note: each undeclared identifier i=
s reported only once for each function it appears in
drivers/gpu/drm/qxl/qxl_display.c:187:2: error: label 'modeset_lock_fail' u=
sed but not defined
  187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPT=
IBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:170:1: warning: label 'modeset_lock_retry' d=
efined but not used [-Wunused-label]
  170 | modeset_lock_retry:       \
      | ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:187:2: note: in expansion of macro 'DRM_M=
ODESET_LOCK_ALL_BEGIN'
  187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPT=
IBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_framebuffer_surface_dir=
ty':
drivers/gpu/drm/qxl/qxl_display.c:434:35: error: macro "DRM_MODESET_LOCK_AL=
L_END" requires 3 arguments, but only 2 given
  434 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |                                   ^
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:194: note: macro "DRM_MODESET_LOCK_ALL_END" =
defined here
  194 | #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)    \
      |=20
drivers/gpu/drm/qxl/qxl_display.c:434:2: error: 'DRM_MODESET_LOCK_ALL_END' =
undeclared (first use in this function)
  434 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:411:2: error: label 'modeset_lock_fail' u=
sed but not defined
  411 |  DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTER=
RUPTIBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:170:1: warning: label 'modeset_lock_retry' d=
efined but not used [-Wunused-label]
  170 | modeset_lock_retry:       \
      | ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:411:2: note: in expansion of macro 'DRM_M=
ODESET_LOCK_ALL_BEGIN'
  411 |  DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTER=
RUPTIBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")

interacting with commit

  77ef38574beb ("drm/modeset-lock: Take the modeset BKL for legacy drivers")

from the drm-misc-fixes tree.

drivers/gpu/drm/qxl/qxl_display.c manages to include
drm/drm_modeset_lock.h by some indirect route, but fails to have
drm/drm_drv.h similarly included.  In fact, drm/drm_modeset_lock.h should
have included drm/drm_drv.h since it uses things declared there, and
drivers/gpu/drm/qxl/qxl_display.c should include drm/drm_modeset_lock.h
similarly.

I have added the following hack patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 26 Aug 2020 10:40:18 +1000
Subject: [PATCH] fix interaction with drm-misc-fix commit

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_di=
splay.c
index fa79688013b7..6063f3a15329 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -26,6 +26,7 @@
 #include <linux/crc32.h>
 #include <linux/delay.h>
=20
+#include <drm/drm_drv.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -186,7 +187,7 @@ void qxl_display_read_client_monitors_config(struct qxl=
_device *qdev)
=20
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, r=
et);
 	qxl_update_offset_props(qdev);
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	if (!drm_helper_hpd_irq_event(dev)) {
 		/* notify that the monitor configuration changed, to
 		   adjust at the arbitrary resolution */
@@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_fra=
mebuffer *fb,
 			  clips, num_clips, inc, 0);
=20
 out_lock_end:
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
=20
 	return 0;
 }
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/=t6fPzJwTXhrx0VBf9IFJv2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9FsxMACgkQAVBC80lX
0GwUiAf/VXvo+XA2ZBKhDrKTbyDJzIg5LziJNHZxevxS8R3ZifhABsFNxhzTaEEx
H/VO6kLeXk0hrXryvT/5vZVfWEYvxU967IDJUMa+XmY8GuXzzUJurF1h7wN9UJOq
B2DHvAQsyG/JLFvZDTWd6ZTv+cGcetSBcCLhlb7ShfDzyOWU8mePuTREXo7htzrC
X+gFiDijD/vf5X5L+rCXSK3bzT+jzP7h2BvGLiqVwm1avOWDHjmUyAfWIcrgbdbl
Mh8KDWB7xDiZgUkMu/Z7OTvAhp9j+kFHd+/jZIrw3qieAGrnrK7QSAS85BSATMwq
YvWGtyH5uF0rPvrG2A1+As/qiN3KlQ==
=K0X/
-----END PGP SIGNATURE-----

--Sig_/=t6fPzJwTXhrx0VBf9IFJv2--
