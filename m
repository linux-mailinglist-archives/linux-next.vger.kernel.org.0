Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF20529A235
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 02:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409292AbgJ0B0c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 21:26:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgJ0B0c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 21:26:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKvDh5MJ1z9sSs;
        Tue, 27 Oct 2020 12:26:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603761989;
        bh=xJK4s5+Fq4J95fHuYwEaGr9RLSssEmH01jmBaMhYu64=;
        h=Date:From:To:Cc:Subject:From;
        b=DSzs3E4y79+TznZdAoPBqPe3rI32YZew8wAGwNizz2H1rkgJoAOB/GKZScXUdlpbO
         g4MSsSSvErQKi4eYd68Oiwh534Ix1LKk0UCiNnmskO/zfJ0s2/2ioS567GEKU9gG2c
         froIPEP6QeSOF2pyLfeEj8EmggzwRqi5t/nEQ1D5NZPdrsHM7afxQnv3sNqBFwVwOE
         tR8J1ZZnluaR5hUUpPr59OP1Z8Wt2+ROuP8bQPP216oA4Gz+lqAyzsSTK00Rq5AAMh
         UBieqZSJDjByo2OO54eNpPynzKzDR8yAr5ypCAGvNtfbzECrSho39zuKWx81cw7bnw
         1Rj4el/jk6EWg==
Date:   Tue, 27 Oct 2020 12:26:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dave Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20201027122628.18babff3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wTISgeN+CU8wMMLX0ZYPJyf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wTISgeN+CU8wMMLX0ZYPJyf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/virtio/virtgpu_vq.c

between commit:

  75ef337bdba4 ("drm: virtio: fix common struct sg_table related issues")

from Linus' tree and commit:

  50c3d1938ee3 ("drm/virtio: implement blob resources: fix stride discrepan=
cy")

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

diff --cc drivers/gpu/drm/virtio/virtgpu_vq.c
index 07945ca238e2,c1824f536936..000000000000
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@@ -1024,11 -1027,14 +1026,13 @@@ void virtio_gpu_cmd_transfer_to_host_3d
  	struct virtio_gpu_transfer_host_3d *cmd_p;
  	struct virtio_gpu_vbuffer *vbuf;
  	bool use_dma_api =3D !virtio_has_dma_quirk(vgdev->vdev);
- 	struct virtio_gpu_object_shmem *shmem =3D to_virtio_gpu_shmem(bo);
 =20
- 	if (use_dma_api)
+ 	if (virtio_gpu_is_shmem(bo) && use_dma_api) {
+ 		struct virtio_gpu_object_shmem *shmem =3D to_virtio_gpu_shmem(bo);
+=20
 -		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
 -				       shmem->pages->sgl, shmem->pages->nents,
 -				       DMA_TO_DEVICE);
 +		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
 +					    shmem->pages, DMA_TO_DEVICE);
+ 	}
 =20
  	cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
  	memset(cmd_p, 0, sizeof(*cmd_p));

--Sig_/wTISgeN+CU8wMMLX0ZYPJyf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Xd0QACgkQAVBC80lX
0GwLQAgAgEyFbdDHC/NUR4XVrq+lPOOduxdbH9nv8tbpYQkooQoXWD6lJwDuwFLU
ky79EfkENcZHmfCNp31/YkySPCrWgr+0g3X+yKoJc6w3yavsE+/dqKEUniaViHQi
NbQ9qNatU7CDoh/9IVCsiIWAtIrSLlFDmUsTh7NdKLU2wk6vniz945tFPYiWBQ19
vn4ZvqEaAPUH3mjiJHoqGH26NlDQTA2tU+eRcu9lc3hJXhDRPSXwq8scKJRqyrWf
hX57vZF9oTY0fThcf1Wfz7ZLO5F2zPLte2e2DzTfy4hNDkZ2AWm9vyHoaWOb5tYG
rMNAUiBqzDQX/U/3e82SUhiqbXozwg==
=2mB9
-----END PGP SIGNATURE-----

--Sig_/wTISgeN+CU8wMMLX0ZYPJyf--
