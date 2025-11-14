Return-Path: <linux-next+bounces-8978-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8AC5B2D3
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8CCD4EDB04
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 03:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E67725485A;
	Fri, 14 Nov 2025 03:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CeGhOM59"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A5D1F1932;
	Fri, 14 Nov 2025 03:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091402; cv=none; b=uTo1uFqTXEt30UFExxzbXEzTBbFJhePRJr5qgL8kj/PZk5ObCiRqNj4zfgQmyYs8OqiWTG6PeYCLN7euk894RLOqsUmCskxMGWWeXZx5NQ77rhI9+OTSVHmYyKyMGtNH0EfJizyX3Iw12bT+XbXY2RwqwEN5VaS/KTFG1w6tt4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091402; c=relaxed/simple;
	bh=y8NEIc70wfuK3r+2O2ACy+jx+a6iSvtKRvDI+b0zgp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JIQ7HtVXXsBkZTwfDHCEnK2Zz0mn3WCuGTCXBt6OdRCiyYjCDMWgGeILK6J2q9l6goAUJ1595KgThx2jvG+EZAoLp+QgUGubWdGzWGLzpEwPKOSbai4ZxM5BIpWWoSMqrPbdudtD5lq8x2lzO5WwA9eY3lTgjsORuyAIeugub9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CeGhOM59; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763091397;
	bh=O2AeylJfT4LLce9gGst7C2jwKRLxrwMURYP+EV98Md8=;
	h=Date:From:To:Cc:Subject:From;
	b=CeGhOM59RTryO6c5KWiWc5vEclxszpuIv8yr/TD+XF2/Ae8LgbSNfi+sMdvdxZgw3
	 tpKiQnjQdmyUdhlB9Wg7JTsXVzDLzE0M2bsTxqZRxyQ5pTw66cKTZy5D0TaQCZTeBP
	 yHaw+vPgaYGtpNt92Z0mISCoKSkvzf/ZSFGxwzirxQMKlUCQy58fx95n4uo9R2axKr
	 7Bkig6HdC1hek6tQ7ms03cWSDJFV7iOXrOP61Svsfos0jeGneshzk8UKK9u47CcXvt
	 Xg1FlK87OOjTeYMT0jOSVSLg3tbVlcPCn4GdqmnVFtNnohltOKCkesuraRwTrDXl4f
	 ADTBieymeU4HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d72qn3Vm4z4wCB;
	Fri, 14 Nov 2025 14:36:37 +1100 (AEDT)
Date: Fri, 14 Nov 2025 14:36:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20251114143636.607c0bdd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qiQxPU899Dva9aHlUDMeroS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qiQxPU899Dva9aHlUDMeroS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ufs/core/ufshcd.c

between commit:

  c74dc8ab47c1 ("scsi: ufs: core: Fix a race condition related to the "hid"=
 attribute group")

from Linus' tree and commit:

  f46b9a595fa9 ("scsi: ufs: core: Allocate the SCSI host earlier")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/ufs/core/ufshcd.c
index c76d8c65ef46,ca17165f6f0e..000000000000
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@@ -10892,12 -10939,8 +10940,8 @@@ initialized
  	if (err)
  		goto out_disable;
 =20
- 	err =3D ufshcd_add_scsi_host(hba);
- 	if (err)
- 		goto out_disable;
-=20
 -	async_schedule(ufshcd_async_scan, hba);
  	ufs_sysfs_add_nodes(hba->dev);
 +	async_schedule(ufshcd_async_scan, hba);
 =20
  	device_enable_async_suspend(dev);
  	ufshcd_pm_qos_init(hba);

--Sig_/qiQxPU899Dva9aHlUDMeroS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWo8QACgkQAVBC80lX
0GwJhggAm/+RPPeYage8g3CkgIU6OmcSS58wlYkmV6i7E9mcK3PBdmhQBr3Ah3ac
WpAhqJhIHsOvqO3OMO1KYSnoXu4QlKN1GLLuiJNP7NNhZksImL0saAqGKQweV6RN
W59/J4yygEjNgbkCqGpZhgdjjJrkb+t2yYAtXuKy1il44LDsEvn2h4NkjJPdwcPu
gfFLasd4R2VJ3WR6xUtRmvdKBqxYeRBxr34N7lunVcGRIOj0aMc7KCgXUo0gr4qC
zs4UEI1nqnMpbY3lbWS2I+IQ+y6jat8+KKkeq+QbuOVHZcmpnHMgQT8kDplOw/mU
1a5J5DOb9rR41v60sRnaCXDK1zX8xw==
=9qvE
-----END PGP SIGNATURE-----

--Sig_/qiQxPU899Dva9aHlUDMeroS--

