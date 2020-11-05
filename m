Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F452A748F
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 02:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732331AbgKEBIq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 20:08:46 -0500
Received: from ozlabs.org ([203.11.71.1]:44137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730429AbgKEBIq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Nov 2020 20:08:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRQQ316BDz9sTK;
        Thu,  5 Nov 2020 12:08:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604538524;
        bh=oi6ob72AUai3KbvsuEo7KDpVVeH1BIO8XzCS7g+cu0Q=;
        h=Date:From:To:Cc:Subject:From;
        b=YsOc8d2tvWJfY32gPLUhB+BRKi/UOnuoOrVHJex29FfmNSUP6U9aLBv23fV8ZpI9X
         DRnP4NM1wKZuqX9Txuk9b65sg5FjBHI709aX2x25+ABSJAnMQefmUv9AVXOq0LP6YV
         wvodQd885KiGajwDeks28TmnvhWzFhw8fzN5WG6B40SLFn92wAIiiPgssS4CgS8pw0
         VK0DWuqt8XqtAU9yqEkA+Ve+A08fZ2Qpj8E6c8BVz3E2+/f4Q8+bnTM4Lj79Pwwd5C
         v6mxCnOyA+Os7+19tJHZEMmdi/4oaCuTvy0uWSyllzgUOAIpAh9K03eIjEbtqDhH1b
         MjuzlnVB/dyrg==
Date:   Thu, 5 Nov 2020 12:08:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Rob Clark <robdclark@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20201105120841.353f981f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VgW/34rCHsR3f3Z4QlQZIf1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VgW/34rCHsR3f3Z4QlQZIf1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  include/drm/drm_crtc.h

between commit:

  5c759eda9b04 ("drm: Introduce plane and CRTC scaling filter properties")

from the drm tree and commit:

  cb21f3f882ad ("drm/msm/atomic: Drop per-CRTC locks in reverse order")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_crtc.h
index ba839e5e357d,cd42f79b2890..000000000000
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@@ -1279,7 -1266,14 +1279,17 @@@ static inline struct drm_crtc *drm_crtc
  #define drm_for_each_crtc(crtc, dev) \
  	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
 =20
+ /**
+  * drm_for_each_crtc_reverse - iterate over all CRTCs in reverse order
+  * @crtc: a &struct drm_crtc as the loop cursor
+  * @dev: the &struct drm_device
+  *
+  * Iterate over all CRTCs of @dev.
+  */
+ #define drm_for_each_crtc_reverse(crtc, dev) \
+ 	list_for_each_entry_reverse(crtc, &(dev)->mode_config.crtc_list, head)
+=20
 +int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 +					    unsigned int supported_filters);
 +
  #endif /* __DRM_CRTC_H__ */

--Sig_/VgW/34rCHsR3f3Z4QlQZIf1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jUJkACgkQAVBC80lX
0Gy6Cwf/QxAeZjebZ/IxdQIW1crxIQZGPZDVgLWJXs6SHFzngnDKii8K3gcT1bIj
YV37+qbUl4T75Gna+aYu4G7kcGOEUDPkr5POK1QGyZ9qRfyrTwm0p6TOz6K9GmDt
PNtGUpDOWMzRqnQHvyZPX1ZjhH06t3EvdOThZAwLeKpBIKnfBZ/U67BSSkBwrz5x
FG456q/is2Z680HIXxWShdjSiSCbAiqS6vHHWG9tpBEQ9TwlpkaZbmnf3KMWI4CK
GLA6NNWls2nCOpO1lcyDQOUNBMlgfNBJZvYIt3l+VGZP5Gsv/N7Y4Ovx6KP5bULQ
H68fJrwfoVj+jmBZ0Vts+eP34fytig==
=huOO
-----END PGP SIGNATURE-----

--Sig_/VgW/34rCHsR3f3Z4QlQZIf1--
