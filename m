Return-Path: <linux-next+bounces-7621-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB96B09D73
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC9673AB779
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155302475F2;
	Fri, 18 Jul 2025 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wug6dazJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC77220F2B;
	Fri, 18 Jul 2025 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826353; cv=none; b=WoXsZm0GGzAcrrS0kojPeXS7ZMuYDpcigEu1tf8dWkfxOmB/BCuLgLJt+w3fqwhe22c64tyLq054eZ6xYs/Gmrm9CRSevuNPDTLWLLZEsfQUTG8T181uvCgTr+SpNgMlmy1lYibpBbXUez3nksxdpKha2Kvf6WEeGVyDF4fDoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826353; c=relaxed/simple;
	bh=e8WqeO0N/lIYLld9ZiQcTN5U4skZRZXy0znSzppFzpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jEE5bXQUPt6BGYrA8Vd6asVz0eWPJIja4QBhjluNuWsHwolpDD/InSFcxraJrNDPDxSJVeuLrHXcuRoCMdTtLyyofJsq/zCMrVqNGAm4vf+MA5sj1nQ36t+yG8LyGUnbPe3wleyv6V2+BQWuW7cvTPDTSdczQMmGPdvwML8Wthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wug6dazJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752826217;
	bh=QNYzSYfRj5GUfAseK0uZu8scFuQKLSmTPjGA0brRS9w=;
	h=Date:From:To:Cc:Subject:From;
	b=Wug6dazJ9DXwyqQiifkq39RmXxGw+IMUz9AT/XLhHdj+I53DRHm0enkM6UFr7rJ/z
	 nt7NNfV794SBLUO60s3EPJOZeqCTNWRV+kS6TS07dAMouZs6ZdYpwepJe9l7f3bJdD
	 XtItjt3dLOdvA1kmPAgk4WJ6WcNzC9TKPRRFyJrGiDgzWI6K4iKk1J6WzzNvNEV/cF
	 mnuCVoIMU2THW1Ab9EPscbuWzppkjMkiyveKfeX2lsWf1Pk6XGem4TsD6f3zHV6h3i
	 6LMjmgA9xK0AlCxoen78kUQeodOCagFWHkjHiBi2b+DNK/zIvExYYrTYlAn7B8l5vz
	 lxTkC+6Y6Ya6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk2XT0rm4z4x3d;
	Fri, 18 Jul 2025 18:10:17 +1000 (AEST)
Date: Fri, 18 Jul 2025 18:12:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Jason Wang <jasowang@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vhost tree with the dma-mapping
 tree
Message-ID: <20250718181226.6343c557@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hqojvehdv5yNWzUSXIl4nOX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hqojvehdv5yNWzUSXIl4nOX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/virtio/virtio_ring.c

between commit:

  b420b31f009f ("kmsan: convert kmsan_handle_dma to use physical addresses")

from the dma-mapping tree and commit:

  d1814d4fca2c ("virtio: rename dma helpers")

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
index a8421dc802d6,3f86e74dd79f..000000000000
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@@ -3143,17 -3240,17 +3240,17 @@@ EXPORT_SYMBOL_GPL(virtqueue_unmap_page_
   * The caller calls this to do dma mapping in advance. The DMA address ca=
n be
   * passed to this _vq when it is in pre-mapped mode.
   *
-  * return DMA address. Caller should check that by virtqueue_dma_mapping_=
error().
+  * return mapped address. Caller should check that by virtqueue_mapping_e=
rror().
   */
- dma_addr_t virtqueue_dma_map_single_attrs(struct virtqueue *_vq, void *pt=
r,
- 					  size_t size,
- 					  enum dma_data_direction dir,
- 					  unsigned long attrs)
+ dma_addr_t virtqueue_map_single_attrs(const struct virtqueue *_vq, void *=
ptr,
+ 				      size_t size,
+ 				      enum dma_data_direction dir,
+ 				      unsigned long attrs)
  {
- 	struct vring_virtqueue *vq =3D to_vvq(_vq);
+ 	const struct vring_virtqueue *vq =3D to_vvq(_vq);
 =20
- 	if (!vq->use_dma_api) {
+ 	if (!vq->use_map_api) {
 -		kmsan_handle_dma(virt_to_page(ptr), offset_in_page(ptr), size, dir);
 +		kmsan_handle_dma(virt_to_phys(ptr), size, dir);
  		return (dma_addr_t)virt_to_phys(ptr);
  	}
 =20

--Sig_/hqojvehdv5yNWzUSXIl4nOX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6AeoACgkQAVBC80lX
0GzLTAf+MrLPWNt6+PLl7qfouNZwfetcchyANUYB9oTCNe7pYQzljMFIbF8HILTb
PyQWV9RsBp91Kr4GLc0RYOZs+ZDVNPna68l3/BOV0mzTcm5R0N9h5+HeQRRnLek6
r+Mn2Qrulz2ABxWVoSWgqMfdi9nqeXph3ltieW/SIa5Ltuje4RqVkBok+qrh81mC
AFOYMAJE4C1jlMlfhNOLJ6OmjVIDRNmib/QoB3T1V229PfkNjazRDEcUBXG+FhLe
zP4dQnnbpJK7Iph8utJgNOdxe4mBQxJX+x0JqYPspUEhHOEmVINrhcaVYN2qEhew
RrNyOKhq5KTFgdvGMf7SEeEHEsQsUg==
=8SvH
-----END PGP SIGNATURE-----

--Sig_/hqojvehdv5yNWzUSXIl4nOX--

