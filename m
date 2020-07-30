Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695CA232CB8
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 09:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgG3Hwl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 03:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3Hwl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 03:52:41 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0CDC061794;
        Thu, 30 Jul 2020 00:52:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHN1J3g1lz9sSt;
        Thu, 30 Jul 2020 17:52:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596095557;
        bh=gGEdv5fHqj7dyxbs6GDk3JDYhrWS+pjlUw3t5q7Gq+w=;
        h=Date:From:To:Cc:Subject:From;
        b=GFWKpbEE5A7eXitdPwPYu+gDAYSThzhJof715jiPylk3B1zBhmcmhDfXMsm98nAJ+
         whNdcrZ9j36awb9QP1Fz5RuMWvdbQKw0qPNfhCOcAQhuJNQKg6bDnSom5luHrDA0h0
         oDgWN7nTa7P4cS+f/ksNa/YqJEi3XBc1awb0YNXnHwqemY3OroS/wOoKsLcQ3KFZiW
         2tPWJDel/3E2T3FvZf1SpOl0d95luftITXRon5V6kc6I/e5kKH8qIwE26MkeX33inH
         dYtzRsOK9QaZuRvwWu3Z5d2iPOCpfiz/95K1TYjbDm5Q8WhrrX9/q04PSPsWCwz6cf
         ndoL769WJJzTg==
Date:   Thu, 30 Jul 2020 17:52:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20200730175233.3351a8fc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OZorazXk.z5HAbO1+40R4tN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OZorazXk.z5HAbO1+40R4tN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/virtio/virtio_vdpa.c: In function 'virtio_vdpa_get':
drivers/virtio/virtio_vdpa.c:60:32: warning: unused variable 'ops' [-Wunuse=
d-variable]
   60 |  const struct vdpa_config_ops *ops =3D vdpa->config;
      |                                ^~~
drivers/virtio/virtio_vdpa.c: In function 'virtio_vdpa_finalize_features':
drivers/virtio/virtio_vdpa.c:301:9: error: void value not ignored as it oug=
ht to be
  301 |  return vdpa_set_features(vdpa, vdev->features);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/virtio/virtio_vdpa.c:296:32: warning: unused variable 'ops' [-Wunus=
ed-variable]
  296 |  const struct vdpa_config_ops *ops =3D vdpa->config;
      |                                ^~~
drivers/virtio/virtio_vdpa.c:302:1: warning: control reaches end of non-voi=
d function [-Wreturn-type]
  302 | }
      | ^
drivers/vhost/vdpa.c: In function 'vhost_vdpa_get_config':
drivers/vhost/vdpa.c:198:32: warning: unused variable 'ops' [-Wunused-varia=
ble]
  198 |  const struct vdpa_config_ops *ops =3D vdpa->config;
      |                                ^~~
drivers/vhost/vdpa.c: In function 'vhost_vdpa_set_features':
drivers/vhost/vdpa.c:284:6: error: void value not ignored as it ought to be
  284 |  if (vdpa_set_features(vdpa, features))
      |      ^~~~~~~~~~~~~~~~~

Caused by commit

  d4ff0377f05b ("virtio_vdpa: legacy features handling")

I added the following (hack) patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 30 Jul 2020 17:39:11 +1000
Subject: [PATCH] virtio_vdpa: fix legacy features handling

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/vhost/vdpa.c         | 4 +---
 drivers/virtio/virtio_vdpa.c | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index be9b3ed01a93..f7ef5f3ef0e3 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -195,7 +195,6 @@ static long vhost_vdpa_get_config(struct vhost_vdpa *v,
 				  struct vhost_vdpa_config __user *c)
 {
 	struct vdpa_device *vdpa =3D v->vdpa;
-	const struct vdpa_config_ops *ops =3D vdpa->config;
 	struct vhost_vdpa_config config;
 	unsigned long size =3D offsetof(struct vhost_vdpa_config, buf);
 	u8 *buf;
@@ -281,8 +280,7 @@ static long vhost_vdpa_set_features(struct vhost_vdpa *=
v, u64 __user *featurep)
 	if (features & ~vhost_vdpa_features[v->virtio_id])
 		return -EINVAL;
=20
-	if (vdpa_set_features(vdpa, features))
-		return -EINVAL;
+	vdpa_set_features(vdpa, features);
=20
 	return 0;
 }
diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index d0ae58d35392..73c5d49ff0df 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -57,7 +57,6 @@ static void virtio_vdpa_get(struct virtio_device *vdev, u=
nsigned offset,
 			    void *buf, unsigned len)
 {
 	struct vdpa_device *vdpa =3D vd_get_vdpa(vdev);
-	const struct vdpa_config_ops *ops =3D vdpa->config;
=20
 	vdpa_get_config(vdpa, offset, buf, len);
 }
@@ -293,12 +292,12 @@ static u64 virtio_vdpa_get_features(struct virtio_dev=
ice *vdev)
 static int virtio_vdpa_finalize_features(struct virtio_device *vdev)
 {
 	struct vdpa_device *vdpa =3D vd_get_vdpa(vdev);
-	const struct vdpa_config_ops *ops =3D vdpa->config;
=20
 	/* Give virtio_ring a chance to accept features. */
 	vring_transport_features(vdev);
=20
-	return vdpa_set_features(vdpa, vdev->features);
+	vdpa_set_features(vdpa, vdev->features);
+	return 0;
 }
=20
 static const char *virtio_vdpa_bus_name(struct virtio_device *vdev)
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/OZorazXk.z5HAbO1+40R4tN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ifEEACgkQAVBC80lX
0GzkFAf8CMDCGfWorZvjW966IHeKGYo2EwMUDiMTZzH3yjV2cDv8m5Oa7iw/QYgV
Z6+KSsl6ypNB5Z9QRhq2cx+Jh0h8dL7fE6WlAXoZAdEpfdRB0SAHNn8TyuAvKrqG
+3wkuDTL7sktc9/SRIy7+C54KunmJvtFK81V5aNYdcMEabeEgyur1Kj/BatVR05F
pywnDqUd41rVAtxBymlqM1m89IwOwuL0hXucyUvWd5hRqWvCyIFU6SgFKrDnQhU+
dDoy8UDxPkxl3DSjC2WVCJVtbBYHpSDtlYEh8nC1hu0wiSvlth/Tf7uVoougUWRr
A0aNFbh0957KVU13YrbA8IUQyJGwtA==
=iNy5
-----END PGP SIGNATURE-----

--Sig_/OZorazXk.z5HAbO1+40R4tN--
