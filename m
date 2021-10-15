Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05EB942ED93
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 11:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236680AbhJOJ3A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 05:29:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60505 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236567AbhJOJ3A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 05:29:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW1B30QRsz4xR9;
        Fri, 15 Oct 2021 20:26:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634290012;
        bh=xl0h0ehAPbQXQoQuuUp7RGzzyhb5d9ztn2d3GE74Wjs=;
        h=Date:From:To:Cc:Subject:From;
        b=bA+KmpzGZSqV/9vXYWF8PRZvTIbOFj4L6qXMHG1rQ5ERg1ajrO8ea3ymi9CLpSbaG
         faBpHJfomvbbxG1Nwd6TTQyvJd3NRgisKlUsGpDnTUOEIMHc+RVccSf4Tek+kOkZEa
         vz/juFVpep+LoYcqp8ctuQP37UAx0yD822EbTt3MSTmiwsBR/xnIGSWSpxEd/6S8aO
         UZ2niUXbeHg4zpaQ9RlNZycTdWCaB2z/K4qrRHOSKf7l+fMgsrxd8K6wQKHrFtkCHr
         2WqtsCpeT2mjlBWW3W0OlW/yQBSc+rTq7qG0Zg9KBfzX1foXM7jfGn5p4Flu4FMQP2
         x99eI359eH9QA==
Date:   Fri, 15 Oct 2021 20:26:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211015202648.258445ef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tYZFJ6chdxiLHwqx9EJihw_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tYZFJ6chdxiLHwqx9EJihw_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/drm_modeset_lock.c:111:29: error: conflicting types for '__=
stack_depot_save'
  111 | static depot_stack_handle_t __stack_depot_save(void)
      |                             ^~~~~~~~~~~~~~~~~~
In file included from include/linux/page_ext.h:7,
                 from include/linux/mm.h:25,
                 from include/linux/kallsyms.h:13,
                 from include/linux/bpf.h:20,
                 from include/linux/bpf-cgroup.h:5,
                 from include/linux/cgroup-defs.h:22,
                 from include/linux/cgroup.h:28,
                 from include/linux/memcontrol.h:13,
                 from include/linux/swap.h:9,
                 from include/linux/suspend.h:5,
                 from include/linux/regulator/consumer.h:35,
                 from include/linux/i2c.h:18,
                 from include/drm/drm_crtc.h:28,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/drm_modeset_lock.c:24:
include/linux/stackdepot.h:18:22: note: previous declaration of '__stack_de=
pot_save' was here
   18 | depot_stack_handle_t __stack_depot_save(unsigned long *entries,
      |                      ^~~~~~~~~~~~~~~~~~

Caused by commit

  cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks wit=
hout backoff")

This may only have been revealed because of another fix I have had to
apply today.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Oct 2021 20:17:52 +1100
Subject: [PATCH] drm/locking: fix for name conflict

Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended lock=
s without backoff")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_modeset_lock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modes=
et_lock.c
index 4d32b61fa1fd..ee36dd20900d 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -79,7 +79,7 @@
 static DEFINE_WW_CLASS(crtc_ww_class);
=20
 #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
-static noinline depot_stack_handle_t __stack_depot_save(void)
+static noinline depot_stack_handle_t __drm_stack_depot_save(void)
 {
 	unsigned long entries[8];
 	unsigned int n;
@@ -108,7 +108,7 @@ static void __stack_depot_print(depot_stack_handle_t st=
ack_depot)
 	kfree(buf);
 }
 #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
-static depot_stack_handle_t __stack_depot_save(void)
+static depot_stack_handle_t __drm_stack_depot_save(void)
 {
 	return 0;
 }
@@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modeset_lock =
*lock,
 		ret =3D 0;
 	} else if (ret =3D=3D -EDEADLK) {
 		ctx->contended =3D lock;
-		ctx->stack_depot =3D __stack_depot_save();
+		ctx->stack_depot =3D __drm_stack_depot_save();
 	}
=20
 	return ret;
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/tYZFJ6chdxiLHwqx9EJihw_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpSVgACgkQAVBC80lX
0Gw7Kgf/ZuKzlxTQSDLKFDfn6/O5S38xFR4DSOjqJwWETTSS1gTN1tdS/1TxVI/G
y6+7Y5jDRBuMaxCVAFETuImKwexIXsoh6um+iVJaXW90a7PDK737ldIACmqMurmr
Q+BeiAjZ8+NA1amrOv/nhiMOPWL+cW2v8OHj4t4MWZYB9HspgtkRia6qlLBQcttZ
pA33MK0v3gZFZ/KCfIFqFe6AD01LDvhepOrMuOC0mnBw6a2dktAEh/wuMN+KqExf
k2M/wUEwgyQjB8Y9OH0aJDmmHnTbPIJ+WZZ030zyX1oMPhN2dqq9jw8E29HqryjI
Y8+MtBPX2O2Df9cT9zQdLlKmDFx2Vg==
=4IfR
-----END PGP SIGNATURE-----

--Sig_/tYZFJ6chdxiLHwqx9EJihw_--
