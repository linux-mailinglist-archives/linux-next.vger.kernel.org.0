Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB51527394D
	for <lists+linux-next@lfdr.de>; Tue, 22 Sep 2020 05:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgIVDea (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 23:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728712AbgIVDea (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Sep 2020 23:34:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632A3C061755;
        Mon, 21 Sep 2020 20:34:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BwRkS1XHyz9sTQ;
        Tue, 22 Sep 2020 13:34:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600745665;
        bh=kE/eQIIvejiVNgVuiLPMxkDduOmD4b/H7xjzjTsXLIU=;
        h=Date:From:To:Cc:Subject:From;
        b=fMTLWIDcxx7IKUxHM2cILY1eClHKUPacmZhfXtNbmMVddOoHRVln+kL/tDlP4QxVo
         9k7q1kgV7N/THWNCKryveGIxZHwjdxq9kIQhaTsCwWvtLie4IKhmIwyOxFAiLbpr3J
         AcuwsDoPvJuVCf364cSQfowGZ/+evVONvJ3+pnTXGHSCFzU4cvw3HVVHiazRt/mtqC
         43VwDxQlC1XtVOTlWPm+bfGHGpFO8d1vN2JFgzHOYJG/3rtmJIa5BjkqBx6qFIp2wr
         z+bGdgb6QIofKdk3J0yv3eaNXAllgtFIIie7CA08o/tqwCAU0eY2zwRTjiP7fZRMyi
         x0fQZXi2/lZ9w==
Date:   Tue, 22 Sep 2020 13:34:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Message-ID: <20200922133420.149dcbd0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9mjQf=4/FmIV+m0uvcJus0L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9mjQf=4/FmIV+m0uvcJus0L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/selftests/mock_gem_device.c

between commit:

  9f9f4101fc98 ("drm/i915/selftests: Push the fake iommu device from the st=
ack to data")

from the drm-intel tree and commit:

  cd01269d11a3 ("drm/i915/selftests: align more to real device lifetimes")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 397c313a8b69,c207d2239791..000000000000
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@@ -118,12 -116,11 +116,11 @@@ static struct dev_pm_domain pm_domain=20
 =20
  struct drm_i915_private *mock_gem_device(void)
  {
 -	struct drm_i915_private *i915;
 -	struct pci_dev *pdev;
  #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
 -	struct dev_iommu iommu;
 +	static struct dev_iommu fake_iommu =3D { .priv =3D (void *)-1 };
  #endif
 +	struct drm_i915_private *i915;
 +	struct pci_dev *pdev;
- 	int err;
 =20
  	pdev =3D kzalloc(sizeof(*pdev), GFP_KERNEL);
  	if (!pdev)
@@@ -141,11 -132,28 +132,26 @@@
  	dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 =20
  #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
 -	/* HACK HACK HACK to disable iommu for the fake device; force identity m=
apping */
 -	memset(&iommu, 0, sizeof(iommu));
 -	iommu.priv =3D (void *)-1;
 -	pdev->dev.iommu =3D &iommu;
 +	/* HACK to disable iommu for the fake device; force identity mapping */
 +	pdev->dev.iommu =3D &fake_iommu;
  #endif
+ 	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
+ 		put_device(&pdev->dev);
+ 		return NULL;
+ 	}
+=20
+ 	i915 =3D devm_drm_dev_alloc(&pdev->dev, &mock_driver,
+ 				  struct drm_i915_private, drm);
+ 	if (IS_ERR(i915)) {
+ 		pr_err("Failed to allocate mock GEM device: err=3D%ld\n", PTR_ERR(i915)=
);
+ 		devres_release_group(&pdev->dev, NULL);
+ 		put_device(&pdev->dev);
+=20
+ 		return NULL;
+ 	}
 =20
  	pci_set_drvdata(pdev, i915);
+ 	i915->drm.pdev =3D pdev;
 =20
  	dev_pm_domain_set(&pdev->dev, &pm_domain);
  	pm_runtime_enable(&pdev->dev);

--Sig_/9mjQf=4/FmIV+m0uvcJus0L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9pcLwACgkQAVBC80lX
0Gwq9Af/S1WDHFw/FtKLGg+c18sLxAFdxecg+cuEhRg2XgfecUztRz3r7J8/JX9Z
UCwQqiv0kGB5+IKpKEve9TZWH78r9Sao9DXj9TbcHgz/FU110+rkuCutKiA/gpYt
ChH0KdeICx0y1WkGV3lvlhTdqJ4Gr/8+Pvr62OzY0R2VK+u7ocxuuCE/lOjfvGJE
EoAdC2roIaNse1zWGCQgf3QRx9LpmKJS8XhQfWOVkXgy0qyDuBbzcSyYABF4YTFw
+SjQaV860zXvDMs0JqnrMo6QECF7Y29SZrsFbCc9aTP1EG/s/PR3ttfwKWtjuLv0
+2i2G6t5x1neRS5HnXFRXhE7Eyl2yQ==
=4Ip8
-----END PGP SIGNATURE-----

--Sig_/9mjQf=4/FmIV+m0uvcJus0L--
