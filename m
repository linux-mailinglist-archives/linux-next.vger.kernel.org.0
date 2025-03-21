Return-Path: <linux-next+bounces-5923-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5261EA6B5C8
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 09:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921D4188FAE7
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16091EB19D;
	Fri, 21 Mar 2025 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XPbKowL1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124442A1C9;
	Fri, 21 Mar 2025 08:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742544560; cv=none; b=kf0jncTIcI2J0CGtUH7NIy6kjwfTDQH7Ta1jK+iZzMT5Gw9SHvBD+G6NfUXQgOOnRnwWLZqNwYrob03JiJCqGlSmT5dQMWEAVfvN6jATO8HyBehlFPba6San7S76RH2w3G/RSIOe9WzH4oYY+Thr1P/mijTqj3A9RNi9nVUowBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742544560; c=relaxed/simple;
	bh=pAo9chrEumreo42/NZKjR3BNwRnTEHqTkG3cEmiMZrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m+XEAwkD76f1mgElQJWyWlAUOQAII3wyux1gbIB3wQl/BAhgNpRlNS+mHo2FDBz1ylE2Bf6cD+ixK/J/Dz3918xkJFyZtWlEUkvsMF08wnuzlXDHcLtEfhA9JcBZcGHzSBXBuJCjbdLzdbnwQmsXQB318Ez1H4Gdvlg7ifcFS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XPbKowL1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742544555;
	bh=YDk7Qpxhc9U9ir6wMaFnsSUvY5hvTrKA0kG+aQ6itYc=;
	h=Date:From:To:Cc:Subject:From;
	b=XPbKowL168j1PFmdhVgejSZVDgXAF/91ZK4rnBiqZeiFOZp1ZT7AQ+whsXXnc+17v
	 q6Crc5VhzPvxPtKl0INq+cYNodlFw42BsFGX0NxzIkfHajX+Qc5kL9VMe7RXJQNVhT
	 zUTaIO7szfnRoHsjXP3TqJlCO8QN+o1OyQ/MoOlF98nZg85LVmENU4O/3NKSmqNe1g
	 SKky7RB1YSLroG4fcEH9fHDJCJArs5pqKIjAZ2hfNsw29+92y/P6e8gsnf4isJHCQh
	 tR8g58ThXhoKtgjULU5shYkX1WisRQMO/7em/0MJjPFX1SoOgYTnF/vluFzKoQms10
	 28g/0FzmdxU6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJw896kPQz4wbp;
	Fri, 21 Mar 2025 19:09:13 +1100 (AEDT)
Date: Fri, 21 Mar 2025 19:09:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>
Cc: Joerg Roedel <jroedel@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Robin
 Murphy <robin.murphy@arm.com>
Subject: linux-next: manual merge of the iommufd tree with the iommu tree
Message-ID: <20250321190912.0495cc78@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oOKhd_mMBbaL0YyjVoVc5sa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oOKhd_mMBbaL0YyjVoVc5sa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommufd tree got a conflict in:

  drivers/iommu/dma-iommu.c

between commit:

  032d7e435cbd ("iommu/dma: Remove redundant locking")

from the iommu tree and commits:

  f3f47b821931 ("iommu: Sort out domain user data")
  e009e088d88e ("iommu: Drop sw_msi from iommu_domain")

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

diff --cc drivers/iommu/dma-iommu.c
index 0832998eca38,2bd9f80a83fe..000000000000
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@@ -59,34 -54,31 +54,30 @@@ struct iommu_dma_options=20
  };
 =20
  struct iommu_dma_cookie {
- 	enum iommu_dma_cookie_type	type;
+ 	struct iova_domain iovad;
+ 	struct list_head msi_page_list;
+ 	/* Flush queue */
  	union {
- 		/* Full allocator for IOMMU_DMA_IOVA_COOKIE */
- 		struct {
- 			struct iova_domain	iovad;
- 			/* Flush queue */
- 			union {
- 				struct iova_fq	*single_fq;
- 				struct iova_fq	__percpu *percpu_fq;
- 			};
- 			/* Number of TLB flushes that have been started */
- 			atomic64_t		fq_flush_start_cnt;
- 			/* Number of TLB flushes that have been finished */
- 			atomic64_t		fq_flush_finish_cnt;
- 			/* Timer to regularily empty the flush queues */
- 			struct timer_list	fq_timer;
- 			/* 1 when timer is active, 0 when not */
- 			atomic_t		fq_timer_on;
- 		};
- 		/* Trivial linear page allocator for IOMMU_DMA_MSI_COOKIE */
- 		dma_addr_t		msi_iova;
+ 		struct iova_fq *single_fq;
+ 		struct iova_fq __percpu *percpu_fq;
  	};
- 	struct list_head		msi_page_list;
-=20
+ 	/* Number of TLB flushes that have been started */
+ 	atomic64_t fq_flush_start_cnt;
+ 	/* Number of TLB flushes that have been finished */
+ 	atomic64_t fq_flush_finish_cnt;
+ 	/* Timer to regularily empty the flush queues */
+ 	struct timer_list fq_timer;
+ 	/* 1 when timer is active, 0 when not */
+ 	atomic_t fq_timer_on;
  	/* Domain for flush queue callback; NULL if flush queue not in use */
- 	struct iommu_domain		*fq_domain;
+ 	struct iommu_domain *fq_domain;
  	/* Options for dma-iommu use */
- 	struct iommu_dma_options	options;
+ 	struct iommu_dma_options options;
 -	struct mutex mutex;
+ };
+=20
+ struct iommu_dma_msi_cookie {
+ 	dma_addr_t msi_iova;
+ 	struct list_head msi_page_list;
  };
 =20
  static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
@@@ -393,14 -363,19 +362,18 @@@ int iommu_dma_init_fq(struct iommu_doma
   */
  int iommu_get_dma_cookie(struct iommu_domain *domain)
  {
- 	if (domain->iova_cookie)
+ 	struct iommu_dma_cookie *cookie;
+=20
+ 	if (domain->cookie_type !=3D IOMMU_COOKIE_NONE)
  		return -EEXIST;
 =20
- 	domain->iova_cookie =3D cookie_alloc(IOMMU_DMA_IOVA_COOKIE);
- 	if (!domain->iova_cookie)
+ 	cookie =3D kzalloc(sizeof(*cookie), GFP_KERNEL);
+ 	if (!cookie)
  		return -ENOMEM;
 =20
- 	iommu_domain_set_sw_msi(domain, iommu_dma_sw_msi);
 -	mutex_init(&cookie->mutex);
+ 	INIT_LIST_HEAD(&cookie->msi_page_list);
+ 	domain->cookie_type =3D IOMMU_COOKIE_DMA_IOVA;
+ 	domain->iova_cookie =3D cookie;
  	return 0;
  }
 =20

--Sig_/oOKhd_mMBbaL0YyjVoVc5sa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfdHqgACgkQAVBC80lX
0GznQwgAhY4s9Xj23iF2AdDmiecxxIHBU8DgrUqVFBhKgTgXk1IZJhMx00SU9q5S
lnlpSCPSTx+thA5NU1aPv4Sqs8QFL5qfR1iy2DB8+1H6ex4+g+f7MVEl0O+9HZXl
anDZXe43E3CPOvEFKRyK2YQ9WX0Y4AbXr90t7PTPSUyDJ678q2ikf1s5OtHaRpq8
6PVtvZBF7zjS6ggSmv9qwc1Jo0u4SzpCuHFcDSPE1sTtSOBISLjTJU55WkE1tqhB
gs6LvL6VmaeMbhJsRNTHIxrqOcPK72g/hj7ddVfIkDeCXBR/ng2uwAXFLsDBewND
4G1rRu94YICzRY8baXvH0ChxD58DiA==
=DmPG
-----END PGP SIGNATURE-----

--Sig_/oOKhd_mMBbaL0YyjVoVc5sa--

