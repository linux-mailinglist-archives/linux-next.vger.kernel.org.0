Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0E1286DC8
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 06:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgJHEmG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 00:42:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54795 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgJHEmG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Oct 2020 00:42:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6JT704d9z9sSn;
        Thu,  8 Oct 2020 15:42:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602132123;
        bh=pHYkEo5SeRirjcFywD0/VFWBVXGBUKoWYC8gzAs94js=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lStlENq4mXKEVZeDOqjX0Z5iLfOQnVCkiRHTUd+8Gkb+Z+yKtn4O5XZx/JiOulu0l
         keppNe8cEdtxYgMkWVJW9t4qZAk7unVcqWOFKmG+woO+bF1Te2i4xkrtoGZPUALPKJ
         Gex8O3NqIVdWSH5FbksfQj8EGzpNOsio5pTk+KtdCnRFsFgqWNxdVWoMopCBockJwI
         0FB39Zd0jB5xEYXOq1ZSgYau9AWdJTsOc1wwG/6QA78FLGZxQx5Lf+599uz9IwjqAn
         lupkr43pRjOSu+JUP6lo0L+AdTW/AGaeCBRq3BJ/cEDLEAvQjaV0E2RRhhQr51APdF
         WL6ue6avSnv/Q==
Date:   Thu, 8 Oct 2020 15:42:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201008154202.175fbec7@canb.auug.org.au>
In-Reply-To: <20201008140903.12a411b8@canb.auug.org.au>
References: <20201008140903.12a411b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a.aVf6N/5DzCJgymDWQC_K+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a.aVf6N/5DzCJgymDWQC_K+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Oct 2020 14:09:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

In file included from include/linux/clk.h:13,
                 from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:10:
drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_update_=
palette':
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_dr=
m' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                                   ^~~~~~~~~~~
include/linux/kernel.h:47:33: note: in definition of macro 'ARRAY_SIZE'
   47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                 ^~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_dr=
m' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                                   ^~~~~~~~~~~
include/linux/kernel.h:47:48: note: in definition of macro 'ARRAY_SIZE'
   47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                ^~~
In file included from include/linux/bits.h:22,
                 from include/linux/bitops.h:5,
                 from drivers/gpu/drm/ingenic/ingenic-drm.h:10,
                 from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:7:
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_dr=
m' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                                   ^~~~~~~~~~~
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                              ^
include/linux/compiler.h:224:46: note: in expansion of macro '__same_type'
  224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[=
0]))
      |                                              ^~~~~~~~~~~
include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_array'
   47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                           ^~~~~~~~~=
~~~~~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of mac=
ro 'ARRAY_SIZE'
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                  ^~~~~~~~~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_dr=
m' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                                   ^~~~~~~~~~~
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                              ^
include/linux/compiler.h:224:46: note: in expansion of macro '__same_type'
  224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[=
0]))
      |                                              ^~~~~~~~~~~
include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_array'
   47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                           ^~~~~~~~~=
~~~~~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of mac=
ro 'ARRAY_SIZE'
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                  ^~~~~~~~~~
include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not a=
n integer constant
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
include/linux/compiler.h:224:28: note: in expansion of macro 'BUILD_BUG_ON_=
ZERO'
  224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[=
0]))
      |                            ^~~~~~~~~~~~~~~~~
include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_array'
   47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be=
_array(arr))
      |                                                           ^~~~~~~~~=
~~~~~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of mac=
ro 'ARRAY_SIZE'
  448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
      |                  ^~~~~~~~~~
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:453:9: error: 'struct ingenic_drm=
' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
  453 |   priv->dma_hwdescs->palette[i] =3D color;
      |         ^~~~~~~~~~~
      |         dma_hwdesc_f0
drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_plane_a=
tomic_update':
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: error: 'crtc_state' undecl=
ared (first use in this function); did you mean 'ctx_state'?
  467 |   crtc_state =3D state->crtc->state;
      |   ^~~~~~~~~~
      |   ctx_state
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: note: each undeclared iden=
tifier is reported only once for each function it appears in
At top level:
drivers/gpu/drm/ingenic/ingenic-drm-drv.c:443:13: warning: 'ingenic_drm_upd=
ate_palette' defined but not used [-Wunused-function]
  443 | static void ingenic_drm_update_palette(struct ingenic_drm *priv,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~

> I noticed that the ingenic driver revert I had been waiting for appeared
> in hte drm-misc tree, so I removed the BROKEN dependency for it, but it
> produced the above errors, so I have marked it BROKEN again.

--=20
Cheers,
Stephen Rothwell

--Sig_/a.aVf6N/5DzCJgymDWQC_K+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+mJoACgkQAVBC80lX
0Gy25AgAiwrgmtejusGdnGlqjti1mzozlFgjX4CgYtoX62Je6t343vPbuiQhTKLn
7oSTXILrf2nRdP6YApgoErv/rHhiXQRJUURHEtYcVWQFrWXjmnRVDx4ceQ1z4emZ
YWhTbPqz5qhB9acuq31DvJgb1mOPSFvbrSzWRXL+8Mwf+jtO/U0p2PiZrtgbbIFL
CTWOQjyFy3VnWi6HQFVq5u1rE1wIVnbpWsFz64Tc82KTBOWtYS2YDG6H1HO97W+P
mLDbRRGozMeygumNFaVe5hL6URzxhIyHecAt/kW2W2FYhYw/j5oeflUAlNCWm9u9
uo+yDtwaMyCE7y0phreINjzxC5nS2Q==
=jXm8
-----END PGP SIGNATURE-----

--Sig_/a.aVf6N/5DzCJgymDWQC_K+--
