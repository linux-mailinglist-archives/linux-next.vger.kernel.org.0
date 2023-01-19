Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 590A2672EAA
	for <lists+linux-next@lfdr.de>; Thu, 19 Jan 2023 03:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjASCM1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Jan 2023 21:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjASCM0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Jan 2023 21:12:26 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA10222F1;
        Wed, 18 Jan 2023 18:12:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ny5jz1T6qz4xN1;
        Thu, 19 Jan 2023 13:12:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1674094343;
        bh=Zwx5h8g4pu1ve4peLagMpUQQBjAjjyv/cZ9FL+9fN0g=;
        h=Date:From:To:Cc:Subject:From;
        b=Qa2Un7n989BB/MPCzfMvxr2SE02pGdX92SHEIk0H1asQjBoFUDuLy9eTLFS0fzA4o
         79KTu13mZxM5bPH9PN1wXWl9QIOw+j5HOt1Y5g/8QnqV6w0VJF+Hs1rRlkgq03hXuy
         gc7C6Hbfj/XsfDKYf40avvH6521R7Ps0M+jd5xS17G27SdtonvAvssSifB8Y8E2oAK
         +FSS8w8tZCGiNmJ1K+siU10J5U3eN1jUBvN/vC+gRC55FwscOXNZDET3Zq5M7R7izs
         B+DZcrs+tK8edaSRWgkeWt9scM/0uxGFi4GiSjN7Drtx/3AZIvuNVpxF9cqvqBNlml
         UPrMbYKKqiSSA==
Date:   Thu, 19 Jan 2023 13:12:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20230119131222.4b7697c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bf4x3piptK9LwHOeyvf8I+i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bf4x3piptK9LwHOeyvf8I+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/gpu/drm/drm_fb_helper.c:33:
drivers/gpu/drm/drm_fb_helper.c: In function 'drm_fb_helper_single_fb_probe=
':
drivers/gpu/drm/drm_fb_helper.c:1968:24: error: 'dev' undeclared (first use=
 in this function); did you mean 'cdev'?
 1968 |         if (dev_is_pci(dev->dev))
      |                        ^~~
include/linux/pci.h:1151:25: note: in definition of macro 'dev_is_pci'
 1151 | #define dev_is_pci(d) ((d)->bus =3D=3D &pci_bus_type)
      |                         ^
drivers/gpu/drm/drm_fb_helper.c:1968:24: note: each undeclared identifier i=
s reported only once for each function it appears in
 1968 |         if (dev_is_pci(dev->dev))
      |                        ^~~
include/linux/pci.h:1151:25: note: in definition of macro 'dev_is_pci'
 1151 | #define dev_is_pci(d) ((d)->bus =3D=3D &pci_bus_type)
      |                         ^
In file included from include/linux/atomic/atomic-instrumented.h:20,
                 from include/linux/atomic.h:82,
                 from include/linux/console.h:17,
                 from drivers/gpu/drm/drm_fb_helper.c:32:
include/linux/compiler_types.h:299:27: error: expression in static assertio=
n is not an integer
  299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:20:9: note: in expansion of macro 'static_asse=
rt'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:20:23: note: in expansion of macro '__same_typ=
e'
   20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
include/linux/pci.h:541:23: note: in expansion of macro 'container_of'
  541 | #define to_pci_dev(n) container_of(n, struct pci_dev, dev)
      |                       ^~~~~~~~~~~~
drivers/gpu/drm/drm_fb_helper.c:1969:46: note: in expansion of macro 'to_pc=
i_dev'
 1969 |                 vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), =
fb_helper->info);
      |                                              ^~~~~~~~~~

Caused by commit

  cff84bac9922 ("drm/fh-helper: Split fbdev single-probe helper")

interacting with commit

  d1d5101452ab ("drm/fb-helper: Set framebuffer for vga-switcheroo clients")

from the drm-misc-fixes tree.

I have added the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 19 Jan 2023 12:42:56 +1100
Subject: [PATCH] fix up for "drm/fb-helper: Set framebuffer for vga-switche=
roo clients"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_fb_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helpe=
r.c
index 97049a26fca2..5e445c61252d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1942,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_f=
b_helper *fb_helper,
 					 int preferred_bpp)
 {
 	struct drm_client_dev *client =3D &fb_helper->client;
+	struct drm_device *dev =3D fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
=20
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/bf4x3piptK9LwHOeyvf8I+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPIpwYACgkQAVBC80lX
0GxXjQf/bdLniuOQx+0xXvX3g6drJhBnipUuQwfDR92l7Yr0+0PjOVq6q6TvvCR4
Qa20WX+CZXVKhdCOKievTU8FZzVo+EnO5BIXyNgBCPCtcTkay/5VG8LnrJryQ22x
ykuPi3XHZY2Dg1q91Mu6NsCyO1RkYQ1uDrkpcTriAZ+3SiJd1SnFfSopijAhN1F0
M1JQCfQUHr1T5Dy2ctE2FJnLGN4yVeOD7VS1PNd5QUFakZAK7mg4UrGMxtkVk0WZ
NKizvAa2D4gPVdZG8x9m1ZI4YWE4TQ8/bx4QYVxhBXayE/NvGhX21cc30mAuAa5Z
sq7KA7y8e0Qi9kqj/TgZjuYgpvWrLg==
=XQJJ
-----END PGP SIGNATURE-----

--Sig_/bf4x3piptK9LwHOeyvf8I+i--
