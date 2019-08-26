Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2059D9C788
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 05:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfHZDMl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Aug 2019 23:12:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51599 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726215AbfHZDMl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 25 Aug 2019 23:12:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Gxrj3ZCtz9sMr;
        Mon, 26 Aug 2019 13:12:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566789157;
        bh=25Ggdo2oL/qJme2XUXxIElP5B2EGLpxpgnHNn9sLCBg=;
        h=Date:From:To:Cc:Subject:From;
        b=LeCeM/tERM3irPiFcF9K7Y4kfW5rJicrZrtcX1jbFeZ89VWWveQ4V3BzbP0Gyi+Zk
         aHCoMTjZmja+UvQBz6btHiw2SpXHYZLx0H1nurBkxqujybHmAMkgKlvQUnBQDfE4ls
         BQOrDvoASSq1nC6F4reh6CQ+KYPM7bwIF6Ay6My71d5dGyQdQCcxfYS2q+o6Uaj4iq
         ig3SnmczOFrOhp/kiBinw+ucu9KABdzRh/++cgqf+nbs/KFvH8fhRY4mQX5tMBsGGp
         GZcvGwnr2Gt4KmcC6ATLnNHaxr0jUfQKJNGvKtwQMivUobsWRhlig8Bx5VN7TxsT+H
         xYw+vFTrLktkQ==
Date:   Mon, 26 Aug 2019 13:12:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20190826131236.441e6c9f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nAw3zeIhKHJVF_u=Cr/HcbU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nAw3zeIhKHJVF_u=Cr/HcbU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/mediatek/mtk_drm_drv.c

between commit:

  7837951a12fd ("drm/mediatek: include dma-mapping header")

from Linus' tree and commit:

  9aef5867c86c ("drm/mediatek: drop use of drmP.h")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 945bc20f1d33,2ee809a6f3dc..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@@ -4,9 -4,16 +4,17 @@@
   * Author: YT SHEN <yt.shen@mediatek.com>
   */
 =20
- #include <drm/drmP.h>
+ #include <linux/component.h>
+ #include <linux/iommu.h>
+ #include <linux/module.h>
+ #include <linux/of_address.h>
+ #include <linux/of_platform.h>
+ #include <linux/pm_runtime.h>
++#include <linux/dma-mapping.h>
+=20
  #include <drm/drm_atomic.h>
  #include <drm/drm_atomic_helper.h>
+ #include <drm/drm_drv.h>
  #include <drm/drm_fb_helper.h>
  #include <drm/drm_gem.h>
  #include <drm/drm_gem_cma_helper.h>
@@@ -352,21 -314,8 +346,20 @@@ static const struct file_operations mtk
  	.compat_ioctl =3D drm_compat_ioctl,
  };
 =20
 +/*
 + * We need to override this because the device used to import the memory =
is
 + * not dev->dev, as drm_gem_prime_import() expects.
 + */
 +struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 +						struct dma_buf *dma_buf)
 +{
 +	struct mtk_drm_private *private =3D dev->dev_private;
 +
 +	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
 +}
 +
  static struct drm_driver mtk_drm_driver =3D {
- 	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
- 			   DRIVER_ATOMIC,
+ 	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 =20
  	.gem_free_object_unlocked =3D mtk_drm_gem_free_object,
  	.gem_vm_ops =3D &drm_gem_cma_vm_ops,
@@@ -374,8 -323,6 +367,7 @@@
 =20
  	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
  	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
- 	.gem_prime_export =3D drm_gem_prime_export,
 +	.gem_prime_import =3D mtk_drm_gem_prime_import,
  	.gem_prime_get_sg_table =3D mtk_gem_prime_get_sg_table,
  	.gem_prime_import_sg_table =3D mtk_gem_prime_import_sg_table,
  	.gem_prime_mmap =3D mtk_drm_gem_mmap_buf,

--Sig_/nAw3zeIhKHJVF_u=Cr/HcbU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jTiQACgkQAVBC80lX
0GzATwf/eK4cY9F9zBKCJgLsfYhSkiyzChMziYSK3kthp8weUk+HYn3bbSIhI8SM
kDeVyTi2c7FoagXBWb/Q9LbDIywNbsAOek+zK65nJjBEYwsRAIA1wAxT+QZ2AeLf
C8Z9UiHNtkup99sQHRMpSg7Z6wa9+KpW7ZcdqUmvyhGv06Xm9HbHqrUG/M4OGjA4
u151jfaBAN+wUp8vradjtaZJgx2Iw8aLVMvF5bykiam+qtUHQGdeqURJ+yNJad9c
+Mpvxnq0qSvc69Y02mzJxVfjuo7J4UCgt89jrJrt3cPDyHXp+y7sOnKKHNoGExL9
K7W1IhwcmiSS2uk/6csxLhaQCh/YvA==
=N329
-----END PGP SIGNATURE-----

--Sig_/nAw3zeIhKHJVF_u=Cr/HcbU--
