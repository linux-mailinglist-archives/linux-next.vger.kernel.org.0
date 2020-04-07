Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62281A051B
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 05:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgDGDFt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Apr 2020 23:05:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgDGDFs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Apr 2020 23:05:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48xC2y1QR0z9sP7;
        Tue,  7 Apr 2020 13:05:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586228746;
        bh=4jItGZbMT8Xb1UNdcXfJm/hRV2V4Q6ciJoIaU9vs9NI=;
        h=Date:From:To:Cc:Subject:From;
        b=DyB/tyn8jBuhsBprcd1O0K7yvkig6NL/shFbPjx4V8FYIFqwgj/nkEVDhefyZi3Np
         K1T1I7djraV0KfB40tc9OcRwd09E1UqTKWbdMV/ip+OgW5CiTk+EStGHqaFLgRS8hf
         A8s8L4Xjo3HY0xZNJ54gf0rip4c2Y0vGNLITzq0z/OXSKYwLtnO3NwWBdq7jMZuvb5
         KucVpj7PrgjlsUlxA4dm72BypWG4HfrCpJX/XHljAV2mWj9oADHKm9f4H1awI3eW+t
         ElIpIHoaX33Zx97Aaju7QIjABeSmKroOY5BZNVFClKl/6HmRx5PF8F9yR8T4r9x//l
         nw2UFZs3KwRFQ==
Date:   Tue, 7 Apr 2020 13:05:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20200407130542.0e3b5d9d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DQefj_VsLdP6ZiNGGyHotvI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DQefj_VsLdP6ZiNGGyHotvI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/virtio/virtgpu_kms.c: In function 'virtio_gpu_init':
drivers/gpu/drm/virtio/virtgpu_kms.c:153:38: error: 'VIRTIO_RING_F_INDIRECT=
_DESC' undeclared (first use in this function)
  153 |  if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/virtio/virtgpu_kms.c:153:38: note: each undeclared identifi=
er is reported only once for each function it appears in

Caused by commit

  898952f9597e ("virtio: stop using legacy struct vring in kernel")

interacting with commit

  5edbb5608256 ("drm/virtio: fix ring free check")

from Linus' tree (post v5.6).

I have added the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 7 Apr 2020 12:58:26 +1000
Subject: [PATCH] drm/virtio: fix up for include file changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/=
virtgpu_kms.c
index 023a030ca7b9..f4ea4cef5e23 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -25,6 +25,7 @@
=20
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
+#include <linux/virtio_ring.h>
=20
 #include <drm/drm_file.h>
=20
--=20
2.25.0

I do have to wonder why all this code has been added to the vhost tree
during the second week of the merge window (especially when I see it
rebased 4 times in one day :-().  Is it really intended for v5.7?
--=20
Cheers,
Stephen Rothwell

--Sig_/DQefj_VsLdP6ZiNGGyHotvI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6L7gYACgkQAVBC80lX
0Gyo+QgAlmFf+SXu2mXp4y3oDXo3FyBwEqOKYpWQYFP0gbuPPLMK+wY8qjneo0yf
R40AWCz9UHY7+TPzlZ0+cz0C99zQgO2mzWT6xcKOenGcyA93jDo5TpxNcN0SfVJI
/CANM7NrVgNo0gc0aexw47fiBr/l4FL3LruLkfSHgnWV83UqS7rhzgPUcU9761NU
LID6R0xLk+SU2u5ydjCWFwy5AER2oU8UjSLDiZuq6ZJn7j2tkegz+W2gqQauSNN3
S2knxLbhLDKcNkFwDApZ8K7g0OdmnjIkDBWlXr/huk9onQnohjCgCaHa+8+U3rWj
gIYSGXJYmbMm6yfUbQgvMd3g/VslqA==
=aVgB
-----END PGP SIGNATURE-----

--Sig_/DQefj_VsLdP6ZiNGGyHotvI--
