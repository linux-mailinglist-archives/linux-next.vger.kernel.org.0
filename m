Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2EF301FC6
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 01:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbhAYAre (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 19:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbhAYArd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Jan 2021 19:47:33 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E66C061573;
        Sun, 24 Jan 2021 16:46:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPB5L0VGNz9sCq;
        Mon, 25 Jan 2021 11:46:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611535610;
        bh=nHdxDyfkK9GBPLAjs71LKqnjaCHPvX7x7DbWhmOho1o=;
        h=Date:From:To:Cc:Subject:From;
        b=omIlNslOCgdzSoKlhAmi9gsbfzuDTmEAoe7b2xj18PgPCWey0v6wKgY1HcIRh0hlJ
         oKpNhck7WIF2IFeWeodSbtD+8fTOTP4qp/TJeOLrgTm0bJJHk5dvaGcQnTN0QCc/8J
         54YJaR8UZBevjnaZ5S2mcvkG0y6MArUdqewPl7AY+xWaRoLsp+PGod8HSYaH5YI718
         enPGLyxoDb6FKipWvd5BZgiqU9urgwV+CjAXT7UL0gXoizkCotFcvfXhhhsOjf5RkA
         s1fjSqwaSW6BkD6mq7FlI1ZW3wtvtg4ZF8T0wOipSPAbE20ACmNj2P9L2A/py/aGfq
         +QIQe4NLJ2yvg==
Date:   Mon, 25 Jan 2021 11:46:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Imre Deak <imre.deak@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20210125114644.7b7cec67@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PgZHLRLUstc9bdqLlXUvmG/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PgZHLRLUstc9bdqLlXUvmG/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_object.h

between commit:

  41a9c75d0acf ("drm/i915/gem: Move stolen node into GEM object union")

from the drm tree and commit:

  5fbc2c2bfa5c ("drm/i915/gem: Add a helper to read data from a GEM object =
page")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gem/i915_gem_object.h
index 5274e9d139b4,ae83737f1d48..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@@ -548,6 -546,6 +554,8 @@@ i915_gem_object_invalidate_frontbuffer(
  		__i915_gem_object_invalidate_frontbuffer(obj, origin);
  }
 =20
 +bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
 +
+ int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, u64 o=
ffset, void *dst, int size);
+=20
  #endif

--Sig_/PgZHLRLUstc9bdqLlXUvmG/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOFPQACgkQAVBC80lX
0Gz7LAf/TjcOO+YgVZYw+gPIYCLggFUAn0h47d/ZJC4FOuDF643UsqClylEBQCdK
VO2j5NewDHP1H6cEBBUtjYISJ8mSAwVQG5FfN9O26WWZSb9epLJVy3B1Jy84P+GL
GOwH3+Z2tb8KedjGz20+89XOImZ7JKtq1x99I7sLxNEy7VS9FzilSPfAyY5H4CbR
+NyWajYZTGonjXUklRxI90GRaKV2aV1ZRkr1OY6pJZw0uoev2ggft2uu94Es/zw4
cG+7z2suIQsacXB+jYbQP+q0K/aYvGRxd9AlquXGCw152SPPIzePM+BK32Ae6+Qx
yh/QrfTIU1mfVef6Ez5/elx2UG21vw==
=UCtQ
-----END PGP SIGNATURE-----

--Sig_/PgZHLRLUstc9bdqLlXUvmG/--
