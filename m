Return-Path: <linux-next+bounces-303-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AF80BE68
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 01:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C4C41F20E0A
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 00:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AE7399;
	Mon, 11 Dec 2023 00:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DeHMjPoB"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482ADEB;
	Sun, 10 Dec 2023 16:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702253009;
	bh=Xu2o7UhOz+q82dze+E6Eq5AxrzPlgZYyi0f1QrDEumU=;
	h=Date:From:To:Cc:Subject:From;
	b=DeHMjPoBU+KiXQyXjXi6MwL1kybHIfqmMe1QV3kWygyEdfReZQjJwgFbzu5uT6EoO
	 GISfQEKG8iyVMitdfu/i62Q5v23q92KwuepzdhMzHcgVdiqRyMKhq8DMqILho/J/zn
	 0v0ZVFvv97V2KRPX3L1N1Arm9WF9cn8pFuaAwW/jftemQWibOf8x54O4FEStOuK1sW
	 61A/Siq2r04ukHDDAqNq8kri/3F0MR6WAU39w+/jW5s2mD+IvcSiLqF11yTJGqz6xo
	 sQsbo7Gqxz1n2UV71RJKTA4dGHOFNpHI9LasNvQ5pxbZa/5+cVOaa8YVyWo0san/SD
	 3wSQjBKL+P8hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpMQm5dQrz4wdC;
	Mon, 11 Dec 2023 11:03:28 +1100 (AEDT)
Date: Mon, 11 Dec 2023 11:03:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Moshe Shemesh <moshe@nvidia.com>, Saeed
 Mahameed <saeedm@nvidia.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20231211110328.76c925af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hjS7o5CUo4wh7zjheP.rlT6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hjS7o5CUo4wh7zjheP.rlT6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c

between commit:

  3d7a3f2612d7 ("net/mlx5: Nack sync reset request when HotPlug is enabled")

from the net tree and commit:

  cecf44ea1a1f ("net/mlx5: Allow sync reset flow when BF MGT interface devi=
ce is present")

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

diff --cc drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
index c4e19d627da2,4b8cb120362b..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
@@@ -325,29 -325,25 +325,48 @@@ static void mlx5_fw_live_patch_event(st
  		mlx5_core_err(dev, "Failed to reload FW tracer\n");
  }
 =20
 +#if IS_ENABLED(CONFIG_HOTPLUG_PCI_PCIE)
 +static int mlx5_check_hotplug_interrupt(struct mlx5_core_dev *dev)
 +{
 +	struct pci_dev *bridge =3D dev->pdev->bus->self;
 +	u16 reg16;
 +	int err;
 +
 +	if (!bridge)
 +		return -EOPNOTSUPP;
 +
 +	err =3D pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &reg16);
 +	if (err)
 +		return err;
 +
 +	if ((reg16 & PCI_EXP_SLTCTL_HPIE) && (reg16 & PCI_EXP_SLTCTL_DLLSCE)) {
 +		mlx5_core_warn(dev, "FW reset is not supported as HotPlug is enabled\n"=
);
 +		return -EOPNOTSUPP;
 +	}
 +
 +	return 0;
 +}
 +#endif
 +
+ static const struct pci_device_id mgt_ifc_device_ids[] =3D {
+ 	{ PCI_VDEVICE(MELLANOX, 0xc2d2) }, /* BlueField1 MGT interface device ID=
 */
+ 	{ PCI_VDEVICE(MELLANOX, 0xc2d3) }, /* BlueField2 MGT interface device ID=
 */
+ 	{ PCI_VDEVICE(MELLANOX, 0xc2d4) }, /* BlueField3-Lx MGT interface device=
 ID */
+ 	{ PCI_VDEVICE(MELLANOX, 0xc2d5) }, /* BlueField3 MGT interface device ID=
 */
+ 	{ PCI_VDEVICE(MELLANOX, 0xc2d6) }, /* BlueField4 MGT interface device ID=
 */
+ };
+=20
+ static bool mlx5_is_mgt_ifc_pci_device(struct mlx5_core_dev *dev, u16 dev=
_id)
+ {
+ 	int i;
+=20
+ 	for (i =3D 0; i < ARRAY_SIZE(mgt_ifc_device_ids); ++i)
+ 		if (mgt_ifc_device_ids[i].device =3D=3D dev_id)
+ 			return true;
+=20
+ 	return false;
+ }
+=20
  static int mlx5_check_dev_ids(struct mlx5_core_dev *dev, u16 dev_id)
  {
  	struct pci_bus *bridge_bus =3D dev->pdev->bus;

--Sig_/hjS7o5CUo4wh7zjheP.rlT6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2UdAACgkQAVBC80lX
0GyKWQf+Ia4wx1trE5N3tEhDkjKdcg3E9xvWxQZDZQ1JkPMwP3D2DHbF4t8nRZdL
QgzSS9qyFaUBsYiKrQtwlxhtBV7l5cM9bWTs/jgXHxg1+Zo+fzpdhRaAULgcC/gZ
Vdv7bYipCpTTnSNA5dvao/M8TJqz8xA+bFrimRYfEi5SbgrtX4JnYlXECoSKyZF2
L+7M4hgDjdb2VJAreBf0XnBU+uwYhTxWn3M6hi9WoNk6RoEHqgsf/8y5ZBQNwoPz
+dyzv7D/mUlpjVwAZ8bldV5gdqRB02Aom68dDnfv5NQ9n4YIX/p7yBKCBvqJEjTj
rEvnNah5ut5mQMLPRYqPNTUmBSvlSw==
=vcRh
-----END PGP SIGNATURE-----

--Sig_/hjS7o5CUo4wh7zjheP.rlT6--

