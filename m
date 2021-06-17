Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9433AA8BA
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 03:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbhFQBo0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Jun 2021 21:44:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39171 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229713AbhFQBo0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Jun 2021 21:44:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G54YJ1RNLz9sW4;
        Thu, 17 Jun 2021 11:42:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623894134;
        bh=I1EcfeSL1oQCetBOruF67yYdf2PJDFYtyBZ2rB1ehNU=;
        h=Date:From:To:Cc:Subject:From;
        b=rvnCAdUgg3zRF9IGVMGrShXKe5oofww8eLNjaucazTK5ld5uO7c0LJwYH0RciSl6O
         v0HKsOCDOfGhKGJuOPr0GOd+q7WknFn8F/JfpXZw1PHiqvtB85QQTVMISFM2FaPHo9
         xtGZBmgz5gwW4UA/u8AWZ0Kl3rRoVqL9AjAvmvYXG0yBKv70cC9EGiRpUW0D4bQQIf
         PR+Baek376m/yel4RLbIRMHMNmzkNkLnQ6Kbm03U75j/0i7jeP/CxXipbtJHgbqpi0
         zTDNIb26+IN07zSsNLAvWBmSshdWOrhn1BCqKhHmAIdyITpwFV0bLjeCZWJV20TJt2
         p2lfIYxfJzGuw==
Date:   Thu, 17 Jun 2021 11:42:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20210617114211.335cfceb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ntqrCRhKsl=qksGA+3m5hXx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ntqrCRhKsl=qksGA+3m5hXx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_hdmi.c

between commit:

  9984d6664ce9 ("drm/vc4: hdmi: Make sure the controller is powered in dete=
ct")

from the drm-misc-fixes tree and commit:

  6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vc4/vc4_hdmi.c
index 8106b5634fe1,3c4cc133e3df..000000000000
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@@ -159,12 -166,9 +166,11 @@@ vc4_hdmi_connector_detect(struct drm_co
  	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
  	bool connected =3D false;
 =20
 +	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
 +
- 	if (vc4_hdmi->hpd_gpio) {
- 		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
- 		    vc4_hdmi->hpd_active_low)
- 			connected =3D true;
+ 	if (vc4_hdmi->hpd_gpio &&
+ 	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
+ 		connected =3D true;
  	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
  		connected =3D true;
  	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
@@@ -787,16 -942,26 +945,18 @@@ static void vc4_hdmi_encoder_pre_crtc_c
  		return;
  	}
 =20
 -	ret =3D clk_prepare_enable(vc4_hdmi->hsm_clock);
 -	if (ret) {
 -		DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
 -		clk_disable_unprepare(vc4_hdmi->pixel_clock);
 -		return;
 -	}
 -
  	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 =20
- 	/*
- 	 * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
- 	 * at 300MHz.
- 	 */
- 	ret =3D clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
- 			       (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
+ 	if (pixel_rate > 297000000)
+ 		bvb_rate =3D 300000000;
+ 	else if (pixel_rate > 148500000)
+ 		bvb_rate =3D 150000000;
+ 	else
+ 		bvb_rate =3D 75000000;
+=20
+ 	ret =3D clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
  	if (ret) {
  		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
 -		clk_disable_unprepare(vc4_hdmi->hsm_clock);
  		clk_disable_unprepare(vc4_hdmi->pixel_clock);
  		return;
  	}

--Sig_/ntqrCRhKsl=qksGA+3m5hXx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDKqHMACgkQAVBC80lX
0GyjsQf/fVlmH4LgWpLmxEk6RZQqD3HUQP2BDiVrnQOr+s2YvPtWdd3ov4Ql6j9W
gvnPvwZ8i//LOy9XDyKSOxiJC9v/81p1pjE+kZvZY39yv/1EGKmfeN1/uTb1kJuV
m4cV7TzIA7vRJcQ44NjxTqT/8aqwrPyqqetY6pFGXRKiRWhpbCtRvGCVaa4a+eUI
PvcqZLjH6zPDxTn35cCtTr0HQbaY66zGmp2vTyQSllfnCooaOXaX+24HxyI1VnbQ
UkLRaKRiR5yDlqXnv8fcLcEIYPEwXSJ2PCd3r5mZSRn8wV9C1IStSuZlfITeU6Oy
4ORJVJojTsI9ijX4xL9v5i/7gpr9+A==
=FWnf
-----END PGP SIGNATURE-----

--Sig_/ntqrCRhKsl=qksGA+3m5hXx--
