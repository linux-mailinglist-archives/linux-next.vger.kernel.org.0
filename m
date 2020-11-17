Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F81D2B55BA
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 01:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgKQAcL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 19:32:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52843 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730225AbgKQAcK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 19:32:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZn2B4JDGz9sRK;
        Tue, 17 Nov 2020 11:32:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605573127;
        bh=V9ydg2LxEVWrqzBnw4r/Moz9ZtUWw12zFNoMCblPROw=;
        h=Date:From:To:Cc:Subject:From;
        b=cL4zmRA1ccuklJbyk5L34kIble7StjBtSt5a9+4IVX+tiAxZnyriyPJy5glAxGPvZ
         uzbIpwNeQUgXyqITQrr2RROUd4gfeHivduAx64GyF9YIai7/XlTTFmNss//EGPiR50
         0iGKLNr4S480tKzVgau/4KzhJXHm/9kW/0fE98IIPDXXfAEL0mPHAeukroKd1kNK3E
         rerVuGswvb84VGd4M5YqPayo7ogZ5+4OTrHLEd04JNjt462kgF4bO2R0QMHzy1uIUR
         zoEjT2RFTW18JPtS0iCCsdydzywtk15tP4QDNlmvNI9cr+NdYa7t692d1DY3CLkZet
         Z1rwr5dftf03w==
Date:   Tue, 17 Nov 2020 11:31:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@linux.ie>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20201117113159.3574fbcf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uHhQCdvnBQ_XxE5t5/mxZAN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uHhQCdvnBQ_XxE5t5/mxZAN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/radeon/radeon_drv.c

between commit:

  384bc5e059d4 ("drm/radeon: Stop changing the drm_driver struct")

from the drm tree and commits:

  4d3efadd374a ("drm/radeon/radeon: Move prototype into shared header")
  0a2e8d51e4da ("drm/radeon/radeon_drv: Move 'radeon_mmap()'s prototype to =
shared header")
  f3723ad110c5 ("drm/radeon/radeon_drv: Move 'radeon_driver_irq_handler_kms=
's prototype into shared header")
  4138b62b8a79 ("drm/radeon/radeon_drv: Move 'radeon_gem_prime_import_sg_ta=
ble()'s prototype to shared header")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/radeon/radeon_drv.c
index bfadb799d6a3,84f5d56528ee..000000000000
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@@ -51,7 -51,10 +51,11 @@@
  #include <drm/radeon_drm.h>
 =20
  #include "radeon_drv.h"
 +#include "radeon.h"
+ #include "radeon_kms.h"
+ #include "radeon_ttm.h"
+ #include "radeon_device.h"
+ #include "radeon_prime.h"
 =20
  /*
   * KMS wrapper.
@@@ -130,7 -123,8 +124,6 @@@ extern int radeon_get_crtc_scanoutpos(s
  				      ktime_t *stime, ktime_t *etime,
  				      const struct drm_display_mode *mode);
  extern bool radeon_is_px(struct drm_device *dev);
- int radeon_mmap(struct file *filp, struct vm_area_struct *vma);
 -extern const struct drm_ioctl_desc radeon_ioctls_kms[];
 -extern int radeon_max_kms_ioctl;
  int radeon_mode_dumb_mmap(struct drm_file *filp,
  			  struct drm_device *dev,
  			  uint32_t handle, uint64_t *offset_p);
@@@ -297,10 -288,8 +287,8 @@@ static struct pci_device_id pciidlist[
 =20
  MODULE_DEVICE_TABLE(pci, pciidlist);
 =20
 -static struct drm_driver kms_driver;
 +static const struct drm_driver kms_driver;
 =20
- bool radeon_device_is_virtual(void);
-=20
  static int radeon_pci_probe(struct pci_dev *pdev,
  			    const struct pci_device_id *ent)
  {

--Sig_/uHhQCdvnBQ_XxE5t5/mxZAN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zGf8ACgkQAVBC80lX
0Gw+/QgAg0MJJ75mimiIgTtnahfvVlArpUqlZvsVAqagrAdkfl8iiDmeVNNYy1P/
y0I7gFYAt3IoxG5qtMgkUS4pka7K/1Ez8ChJF28VMmCpC8KLDAhQ4+p76RyKfMbU
tgF3m23NljXCHC9xHVekxLXyE2C7vCF2I55dHDcGrM1bxmsoX3K8UyhkNIIdp/wM
tpdqT/LsYRzY3WOwNgzqdIbn2V8ySRjfDtOGovC3aiHmheYUGX4TPMHpbcMR0sWn
1SZfDVfB65krcsc1rzKZAkPFm0asFNTqsbfjA9Re5qwMD7NpPaphQ6IfqjhvCvCj
hcIzD8//p1dwCWmFzp6st9g1glTF6g==
=Iyjy
-----END PGP SIGNATURE-----

--Sig_/uHhQCdvnBQ_XxE5t5/mxZAN--
