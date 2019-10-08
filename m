Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04670D0437
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 01:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfJHXig (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 19:38:36 -0400
Received: from ozlabs.org ([203.11.71.1]:41839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726822AbfJHXig (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Oct 2019 19:38:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nv1M3pwyz9sPL;
        Wed,  9 Oct 2019 10:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570577912;
        bh=1lm8mYQPJzPKDhit1Mo4RGEcsekl2gAaPnzcVPSg8Kc=;
        h=Date:From:To:Cc:Subject:From;
        b=W4sgBgjRAs1uMxPyDwilr2XyPJu8Kd3VendqHI5I/LNoH9HRtFnFOMO6X/2rC1TgU
         6r4bWFEq3QIYPsp2uggQu9RWNPQYhBDa5Y/KVzWjk5Kv+3effK4wA/niIEqHvOOxaf
         sHRdqJ+A+8kyNslxgtGlX+CvJwoscjzWEo0e+27Q4C7EwpvZEWFoAABPGHX0gsvIJn
         I27wHx81r4y5FcDfro0cOJ/a0D2mNKpoDwFg4tXchTvzwGere1c+ghLu6StSdQzQuU
         LK8ttSP08+QZAsb9N2jxtceaiSAU7KjDur2v7YjD8LqQTSP/ig1xaVOImP3w1Yr93t
         39LVOWPoFno0w==
Date:   Wed, 9 Oct 2019 10:38:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20191009103830.0b75dbb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_/zJcqceIEDcW/o/wfX083J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_/zJcqceIEDcW/o/wfX083J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.c

between commit:

  2d6f6f359fd8 ("drm/i915: add i915_driver_modeset_remove()")

from the drm tree and commit:

  f2521f7731ed ("drm/i915: switch to drm_fb_helper_remove_conflicting_pci_f=
ramebuffers")

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

diff --cc drivers/gpu/drm/i915/i915_drv.c
index 15abad5c2d62,1c4ff8b5b0a2..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@@ -350,44 -422,6 +350,19 @@@ out
  	return ret;
  }
 =20
- static int i915_kick_out_firmware_fb(struct drm_i915_private *dev_priv)
- {
- 	struct apertures_struct *ap;
- 	struct pci_dev *pdev =3D dev_priv->drm.pdev;
- 	struct i915_ggtt *ggtt =3D &dev_priv->ggtt;
- 	bool primary;
- 	int ret;
-=20
- 	ap =3D alloc_apertures(1);
- 	if (!ap)
- 		return -ENOMEM;
-=20
- 	ap->ranges[0].base =3D ggtt->gmadr.start;
- 	ap->ranges[0].size =3D ggtt->mappable_end;
-=20
- 	primary =3D
- 		pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
-=20
- 	ret =3D drm_fb_helper_remove_conflicting_framebuffers(ap, "inteldrmfb", =
primary);
-=20
- 	kfree(ap);
-=20
- 	return ret;
- }
-=20
 +static void i915_driver_modeset_remove(struct drm_i915_private *i915)
 +{
 +	intel_modeset_driver_remove(i915);
 +
 +	intel_bios_driver_remove(i915);
 +
 +	i915_switcheroo_unregister(i915);
 +
 +	intel_vga_unregister(i915);
 +
 +	intel_csr_ucode_fini(i915);
 +}
 +
  static void intel_init_dpio(struct drm_i915_private *dev_priv)
  {
  	/*

--Sig_/_/zJcqceIEDcW/o/wfX083J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2dHfYACgkQAVBC80lX
0GwyhAf/ebekB2v3yeFzeOUNfR+hb/RMJVxhfa8dyuaoqO8jX8X+QuyDPM0ZoyZ1
M/MMTW1aEcPn4c+1j9u/ctM92gklAaJGVYmhM+mRN0Jk2zt1+7oZ9tewCXDSFtiv
63EVFP3/L75/38bhe7PVyGkDWo8hBgteXVc06+MY+ZTQpqLCt69u86RqVTCvo5ss
hbNjJBVZW9hAcXMYF3bfxDByFDDCku+FysGkBPj2TG5tndGY08CHURV7tXipdHb4
psKyOZdwKPwJCyZxaFuti1kCAAX53HJBswWZ9rIlcUASXwp+rOmabO33PrPCErBZ
/PhBPCa4dyaU6v5hRH/6IyEbJAhudg==
=UVGC
-----END PGP SIGNATURE-----

--Sig_/_/zJcqceIEDcW/o/wfX083J--
