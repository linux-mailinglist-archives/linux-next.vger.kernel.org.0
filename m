Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F3817510E
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 00:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgCAXnb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 18:43:31 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgCAXna (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 18:43:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48W0G76Sfqz9sSQ;
        Mon,  2 Mar 2020 10:43:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583106208;
        bh=gIZXNiNPVslt627TKckA0B3yIPamJysGD6GIC0Ae2QI=;
        h=Date:From:To:Cc:Subject:From;
        b=JwLHxczlDseMQdo8piauim84SpJyz9o0/zXn+L9P1vjrw5erU6ycw3BrIZGNa98wS
         yVYq9XU2UmIKMw4D0RZekbjiID4eieeqSdNoAcTkYlkmRUUY6c2ffrrtEtStkSMOM4
         JAxgNloLTTTVqcnIXiIjGzWgmUvGV5qcQrfTomDCtyCEG5HApLJsqe64+ej6K0Lpe9
         82+/gTpSC6scjci8AL36ArZboinHyaZXjBVxwf7rQx+jewFwKdGeHR9slbQRrBwImo
         uakjvyIrOfzW+hsdwtUMO8n57qb4jrcyLRvcYZDdNXarHyqbpq5cgi7rjAtqDNrAW0
         Z7rKKmPDs4YUg==
Date:   Mon, 2 Mar 2020 10:43:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20200302104321.26803fb6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wIzYF3MvTJ9821ko1+UV.eo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wIzYF3MvTJ9821ko1+UV.eo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/virtio/virtgpu_object.c

between commit:

  6be7e0733548 ("drm/virtio: fix mmap page attributes")

from the drm-misc-fixes tree and commit:

  18b39fb975b7 ("drm/virtio: add virtio_gpu_is_shmem helper")

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

diff --cc drivers/gpu/drm/virtio/virtgpu_object.c
index 3af7ec80c7da,c5cad949eb8d..000000000000
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@@ -98,8 -123,7 +123,8 @@@ struct drm_gem_object *virtio_gpu_creat
  	if (!bo)
  		return NULL;
 =20
- 	bo->base.base.funcs =3D &virtio_gpu_gem_funcs;
+ 	bo->base.base.funcs =3D &virtio_gpu_shmem_funcs;
 +	bo->base.map_cached =3D true;
  	return &bo->base.base;
  }
 =20

--Sig_/wIzYF3MvTJ9821ko1+UV.eo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5cSJkACgkQAVBC80lX
0GwgUgf/YEcABNQy6d1hVxM974xgFj1/0taBQ0xWzG7FxL25ImmMacUZJFCjWWzh
tON1pgmXeyxLS5tBJPtOJ0al6s4pWY05Rvb6pTcGi62QqIw+ptDLvznbkuEb2L52
NznfnbqT9PaZJqp/fHP94u8Zx3gAvsLEAAnCxyPPaQm60CYiWxWUX3/biUp4KwgI
eixKGPk0KydJgY9fnQDMHV14u3J99VMCm80a2uTbdJj6SIVuEP5rWJRRw1/HzCUh
180Nv4uXRlRrXXjzowHbISyLYSSpP8ym3aBim9ORP0Y8RQkJaHWtaVpbgT959pqv
ZSTHJHjjyW1w1ZvCAWSHDi4bmikYUA==
=J+7D
-----END PGP SIGNATURE-----

--Sig_/wIzYF3MvTJ9821ko1+UV.eo--
