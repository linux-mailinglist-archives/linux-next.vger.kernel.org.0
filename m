Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02109FDA0
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 10:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfH1Izb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 04:55:31 -0400
Received: from ozlabs.org ([203.11.71.1]:37191 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbfH1Iz2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 04:55:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JKMJ5Txkz9sNp;
        Wed, 28 Aug 2019 18:55:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566982525;
        bh=uHfZSqpM9d5GmZPwHwbJ/ALaDsqk/uyw9kZHkl+R9NE=;
        h=Date:From:To:Cc:Subject:From;
        b=I7/yD7DH7aaydjm2wxLZr4OBwHvpk84eM0V2tmBzHdYVPOlqOrGmr3Q+jUAd4ZXPA
         FE347BnBhMs4N5Nhf0ngbcP9ClAXbqLevO5Z00AQUDHipyUtkAJHGKDH9mnxn4ly4A
         0Hoe4mowNqHA+XHsqW+9DZg660LpvFNpBMxWsOFKqhPNRxy1xgLar8ZRTq3bD9rVaC
         EI3KcN9F13n6ZLK5PcKmkDJfHUep8Ac8eC8btSYJVXCaTSMqQ4jUoAZRohY/fRNzrB
         YuU7aZ6FrJRpX1Aup0r7SJDw3RWPRzvyyqrIXIErez1MiXRAtBz9+V5N3kARzTnnw2
         VhTPQfwaTLRwQ==
Date:   Wed, 28 Aug 2019 18:55:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20190828185516.22b03da8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vl+g_4dHxCiacR0wR8Sx6nD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vl+g_4dHxCiacR0wR8Sx6nD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/virtio/virtgpu_object.c:31:67: error: expected ')' before '=
int'
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 04=
00);
                                                                   ^~~~
                                                                   )

Caused by commit

  3e93bc2a58aa ("drm/virtio: make resource id workaround runtime switchable=
.")

I applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Aug 2019 18:37:40 +1000
Subject: [PATCH] drm/virtio: module_param_named() requires linux/modulepara=
m.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c
index aab5534056ec..b5f8923ac674 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -23,6 +23,8 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
=20
+#include <linux/moduleparam.h>
+
 #include <drm/ttm/ttm_execbuf_util.h>
=20
 #include "virtgpu_drv.h"
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/vl+g_4dHxCiacR0wR8Sx6nD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1mQXQACgkQAVBC80lX
0GwORQf6AlHwThxv6cZcRGeDgqyf3lCCR2mfKYONLAp2GmjLFjkS3TaAri5ltvPT
97svBbPdH8yu86Kw8PowHBXS8BUV1CxmrgfSrmZHUjBerrTi+wlIduVFP7Q8tzry
haUQ6gaVphSvChG0OCAB6TsJZlnmHtJy5VZSRH5mZ4Opsn0HYGaa0RcV5dWqQM1z
cpOpsz7Hbyf1DQC4TQ6Y5+CLD1sj4MNe9gh8N4blAlN6Kv7HoLMEMSZCUPUxSlkV
Z9bLuzSnHv+EB77v0H3UO9x3OOR7g1KYc6GmVJyOXk0QQC9o/yery3tYscE2lobC
tF82e/0NcWBt1banOVbXJQCqWDFFjg==
=/Jl+
-----END PGP SIGNATURE-----

--Sig_/vl+g_4dHxCiacR0wR8Sx6nD--
