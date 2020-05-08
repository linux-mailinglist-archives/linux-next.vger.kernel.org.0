Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C531CA1AF
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 05:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgEHDur (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 23:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgEHDur (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 23:50:47 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80529C05BD43;
        Thu,  7 May 2020 20:50:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JGZS6pgTz9sRf;
        Fri,  8 May 2020 13:50:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588909844;
        bh=Cmc1FVhoEKlY9s9LgXvIPNjxGWl3kjq2kdUKA+rElg0=;
        h=Date:From:To:Cc:Subject:From;
        b=Tbu/3oWlfZR1mjXnv3YcFtn8fPEOluy8oRvmFWgRtwSfXDQeR+qA4+NiccqOhIPOY
         qx29zz3YOITLmF1Q2fUN6mbBMv9Dw01bbh68z+f2G5tZQGpbciSx5EhZKesyZXCvtB
         fF17nmHg9uu2BJpGS9KcmFjbcfhtPU5X9mK2Du234PEEqkqPInnyM7JcGZ6aWGSx55
         DXHJstkSYGHbK3lVEbZlcydQ4U6uKc0cbiMT+TegfsQ9dXy/+iq3kVl7snZzr/ArMv
         3pG0u5BVFMyDoh6GMwZskeO1AaG4BAvLLKIjQzguDAJq0F6lu8/hZo3KXX1yYl0JPQ
         LHNM5DlBG+DCg==
Date:   Fri, 8 May 2020 13:50:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Message-ID: <20200508135038.7b6547bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1K3goufP+ySveH8YfPl.3wn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1K3goufP+ySveH8YfPl.3wn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_domain.c

between commit:

  47bf7b7a7151 ("drm/i915/gem: Remove object_is_locked assertion from unpin=
_from_display_plane")

from the drm-intel-fixes tree and commit:

  9da0ea09639f ("drm/i915/gem: Drop cached obj->bind_count")

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

diff --cc drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 4f96c8788a2e,af43e82f45c7..000000000000
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@@ -368,7 -368,8 +368,7 @@@ static void i915_gem_object_bump_inacti
  	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
  	struct i915_vma *vma;
 =20
- 	if (!atomic_read(&obj->bind_count))
 -	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
+ 	if (list_empty(&obj->vma.list))
  		return;
 =20
  	mutex_lock(&i915->ggtt.vm.mutex);

--Sig_/1K3goufP+ySveH8YfPl.3wn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl601w4ACgkQAVBC80lX
0GwdVAgAmeyPSkyP3akZ3WA4t5E5ZXWpjmKjiUEI39WPVfg7hkbtiilDlJhl4h0L
y9F2/mGtpCnITUIvX77XJaNLXc//+oTNxbr8k+MzDNbWzf4Gc9ILTbNMh+TuNFCI
/vgVvGEn/B6GHPCMlZb7fxG+talqbCSz7iDaKzZXVPymuJNO8RhMZ9zzenoRUzNK
CInTggZTP+D2N71QxZ1qj5VRA/n5yfbxhQiWXap7rgV39ZEtfE6Z/wGTWU4+Y4m6
B0f8lLTbj8KjFnlkxrWRxQW8nJy0pot2U/1mjHe9zmCP0hRPc8/pKvu6BSb7aqq9
2Y8tM9yinStAbQb/cNMcyXyraQzHjg==
=xa1Z
-----END PGP SIGNATURE-----

--Sig_/1K3goufP+ySveH8YfPl.3wn--
