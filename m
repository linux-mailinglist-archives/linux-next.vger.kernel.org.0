Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FAA27A602
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 05:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgI1DyM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Sep 2020 23:54:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgI1DyM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Sep 2020 23:54:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C07tS6Dtrz9sSC;
        Mon, 28 Sep 2020 13:54:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601265250;
        bh=zJZbAuZVkx42FoKhUXPLJIvzQCvkeCOXLrWnMARQTLM=;
        h=Date:From:To:Cc:Subject:From;
        b=InBSiV7PACLpqSfam1oCU3GUsUkYDYzaH9tnw8L20pgNLTrNDbrjAYPORCvV/IEKH
         RzeeVX3zGBfbgsbQAwYvdE8BuW1ALkEwwfzq5dbvQbzEokt4CEKhNJzgD/LI2yxyQY
         kUZFcQAHTs3GuTj+hojmRgly0bM3n58YFOkqGlWbt9Igzyz3yrJ85+JFKRXxzShMm6
         gez+DbcZtmLFBRbsvi1fZTRjqAbQ8HotvHVtsnGZ5NeC26K5DaKLBkKz/JYuZjh3Hl
         AQ6v0PGQQO0Rxnq756hL4Q1UGpT/7vsYY+yGKE5iGqYKaay9ZHGSp6POkS2BZbLWrC
         q3wObpwmu3k8g==
Date:   Mon, 28 Sep 2020 13:54:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20200928135405.73404219@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TtqDvJSRZxzN_9i5h=CBwVG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TtqDvJSRZxzN_9i5h=CBwVG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_sync_da=
ta':
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:478:4: error: implicit declaratio=
n of function 'dma_cache_sync'; did you mean 'regcache_sync'? [-Werror=3Dim=
plicit-function-declaration]
  478 |    dma_cache_sync(priv->dev, addr + offset,
      |    ^~~~~~~~~~~~~~
      |    regcache_sync
drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_gem_mma=
p':
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:671:11: error: 'DMA_ATTR_NON_CONS=
ISTENT' undeclared (first use in this function)
  671 |   attrs =3D DMA_ATTR_NON_CONSISTENT;
      |           ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:671:11: note: each undeclared ide=
ntifier is reported only once for each function it appears in

Caused by commit

  37054fc81443 ("gpu/drm: ingenic: Add option to mmap GEM buffers cached")

interacting with commits

  5a8429227140 ("dma-mapping: remove dma_cache_sync")
  efa70f2fdc84 ("dma-mapping: add a new dma_alloc_pages API")

from the dma-mapping tree.

Its not immediately obvious how to fix this up, so I have just marked
CONFIG_DRM_INGENIC as BROKEN until a fix up is provided.

--=20
Cheers,
Stephen Rothwell

--Sig_/TtqDvJSRZxzN_9i5h=CBwVG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9xXl0ACgkQAVBC80lX
0GwLMwf9HC4vQnyBXp4F+rGioMw5maEobTmfFn1IC5QL/ahSKbDX1Sv0pYo2WCfR
afvxdZbG1SFC9U5jF9n/gnBxyq3DIdPK+/3TScFbMGKWq23BpyA+50oVl1joZq7l
ThZ31182NgnYUgiGnDPpSuNF2olCo0ot4c9tCuu9wHau47tqxsWm2ijp1SuzMdT8
0rDEShd5HHDG4a9WwRpJUCsIVslKT9tfcFwjYwXGz3R+nWyIxkICLjCXQ0ze39zD
iGJN0IVEWnzt3Ix8acp+R0OHJVEqcZwA5xmSkv8O3nOAMvm8UoU0lN2b6aOxQRYi
o4N4nqROvaXI1VM9nzW1CA+I9WAJhw==
=/EiK
-----END PGP SIGNATURE-----

--Sig_/TtqDvJSRZxzN_9i5h=CBwVG--
