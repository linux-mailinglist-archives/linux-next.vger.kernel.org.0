Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A3B401515
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 04:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238867AbhIFCvI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Sep 2021 22:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238842AbhIFCvI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Sep 2021 22:51:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87ADC061575;
        Sun,  5 Sep 2021 19:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630896596;
        bh=lvnjrDHVue4jRbF+xpLu6wRs9BCkjAt29ulD1CAA8Sg=;
        h=Date:From:To:Cc:Subject:From;
        b=GV7VW42N/9jCdMIoTnkN/sx83SmUZIckX0mZM/bQTP/urWGXi0+Opi2qn23gvAKCp
         QyzEW1qwmKafRUkw513I21iz7j5QFp6zutTqnhJ6ORQNI7p4/le5VzB0Gu65FCXKZh
         4n3f1+4H4evhKXdENyVohb+n22IYfnXfBOybkIAxCPpZ+eK+32eOZIMs7HDv5I+U89
         gaubzy8T/t8V1qKFcBoNhd1vWe7Llm6iBRQN0iOGttDaIfQHo1hUNe/Rkbqua1xGK/
         DWdjJ96K6TgQ0vtaKh321Q2e7ucr8/gTv1unV974fdWmxElVquaePSMPIyqlrN4aPF
         YFA3RGfWc05dQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2tD40WlLz9sW4;
        Mon,  6 Sep 2021 12:49:55 +1000 (AEST)
Date:   Mon, 6 Sep 2021 12:49:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Xie Yongji <xieyongji@bytedance.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20210906124954.55ece6e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nZ1.Z3iCbFT6pedY5E66n9T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nZ1.Z3iCbFT6pedY5E66n9T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/vdpa/vdpa_user/vduse_dev.c: In function 'vduse_vdpa_kick_vq':
drivers/vdpa/vdpa_user/vduse_dev.c:489:6: error: implicit declaration of fu=
nction 'eventfd_signal_count'; did you mean 'eventfd_signal_allowed'? [-Wer=
ror=3Dimplicit-function-declaration]
  489 |  if (eventfd_signal_count()) {
      |      ^~~~~~~~~~~~~~~~~~~~
      |      eventfd_signal_allowed

Caused by commit

  b66219796563 ("vduse: Introduce VDUSE - vDPA Device in Userspace")

interacting with commit

  b542e383d8c0 ("eventfd: Make signal recursion protection a task bit")

from Linus' tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Sep 2021 12:43:32 +1000
Subject: [PATCH] fix up for "eventfd: Make signal recursion protection a ta=
sk bit"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/vdpa/vdpa_user/vduse_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vd=
use_dev.c
index 59a93e5b967a..5c25ff6483ad 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -486,7 +486,7 @@ static void vduse_vdpa_kick_vq(struct vdpa_device *vdpa=
, u16 idx)
 	struct vduse_dev *dev =3D vdpa_to_vduse(vdpa);
 	struct vduse_virtqueue *vq =3D &dev->vqs[idx];
=20
-	if (eventfd_signal_count()) {
+	if (eventfd_signal_allowed()) {
 		schedule_work(&vq->kick);
 		return;
 	}
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/nZ1.Z3iCbFT6pedY5E66n9T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1gdIACgkQAVBC80lX
0Gy0Bgf7Bt6B1FK7vEGX9BaXfhybMKk+HcfsHskEIvbhZsavlCc9/GmRwjRrt0jR
qi+K/iLpWQ6+PsYjI7s7MS35tX1ijecqRPlOhJCSZcRGYlYLmN2Eu2itralLkXcK
mKM5S2uRf2KJguHMpOPv77bvt7DW190zCSAe1p+nieoKQhkaHxg9j/cBquhcml9r
t5jySXtX5+0tG6Etzp2LN31VdW52eBI/ilLeujsNHDcFzfoBLNhPMCMxK6Y6aIja
Ea6IhGXGSGMRCqjU1if4C1EslshNV7FXnzWT/C78rDC2LVMUZkDjYw49DLQ4PzsN
YvFOPFfO/0eGHRDqA9cwJeWlJ4SzAg==
=TueG
-----END PGP SIGNATURE-----

--Sig_/nZ1.Z3iCbFT6pedY5E66n9T--
