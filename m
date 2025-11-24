Return-Path: <linux-next+bounces-9176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C3C80A2E
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DECC4E283F
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 13:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3E3302766;
	Mon, 24 Nov 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b7gfKzuo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7638F2FC88B;
	Mon, 24 Nov 2025 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989325; cv=none; b=Vb4gT/Bz/TUMCu/TXo/RgWlkPON3S24r8sZXWr8UI+MuuCU4qkA/eWGguk9iVQ073E8gJ/FRRTnZy1gqgnoJxH2LTT2wm/vLIpZz4M2krG8fA+N4NWtlG21MbkKSI6n+KgVPgPwu7TmltQ7ywHE0SeMrA9SgYNbmLyT/n6zOJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989325; c=relaxed/simple;
	bh=wlR8QLAdbC9QaRFhbEBlnCQ9htolh0I8LEDKXLPyM4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jw32pA3JQWhMIIt8PgrzrUVWSmyZqGKYBJCbVpH19bNK3T7leGsjXEOuBUfvIX97q3mYBKJpZJdUd36YnD/eQR4ltUVlnBGXkORSlOf5ahpLMNELHz0w/tDsRHSiSPxTRBcM8IT9kd19TvDv3UadFqIS7adSxuqoF0AXpE/cw4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b7gfKzuo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763989315;
	bh=u6UXAk5VZCjPAVSRrVbWr/3ztRGborJIApr1elBT5PE=;
	h=Date:From:To:Cc:Subject:From;
	b=b7gfKzuoLrnItWAXl/gQXVOXiEVxUEdRUMroUBowuIaXrpEIrtVu7/B1688+s+3CE
	 xdNwocVc5pSn3SoN/HmgxT/CK6ytRw1HGbUJ/oD8IIAdxZR6H4dPhCjpqYxPXg+teP
	 MfEYYpEsFDSFHU5887hsH0JFAB/YDDUVOV5XI+CISBuMaY5Kpj8HCDXNNsdvqQFJKk
	 T0KDUEJ+MnDUlIp++Z3yVzrK8DXD0GYVsqsDXO39JmeSgLuL86NbxAPrZm66gaDQT8
	 3Dxz4OD2yV3i8iZUvRBceGF24DKckzkdI8A13o2vilZjo3rHOV2FJ+f7tvfHIDVvHs
	 NwiTWFFY1d69w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFQvP0QHbz4w2R;
	Tue, 25 Nov 2025 00:01:52 +1100 (AEDT)
Date: Tue, 25 Nov 2025 00:01:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Dave Airlie <airlied@redhat.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, DRI <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20251125000151.23372279@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1rFUMRySHJGSinYlKIZ1Z.h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1rFUMRySHJGSinYlKIZ1Z.h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  drivers/gpu/drm/i915/gvt/kvmgt.c

between commit:

  69b4d367fff6 ("drm/i915/gvt: Simplify case switch in intel_vgpu_ioctl")

from the drm tree and commits:

  e664067b6035 ("vfio/gvt: Provide a get_region_info op")
  93165757c023 ("vfio/gvt: Convert to get_region_info_caps")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/gvt/kvmgt.c
index bbeba0d3fca8,96d23717684f..000000000000
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@@ -1141,6 -1140,126 +1141,121 @@@ static int intel_vgpu_set_irqs(struct i
  	return func(vgpu, index, start, count, flags, data);
  }
 =20
+ static int intel_vgpu_ioctl_get_region_info(struct vfio_device *vfio_dev,
+ 					    struct vfio_region_info *info,
+ 					    struct vfio_info_cap *caps)
+ {
+ 	struct vfio_region_info_cap_sparse_mmap *sparse =3D NULL;
+ 	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
+ 	int nr_areas =3D 1;
+ 	int cap_type_id;
+ 	unsigned int i;
+ 	int ret;
+=20
+ 	switch (info->index) {
+ 	case VFIO_PCI_CONFIG_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D vgpu->gvt->device_info.cfg_space_size;
+ 		info->flags =3D VFIO_REGION_INFO_FLAG_READ |
+ 			      VFIO_REGION_INFO_FLAG_WRITE;
+ 		break;
+ 	case VFIO_PCI_BAR0_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D vgpu->cfg_space.bar[info->index].size;
+ 		if (!info->size) {
+ 			info->flags =3D 0;
+ 			break;
+ 		}
+=20
+ 		info->flags =3D VFIO_REGION_INFO_FLAG_READ |
+ 			      VFIO_REGION_INFO_FLAG_WRITE;
+ 		break;
+ 	case VFIO_PCI_BAR1_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D 0;
+ 		info->flags =3D 0;
+ 		break;
+ 	case VFIO_PCI_BAR2_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->flags =3D VFIO_REGION_INFO_FLAG_CAPS |
+ 			      VFIO_REGION_INFO_FLAG_MMAP |
+ 			      VFIO_REGION_INFO_FLAG_READ |
+ 			      VFIO_REGION_INFO_FLAG_WRITE;
+ 		info->size =3D gvt_aperture_sz(vgpu->gvt);
+=20
+ 		sparse =3D kzalloc(struct_size(sparse, areas, nr_areas),
+ 				 GFP_KERNEL);
+ 		if (!sparse)
+ 			return -ENOMEM;
+=20
+ 		sparse->header.id =3D VFIO_REGION_INFO_CAP_SPARSE_MMAP;
+ 		sparse->header.version =3D 1;
+ 		sparse->nr_areas =3D nr_areas;
+ 		cap_type_id =3D VFIO_REGION_INFO_CAP_SPARSE_MMAP;
+ 		sparse->areas[0].offset =3D
+ 			PAGE_ALIGN(vgpu_aperture_offset(vgpu));
+ 		sparse->areas[0].size =3D vgpu_aperture_sz(vgpu);
+ 		break;
+=20
+ 	case VFIO_PCI_BAR3_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D 0;
+ 		info->flags =3D 0;
+=20
+ 		gvt_dbg_core("get region info bar:%d\n", info->index);
+ 		break;
+=20
+ 	case VFIO_PCI_ROM_REGION_INDEX:
+ 	case VFIO_PCI_VGA_REGION_INDEX:
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D 0;
+ 		info->flags =3D 0;
+=20
+ 		gvt_dbg_core("get region info index:%d\n", info->index);
+ 		break;
+ 	default: {
+ 		struct vfio_region_info_cap_type cap_type =3D {
+ 			.header.id =3D VFIO_REGION_INFO_CAP_TYPE,
+ 			.header.version =3D 1
+ 		};
+=20
+ 		if (info->index >=3D VFIO_PCI_NUM_REGIONS + vgpu->num_regions)
+ 			return -EINVAL;
+ 		info->index =3D array_index_nospec(
+ 			info->index, VFIO_PCI_NUM_REGIONS + vgpu->num_regions);
+=20
+ 		i =3D info->index - VFIO_PCI_NUM_REGIONS;
+=20
+ 		info->offset =3D VFIO_PCI_INDEX_TO_OFFSET(info->index);
+ 		info->size =3D vgpu->region[i].size;
+ 		info->flags =3D vgpu->region[i].flags;
+=20
+ 		cap_type.type =3D vgpu->region[i].type;
+ 		cap_type.subtype =3D vgpu->region[i].subtype;
+=20
+ 		ret =3D vfio_info_add_capability(caps, &cap_type.header,
+ 					       sizeof(cap_type));
+ 		if (ret)
+ 			return ret;
+ 	}
+ 	}
+=20
+ 	if ((info->flags & VFIO_REGION_INFO_FLAG_CAPS) && sparse) {
 -		switch (cap_type_id) {
 -		case VFIO_REGION_INFO_CAP_SPARSE_MMAP:
++		ret =3D -EINVAL;
++		if (cap_type_id =3D=3D VFIO_REGION_INFO_CAP_SPARSE_MMAP)
+ 			ret =3D vfio_info_add_capability(
+ 				caps, &sparse->header,
+ 				struct_size(sparse, areas, sparse->nr_areas));
 -			if (ret) {
 -				kfree(sparse);
 -				return ret;
 -			}
 -			break;
 -		default:
++		if (ret) {
+ 			kfree(sparse);
 -			return -EINVAL;
++			return ret;
+ 		}
+ 	}
+=20
+ 	kfree(sparse);
+ 	return 0;
+ }
+=20
  static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int c=
md,
  			     unsigned long arg)
  {

--Sig_/1rFUMRySHJGSinYlKIZ1Z.h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkkVz8ACgkQAVBC80lX
0Gz1TAgAoEZIJ5/IeK8p9hifiStZ/jh/3iKPaCybV2k/AT+AFIe0ll+AmTTXEMXr
NnIyGgut00oyPURAkHwtfI/HfjCBtaiv96ZDufMC2ECFPpyt0qiBNUbufxvGfic3
ABtpkPepAEt9r7pInhm8rZMVXM6EvR3tVhBjlKkrYHhe8rL1Esexz9KPI3FFr2QW
m0S+hcZhDY+9Sp5//kVLoN76ei+0FtSxqJVID2lXYS83tTCKD79Icxc1PRyjrmP9
inPBCDps1MpB4j7oqmQN5WfsESovTQmKlH4yGHg+1QzG/ckWumKtg6zsK/dZ5r6i
w/iUjfPLvlSD+8pG/C7cczeRmqKozA==
=DXnF
-----END PGP SIGNATURE-----

--Sig_/1rFUMRySHJGSinYlKIZ1Z.h--

