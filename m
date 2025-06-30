Return-Path: <linux-next+bounces-7275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB34AED430
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 08:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 010411894321
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 06:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153F19ADBA;
	Mon, 30 Jun 2025 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cWbi1juI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276ED2F4A;
	Mon, 30 Jun 2025 06:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263315; cv=none; b=hVCdn6uFwbvAZGr22Gy2JN9yEvNy1TSMaMLNHZeiMs47riJQHdpXB/3opcpC/uLfBgJYTztUHPgi66fTW49BLgSgOF5+sybeaymYIQZc4zmiFmHcZg9qccueFJAci4FZbX0OdayRxd0hq+ADwUOJPRdxuZAwOhoUlcb8wmTXmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263315; c=relaxed/simple;
	bh=qczW777iQz4wArWTbhCw2qu9kAv37gI8/e/m4EuvhO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FAOituwp+omG0dlxwKsOeQ0l40LEr3fT5ftXOnszRb4UeD1C+GnIYc9v/hPgqWuSg7qyhfg8JIr9EoaXOGSZTCwNZ2w8kwniXF6/S5VgJDWjBfi0nGGTw43tmkg5p1XHZIy+p+OPFXBj4y9FAa92ms7MDChxIFiskcKd/QjgfQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cWbi1juI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751263306;
	bh=WKmaHGLzGfShKi7ENX78CD/CWzNHiFx2IRicO5n19OM=;
	h=Date:From:To:Cc:Subject:From;
	b=cWbi1juI0XXRhjCnD3Syz53GuSqrUKV4daRd3c6FEJ3vtNWtW5+FYf1sgAQR3Aalt
	 GD2nlXjPQBpwGRxvjpEEFNW8qpjkdwSDVTlQG42SER+6BZq+AYNVo1be/OFUD392MK
	 2JjzB5L9fE2MK9q8L67iW51QCaYdu2We8+ORo1t4LmhQHFxSNTD9b2tHQOnfW0v0/y
	 vWADyzCifilp4sH6rMROCV6NDGTfLAUqvJ6bJU82sQFnMg+/VzwJIdyyS7+wlsIWaZ
	 xkaG/60z7WA+QJKLNR0rjq5E+WXwBHN4vFqFlHtN5ZKL4zy4a4JDxH9tG6G8tCxTrz
	 o43KUVgJTMGKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bVwXT4jf4z4x21;
	Mon, 30 Jun 2025 16:01:45 +1000 (AEST)
Date: Mon, 30 Jun 2025 16:00:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joerg.roedel@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nicolin Chen
 <nicolinc@nvidia.com>
Subject: linux-next: manual merge of the iommufd tree with the iommu tree
Message-ID: <20250630160059.49544dde@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r.WIf1iNV/vkDrJ6SAirccM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r.WIf1iNV/vkDrJ6SAirccM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommufd tree got a conflict in:

  include/linux/iommu.h

between commit:

  792ea7b6cafa ("iommu: Remove ops->pgsize_bitmap")

from the iommu tree and commits:

  187f146d5de6 ("iommu: Introduce get_viommu_size and viommu_init ops")
  f842ea208e43 ("iommu: Deprecate viommu_alloc op")

from the iommufd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/iommu.h
index 7073be1d8841,04548b18df28..000000000000
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@@ -596,14 -597,17 +597,16 @@@ iommu_copy_struct_from_full_user_array(
   *		- IOMMU_DOMAIN_DMA: must use a dma domain
   *		- 0: use the default setting
   * @default_domain_ops: the default ops for domains
-  * @viommu_alloc: Allocate an iommufd_viommu on a physical IOMMU instance=
 behind
-  *                the @dev, as the set of virtualization resources shared=
/passed
-  *                to user space IOMMU instance. And associate it with a n=
esting
-  *                @parent_domain. The @viommu_type must be defined in the=
 header
-  *                include/uapi/linux/iommufd.h
-  *                It is required to call iommufd_viommu_alloc() helper for
-  *                a bundled allocation of the core and the driver structu=
res,
-  *                using the given @ictx pointer.
+  * @get_viommu_size: Get the size of a driver-level vIOMMU structure for =
a given
+  *                   @dev corresponding to @viommu_type. Driver should re=
turn 0
+  *                   if vIOMMU isn't supported accordingly. It is require=
d for
+  *                   driver to use the VIOMMU_STRUCT_SIZE macro to saniti=
ze the
+  *                   driver-level vIOMMU structure related to the core one
+  * @viommu_init: Init the driver-level struct of an iommufd_viommu on a p=
hysical
+  *               IOMMU instance @viommu->iommu_dev, as the set of virtual=
ization
+  *               resources shared/passed to user space IOMMU instance. As=
sociate
+  *               it with a nesting @parent_domain. It is required for dri=
ver to
+  *               set @viommu->ops pointing to its own viommu_ops
 - * @pgsize_bitmap: bitmap of all possible supported page sizes
   * @owner: Driver module providing these ops
   * @identity_domain: An always available, always attachable identity
   *                   translation.
@@@ -653,11 -657,13 +656,12 @@@ struct iommu_ops=20
 =20
  	int (*def_domain_type)(struct device *dev);
 =20
- 	struct iommufd_viommu *(*viommu_alloc)(
- 		struct device *dev, struct iommu_domain *parent_domain,
- 		struct iommufd_ctx *ictx, unsigned int viommu_type);
+ 	size_t (*get_viommu_size)(struct device *dev,
+ 				  enum iommu_viommu_type viommu_type);
+ 	int (*viommu_init)(struct iommufd_viommu *viommu,
+ 			   struct iommu_domain *parent_domain);
 =20
  	const struct iommu_domain_ops *default_domain_ops;
 -	unsigned long pgsize_bitmap;
  	struct module *owner;
  	struct iommu_domain *identity_domain;
  	struct iommu_domain *blocked_domain;

--Sig_/r.WIf1iNV/vkDrJ6SAirccM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhiKBsACgkQAVBC80lX
0GyyVAgAmIDuZZk3cu5esXQq1UJjFEIUBO3GnJdmGbwh+ZzW63K1TyEZZNbJq8dO
nWfh+O9+GCqp4HHCpYH8gWKrUlA4DNqxg9QHqXvof1+Uo7i72FBJlXpWKOuvCyya
RiMya+2qkxMwNoWSeLaoar1xbgh9jD4unwiHutOCxgmv/GFyc4oU4zKS3XzA81ah
rF124S24l+yG9W/WpVN1ZqNNTUUt7L5XxzO2WX9wFjFlMBBAIhF2Gk2U/BuYGDrh
WzZzYFnjdpH35hj8McUNjOz65l5eceO3517bwV81aRBMuTiqg0lLq7dDvEomUyUn
IUgQuGsZCt49U1UW7G6Nz51gsR53vA==
=hdTA
-----END PGP SIGNATURE-----

--Sig_/r.WIf1iNV/vkDrJ6SAirccM--

