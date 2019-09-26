Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D4DBF61A
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 17:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfIZPnk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 11:43:40 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34892 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfIZPnk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 11:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NBX57sFuKjtBPrTUHJDkACSKpkdPcWpMh+F7o309LqY=; b=NK94D5gglxhUnieF+ULb4HAgJ
        7HJbyFcemE0CxlzR+ocU+JMc8FkGQgGcz5Jdycvg8A+S+ehEYOXjsABNn5grKNMOOyfL3LsvCDtKr
        bSt3lnfH6zED57Fv6RgQZ+J0U5s2qTOv5hYipNg51VSesJuTrejFrPCH237scsZ8LyoQQ=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iDVvY-0003yj-U8; Thu, 26 Sep 2019 15:43:33 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 5A75AD02CFF; Thu, 26 Sep 2019 16:43:31 +0100 (BST)
Date:   Thu, 26 Sep 2019 08:43:31 -0700
From:   Mark Brown <broonie@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the amlogic tree with the FIXME tree
Message-ID: <20190926154331.GX2036@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x735uyZ2C9eR7U1j"
Content-Disposition: inline
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--x735uyZ2C9eR7U1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amlogic tree got a conflict in:

  drivers/gpu/drm/meson/meson_drv.c

between commit:

  66620f48cb59440 ("drm/meson: drop use of drmP.h")

=66rom Linus' tree and commit:

  e478e0ba4ffec31 ("drm/meson: enable runtime PM")

=66rom the amlogic tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/meson/meson_drv.c
index a24f8dec5adc9,256b6a0e9c6b2..0000000000000
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@@ -8,30 -8,36 +8,31 @@@
   *     Jasper St. Pierre <jstpierre@mecheye.net>
   */
 =20
 -#include <linux/kernel.h>
 -#include <linux/module.h>
 -#include <linux/mutex.h>
 -#include <linux/platform_device.h>
  #include <linux/component.h>
 +#include <linux/module.h>
  #include <linux/of_graph.h>
 +#include <linux/platform_device.h>
+ #include <linux/pm_runtime.h>
 +#include <linux/soc/amlogic/meson-canvas.h>
 =20
 -#include <drm/drmP.h>
 -#include <drm/drm_atomic.h>
  #include <drm/drm_atomic_helper.h>
 -#include <drm/drm_fb_cma_helper.h>
 +#include <drm/drm_drv.h>
  #include <drm/drm_fb_helper.h>
 -#include <drm/drm_flip_work.h>
  #include <drm/drm_gem_cma_helper.h>
  #include <drm/drm_gem_framebuffer_helper.h>
 -#include <drm/drm_plane_helper.h>
 +#include <drm/drm_irq.h>
 +#include <drm/drm_modeset_helper_vtables.h>
  #include <drm/drm_probe_helper.h>
 -#include <drm/drm_rect.h>
 +#include <drm/drm_vblank.h>
 =20
 +#include "meson_crtc.h"
  #include "meson_drv.h"
 -#include "meson_plane.h"
  #include "meson_overlay.h"
 -#include "meson_crtc.h"
 +#include "meson_plane.h"
 +#include "meson_registers.h"
  #include "meson_venc_cvbs.h"
 -
 -#include "meson_vpp.h"
  #include "meson_viu.h"
 -#include "meson_venc.h"
 -#include "meson_registers.h"
 +#include "meson_vpp.h"
 =20
  #define DRIVER_NAME "meson"
  #define DRIVER_DESC "Amlogic Meson DRM driver"

--x735uyZ2C9eR7U1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2M3KIACgkQJNaLcl1U
h9Bn0Qf/Z4VcbgndgnTVp4VmQHNoU+SpAW+zTuVy9ep2jQIy4XpcNT3rjTkldgJV
WqqsbGJou1kEojyzB/8P5hD5XCtgLHsUwhjSkNy94gUF1kCrqpXGCNrLYmRBliua
E5nddB8eDlmV01cHcjrZmbxTLlAJkjHF/BJEOFOGpFC0aBRbOOpt/eTZpaiU4JS5
qEK4elVM68ZAqEGpcZ6cHuEx9mO8z8UorSwK7ryzIhYdddfIV45GcPEfehyhsJCi
+SAeUuGtMbAu+PEUwBL4Z5VViamuVCq46tEB5fIAL8XoRb86AwqCQt+hi9QPc6Pu
1qvehBkFePpbGbBGdAaHjpzrJGBixA==
=wTNs
-----END PGP SIGNATURE-----

--x735uyZ2C9eR7U1j--
