Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5124933E772
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 04:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCQDIl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 23:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhCQDIa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 23:08:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F223AC06174A;
        Tue, 16 Mar 2021 20:08:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0ZqG0Slgz9sVm;
        Wed, 17 Mar 2021 14:08:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615950508;
        bh=cH40xToruz58wQe0FpxRyTXHd19xqW7j16su0L1Ebec=;
        h=Date:From:To:Cc:Subject:From;
        b=VSAMQd3f+7Jvr8R9DrAlK/jgy5vicojoLWScnGXDM4LIx33daAbMjIiIvHCBhJaG9
         9Rcf0HB5Umt0ZTpmc/vjmEu8t3NkHCjym3HRa1HMitKmCATBJDXgpd1EeeLLR/HzSF
         MLvRGABlyHVy+6SRkIBGwJ7fnjtLytOB/lWF++QRSV12IcBzKwe5ApdfZG2hxVX40V
         lnbi/uvOFXbdzH3TXs8zgzxzDjhyAz7OaDcfp4C8ryDAV9lfE+ishgr1+2BdK/ulkm
         ixtoflF3gvxuOxHmxStqTI6UTQAC1w37zDYCDvSzZY4mE6McWXQSBHH1/6KMLMSbrv
         qTCCtI5z0IQVw==
Date:   Wed, 17 Mar 2021 14:08:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@redhat.com>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20210317140824.0a28ffec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZM_0D8_+CwGK+99=bNDRc6R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZM_0D8_+CwGK+99=bNDRc6R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_sprite.c

between commit:

  92f1d09ca4ed ("drm: Switch to %p4cc format modifier")

from the drm tree and commit:

  46d12f911821 ("drm/i915: migrate skl planes code new file (v5)")

from the drm-intel tree.

I fixed it up (I used the latter version of the file and applied the
following patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Mar 2021 14:05:42 +1100
Subject: [PATCH] merge fix for "drm: Switch to %p4cc format modifier"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/g=
pu/drm/i915/display/skl_universal_plane.c
index 1f335cb09149..45ceff436bf7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1120,7 +1120,6 @@ static int skl_plane_check_fb(const struct intel_crtc=
_state *crtc_state,
 	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
 	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
 	unsigned int rotation =3D plane_state->hw.rotation;
-	struct drm_format_name_buf format_name;
=20
 	if (!fb)
 		return 0;
@@ -1168,9 +1167,8 @@ static int skl_plane_check_fb(const struct intel_crtc=
_state *crtc_state,
 		case DRM_FORMAT_XVYU12_16161616:
 		case DRM_FORMAT_XVYU16161616:
 			drm_dbg_kms(&dev_priv->drm,
-				    "Unsupported pixel format %s for 90/270!\n",
-				    drm_get_format_name(fb->format->format,
-							&format_name));
+				    "Unsupported pixel format %p4cc for 90/270!\n",
+				    &fb->format->format);
 			return -EINVAL;
 		default:
 			break;
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/ZM_0D8_+CwGK+99=bNDRc6R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRcqgACgkQAVBC80lX
0GzpPQf/Qmq07BQBwuzbRx+B4fgrek5GFFs+ZPbqb1g+37MEpyLOQbIvL3BIAjYF
D1+OPvka3Tmc5w0m9WuY96SRa8weXYF7j2+ObAI+1SNhW3ComB7pwfcX1igZYYjU
51PC0LHakatD9tFddwg+gdtv7KoHKwH2+vhJ7JnOtTIRS6k3PeSOAQDjZr6NjFzi
CHNm1oFqJ9N34ugjGxQluCUOUiJm1rpp+bPwtB2a/ZaPpVmaacQp97n+g5iyFjdV
cEQIgPhpnGjf/GbI2AkU6FR0P51k3WEIVrCjLLTT16SECxX0oHgULP7qmZP1c4UU
UftEPCYtM7qPmz8xOJF+QrdBciFt2Q==
=+a1W
-----END PGP SIGNATURE-----

--Sig_/ZM_0D8_+CwGK+99=bNDRc6R--
