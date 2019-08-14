Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357AE8C9DC
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 05:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfHNDU4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 23:20:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33487 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726909AbfHNDU4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 23:20:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467Zbn2WQBz9sDB;
        Wed, 14 Aug 2019 13:20:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565752853;
        bh=aDsEWAk8z5cWPOG79P6XI4GbMTAPFisWuPLsGPIVZaE=;
        h=Date:From:To:Cc:Subject:From;
        b=OfvMgYDEoc5j4nmZxjhAiXUu8JURMocpVhHAxh5LYGPt5wh1xfDF4uSVU33HFFml/
         bVD69r0O8Bj9PFG9LfVVbm2ZGeGlTML5crheGADIF91G1+F7REZsZ/ZQIPTWcSsJWB
         aSKlBGjcCWQu8MGD7Hu8H4YrAfCYZkBnIUWls7McriXALqsrGB1T219MJLqqnjcDSp
         ukd3JOX+9q01A3GpQf4H8hpgcjVDaaDR2PZU3w1oCRieSWnMiU8GNFvN2J6VLxGDih
         02hJHfYeGvg8Eb9vt01OYf4wcYmbhCSuvy4RVyQXJpn7Wq9LFOIKBzUZ6Y/9bGA/m2
         ve5tACyT+5GSA==
Date:   Wed, 14 Aug 2019 13:20:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: manual merge of the etnaviv tree with the drm-misc tree
Message-ID: <20190814132052.6a948fec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vRy27nI4wAjYLxi9_zgcFMc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vRy27nI4wAjYLxi9_zgcFMc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the etnaviv tree got a conflict in:

  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c

between commit:

  52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")

from the drm-misc tree and commit:

  6eae41fea750 ("drm/etnaviv: drop use of drmP.h")
  2e737e520548 ("drm/etnaviv: clean up includes")

from the etnaviv tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 998c96b40d8a,f535a627f297..000000000000
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@@ -3,9 -3,15 +3,15 @@@
   * Copyright (C) 2015 Etnaviv Project
   */
 =20
+ #include <drm/drm_file.h>
  #include <linux/dma-fence-array.h>
+ #include <linux/file.h>
+ #include <linux/pm_runtime.h>
 -#include <linux/reservation.h>
 +#include <linux/dma-resv.h>
  #include <linux/sync_file.h>
+ #include <linux/uaccess.h>
+ #include <linux/vmalloc.h>
+=20
  #include "etnaviv_cmdbuf.h"
  #include "etnaviv_drv.h"
  #include "etnaviv_gpu.h"

--Sig_/vRy27nI4wAjYLxi9_zgcFMc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1TfhQACgkQAVBC80lX
0GzCiAf/bmDL6BQOfqpZNVydZdEuaCwG8NkzhvP0TftrctQAmqld5q7Q+GrRccf8
WtvfE18XBcAXibGZ8XsTK/iHJtg/g+BvONECGs+q4uu51ecaDgUOjMS73ZHo3gp8
azilrXfnHBi3SGGZkXdftk3MOJfYM9SIAaMuDGXGwN27NuGs1j1a1L7AzrlGTyQy
4UPhQGUpRmL2/XnlB0So2Lhr0WleOvrxVBDQP5O6IJWlKwzKecq28LhG/ueuDAY+
W4c1evel6Xxv6o9BfSpLxkUrGRSRNohyyWPf1uBbm54E/NGk1kuHErYng94aqPd8
8WXvlmss5jlimth4qziUbwJY5lu60Q==
=JxjQ
-----END PGP SIGNATURE-----

--Sig_/vRy27nI4wAjYLxi9_zgcFMc--
