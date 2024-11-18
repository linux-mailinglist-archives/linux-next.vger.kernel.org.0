Return-Path: <linux-next+bounces-4799-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3E9D0999
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 07:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC4E281E24
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 06:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A8114830C;
	Mon, 18 Nov 2024 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BIu2xzZD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D2145A16;
	Mon, 18 Nov 2024 06:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731911175; cv=none; b=e2Fh1g68NXe2/hPrAqHTwNWXTciG0qu8bNmLHXUFvEsiejA1KguuCz3EhWCb6EgaWZgoAhMzTuIpWT8GkARw6isGPrP+EJI80uCc48ASBOOfYZYdgQYRJWsB9LQ/ew4IyadbffnnOE/rpD/2K1kcdgl0zmL5c5RubxZQN7BXRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731911175; c=relaxed/simple;
	bh=Lqsipl3W4T/IW74TauH9Ii2sgwnoJbsQeKLVispAMic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aQGZgkahECTwFEE7Y0r+e68liuE7T3cGhmGGw0Iu3mole/j5Ddw99jXlRk0eXusSUNNC+FXQW18mSulV4lcgRK5qOG/t4qpGFeUB5G/3150ji1RLr8j4vTdvrUlb58LsfjKSXD2Qb0WWs1b23WdnqDW9pmrrvyJ8QsGvpYr7OOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BIu2xzZD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731911165;
	bh=pzdHO+GJiiSzs6NT6aXnsZPJcpu5ZFP/wUcExbRIogQ=;
	h=Date:From:To:Cc:Subject:From;
	b=BIu2xzZDU66COpBHoiqhkFnwS08kV1EkKwXgOfOCki4bYs85albCQh1Q0930xSAdW
	 1kOxqS3LzjEMPKhO9YtmWsRIgXzdQxEn/QADoThNbNqg7PBrzBNdS+l13eK1smYScd
	 jYHtuaYxb+4As7Gg+FvqG7YzEXD4XgOJaUp98I4LZxDqZDr6JwtWcrr2eSHXfjGJ4j
	 H8vrX1ZcbUtCG7Yi8ZNgNUhVnhY5yZlEjtjUX8Pb00lLGXAzx7mp06rGyX9pVYqa+6
	 fjTciHi9v+ZsRWUvl+rpxRtvqfpyJ3o0Z7+B+PwadaNR+U2DUEEXwpdKskrBwXHYsP
	 0r/zzevHoLfTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XsHgv5f2qz4wcy;
	Mon, 18 Nov 2024 17:26:03 +1100 (AEDT)
Date: Mon, 18 Nov 2024 17:26:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wenyu Huang <huangwenyu1998@gmail.com>, Xuan
 Zhuo <xuanzhuo@linux.alibaba.com>
Subject: linux-next: manual merge of the vhost tree with the net_next tree
Message-ID: <20241118172605.19ee6f25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7k4v_N_aVib7tYhIeXMi/Nd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7k4v_N_aVib7tYhIeXMi/Nd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/virtio/virtio_ring.c

between commits:

  9f19c084057a ("virtio_ring: introduce vring_need_unmap_buffer")
  880ebcbe0663 ("virtio_ring: remove API virtqueue_set_dma_premapped")

from the net_next tree and commit:

  a49c26f761d2 ("virtio: Make vring_new_virtqueue support packed vring")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/virtio/virtio_ring.c
index 8167be01b400,48b297f88aba..000000000000
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@@ -1135,6 -1129,66 +1126,64 @@@ static int vring_alloc_queue_split(stru
  	return 0;
  }
 =20
+ static struct virtqueue *__vring_new_virtqueue_split(unsigned int index,
+ 					       struct vring_virtqueue_split *vring_split,
+ 					       struct virtio_device *vdev,
+ 					       bool weak_barriers,
+ 					       bool context,
+ 					       bool (*notify)(struct virtqueue *),
+ 					       void (*callback)(struct virtqueue *),
+ 					       const char *name,
+ 					       struct device *dma_dev)
+ {
+ 	struct vring_virtqueue *vq;
+ 	int err;
+=20
+ 	vq =3D kmalloc(sizeof(*vq), GFP_KERNEL);
+ 	if (!vq)
+ 		return NULL;
+=20
+ 	vq->packed_ring =3D false;
+ 	vq->vq.callback =3D callback;
+ 	vq->vq.vdev =3D vdev;
+ 	vq->vq.name =3D name;
+ 	vq->vq.index =3D index;
+ 	vq->vq.reset =3D false;
+ 	vq->we_own_ring =3D false;
+ 	vq->notify =3D notify;
+ 	vq->weak_barriers =3D weak_barriers;
+ #ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
+ 	vq->broken =3D true;
+ #else
+ 	vq->broken =3D false;
+ #endif
+ 	vq->dma_dev =3D dma_dev;
+ 	vq->use_dma_api =3D vring_use_dma_api(vdev);
 -	vq->premapped =3D false;
 -	vq->do_unmap =3D vq->use_dma_api;
+=20
+ 	vq->indirect =3D virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
+ 		!context;
+ 	vq->event =3D virtio_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX);
+=20
+ 	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
+ 		vq->weak_barriers =3D false;
+=20
+ 	err =3D vring_alloc_state_extra_split(vring_split);
+ 	if (err) {
+ 		kfree(vq);
+ 		return NULL;
+ 	}
+=20
+ 	virtqueue_vring_init_split(vring_split, vq);
+=20
+ 	virtqueue_init(vq, vring_split->vring.num);
+ 	virtqueue_vring_attach_split(vq, vring_split);
+=20
+ 	spin_lock(&vdev->vqs_list_lock);
+ 	list_add_tail(&vq->vq.list, &vdev->vqs);
+ 	spin_unlock(&vdev->vqs_list_lock);
+ 	return &vq->vq;
+ }
+=20
  static struct virtqueue *vring_create_virtqueue_split(
  	unsigned int index,
  	unsigned int num,

--Sig_/7k4v_N_aVib7tYhIeXMi/Nd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc63f0ACgkQAVBC80lX
0GyY3Qf/cW2nX+CGnMfamWThl+HzXZ5Vg/KDYhtqqzoy2LNYtwcgHjVOwyOdpG/F
6cED3rq2/xtb6DmUTIyPSiqiolgEJYpakioqgFgg9r9Ahuf7argM82ku1jGOZYO7
EaTzz7fOiIaR+k3JEo3fssDvwh2pwyoDi6dCkQeIFIE8jmM3S9nNb1LaOhz8A+CG
hA8f8R/mWqct8A1tARjMLqt4wJkTCrJQyGDK3+MrTGYGSCsxDQRq6ckqjNKRS2R1
R2hO4t3Wyrcus4jYjLTH2hzb5BZyZGwh6uX1QjUiX8GIM+cbCeWYRuqvHTK2uDbb
rTq6Gj8m55x1TeNEOCA8ZcFn6i9JMw==
=RSl2
-----END PGP SIGNATURE-----

--Sig_/7k4v_N_aVib7tYhIeXMi/Nd--

