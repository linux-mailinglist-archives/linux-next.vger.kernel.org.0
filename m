Return-Path: <linux-next+bounces-3256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5B94B449
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 02:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02C91F2215E
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2024 00:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E532B2107;
	Thu,  8 Aug 2024 00:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V5IUzPoN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BDD440C;
	Thu,  8 Aug 2024 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723077841; cv=none; b=EkN5il78/w8942f/eA5cinl1XVOGCfufVQL7MxYDhuQ4B2WT9bh42bRACpSGd2RtyOzDu6n9AsN1tnvqgQo7v642Ua40JVgZbSPkVr/yxbZ0rV+3ESxRdbkOo7I4lSdACsD/4F7/zE8nWYzcQxNgD3orPhSUb8JLAEmHuZqhfmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723077841; c=relaxed/simple;
	bh=7mbApR3ZBwxfpid5b2EvaWwXOxT6ehpKWiF0Mr7vCvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UsAZK+0ABmcXjcYr2sBbrFYPoZoNpUw9YIWEk8aeVwXZuBC1iH5pJYS4/iY8/USDQQ4UGJl+EPXQoEkbWTd2Wbq2sPzDj7XJvB9OfMRl5SCUg6IAiZGWbA/Hxbp98qHal9cnA4HkRBvpVIEQHiOuJJ9o2r0HJ+WNA8dXFJzQUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V5IUzPoN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723077830;
	bh=D33cx3XCrLB+VT+exOdc1DZTElUFvm/vXNRQtYDViV4=;
	h=Date:From:To:Cc:Subject:From;
	b=V5IUzPoNgI6e9IewYkevntNhiw2IncSARxo4EkYhfNEKRVUQ/W25vQt4gyENhsJY1
	 zF0DMKq1fVGVpaw51rVEyQ+z+/0N4751o4DIHk5l+9AlrZnXJKu+AtOp4iGU6GxK5u
	 DvF1CRdvvsIxECgQgOnusew7vn98XZKfEFv8xRTfAwemcUcGEa5838bVDhc9mlpGWA
	 SeapHpQaMNGTJVLlXoYFqvfLpCfRQeR6qaZWVc4dm8mZ1nirjrEjaK42j2Pnx5wE5R
	 teiJ8SXnCz2z8xjcsjq7mP3uAFRg0tEDMe4gzGzeaJBHiPeewMdUii3yeKijn3QRUn
	 e9ggo1BeIBHRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfSw62jkjz4x42;
	Thu,  8 Aug 2024 10:43:50 +1000 (AEST)
Date: Thu, 8 Aug 2024 10:43:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Ath10k List <ath10k@lists.infradead.org>, Aditya Kumar Singh
 <quic_adisi@quicinc.com>, Baochen Qiang <quic_bqiang@quicinc.com>, Kalle
 Valo <quic_kvalo@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ath-next tree with the ath tree
Message-ID: <20240808104348.6846e064@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aVhgp843wQxgMkM6fC0wQpA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aVhgp843wQxgMkM6fC0wQpA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/hw.c

between commit:

  38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path =
for WCN7850")

from the ath tree and commit:

  8be12629b428 ("wifi: ath12k: restore ASPM for supported hardwares only")

from the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/ath/ath12k/hw.c
index 7b0b6a7f4701,76c0e07a88de..000000000000
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@@ -925,7 -925,7 +925,9 @@@ static const struct ath12k_hw_params at
  		.acpi_guid =3D NULL,
  		.supports_dynamic_smps_6ghz =3D true,
 =20
 +		.iova_mask =3D 0,
++
+ 		.supports_aspm =3D false,
  	},
  	{
  		.name =3D "wcn7850 hw2.0",
@@@ -1003,7 -1003,7 +1005,9 @@@
  		.acpi_guid =3D &wcn7850_uuid,
  		.supports_dynamic_smps_6ghz =3D false,
 =20
 +		.iova_mask =3D ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
++
+ 		.supports_aspm =3D true,
  	},
  	{
  		.name =3D "qcn9274 hw2.0",
@@@ -1077,7 -1077,7 +1081,9 @@@
  		.acpi_guid =3D NULL,
  		.supports_dynamic_smps_6ghz =3D true,
 =20
 +		.iova_mask =3D 0,
++
+ 		.supports_aspm =3D false,
  	},
  };
 =20

--Sig_/aVhgp843wQxgMkM6fC0wQpA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma0FMQACgkQAVBC80lX
0GxNfwgAmvMublhZkhutZM2kgnrpMhJ1DZKtE9uXPXf9V40PUz6IvyG7Oa39+4jU
E3XkSTvGtwuy12vB1jPZ2QLp8LOlgEOl9Q7yIiuIzYBUIB6wN5PrGkpfopnc73nL
j52fW5k4PbSrk5OJIWRubGJV9SV0LfGJWqRqRFVq/TbbAkpWZ9PazTPEKDLuovCn
xo2LJmvgeDo9Rj3kDOjaO9CR1qUphGgLz2Xofn4G035396ydAnmtJtKpaq0pDJiM
lvfInH2V3ptpiHbRPgw/dUkscA3jh+FQFHoOzeariWDzRcxxEafrItaG1qx7BIwo
dWKdMSt52JI3VMWaQaAzC9s9/fj2dA==
=BkAT
-----END PGP SIGNATURE-----

--Sig_/aVhgp843wQxgMkM6fC0wQpA--

