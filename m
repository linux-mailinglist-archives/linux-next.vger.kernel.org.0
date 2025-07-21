Return-Path: <linux-next+bounces-7643-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 444C6B0BAD6
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 04:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A7F161F30
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 02:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD717A13A;
	Mon, 21 Jul 2025 02:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nYVwxkes"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA59D2E36EE;
	Mon, 21 Jul 2025 02:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753065493; cv=none; b=Hd/mBSTRoOE1nsJXOMNeQAN2e8Ku7Yhvdt2eQnIReqQTijBk0ZuXtIuAHYJerzHB7tLkOCRaic8aRJL47/0du1zJ1LauT8uzfcAA2JRZzIBy3WWVq3muHExkttYoLmeor7CGDyh0g9GZ9bSnLNWk6/On0r8pjek02Xhid/t1cU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753065493; c=relaxed/simple;
	bh=YFCtjeuNRWirAmt0L2XzJ/hXjgV+AvGMigT27vrVUT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n+KNWOL56S6bzxvQFzGRRi2cfFXPRTK7mXWd5uar+RNBVpaScSv4mCVNaBwysxZfEqHbVoB+HYj+D9iTl763jcfs2K1wFgf0Faa5xVFofqvkeRmsW8fy4wez6+/CODmbsKZHQXkGBMWRZ0aTR7AK1FFoOAXCNsZCSEH3X+NpQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nYVwxkes; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753065333;
	bh=yem6wahpDn+9vCFM4jztkJ4anRIFrDvhlGJ/aVZO4CE=;
	h=Date:From:To:Cc:Subject:From;
	b=nYVwxkes4RQaPyEjpLH9ma6meX5E2RBbVMkbU46Qdu7TkwJCYcHM0APCooJ0og1cA
	 RHOzhsAPp/jf+k6HIAb1T6P23yNYESHpsU3TOKBo1w3pmijT8lyBe9hSnclJkcugE4
	 O1Q0o+DkaeLjxB6pifDHGBMRxFlx2Z9OwtlzG/+e26Qapx7GBTjRX3aAvt6FTjOa/2
	 aY2AGeiiLHBDn9tAwqkgYCM4+XvRJR+v9RySnA9tctZjY0cb5ahWvFoLUWXYhFu+KW
	 jUQCIloPvfCJx/zNptNo+HxdqbfbqQ05p08Q6EiEe3XdTjIKvt8tMu8dyKCkfrRc/L
	 iqTtQYom+dqgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blkyr3CSkz4wbb;
	Mon, 21 Jul 2025 12:35:32 +1000 (AEST)
Date: Mon, 21 Jul 2025 12:38:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>, Michal Simek <monstr@monstr.eu>
Cc: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Simek <michal.simek@amd.com>
Subject: linux-next: manual merge of the pmdomain tree with the xilinx tree
Message-ID: <20250721123801.78841075@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A=0meQQ6qxiLxJJo5tba4hA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A=0meQQ6qxiLxJJo5tba4hA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pmdomain tree got a conflict in:

  drivers/firmware/xilinx/zynqmp.c

between commit:

  ef32394c6d34 ("drivers: firmware: xilinx: Add unique family code for all =
platforms")

from the xilinx tree and commits:

  3da405ead651 ("firmware/pmdomain: xilinx: Move ->sync_state() support to =
firmware driver")
  29ea33866d6d ("firmware: xilinx: Use of_genpd_sync_state()")

from the pmdomain tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/firmware/xilinx/zynqmp.c
index 906a7aae719e,02da3e48bc8f..000000000000
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@@ -2143,22 -2100,22 +2143,35 @@@ static void zynqmp_firmware_remove(stru
  	platform_device_unregister(em_dev);
  }
 =20
+ static void zynqmp_firmware_sync_state(struct device *dev)
+ {
+ 	struct device_node *np =3D dev->of_node;
+=20
+ 	if (!of_device_is_compatible(np, "xlnx,zynqmp-firmware"))
+ 		return;
+=20
+ 	of_genpd_sync_state(np);
+=20
+ 	if (zynqmp_pm_init_finalize())
+ 		dev_warn(dev, "failed to release power management to firmware\n");
+ }
+=20
 +static const struct platform_fw_data platform_fw_data_versal =3D {
 +	.family_code =3D PM_VERSAL_FAMILY_CODE,
 +};
 +
 +static const struct platform_fw_data platform_fw_data_versal_net =3D {
 +	.family_code =3D PM_VERSAL_NET_FAMILY_CODE,
 +};
 +
 +static const struct platform_fw_data platform_fw_data_zynqmp =3D {
 +	.family_code =3D PM_ZYNQMP_FAMILY_CODE,
 +};
 +
  static const struct of_device_id zynqmp_firmware_of_match[] =3D {
 -	{.compatible =3D "xlnx,zynqmp-firmware"},
 -	{.compatible =3D "xlnx,versal-firmware"},
 +	{.compatible =3D "xlnx,zynqmp-firmware", .data =3D &platform_fw_data_zyn=
qmp},
 +	{.compatible =3D "xlnx,versal-firmware", .data =3D &platform_fw_data_ver=
sal},
 +	{.compatible =3D "xlnx,versal-net-firmware", .data =3D &platform_fw_data=
_versal_net},
  	{},
  };
  MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);

--Sig_/A=0meQQ6qxiLxJJo5tba4hA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9qAkACgkQAVBC80lX
0GzXcAf7BsMKuk78CZfJkHzi3rwboosa7PMBRHmWLFCg1IHH5Uu08fFGlIA6O+xd
ASpniuGWyT+0ugj9pov81RQFffB22AOYRQdNAgwWhksnEtPi/YUZhg3xmciWi1z4
B06LY+wyZbi6zj+9Kvi2L2O48ecrudY6ggp76n7jfJ4VCjy+zFyeMfkCehQwM2IX
7aj6VGXLD6Ig6a49ssom2DHKspI6mtpqKycEH7Pt+VAzh6jCjT4GZAA5mYcEMRms
e+mtlijGmgjZE1swmpHVldU1aYy4CkMOlwXk1a63Nu3Yaueq2wrqeB/JbGlwCBCf
tHJF9w0fNo0siJSyHnY2KWixPW6Xqw==
=iafp
-----END PGP SIGNATURE-----

--Sig_/A=0meQQ6qxiLxJJo5tba4hA--

