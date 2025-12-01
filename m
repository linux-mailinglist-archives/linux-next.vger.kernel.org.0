Return-Path: <linux-next+bounces-9282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC9C9584E
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 02:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1213E341CD0
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 01:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EB178F4A;
	Mon,  1 Dec 2025 01:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Na3LGZqT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06063AC15;
	Mon,  1 Dec 2025 01:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764553427; cv=none; b=dsygS+yg588amL1L2GX4qaeMzwTZdrRZ1nmRYHz/TVFw3rNprIIEmN0na0bbDngYxRXQ9QgZeeA6uYsgoLM3kJowNbTurQQRaJyIg6kx01DMNQTAGSFqtW5hRZBAciCrV0zS8G8f43Bit3MBJYXSa3HjUcX5BC3QT1bVJ8/iu38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764553427; c=relaxed/simple;
	bh=JGrA9DRlzkzS9qyuxin4hBdxfeTrkgm2YUfGG45TFtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P5gdKloYYrf3a26aWjbDKIj+zpdc9dZyDInmcRpwLvD410Owrqjk+3eXxBqQXdkk2aE/5LQrKnYyC6MYD7bEpT8h3ZBh2bqV8qo1pNYX7nVuhdo4g5Duwe0WNQvjdeKvXznMpOejTYTpbZ33LoiORvmgAVgIHPiZBAnpVtC4oME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Na3LGZqT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764553421;
	bh=Qhw1u4MnfL0LDaxm+xZaPFlVNdbHe/L+N2yUvZjOArY=;
	h=Date:From:To:Cc:Subject:From;
	b=Na3LGZqTlMVepe1uW9Ky7EuNugVk8rkUGiTZZN9uJu8Zk2MaYdDc/qa8p+fd7Y1eu
	 GIZKZeEYelFyyt/x8YLnXjTAPhBD3Y77OV0z3tIlRBB8OK7aMF0nJzQxNb8EIyuUR7
	 1LWiCC4h439kThOrznnIuPCC3lxQQcPI2G2BP4MoReTHZmtNV4yZ+nQQKW+ckF0ZZU
	 pc0PQu3GF2y1nyKVaajqLnSUqljl4VgUV1O2ZMvVhjPdl46arM7yeyzolxq30X3VCE
	 h5Vl9G2Mgxr6Pq2oMAtC6dokEKsMUPufSQQvlsDNMF9IxqJDqLgbwnjqJJRmLrXB2m
	 PYLhK8cUo23ow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKRWd34nWz4wCB;
	Mon, 01 Dec 2025 12:43:41 +1100 (AEDT)
Date: Mon, 1 Dec 2025 12:43:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson <alex@shazbot.org>
Cc: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iommufd tree with the vfio tree
Message-ID: <20251201124340.335d7144@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TXYTD_5iI0dNtp5QqgZ9wa5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TXYTD_5iI0dNtp5QqgZ9wa5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommufd tree got a conflict in:

  include/linux/vfio_pci_core.h

between commit:

  9b92bc7554b5 ("vfio: refactor vfio_pci_mmap_huge_fault function")

from the vfio tree and commit:

  96ce2aeb15bd ("vfio/pci: Add vfio_pci_dma_buf_iommufd_map()")

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

diff --cc include/linux/vfio_pci_core.h
index 336a0e58b443,6a3074f2cf1c..000000000000
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@@ -29,12 -28,8 +29,13 @@@ struct vfio_pci_core_device
  struct vfio_pci_region;
  struct p2pdma_provider;
  struct dma_buf_phys_vec;
+ struct dma_buf_attachment;
 =20
 +struct vfio_pci_eventfd {
 +	struct eventfd_ctx	*ctx;
 +	struct rcu_head		rcu;
 +};
 +
  struct vfio_pci_regops {
  	ssize_t (*rw)(struct vfio_pci_core_device *vdev, char __user *buf,
  		      size_t count, loff_t *ppos, bool iswrite);
@@@ -216,14 -204,7 +217,17 @@@ VFIO_IOREAD_DECLARATION(32
  VFIO_IOREAD_DECLARATION(64)
  #endif
 =20
 +static inline bool is_aligned_for_order(struct vm_area_struct *vma,
 +					unsigned long addr,
 +					unsigned long pfn,
 +					unsigned int order)
 +{
 +	return !(order && (addr < vma->vm_start ||
 +			   addr + (PAGE_SIZE << order) > vma->vm_end ||
 +			   !IS_ALIGNED(pfn, 1 << order)));
 +}
 +
+ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
+ 				 struct dma_buf_phys_vec *phys);
+=20
  #endif /* VFIO_PCI_CORE_H */

--Sig_/TXYTD_5iI0dNtp5QqgZ9wa5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmks8swACgkQAVBC80lX
0GzBnwf/Zh/ZI/JFwcVyCs6jdBRuspLEYfcnaTJqSXfLNBGveshNcCOPv0m0MVMu
GkH2n/AFdpdcpiERYT3c5xmma7ykP7+hA02IIZm0M91xYD9a05bShy246GzQPgVD
efPYqiz6nq7L5KrY+GsTVspLYHk3o0jydZI0J/MzNTpRFBzO7njKZbFUgupOGgVP
5tQybBtXRcGF5U/ue/laLOFXxndQEf3J5agQ8/kUFA6kIvGzNazWl1TOaXD+0IIa
0Th+BTtHyoSUkjHGrr0xet5OroLJ/cgNDnoDUylbKIPn7DpFHBC5KZIVgcGQb8Di
TRbeBtPk+l2toodPqGmWTQKNoVYDyQ==
=fw03
-----END PGP SIGNATURE-----

--Sig_/TXYTD_5iI0dNtp5QqgZ9wa5--

