Return-Path: <linux-next+bounces-6719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77053AB49D9
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 05:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C61733A85F7
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 03:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541C01A8419;
	Tue, 13 May 2025 03:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TJfUolF5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219B4C6C;
	Tue, 13 May 2025 03:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747105601; cv=none; b=I8KgtV2ABNqZDq1ZcG6ATGzCUpS5zMH81bj3XPb5JTRHMWn2tHsF72rEyaUbvXgFNfIBVGQ4sdINR6dQC8DjAQMsxZWJJEqUKllciso341DLwqTS5jM6WEau+0ly8XuL42h4kvSQ17OBvP++wQWdRQvwsXGF/u/GuIWkhy2xL0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747105601; c=relaxed/simple;
	bh=tIgXaLSVizFofL4SRJwe+0I2bWrhtONCrIazmJtlLdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YJvgZ/qVAHvtUVZ1zJrq9VsWYM3yklJ+4NAcEyWmH+06nO05yVtJOJAD/RzAWPg4K8X1NNWbZoiZwYYCiyhhN/RmokFAR9QpeuqKiEnBcTFnIdjJCe4QmPhIRfWDbfR4ohTWcmuYK8pqqvfI/wtWjm6K/KTdJMA8V664DmBsgjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TJfUolF5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747105593;
	bh=ayxdP8gWAbkfn0fMI/Ym542Ws5mHhmNhJ/pLVIx2Sfw=;
	h=Date:From:To:Cc:Subject:From;
	b=TJfUolF5Qu4L+3FUqR/hcIS/mcpl2wRYcFwH1T02kpmGvh51LyZmpKPDqCbn8qjul
	 zZsBD3tvj1SCThzy9OabEyaF9INaBi3vJ1y7ibEAJON9WMiw0ePC5vd8WGGLK/DIiq
	 U38ppv+4NR6y4BnyfyvuxWXtwtTNnwUtM4EfNFV9oMlu0MRzSB/BRHbaB0MIP5icHk
	 jHfppDZNrrVZXYuuVZobIsz56SzwD2YE6XgKmfzaGygEEwsViZ3cmdNwV60lOlhIw4
	 DW1hO4eYFSQnNV/CFc8cGzfRQZdh3YOf9BrSU3vrqE4mciYeAu8/6ocEmhxeI4HEp5
	 aplgGW/00xgTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxLwS67Xkz4wcd;
	Tue, 13 May 2025 13:06:32 +1000 (AEST)
Date: Tue, 13 May 2025 13:06:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, Jason
 Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Dave Ertman
 <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Swiatkowski
 <michal.swiatkowski@linux.intel.com>, Mustafa Ismail
 <mustafa.ismail@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Tatyana Nikolova <tatyana.e.nikolova@intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>
Subject: linux-next: manual merge of the net-next tree with the rdma-fixes
 tree
Message-ID: <20250513130630.280ee6c5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vtpU+YY_BFYko292DKksJ2y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vtpU+YY_BFYko292DKksJ2y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/infiniband/hw/irdma/main.c

between commits:

  80f2ab46c2ee ("irdma: free iwdev->rf after removing MSI-X")
  4bcc063939a5 ("ice, irdma: fix an off by one in error handling code")

from the rdma-fixes tree and commit:

  c24a65b6a27c ("iidc/ice/irdma: Update IDC to support multiple consumers")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/irdma/main.c
index 7599e31b5743,abb532bc8ce4..000000000000
--- a/drivers/infiniband/hw/irdma/main.c
+++ b/drivers/infiniband/hw/irdma/main.c
@@@ -221,8 -221,8 +221,8 @@@ static int irdma_init_interrupts(struc
  			break;
 =20
  	if (i < IRDMA_MIN_MSIX) {
 -		for (; i > 0; i--)
 +		while (--i >=3D 0)
- 			ice_free_rdma_qvector(pf, &rf->msix_entries[i]);
+ 			ice_free_rdma_qvector(cdev, &rf->msix_entries[i]);
 =20
  		kfree(rf->msix_entries);
  		return -ENOMEM;
@@@ -245,35 -245,40 +245,42 @@@ static void irdma_deinit_interrupts(str
 =20
  static void irdma_remove(struct auxiliary_device *aux_dev)
  {
- 	struct iidc_auxiliary_dev *iidc_adev =3D container_of(aux_dev,
- 							    struct iidc_auxiliary_dev,
- 							    adev);
- 	struct ice_pf *pf =3D iidc_adev->pf;
  	struct irdma_device *iwdev =3D auxiliary_get_drvdata(aux_dev);
+ 	struct iidc_rdma_core_auxiliary_dev *iidc_adev;
+ 	struct iidc_rdma_core_dev_info *cdev_info;
 =20
+ 	iidc_adev =3D container_of(aux_dev, struct iidc_rdma_core_auxiliary_dev,=
 adev);
+ 	cdev_info =3D iidc_adev->cdev_info;
+=20
+ 	ice_rdma_update_vsi_filter(cdev_info, iwdev->vsi_num, false);
  	irdma_ib_unregister_device(iwdev);
- 	ice_rdma_update_vsi_filter(pf, iwdev->vsi_num, false);
- 	irdma_deinit_interrupts(iwdev->rf, pf);
+ 	irdma_deinit_interrupts(iwdev->rf, cdev_info);
 =20
 +	kfree(iwdev->rf);
 +
- 	pr_debug("INIT: Gen2 PF[%d] device remove success\n", PCI_FUNC(pf->pdev-=
>devfn));
+ 	pr_debug("INIT: Gen2 PF[%d] device remove success\n", PCI_FUNC(cdev_info=
->pdev->devfn));
  }
 =20
- static void irdma_fill_device_info(struct irdma_device *iwdev, struct ice=
_pf *pf,
- 				   struct ice_vsi *vsi)
+ static void irdma_fill_device_info(struct irdma_device *iwdev,
+ 				   struct iidc_rdma_core_dev_info *cdev_info)
  {
+ 	struct iidc_rdma_priv_dev_info *iidc_priv =3D cdev_info->iidc_priv;
  	struct irdma_pci_f *rf =3D iwdev->rf;
 =20
- 	rf->cdev =3D pf;
+ 	rf->sc_dev.hw =3D &rf->hw;
+ 	rf->iwdev =3D iwdev;
+ 	rf->cdev =3D cdev_info;
+ 	rf->hw.hw_addr =3D iidc_priv->hw_addr;
+ 	rf->pcidev =3D cdev_info->pdev;
+ 	rf->hw.device =3D &rf->pcidev->dev;
+ 	rf->pf_id =3D iidc_priv->pf_id;
  	rf->gen_ops.register_qset =3D irdma_lan_register_qset;
  	rf->gen_ops.unregister_qset =3D irdma_lan_unregister_qset;
- 	rf->hw.hw_addr =3D pf->hw.hw_addr;
- 	rf->pcidev =3D pf->pdev;
- 	rf->pf_id =3D pf->hw.pf_id;
- 	rf->default_vsi.vsi_idx =3D vsi->vsi_num;
- 	rf->protocol_used =3D pf->rdma_mode & IIDC_RDMA_PROTOCOL_ROCEV2 ?
- 			    IRDMA_ROCE_PROTOCOL_ONLY : IRDMA_IWARP_PROTOCOL_ONLY;
+=20
+ 	rf->default_vsi.vsi_idx =3D iidc_priv->vport_id;
+ 	rf->protocol_used =3D
+ 		cdev_info->rdma_protocol =3D=3D IIDC_RDMA_PROTOCOL_ROCEV2 ?
+ 		IRDMA_ROCE_PROTOCOL_ONLY : IRDMA_IWARP_PROTOCOL_ONLY;
  	rf->rdma_ver =3D IRDMA_GEN_2;
  	rf->rsrc_profile =3D IRDMA_HMC_PROFILE_DEFAULT;
  	rf->rst_to =3D IRDMA_RST_TIMEOUT_HZ;

--Sig_/vtpU+YY_BFYko292DKksJ2y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgitzYACgkQAVBC80lX
0GxN2wf/TyrOJtgN7ZJw0Bz09/UfTOtj5gwx+vfMDRkoBU8Hp19s4Sfy+TQgz/NO
8R+9c9iIzEOlHCPg0kIMS96YPmtL05NFXKzoMcHbWnZSiXyVdNe5HcQ1s6KRjKul
u9XF9bO+phRCqbM3ixPnMxBIBl1tQcWICk9AXq8oKB6cK7U6qUUYxU7TDfoO4VU4
GF72MJ3+CY6stJhqeh3SzUmWvmyrc5xn4szl5Zm141UD7/gYd08CJ2sz0U/15Duf
1Z6aaCX75TKjhqacDD8JDVoFmz2dLGS+5r3LRsj9dirUPplMfxrgsvjtg476Ti4m
lx6u0SjVXre0VszySdrKK8XZg49dIA==
=czAo
-----END PGP SIGNATURE-----

--Sig_/vtpU+YY_BFYko292DKksJ2y--

