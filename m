Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650D42A3AFA
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 04:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCDVO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 22:21:14 -0500
Received: from ozlabs.org ([203.11.71.1]:39755 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbgKCDVN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Nov 2020 22:21:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQFRp2NgSz9sTL;
        Tue,  3 Nov 2020 14:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604373671;
        bh=0i7bKmueBR4uQHiGXA3iF8NKg7TqS2wm+4YVrKH6fvk=;
        h=Date:From:To:Cc:Subject:From;
        b=bIoTxi396cMOEWHHJSc2eP3fCptQSrLw9g372pbo+YWATGp4s3+5zGXNhBzf0fUOD
         OzEJk7zO3NiSp0KDPQ0sRaQy1BL/mrlcFKghuoKOVu5jHDjoVpVo7kPSLz+s+P8Gu/
         +o5FNTfs9VSNdiwWw9j+cjudSZLe0ox4vU2ymrOEcEsaR7hnMbpjWhjGjxTNgeg0Ev
         l+rQjF7To+2ZwDDyZps3hHFAK3Xhg+ZjvmJKiLXPCAN/7of2/ybgOleuqeuGDkGwTQ
         hWZhoEQgUy4Fr5VneCqxBKFzU5KIWX4cfgfdXylwtv8+ctIhqLEdmHmKSeBj4+zUpo
         IlBJaFALHXD3w==
Date:   Tue, 3 Nov 2020 14:21:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20201103142108.129da15c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v_VTF3=V=ZLQ0Zhu5lDpUs9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v_VTF3=V=ZLQ0Zhu5lDpUs9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

between commit:

  e8a982355f96 ("drm/amd/display: Add tracepoint for amdgpu_dm")

from the amdgpu tree and commit:

  29b77ad7b9ca ("drm/atomic: Pass the full state to CRTC atomic_check")

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

diff --cc drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 28dcaae06993,86fd4420f128..000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -6003,19 -5514,19 +6003,21 @@@ static void dm_update_crtc_active_plane
  }
 =20
  static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
- 				       struct drm_crtc_state *state)
+ 				       struct drm_atomic_state *state)
  {
+ 	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(stat=
e,
+ 									  crtc);
  	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
  	struct dc *dc =3D adev->dm.dc;
- 	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(state);
+ 	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(crtc_state);
  	int ret =3D -EINVAL;
 =20
- 	trace_amdgpu_dm_crtc_atomic_check(state);
++	trace_amdgpu_dm_crtc_atomic_check(crtc_state);
 +
- 	dm_update_crtc_active_planes(crtc, state);
+ 	dm_update_crtc_active_planes(crtc, crtc_state);
 =20
  	if (unlikely(!dm_crtc_state->stream &&
- 		     modeset_required(state, NULL, dm_crtc_state->stream))) {
+ 		     modeset_required(crtc_state, NULL, dm_crtc_state->stream))) {
  		WARN_ON(1);
  		return ret;
  	}

--Sig_/v_VTF3=V=ZLQ0Zhu5lDpUs9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+gzKQACgkQAVBC80lX
0GzNXAf/W9AAIlNh1aTu47i1Eol536395rKOnzvFj7a8svfEPluVkkQ5POy/bLqi
CUarxu7zj6dkQG3t6qTi/z31MH4DwTh5cbyPoJnLWmZWFjmeU7qVdL/w7v2Q69fk
nt7x18peGZ33SHHrmEbIZ1ehfcMHwwDsFt2z6yg+3/XddCN9RKIGTRQVNafmUQIE
9d4pJ/43R6a0Mwk3TQq15UIJ4Gvsu090kUMISDMJJV2n+08WER2pSkiQ4PrHTa1e
jeqirtWcUNGI65CfEl0KcKMMG6zt9eRb10WpoVLX2ctffX/60NxxHalv08VkPe5n
gvlOBYB/ryj7vQWncjMvhn7bR1Y07g==
=sIKW
-----END PGP SIGNATURE-----

--Sig_/v_VTF3=V=ZLQ0Zhu5lDpUs9--
