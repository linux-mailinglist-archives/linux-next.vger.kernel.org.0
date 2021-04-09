Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFD23592B6
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 05:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhDIDNP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 23:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbhDIDNO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 23:13:14 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B47C061760;
        Thu,  8 Apr 2021 20:13:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGjqr14Qqz9sW1;
        Fri,  9 Apr 2021 13:12:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617937978;
        bh=//XF3pf9c64cU+t13IzrOTUQCue+ZS7pXjZN4nupHbg=;
        h=Date:From:To:Cc:Subject:From;
        b=qax6trgBiOYRcsSNdKFHnpVvqoT/99lvSUdSLgtPjyygpFrMlOQ0RXCE3HVNTXY07
         04A7GqcMIbkDTCphq4BUSlczeW9m3EC4WTJV8C7JljzT47U7MQhfbKo8QuEKzmivnw
         Z0LMeywwlwFQs7QBaWFEAVj8i9HaP9RhNmW9k8Y+jlt72qttQI7wCYhjL0bgEjHofo
         K/aglLFfHlsrbmnpHSztligf5yRSZMblS8dLF2TN6/enfrio1sseSl/yKvEIEn4DZp
         lxcOJdfdaBMmjSbr+6rIoIoxqdBTSxTt+t9wY2WZKMidYXcl8M4ze11jYgLbR5hnHM
         aAEkwWBtmXs7w==
Date:   Fri, 9 Apr 2021 13:12:53 +1000
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
Message-ID: <20210409131253.1a67eae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.3TCEW2K/ucdGcZbZyQjv9B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.3TCEW2K/ucdGcZbZyQjv9B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_plane.c

between commit:

  35d65ab3fdba ("drm/vc4: plane: Remove redundant assignment")

from the drm-misc-fixes tree and commit:

  5ddb0bd4ddc3 ("drm/atomic: Pass the full state to planes async atomic che=
ck and update")

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

diff --cc drivers/gpu/drm/vc4/vc4_plane.c
index 1e9c84cf614a,c76e73a452e0..000000000000
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@@ -1133,31 -1135,34 +1135,33 @@@ void vc4_plane_async_set_fb(struct drm_
  }
 =20
  static void vc4_plane_atomic_async_update(struct drm_plane *plane,
- 					  struct drm_plane_state *state)
+ 					  struct drm_atomic_state *state)
  {
+ 	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_sta=
te(state,
+ 										 plane);
  	struct vc4_plane_state *vc4_state, *new_vc4_state;
 =20
- 	swap(plane->state->fb, state->fb);
- 	plane->state->crtc_x =3D state->crtc_x;
- 	plane->state->crtc_y =3D state->crtc_y;
- 	plane->state->crtc_w =3D state->crtc_w;
- 	plane->state->crtc_h =3D state->crtc_h;
- 	plane->state->src_x =3D state->src_x;
- 	plane->state->src_y =3D state->src_y;
- 	plane->state->src_w =3D state->src_w;
- 	plane->state->src_h =3D state->src_h;
- 	plane->state->alpha =3D state->alpha;
- 	plane->state->pixel_blend_mode =3D state->pixel_blend_mode;
- 	plane->state->rotation =3D state->rotation;
- 	plane->state->zpos =3D state->zpos;
- 	plane->state->normalized_zpos =3D state->normalized_zpos;
- 	plane->state->color_encoding =3D state->color_encoding;
- 	plane->state->color_range =3D state->color_range;
- 	plane->state->src =3D state->src;
- 	plane->state->dst =3D state->dst;
- 	plane->state->visible =3D state->visible;
-=20
- 	new_vc4_state =3D to_vc4_plane_state(state);
+ 	swap(plane->state->fb, new_plane_state->fb);
+ 	plane->state->crtc_x =3D new_plane_state->crtc_x;
+ 	plane->state->crtc_y =3D new_plane_state->crtc_y;
+ 	plane->state->crtc_w =3D new_plane_state->crtc_w;
+ 	plane->state->crtc_h =3D new_plane_state->crtc_h;
+ 	plane->state->src_x =3D new_plane_state->src_x;
+ 	plane->state->src_y =3D new_plane_state->src_y;
+ 	plane->state->src_w =3D new_plane_state->src_w;
+ 	plane->state->src_h =3D new_plane_state->src_h;
 -	plane->state->src_h =3D new_plane_state->src_h;
+ 	plane->state->alpha =3D new_plane_state->alpha;
+ 	plane->state->pixel_blend_mode =3D new_plane_state->pixel_blend_mode;
+ 	plane->state->rotation =3D new_plane_state->rotation;
+ 	plane->state->zpos =3D new_plane_state->zpos;
+ 	plane->state->normalized_zpos =3D new_plane_state->normalized_zpos;
+ 	plane->state->color_encoding =3D new_plane_state->color_encoding;
+ 	plane->state->color_range =3D new_plane_state->color_range;
+ 	plane->state->src =3D new_plane_state->src;
+ 	plane->state->dst =3D new_plane_state->dst;
+ 	plane->state->visible =3D new_plane_state->visible;
+=20
+ 	new_vc4_state =3D to_vc4_plane_state(new_plane_state);
  	vc4_state =3D to_vc4_plane_state(plane->state);
 =20
  	vc4_state->crtc_x =3D new_vc4_state->crtc_x;

--Sig_/.3TCEW2K/ucdGcZbZyQjv9B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBvxjUACgkQAVBC80lX
0GxIuwf+MLYE674mIMmHxJJji/55gWYtGGX/V3SrSewLyeKvHLfDuQlPItFchsX1
3Pz68dEgLmoWKU4VMulSbKduwWdP2SBPTT8CuKu9hXGjLj/CaVW9cG0CN6FFi55g
GQEnlmYDcvLjvVyMmi/Tva+TJ1ck9HRWzfiuSxeo9uDp4qsmSnl04DgKcfovOoy6
PY4kFCQ7d6QqF4Fnw5RQClDB8Lzf8SV0geat+Hvv9O9R244jLstLNx7rqLuNyd2S
bzyIMwugX/Oiu274Cxgf9W7aIeYSDrrdVwQ1HNTZErscCjoWjoKE/aFaCOnNKQ2r
y+SB5knEJv0xAg4gxS2Zxtzb+6SwSw==
=ya55
-----END PGP SIGNATURE-----

--Sig_/.3TCEW2K/ucdGcZbZyQjv9B--
